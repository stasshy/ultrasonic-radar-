# Ultrasonic Radar Visualization Project

This project simulates an ultrasonic radar system using Arduino and Processing. It includes:  
- **Arduino code** for both radar scanning (servo + ultrasonic) and a simple servo-based distance meter  
- **Processing UI** code for real-time radar visualization  
- **Fake data generator** for testing the UI without hardware

---

## Features

- **Radar Scanning:** Servo motor sweeps an ultrasonic sensor, measuring distances at various angles.
- **Distance Meter Mode:** Simple servo-based distance measurement.
- **Processing UI:** Visualizes radar sweeps and detected objects in real time.
- **Fake Data Mode:** Test the Processing UI with simulated data (no hardware required).

---

## Hardware Requirements

- Arduino UNO/Nano (or compatible)
- Ultrasonic Sensor (e.g., HC-SR04)
- Servo Motor (e.g., SG90)
- Jumper wires, breadboard, USB cable

---


---

## How It Works

- **Arduino :**  
  The servo rotates the ultrasonic sensor in steps (e.g., 0° to 180°), measuring distance at each angle and sending angle+distance data via serial to the PC.

- **Processing :**  
  Receives serial data, parses angle and distance, and displays a radar-like sweep in real time.

- **Fake Data Mode :**  
  Generates simulated angle/distance data for UI testing without Arduino.

- **Servo Distance Meter :**  
  Simple code for measuring distance at a fixed angle and controlling a servo.

---

## Getting Started

### 1. **Arduino Setup**
- Wire the ultrasonic sensor and servo motor to your Arduino as shown in typical HC-SR04 + SG90 tutorials.
- Upload `radar_scan.ino` for radar mode, or `servo_distance.ino` for simple distance meter mode.

### 2. **Processing UI**
- Install [Processing](https://processing.org/).
- Open and run `radar_ui.pde` for live radar visualization.
    - Set the correct serial port in the code.
- To test without hardware, run `fake_data_mode.pde`.

---

## Usage

- **Radar Mode:**  
    1. Power the Arduino and connect to PC.  
    2. Run the Processing UI (`radar_ui.pde`).  
    3. Watch the radar sweep and see detected objects visualized.

- **Fake Data Mode:**  
    1. Run `fake_data_mode.pde` in Processing.  
    2. Observe the UI with simulated radar sweeps.

- **Servo Distance Meter:**  
    1. Upload `servo_distance.ino` to Arduino.  
    2. Open Serial Monitor to see distance readings.

---





