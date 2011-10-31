/*
Read analogue inputs and send message if value is below a threshold
 
 
 */


#include <Firmata.h>

int sensorValue = 0;  // variable to store the value coming from the sensor
int threshold = 500;


int inputPins[] = {
  A1, A2, A3, A4, A5};
int outputPins[] = { 
  3, 4, 5, 6, 7};

void setup() {

  Firmata.setFirmwareVersion(0, 1);
  Firmata.begin(57600);
  
  // set up 3-7 as outputs.  
  for (int i = 0; i < 5; i++) {
    pinMode(outputPins[i], OUTPUT);
  }  
}

void loop() {
  for (int i = 0; i < 5; i++) {
    sensorValue = analogRead(inputPins[i]);
    if (sensorValue < threshold) {
      digitalWrite(outputPins[i], HIGH);
      Firmata.sendAnalog(i, 1);
    } 
    else {
      digitalWrite(outputPins[i], LOW);
      Firmata.sendAnalog(i, 0); 
    }
  }

  /*
  // read the value from the sensor:
   sensorValue = analogRead(sensorPin);    
   // turn the ledPin on
   digitalWrite(ledPin, HIGH);  
   // stop the program for <sensorValue> milliseconds:
   delay(sensorValue);          
   // turn the ledPin off:        
   digitalWrite(ledPin, LOW);   
   // stop the program for for <sensorValue> milliseconds:
   delay(sensorValue);                  
   */
}




