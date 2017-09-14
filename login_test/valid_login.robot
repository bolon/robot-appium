*** Settings ***
Documentation     This test suite to imitate valid login
Library           AppiumLibrary
Resource          resource.robot
Test Teardown     Close Application

*** Test Case ***
Valid Login
  Open Moka App in Device
  User Choose To Sign In

Valid Register
  Open Moka App in Device
  User Choose To Sign Up
