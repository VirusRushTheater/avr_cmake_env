#include <string.h>
#include <stdint.h>
#include <avr/io.h>
#include <avr/interrupt.h>

#ifndef F_CPU
#define F_CPU               8000000UL
#endif
#include <util/delay.h>

#include "avr_macros.h"

#define LED                 PB2
#define DELAY_MS            100

#define UART_OUT            PB0
#define UART_IN             PB1
#define UART_BUFFERSIZE     32

static struct {
    uint8_t     bitcursor;
    uint8_t     bytecursor_loop;
    uint8_t     bytecursor_ri;
    uint8_t     bytecursor_wo;
    uint8_t     timerflag;
    uint8_t     byteready;
    char        padding_01[1];
    uint8_t     inputbuffer[UART_BUFFERSIZE];
    uint8_t     outputbuffer[UART_BUFFERSIZE];
} uart_adc_vars = {0};

/**
* This function initializes the ADC 
* 
* ADC Prescaler Notes:
* --------------------
* 
* ADC Prescaler needs to be set so that the ADC input frequency is between 50 - 200kHz.
* 
* For more information, see table 17.5 "ADC Prescaler Selections" in 
* chapter 17.13.2 "ADCSRA – ADC Control and Status Register A"
* (pages 140 and 141 on the complete ATtiny25/45/85 datasheet, Rev. 2586M–AVR–07/10)
* 
* Valid prescaler values for various clock speeds
* 
* Clock   Available prescaler values
* ---------------------------------------
* 1 MHz   8 (125kHz),  16 (62.5kHz)
* 4 MHz   32 (125kHz), 64 (62.5kHz)
* 8 MHz   64 (125kHz), 128 (62.5kHz)
* 16 MHz  128 (125kHz)
* 
* Below example set prescaler to 128 for mcu running at 8MHz
* (check the datasheet for the proper bit values to set the prescaler)
*/
void initADC()
{
    // 8-bit resolution
    // set ADLAR to 1 to enable the Left-shift result (only bits ADC9..ADC2 are available)
    // then, only reading ADCH is sufficient for 8-bit results (256 values)

    ADMUX =
        (1 << ADLAR) |     // left shift result
        (0 << REFS1) |     // Sets ref. voltage to VCC, bit 1
        (0 << REFS0) |     // Sets ref. voltage to VCC, bit 0
        (0 << MUX3)  |     // use ADC2 for input (PB4), MUX bit 3
        (0 << MUX2)  |     // use ADC2 for input (PB4), MUX bit 2
        (1 << MUX1)  |     // use ADC2 for input (PB4), MUX bit 1
        (0 << MUX0);       // use ADC2 for input (PB4), MUX bit 0

    ADCSRA = 
        (1 << ADEN)  |     // Enable ADC 
        (1 << ADPS2) |     // set prescaler to 64, bit 2 
        (1 << ADPS1) |     // set prescaler to 64, bit 1 
        (0 << ADPS0);      // set prescaler to 64, bit 0  
}

/**
 * Inits timer 1.
 * The timer period can be adjusted by using the prescaler (CS1[3:0]) and the
 * OCR1C counter.
 * ---------------
 * The formula is:
 * f_timer1 = F_CPU / 2^(CS1[3:0] - 2) / OCR1C
 * 
 * A more precise counter can be get by maximizing OCR1C (a one-byte counter)
 * and minimizing CS1[3:0]
 */
static inline void initTimer1(void)
{
    TCCR1 |=    (1 << CTC1);   // clear timer on compare match

    // Adapted for 19,200 Hz
    TCCR1 |=    (1 << CS13) | (1 << CS12) | (1 << CS11); // clock prescaler 8192
    OCR1C =     63;           // compare match value 

    //TCCR1 |=    ((TIMER1_CS3_0 & 0x0f) << CS10);
    //OCR1C =     (uint8_t) 10;

    TIMSK |=    (1 << OCIE1A); // enable compare match interrupt
}

/**
 * Inits PB0~3 as outputs and lets it output 0.
 */
static inline void initPorts(void)
{
    // DDR# -> 0 if input, 1 if output
    DDRB |=     (1 << UART_OUT);
    DDRB &=     ~(1 << UART_IN);
    PORTB &=    ~(0x0F);        // And pulls them down.
}

static inline void initUART(void)
{
    uart_adc_vars.bitcursor = 0x01;
}

void putc (uint8_t c)
{
    uart_adc_vars.outputbuffer[uart_adc_vars.bytecursor_wo++] = c;
    if (uart_adc_vars.bytecursor_wo == UART_BUFFERSIZE)
        uart_adc_vars.bytecursor_wo = 0;
}

int main(void) 
{
    // initializations 
	DDRB =      0x0F;           // enable PB0-PB3 as outputs
	PORTB |=    (1 << LED);     // enable pullup on pushbutton output

	initTimer1();               // initialize timer registers
    initADC();
    initUART();
	sei();                      // enable interrupts

    memset(uart_adc_vars.outputbuffer, 0x12, UART_BUFFERSIZE);

    ADCSRA |= (1 << ADSC);      // start ADC measurement
	
	while(1)
	{
        // ================================================
        // ADC stuff
        // ================================================
        if (!(ADCSRA & (1 << ADSC)))
        {
            // play with ADCL and ADCH

            // Reset ADC
            ADCSRA |= (1 << ADSC);
        }

        // ================================================
        // UART stuff
        // ================================================
        // Only let it pass if the timer allowed it.
        if (uart_adc_vars.timerflag)
        {

            // UART output
            if (uart_adc_vars.outputbuffer[uart_adc_vars.bytecursor_loop] & (1 << uart_adc_vars.bitcursor))
                PORTB |= (1 << UART_OUT);
            else
                PORTB &= ~(1 << UART_OUT);
            
            // UART input
            if (PINB &= (1 << UART_IN))
                uart_adc_vars.inputbuffer[uart_adc_vars.bytecursor_loop] |= (1 << uart_adc_vars.bitcursor);
            
            // Scrolls the circular buffer.
            if ((++uart_adc_vars.bitcursor) == 8)
            {
                uart_adc_vars.bytecursor_loop = (uart_adc_vars.bytecursor_loop + 1) % UART_BUFFERSIZE;
                uart_adc_vars.byteready = 1;
            }

            // UART has a byte ready.
            if (uart_adc_vars.byteready)
            {
                uart_adc_vars.inputbuffer[uart_adc_vars.bytecursor_loop] = 0x00;
            }

            // Clear timer flags.
            uart_adc_vars.timerflag = 0;
            uart_adc_vars.byteready = 0;
        }
	}

    return 0;
}

/**
 * Method called every time TIMER1 is elapsed.
 */
ISR (TIMER1_COMPA_vect)
{
    // Activates UART stuff.
    uart_adc_vars.timerflag = 1;
}