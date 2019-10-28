*** Settings ***
Library    SeleniumLibrary  run_on_failure=Nothing
Library    HandleAlert.py
Test Teardown    Close All Browsers
*** Test Cases ***

QuickAlertCheck
    [Documentation]    Show what happens when no alert found (fails with message "Alert not found in 2 seconds.")
    Open Browser    about:blank  chrome
    Run Keyword And Expect Error   *Alert not found*   Handle Alert    timeout=2 seconds
    Close All Browsers

DelayedClose
    [Documentation]    Show what happens when something stops it waiting for the timeout (eg. tab closed)
    Open Browser    about:blank  chrome
    Execute Javascript    a=window.open("about:blank"); window.setTimeout(function(){a.close()},10000);
    Switch Window   NEW 
    Handle Alert    timeout=120 seconds
    Close All Browsers

AltDelayedClose
    [Documentation]    Show what happens when something stops it waiting for the timeout (eg. tab closed)
    ...    Uses custom keyword that does not catch the exception
    Open Browser    about:blank  chrome
    Execute Javascript    a=window.open("about:blank"); window.setTimeout(function(){a.close()},10000);
    Switch Window   NEW 
    Alt Handle Alert    timeout=120 seconds
    Close All Browsers
    
    
HandleTheAlert
    [Documentation]    Handle an alert - shows what happens when an alert appears
    Open Browser    about:blank  chrome
    Execute Javascript    window.setTimeout(alert,100);
    Handle Alert    timeout=2 seconds
    Close All Browsers    

AltHandleTheAlert
    [Documentation]    Handle an alert - shows what happens when an alert appears
    Open Browser    about:blank  chrome
    Execute Javascript    window.setTimeout(alert,100);
    Alt Handle Alert    timeout=2 seconds
    Close All Browsers    
    
    
DifferentKeyword
    [Documentation]    Show how a different keyword handles something stops it waiting for the timeout (eg. tab closed)
    Open Browser    about:blank  chrome
    Execute Javascript    a=window.open("about:blank"); window.setTimeout(function(){a.close()},10000);
    Switch Window   NEW 
    Wait Until Page Contains    Text that will never appear    timeout=120 seconds
    Close All Browsers
