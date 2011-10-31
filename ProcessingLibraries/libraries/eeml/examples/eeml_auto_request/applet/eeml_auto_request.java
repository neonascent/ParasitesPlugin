import processing.core.*; 
import processing.xml.*; 

import eeml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class eeml_auto_request extends PApplet {

// Basic example to retrieve data from an existing Pachube feed
//
// See many other methods available to the DataIn object here:
// http://www.eeml.org/library/docs/eeml/DataIn.html




DataIn dIn;

public void setup(){
    // set up DataIn object; indicate the URL you want, your Pachube API key, and how often you want it to update
    // e.g. every 15 seconds    
    dIn = new DataIn(this,"http://www.pachube.com/api/504.xml", "485Nzt64WkWwzlaj0QIgHZqRoHVWu-mvuaTa8NJs40k", 15000);
}

public void draw()
{
    // do whatever needs doing in the main loop
}

// onReceiveEEML is run every time your app receives back EEML that it has requested from a Pachube feed. 
public void onReceiveEEML(DataIn d){ 
    float myVariable = d.getValue(1); // get the value of the stream 1
    println(myVariable);
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#F0F0F0", "eeml_auto_request" });
  }
}
