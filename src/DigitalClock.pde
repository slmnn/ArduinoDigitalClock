#define PIN_SCE   7
#define PIN_RESET 6
#define PIN_DC    5
#define PIN_SDIN  4
#define PIN_SCLK  3
#define LCD_CMD   0

#define LCD_C     LOW
#define LCD_D     HIGH

#define LCD_X     84
#define LCD_Y     48

static const byte Digits[][4][18] = 
{
 {
    { 0xE0, 0xF0, 0xF8, 0xF4, 0xEE, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0xEE, 0xF4, 0xF8, 0xF0, 0xE0 },
    { 0x1F, 0x3F, 0x7F, 0x3F, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x3F, 0x7F, 0x3F, 0x1F },  
    { 0xFC, 0xFE, 0xFF, 0xFE, 0xFC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFC, 0xFE, 0xFF, 0xFE, 0xFC }, 
    { 0x03, 0x07, 0x0F, 0x17, 0x3B, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x3B, 0x17, 0x0F, 0x07, 0x03 },
  },
  {
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xF0, 0xF8, 0xF0, 0xE0 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x3F, 0x7F, 0x3F, 0x1F },  
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFC, 0xFE, 0xFF, 0xFE, 0xFC }, 
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x07, 0x0F, 0x07, 0x03 },
  },
  {
    { 0x00, 0x00, 0x00, 0x04, 0x0E, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0xEE, 0xF4, 0xF8, 0xF0, 0xE0 },
    { 0x00, 0x00, 0x00, 0x80, 0xC0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xDF, 0xBF, 0x7F, 0x3F, 0x1F },  
    { 0xFC, 0xFE, 0xFF, 0xFE, 0xFD, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00 }, 
    { 0x03, 0x07, 0x0F, 0x17, 0x3B, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x38, 0x10, 0x00, 0x00, 0x00 },
  },
  {
    { 0x00, 0x00, 0x00, 0x04, 0x0E, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0xEE, 0xF4, 0xF8, 0xF0, 0xE0 },
    { 0x00, 0x00, 0x00, 0x80, 0xC0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xDF, 0xBF, 0x7F, 0x3F, 0x1F },  
    { 0x00, 0x00, 0x00, 0x00, 0x01, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0xFD, 0xFE, 0xFF, 0xFE, 0xFC }, 
    { 0x00, 0x00, 0x00, 0x10, 0x38, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x3B, 0x17, 0x0F, 0x07, 0x03 },
  },
  {
    { 0xE0, 0xF0, 0xF8, 0xF0, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xF0, 0xF8, 0xF0, 0xE0 },
    { 0x1F, 0x3F, 0x7F, 0xBF, 0xDF, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xDF, 0xBF, 0x7F, 0x3F, 0x1F },  
    { 0x00, 0x00, 0x00, 0x00, 0x01, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0xFD, 0xFE, 0xFF, 0xFE, 0xFC }, 
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x07, 0x0F, 0x07, 0x03 },
  },
  {
    { 0xE0, 0xF0, 0xF8, 0xF4, 0xEE, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x0E, 0x04, 0x00, 0x00, 0x00 },
    { 0x1F, 0x3F, 0x7F, 0xBF, 0xDF, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xC0, 0x80, 0x00, 0x00, 0x00 },  
    { 0x00, 0x00, 0x00, 0x00, 0x01, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0xFD, 0xFE, 0xFF, 0xFE, 0xFC }, 
    { 0x00, 0x00, 0x00, 0x10, 0x38, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x3B, 0x17, 0x0F, 0x07, 0x03 },
  },
  {
    { 0xE0, 0xF0, 0xF8, 0xF4, 0xEE, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x0E, 0x04, 0x00, 0x00, 0x00 },
    { 0x1F, 0x3F, 0x7F, 0xBF, 0xDF, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xC0, 0x80, 0x00, 0x00, 0x00 },  
    { 0xFC, 0xFE, 0xFF, 0xFE, 0xFD, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0xFD, 0xFE, 0xFF, 0xFE, 0xFC }, 
    { 0x03, 0x07, 0x0F, 0x17, 0x3B, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x3B, 0x17, 0x0F, 0x07, 0x03 },
  },
  {
    { 0x00, 0x00, 0x00, 0x04, 0x0E, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0xEE, 0xF4, 0xF8, 0xF0, 0xE0 },
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x3F, 0x7F, 0x3F, 0x1F },  
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFC, 0xFE, 0xFF, 0xFE, 0xFC }, 
    { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x07, 0x0F, 0x07, 0x03 },
  },
  {
    { 0xE0, 0xF0, 0xF8, 0xF4, 0xEE, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0xEE, 0xF4, 0xF8, 0xF0, 0xE0 },
    { 0x1F, 0x3F, 0x7F, 0xBF, 0xDF, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xDF, 0xBF, 0x7F, 0x3F, 0x1F },  
    { 0xFC, 0xFE, 0xFF, 0xFE, 0xFD, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0xFD, 0xFE, 0xFF, 0xFE, 0xFC }, 
    { 0x03, 0x07, 0x0F, 0x17, 0x3B, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x3B, 0x17, 0x0F, 0x07, 0x03 },
  },
  {
    { 0xE0, 0xF0, 0xF8, 0xF4, 0xEE, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0xEE, 0xF4, 0xF8, 0xF0, 0xE0 },
    { 0x1F, 0x3F, 0x7F, 0xBF, 0xDF, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xE0, 0xDF, 0xBF, 0x7F, 0x3F, 0x1F },  
    { 0x00, 0x00, 0x00, 0x00, 0x01, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0xFD, 0xFE, 0xFF, 0xFE, 0xFC }, 
    { 0x00, 0x00, 0x00, 0x10, 0x38, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x7C, 0x3B, 0x17, 0x0F, 0x07, 0x03 },
  }
};

