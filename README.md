# robot-appium
Demo for Automated app testing using Robot Framework & Appium

# Pre-req
* ``Appium`` installed in machine

* ``Python`` & ``Pip`` installed in machine | Note : because of the compatibility issue, consider using python 2.7

* Install ``robotframework``

* Install ``robotframework-appiumlibrary`` --> lib to access app layer

* ``Android SDK`` for Android testing installed in machine

* ``adb`` accessible from everywhere

* Make sure App that will be tested already in device/emulator

* Connected device *WARNING* If using emulator make sure architecture emulator is arm.

* Put .apk in folder ``apk_res``

# Execute test
### Run whole test in a project
* Go to root project
* Run this command from cli ``robot folder_name`` ex : ``robot login_test``
### Run specific test suite
* Go to root project
* Run this command from cli ``robot folder_name/file_name.robot``
### Run specific test case
* Go to root project
* Run this command from cli ``robot -t test_case_name folder_name/file_name.robot`` Note : Test case name with whitespace should be considered to be appended
