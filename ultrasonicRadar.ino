int triggerPin=13;
int echoPin=12;

float distance;
float duration;

void setup()
{
  Serial.begin(9600);
  
  pinMode(triggerPin,OUTPUT);
  pinMode(echoPin, INPUT);
}

void loop()
{
  digitalWrite(triggerPin, LOW);
  delayMicroseconds(2);
  
  digitalWrite(triggerPin, HIGH);
  delayMicroseconds(10);
  
  digitalWrite(triggerPin, LOW);
  
  duration = pulseIn(echoPin, HIGH);
  distance = (duration*0.034)/2;
  
  Serial.println(distance);
  delay(100);
}