static const byte SecondIndicator[4] =
{
  0x00, 0x07, 0x70, 0x00
};

void LcdInitialise(void)
{
  pinMode(PIN_SCE, OUTPUT);
  pinMode(PIN_RESET, OUTPUT);
  pinMode(PIN_DC, OUTPUT);
  pinMode(PIN_SDIN, OUTPUT);
  pinMode(PIN_SCLK, OUTPUT);
  digitalWrite(PIN_RESET, LOW);
  digitalWrite(PIN_RESET, HIGH);

  LcdWrite( LCD_CMD, 0x21 ); // LCD Extended Commands.
  LcdWrite( LCD_CMD, 0xC8 ); // Set LCD Vop (Contrast)
  LcdWrite( LCD_CMD, 0x06 ); // Set Temp coefficent
  LcdWrite( LCD_CMD, 0x14 ); // LCD bias mode 1:48

  LcdWrite( LCD_CMD, 0x20 ); // LCD Standard Commands.
  LcdWrite( LCD_CMD, 0x0C ); // LCD in normal mode. 0x0d for inverse
}

void LcdWrite(byte dc, byte data)
{
  digitalWrite(PIN_DC, dc);
  digitalWrite(PIN_SCE, LOW);
  shiftOut(PIN_SDIN, PIN_SCLK, MSBFIRST, data);
  digitalWrite(PIN_SCE, HIGH);
}

void LcdClear(void)
{
  for (int index = 0; index < LCD_X * LCD_Y / 8; index++)
  {
    LcdWrite(LCD_D, 0x00);
  }
}

void Spacer()
{
  LcdWrite(LCD_D, 0x00);
  LcdWrite(LCD_D, 0x00);
}

