*** Settings ***
Documentation     This test suite to imitate valid login
Library           AppiumLibrary
Resource          resource.robot
Test Teardown     Close Application

*** Test Case ***
Valid Login
  Open Moka App in Device
  User Choose To Sign In
  User Input Valid Credential
  User Choose Outlet
  User will be on main page
