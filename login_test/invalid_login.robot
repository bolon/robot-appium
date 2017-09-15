*** Settings ***
Documentation   Imitate invalid login in app
Library         AppiumLibrary
Resource        resource.robot
Test Teardown   Close Application

*** Test Case ***
Invalid Login
  Open Moka App in Device
  User Choose To Sign In
  User Input Invalid Credential
