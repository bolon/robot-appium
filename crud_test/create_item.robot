*** Settings ***
Documentation           Test Suite for create item
Resource                resource.robot
Suite Setup             User Login to App
#Test Teardown           Close Mock Application

*** Test Case ***
Create New Item Without Variant
  User Click Button CRUD
  User Click Create New Item
