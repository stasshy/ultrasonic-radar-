// C++ code

#include <Servo.h>

#define PIN13 13
#define PIN2 2
#define PIN10 10

const int sensorPin = 7;

int buttonState;

Servo mServo; 

void setup()
{
  Serial.begin(9600);
  pinMode(PIN13, OUTPUT);
  pinMode(PIN2, INPUT_PULLUP);
  pinMode(PIN6, INPUT);
  
  mServo.attach(10);
  
}

void loop()
{
  
 for (int angle = 0; angle <= 180; angle++) { // Move from 0 to 180 degrees
    mServo.write(angle); // Set the servo position
    delay(15); // Small delay for smooth motion
  }

  for (int angle = 180; angle >= 0; angle--) { // Move from 180 to 0 degrees
    mServo.write(angle);
    delay(15);
  }
  
  int sensorValue = digitalRead(sensorPin);  // Read sensor state

  if (sensorValue == HIGH) {  // Object detected
    Serial.println("Object detected!");
    //digitalWrite(ledPin, HIGH);  // Turn on LED
  } else {  // No object
    Serial.println("No object detected.");
    //digitalWrite(ledPin, LOW);
  }

  delay(200);
}