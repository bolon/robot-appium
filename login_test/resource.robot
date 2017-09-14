*** Settings ***
Documentation   Abstract away the resources for test
Library         AppiumLibrary
Library         Process

*** Variables ***
${APK_NAME}               moka.apk
${APK_PATH}               apk_res/${APK_NAME}
${APPIUM_ENDPOINT}        http://127.0.0.1:4723/wd/hub
${APP.PKG_NAME}           com.mokapos.android
${APP.LAUNCHER_ACT}       com.mokapos.ActivitySplashScreen
${DEVICE.NAME}            4200b0e2ec892400
${DEVICE.PLATFORM_NAME}   Android
${DEVICE.VERSION}         6.0.1

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
  Click Element    goToSignIn
  #or
  #Click Element    //*[@text='Sign In']
  #or
  #Click Element    //*[contains(@text, 'Sign')]

User Choose To Sign Up
  Wait Until Page Contains    "Create Account"
  Click Element    goToCreateAccount
