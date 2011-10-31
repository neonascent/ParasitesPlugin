/**
 Grab states from Firmata, and then send via UDP
 */

// import UDP library
import hypermedia.net.*;
import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

UDP udp;  // define the UDP object
int values[] = {
  0, 0, 0, 0, 0
};
int destinationPort = 6100;


/**
 * init
 */
void setup() {

  // create a new datagram connection on port 6000
  udp = new UDP( this, 6000 );

  // setup Arduino
  arduino = new Arduino(this, Arduino.list()[1], 57600);
}

//process events
void draw() {

  // check each pin value
  for (int i = 0; i < 5; i++) {
    int newValue = arduino.analogRead(i);
    if (newValue != values[i]) {
      sendValueToUDP(i, newValue);
    }
    values[i] = newValue;
  }

  // if value changes, then send value
}

/** 
 * on key pressed event:
 * send the current key value over the network
 */
void sendValueToUDP(int pin, int value) {

  String message  = pin + ":" + value;
  String ip       = "localhost";	// the remote IP address

  // formats the message for Pd
  // send the message
  udp.send( message, ip, destinationPort );
  println(message);
}

