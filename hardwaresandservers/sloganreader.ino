/***************************************************
  Adafruit invests time and resources providing this open source code,
  please support Adafruit and open-source hardware by purchasing
  products from Adafruit!

  Written by Limor Fried/Ladyada for Adafruit Industries.
  MIT license, all text above must be included in any redistribution
 ****************************************************/

#include <Adafruit_GFX.h>    // Core graphics library
#include "Adafruit_EPD.h"

#define EPD_CS      9
#define EPD_DC      10
#define SRAM_CS     6
#define SD_CS       5
#define EPD_RESET   -1 // can set to -1 and share with microcontroller Reset!
#define EPD_BUSY    -1 // can set to -1 to not use a pin (will wait a fixed delay)

//featherwingtest
//  #define SD_CS       5
//  #define SRAM_CS     6
//  #define EPD_CS      9
//  #define EPD_DC      10  

/* Uncomment the following line if you are using 1.54" tricolor EPD */
//Adafruit_IL0373 display(152, 152, EPD_DC, EPD_RESET, EPD_CS, SRAM_CS, EPD_BUSY);

/* Uncomment the following line if you are using 1.54" monochrome EPD */
//Adafruit_SSD1608 display(200, 200, EPD_DC, EPD_RESET, EPD_CS, SRAM_CS, EPD_BUSY);

/* Uncomment the following line if you are using 2.13" tricolor EPD */
Adafruit_IL0373 display(212, 104, EPD_DC, EPD_RESET, EPD_CS, SRAM_CS, EPD_BUSY);
//#define FLEXIBLE_213

/* Uncomment the following line if you are using 2.13" monochrome 250*122 EPD */
//Adafruit_SSD1675 display(250, 122, EPD_DC, EPD_RESET, EPD_CS, SRAM_CS, EPD_BUSY);

/* Uncomment the following line if you are using 2.7" tricolor or grayscale EPD */
//Adafruit_IL91874 display(264, 176, EPD_DC, EPD_RESET, EPD_CS, SRAM_CS);

/* Uncomment the following line if you are using 2.9" EPD */
//Adafruit_IL0373 display(296, 128, EPD_DC, EPD_RESET, EPD_CS, SRAM_CS, EPD_BUSY);
//#define FLEXIBLE_290

/* Uncomment the following line if you are using 4.2" tricolor EPD */
//Adafruit_IL0398 display(300, 400, EPD_DC, EPD_RESET, EPD_CS, SRAM_CS, EPD_BUSY);

String a;
String b;
String c;

void setup(void) {
  Serial.begin(115200);
//  Serial.print("Hello! EPD Test");
  Serial.println("###1$$$");
  while(Serial.available()) {
  a= Serial.readString();// read the incoming data as string
  Serial.println("###2$$$");
  }

  while(Serial.available()) {
  b= Serial.readString();// read the incoming data as string
  Serial.println("###3$$$");
  }

  while(Serial.available()) {
  c= Serial.readString();// read the incoming data as string
  Serial.println("###0$$$");
  }

  display.begin();
#if defined(FLEXIBLE_213) || defined(FLEXIBLE_290)
  // The flexible displays have different buffers and invert settings!
  display.setBlackBuffer(1, false);
  display.setColorBuffer(1, false);
#endif

  Serial.println("Initialized");

  display.setRotation(2);

  // large block of text
  Serial.println(a);
  Serial.println(b);
  Serial.println(c);

  display.clearBuffer();
  display.setTextWrap(true);

  display.setCursor(70, 10);
  display.setTextSize(3);
  display.setTextColor(EPD_BLACK);
//  display.print("BAT");
  display.print(a);
  display.setCursor(35, 40);
  
//  display.print("LIVES");
  display.print(b);
  display.setCursor(30, 70);

//  display.print("MATTER!");
  display.print(c);
  display.setCursor(70, 90);
  display.setTextSize(1);
  display.setTextColor(EPD_RED);
  display.print("--B W Anonymous");

  display.display();
}

void loop() {
  delay(1000);
}
