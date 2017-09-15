*** Settings ***
Documentation         Contains keywords and non-secret var for crud_test
Library               AppiumLibrary
Resource             ../secret.robot
Resource             ../login_test/resource.robot

*** Variables ***
#TODO HERE

*** Keywords  ***
User Login to App
  Open Moka App in Device
  User Choose To Sign In
  User Input Valid Credential
  User Choose Outlet
  User will be on main page

Close Mock Application
  Close Application

User Click Button CRUD
  Click Element    id=crud_btn

User Click Create New Item
  Click Element    menu_create_item
  Wait Until Page Contains    "SAVE"
