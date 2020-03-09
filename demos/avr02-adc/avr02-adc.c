#include <stdint.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#define LED                 PB2
#define DELAY_MS            100

#define UART_BAUD_RATE      19200
#define UART_FTIMER         F_CPU / 19200

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

void setupLEDPort ()
{
    DDRB |= (1 << LED);
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
    TCCR1 |=    (1 << CS13) | (1 << CS12) | (1 << CS11); // clock prescaler 8192
    OCR1C =     122;           // compare match value 
    TIMSK |=    (1 << OCIE1A); // enable compare match interrupt
}

int main(void) 
{
    // initializations 
	DDRB =      0x0F;            // enable PB0-PB3 as outputs
	PORTB |=    (1 << LED);    // enable pullup on pushbutton output
	initTimer1();           // initialize timer registers
	sei();                  // enable interrupts
	
	while(1)
	{
	}

    /*
    initADC();
    setupLEDPort();

    while(1)
    {
        ADCSRA |= (1 << ADSC);         // start ADC measurement
        while (ADCSRA & (1 << ADSC) ); // wait till conversion complete 

        if (ADCH <= 128)
        {
            // ADC input voltage is more than half of VCC
            PORTB &= ~(1 << LED);   // Turn off the LED
        }
        else
        {
            // ADC input voltage is less than half of VCC
            PORTB |=  (1 << LED);   // Turn on the LED.
        }
    }
    */

    return 0;
}

/**
 * Method called every time TIMER1 is elapsed.
 */
ISR (TIMER1_COMPA_vect)
{
	PORTB ^= (1 << LED);
}