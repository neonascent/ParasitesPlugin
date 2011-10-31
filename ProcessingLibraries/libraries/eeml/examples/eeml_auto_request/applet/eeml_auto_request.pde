// Basic example to retrieve data from an existing Pachube feed
//
// See many other methods available to the DataIn object here:
// http://www.eeml.org/library/docs/eeml/DataIn.html


import eeml.*;

DataIn dIn;

void setup(){
    // set up DataIn object; indicate the URL you want, your Pachube API key, and how often you want it to update
    // e.g. every 15 seconds    
    dIn = new DataIn(this,"http://www.pachube.com/api/504.xml", "485Nzt64WkWwzlaj0QIgHZqRoHVWu-mvuaTa8NJs40k", 15000);
}

void draw()
{
    // do whatever needs doing in the main loop
}

// onReceiveEEML is run every time your app receives back EEML that it has requested from a Pachube feed. 
void onReceiveEEML(DataIn d){ 
    float myVariable = d.getValue(1); // get the value of the stream 1
    println(myVariable);
}
