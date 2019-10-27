*** Settings ***
Library    SeleniumLibrary  run_on_failure=Nothing
Test Teardown    Close All Browsers
*** Test Cases ***

QuickAlertCheck
    [Documentation]    Show what happens when no alert found (fails with message "Alert not found in 2 seconds.")
    Open Browser    about:blank  chrome
    Handle Alert    timeout=2 seconds
    Close All Browsers

DelayedCrash
    [Documentation]    Show when something stops it waiting for the timeout (eg. browser crash or tab closed)
    Open Browser    about:blank  chrome
    Execute Javascript    a=window.open("about:blank"); window.setTimeout(function(){a.close()},10000);
    Switch Window   NEW 
    Handle Alert    timeout=120 seconds
    Close All Browsers