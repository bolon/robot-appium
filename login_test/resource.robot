*** Settings ***
Documentation   Abstract away the resources for test
Library         AppiumLibrary
Library         Process
Resource        ../secret.robot

*** Variables ***
${APK_NAME}               moka.apk
${APK_PATH}               apk_res/${APK_NAME}
${APPIUM_ENDPOINT}        http://127.0.0.1:4723/wd/hub

*** Keywords ***
Install Moka App
  Log To Console    Start installing here...
  Run Process       adb install apk_res/moka.apk    shell=yes
  Log To Console    Finish installing...

Install Moka App if not yet
[Documentation]   Make dynamic. Skip if not installed yet.
  ${msg}=   Run Process    adb shell pm list packages ${APP.PKG_NAME}    shell=yes
  Run Keyword If    '${msg}' != ''    Install Moka App

#In RF you have to specify app pkg & app activity
Open Moka App in Device
  Open Application    ${APPIUM_ENDPOINT}    deviceName=${DEVICE.NAME}   platformName=${DEVICE.PLATFORM_NAME}  appPackage=${APP.PKG_NAME}  appActivity=${APP.LAUNCHER_ACT}

User Choose To Sign In
  Wait Until Page Contains    "Sign In"
  Click Element               goToSignIn
  Wait Until Page Contains    "Email"

User Input Valid Credential
  Input Text                  //*[@text='Email']    ${VALID.MAIL}
  Input Password              password              ${VALID.PWD}
  Click Element               signInButton

User Input Invalid Credential
  Input Text        //*[@text='Email']    ${INVALID.MAIL}
  Input Password    password              ${INVALID.PWD}
  Click Element     signInButton

User Choose To Sign Up
  Wait Until Page Contains    "Create Account"
  Click Element               goToCreateAccount

User Choose Outlet
  Wait Until Page Contains    "Select Outlet"   timeout=20
  Click Element               //*[contains(@text, 'Outlet')]
  @{outlets}                  Get Webelements    //android.widget.RelativeLayout
  Click Element               @{outlets}[1]
  Click Element               //*[@text='Continue']

User will Be on Main Page
  Wait Until Page Contains Element    id=crud_btn   timeout=20

User will see error pop up
  Wait Until Page Contains    "Authentication failed"
