---
layout: page
title: Launch 5
description: We launched LV2 with a complete avionics system over 5,000 meters on August 20th 2005, outside of Brothers Oregon.
---

* Table of Contents
{:toc}

# Introduction

Launch 5 was our "successful failure" launch. We had a great team, and a really well prepared rocket. We had a smooth countdown and launch. This was our first flight with 802.11 WiFi live telemetry from a linux flight computer. We got tons of data. The only thing to go wrong was the parachutes not opening!


## Telemetry

For the first time in PSAS history we had a *real* flight computer. This was a x86 processor in an embedded format (PC104 form factor) running linux. We had more than enough computational power to stream and process all the sensor data in real time on the rocket. Since this was out first try, we mostly just recorded and streamed. It's lucky that we were able to stream the data because this is one flight computer that we didn't get back in one piece.

All the data we have from this flight was streamed over a simple WiFi card to the ground. As far as we know we're the first amateur rocket group to fly WiFi on rockets and to have such a sophisticated avionics stack.

# IMU

Our Inertial Measurement Unit (IMU) is a combination of accelerometers and gyroscopes in each direction $(x,y,z)$. We can use it to measure how much the rocket accelerates and how fast it rotates. This can also tell us about the speed and altitude of the rocket.


## Acceleration

We start off looking at the vertical component (in body frame) of the measured acceleration during the flight, the accelerometers in the $x$ and $y$ (sideways) direction. The raw accelerometers are quite noisy, passing through a decimation filter helps.






![](data/launch-overview/IMU_files/IMU_2_0.png)





![](data/launch-overview/IMU_files/IMU_3_0.png)


## Velocity

A single integration of the vertical acceleration will give approximate velocity. There will be some drift as the tiny errors in the IMU readings slowly add up over the integration.






![](data/launch-overview/IMU_files/IMU_6_0.png)




The peak velocity during the motor burn was 406 m/s (Mach 1.2).


## Altitude

Further integrating the velocity numbers should get us altitude. Here we really see the IMU drift. After 70 seconds our guess of altitude is almost 2 kilometers off! (the rocket landed on the ground, not 2000 meters underground).

Hopfully we can fix this with filters that take into acconut several sensors, like pressure and GPS fixes, in order to de-bias our IMU drift.






![](data/launch-overview/IMU_files/IMU_10_0.png)




According to the IMU the apogee was 5.56 kilometers. And then we "landed" 2,525 meters underground






# GPS

The rocket has a Conexant Jupiter GPS, a 12-channel OEM receiver based on the Zodiac chipset. It was set to send 1 Hz binary data.

## Altitude

We can compare the GPS reported altitude to the IMU integration.






![](data/launch-overview/GPS_files/GPS_2_0.png)


There does appear to be a time lag for some reason between the two.



The maximum GPS altitude recorded was 5.53 kilomters. (IMU: 5.56 km).
Though there was some forcing in the IMU calibration to match this numer.



