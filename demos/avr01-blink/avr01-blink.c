#include <avr/io.h>
#include <util/delay.h>

#define LED         PB2
#define DELAY_MS    100

/**
 * Blinks LED in PB2.
 */
int main (void)
{
    uint8_t high = 0;
	uint16_t ms = 0;

    // setup LED pin for output in port B's direction register
    DDRB |= (1 << LED);

    // set LED pin LOW
	PORTB &= ~(1 << LED);

    // Infinite loop.
    while (1)
    {
        high = !high;

		if (high)
			PORTB |= (1 << LED);
		else
			PORTB &= ~(1 << LED);

		// delay for 500 ms
		for (ms = DELAY_MS; ms > 0; ms -= 10)
			_delay_ms(10);
    }
}