# One-to-Many Relationships Tutorial

## Overview

The project teaches you how to create a one-to-many relationship on MaxLeap with the example of a simple blog app.

## Features

- User log in
- Create relationship data
- Check your own post list

## How to Run

1. Log in [MaxLeap console](http://maxleap.com) and create an app. You can skip this step if you've already created one.
2. Add class `Post` with columns:
	
	Column Name | Type
	------------|-----
	textContent | String
	author		  | Pointer, target class `_User`
	
3. Clone the repository and open project with Xcode.
4. Add your MaxLeap application id and client key in `AppDelegate.m`.

## Learn More 

Please check official [MaxLeap iOS Guide](https://leap.as/en_us/guide/devguide/ios.htm) to learn more details. 