void DisplayTime(byte hour, byte minutes, byte seconds)
{
  byte components[4] = 
  { 
    (byte)(hour / 10), 
    (byte)(hour % 10), 
    (byte)(minutes / 10), 
    (byte)(minutes % 10) 
  };

  for(byte row = 0; row < 4; row++)
  {      
    LcdWrite(LCD_C, 0x80 | 0);
    LcdWrite(LCD_C, 0x40 | row);

    for(byte digit = 0; digit < 4; digit++)
    {
      for(byte col = 0; col < 18; col++)
      {        
        LcdWrite(LCD_D, Digits[components[digit]][row][col]);
      }      

      Spacer();

      // Display second indicator after the second digit
      if(digit == 1)
      {
        DisplaySecondIndicator(row, seconds & 0x01);
      }
    }
  }

  DrawSecondsBar(seconds);  
}

void DisplaySecondIndicator(byte row, boolean show)
{
  for(int secondIndicatorSegment = 0; secondIndicatorSegment < 3; secondIndicatorSegment++)
  {
    if(show)
    {
      LcdWrite(LCD_D, SecondIndicator[row]);
    }
    else // clear
    {
      LcdWrite(LCD_D, 0x00);
    }
  }
  
  Spacer();
}

void DrawSecondsBar(byte seconds)
{
  // Position the pointer
  LcdWrite(LCD_C, 0x80 | 0x0b);
  LcdWrite(LCD_C, 0x44);

  // Draw the left side of the progress bar box
  LcdWrite(LCD_D, 0xF0);
  
  for(byte i = 0; i < 59; i++)
  {
    if(i < seconds)
    {
      LcdWrite(LCD_D, 0xF0);
    }
    else
    {
      LcdWrite(LCD_D, 0x90);
    }
  }

  // Draw the right side of the progress bar box  
  LcdWrite(LCD_D, 0xF0);
}

byte tcnt2;
unsigned long time = 0; // 86390000;

void setup(void)
{
  SetupInterrupt();
  InitializeDisplay();
}

// Credits for the interrupt setup routine:
// http://popdevelop.com/2010/04/mastering-timer-interrupts-on-the-arduino/
void SetupInterrupt()
{
  /* First disable the timer overflow interrupt while we're configuring */  
  TIMSK2 &= ~(1<<TOIE2);   

  /* Configure timer2 in normal mode (pure counting, no PWM etc.) */  
  TCCR2A &= ~((1<<WGM21) | (1<<WGM20));   
  TCCR2B &= ~(1<<WGM22);   
  
  /* Select clock source: internal I/O clock */  
  ASSR &= ~(1<<AS2);
     
  /* Disable Compare Match A interrupt enable (only want overflow) */  
  TIMSK2 &= ~(1<<OCIE2A);   
  
  /* Now configure the prescaler to CPU clock divided by 128 */  
  TCCR2B |= (1<<CS22)  | (1<<CS20); // Set bits   
  TCCR2B &= ~(1<<CS21);             // Clear bit   
  
  /* We need to calculate a proper value to load the timer counter.  
   * The following loads the value 131 into the Timer 2 counter register  
   * The math behind this is:  
   * (CPU frequency) / (prescaler value) = 125000 Hz = 8us.  
   * (desired period) / 8us = 125.  
   * MAX(uint8) + 1 - 125 = 131;  
   */  
  /* Save value globally for later reload in ISR */  
  tcnt2 = 131;    
     
  /* Finally load end enable the timer */  
  TCNT2 = tcnt2;   
  TIMSK2 |= (1<<TOIE2);   
}

void InitializeDisplay()
{
  LcdInitialise();
  LcdClear();
}

/*  
 * Install the Interrupt Service Routine (ISR) for Timer2 overflow.  
 * This is normally done by writing the address of the ISR in the  
 * interrupt vector table but conveniently done by using ISR()  */  
ISR(TIMER2_OVF_vect) {   
  /* Reload the timer */  
  TCNT2 = tcnt2;
  
  time++;
  time = time % 86400000; 
}   

void loop(void)
{
  unsigned long t = (unsigned long)(time/1000);
  
  DisplayTime((byte)(t / 3600), (byte)((t / 60) % 60), (byte)(t % 60));
}
