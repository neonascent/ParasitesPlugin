// Basic example to update Pachube manually
// (e.g. when you're behind a firewall, or only want 
// to update occasionally).
//
// See many other methods available to the DataOut object here:
// http://www.eeml.org/library/docs/eeml/DataOut.html


import eeml.*;
DataOut dOut;
float lastUpdate;

void setup(){
    // set up DataOut object; requires URL of the EEML you are updating, and your Pachube API key   
    dOut = new DataOut(this, "http://www.pachube.com/api/77.xml", "ENTER_API_KEY_HERE");   

    //  and add and tag a datastream    
    dOut.addData(0,"my tag 0, tag2, tag3");
}


void draw()
{
    // update once every 5 seconds (could also be e.g. every mouseClick)
    if ((millis() - lastUpdate) > 5000){
        println("ready to POST: ");
        dOut.update(0, random(1000)); // update the datastream 
        int response = dOut.updatePachube(); // updatePachube() updates by an authenticated PUT HTTP request
        println(response); // should be 200 if successful; 401 if unauthorized; 404 if feed doesn't exist
        lastUpdate = millis();
    }   
}
