import java.awt.event.KeyEvent;
import java.io.IOException;

import processing.serial.*;

String data = "";

float pixsDistance;

int dataAngle, dataDistance;
int index1 = 0;
int index2 = 0;

PFont orcFont;

Serial arduinoPort;

//Fake data variables
int lastUpdateTime = 0;
int updateInterval = 10;

int [] angles = new int[181];
int counter = 0;
int state = 0;

void setup() {

    size(1200, 700);
    smooth();
    
    arduinoPort = new Serial(this, "COM3", 9600);
    arduinoPort.bufferUntil('.');

    for(int i=0; i<=180; i++){ angles[i] = i; }
}

void serialEvent(Serial port)
{
  data = port.readStringUntil('\n');
  
  if(data != null)
  {
    data = data.trim();
    String[] values = data.split("\n");
    
    dataDistance = int(values[0]);
  }
}

void draw() {

    fill(98, 245, 31);
    noStroke();
    fill(0, 4);
    rect(0, 0, width, height - height * 0.065);

    fill(98, 245, 31);
    drawRadar();
    drawLine();
    drawObject();
    drawText();

    if (millis() - lastUpdateTime > updateInterval) {
        generateFakeData();
        lastUpdateTime = millis(); // Reset timer
    }
}

// Simulates sensor readings by generating random values every 2 seconds
void generateFakeData() {

    if(dataAngle == 0) {state = 0;}

    if(dataAngle == 180) {state = -1;}

    if(state == 0){
        if(counter == 0) {counter = 1;} //xaneis mono thn prwth fora
        dataAngle = angles[counter++];
    }
    else {
        if(counter == 181) {counter = 180;}
        dataAngle = angles[--counter];
    }
}

void drawRadar() { //Radar UI

    pushMatrix(); //Saving general coordinate settings for each frame to work with the same settings
    
    translate(width / 2, height - height * 0.069);
    noFill();
    strokeWeight(2);
    stroke(98, 245, 31);
    
    //Hmikyklia
    arc(0, 0, width - width * 0.0625, width - width * 0.0625, PI, TWO_PI);
    arc(0, 0, width - width * 0.27, width - width * 0.27, PI, TWO_PI);
    arc(0, 0, width - width * 0.479, width - width * 0.479, PI, TWO_PI);
    arc(0, 0, width - width * 0.687, width - width * 0.687, PI, TWO_PI);

    line(-width / 2, 0, width / 2, 0);
    
    popMatrix(); //"Pops" the settings saved at the start of the method so the next method retains the same settings
}

void drawObject() { //Red lines for existing objects in range

    pushMatrix();
    translate(width / 2, height - height * 0.069);
    strokeWeight(9);
    stroke(255, 10, 10);
    //Converting real world distance to pixels
    pixsDistance = dataDistance * ((height - height * 0.1665) * 0.025);

    //Drawing the object's lines by defining the x,y of the starting and ending points
    if (dataDistance < 100) {
        line(pixsDistance/2.5 * cos(radians(dataAngle)), -pixsDistance/2.5 * sin(radians(dataAngle)),
                (width - width * 0.486) * cos(radians(dataAngle)), -(width - width * 0.486) * sin(radians(dataAngle)));
    }
    popMatrix();
}

void drawLine() { //For the radar's green lines

    pushMatrix();
    strokeWeight(9);
    stroke(30, 250, 60);
    translate(width / 2, height - height * 0.069);
    line(0, 0, (height - height * 0.12) * cos(radians(dataAngle)), -(height - height * 0.12) * sin(radians(dataAngle)));
    popMatrix();
}

void drawText() { //For text drawn on the bottom of the radar

    pushMatrix();
    //noObject = (dataDistance > 40) ? "Out of Range" : "In Range";

    fill(0, 0, 0);
    noStroke();
    rect(0, height - height * 0.0648, width, height);
    fill(98, 245, 31);
    textSize(25);

    int printedDistance = (dataDistance > 100) ? -1 : dataDistance;

    text("Angle: " + dataAngle, width - width * 0.48, height - height * 0.0277);
    text("Distance: " + printedDistance + " cm", width - width * 0.225, height - height * 0.0277);
    //text("Object state: " + noObject, width - width, height - height * 0.0277);
    popMatrix();
}
