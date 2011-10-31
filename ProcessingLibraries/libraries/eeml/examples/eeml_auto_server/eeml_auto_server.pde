// Basic example to update Pachube automatically, by serving data
// when Pachube requests it (i.e. does not work if you're behind a firewall
// unless you can configure port forwarding). The advantage of this is
// that it works asynchronously so your main draw loop can continue 
// animating or whatever without being interrupted by waiting for the network
// to complete its operations
// Try running this and then view: http://localhost:5210/ in your browser.
//
// See many other methods available to the DataOut object here:
// http://www.eeml.org/library/docs/eeml/DataOut.html


import eeml.*;
DataOut dOut;

void setup(){
    // set up DataOut object; requires the port that you are serving on
    dOut = new DataOut(this, 5210);
    
    //  and add and tag a datastream    
    dOut.addData(0,"my tag 0, tag2, tag3");
}


void draw()
{
    // do whatever needs doing in the main loop
}

// onReceiveRequest is run every time your app receives a request for data; so you 
// would normally run d.update on all your data streams. 
void onReceiveRequest(DataOut d){ 
    d.update(0, random(1000)); // updates stream 0 with a value as required
}
