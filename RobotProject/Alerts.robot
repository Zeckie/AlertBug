*** Settings ***
Library    SeleniumLibrary  run_on_failure=Nothing

*** Test Cases ***

QuickAlertCheck
    [Documentation]    Show what happens when no alert found (fails with message "Alert not found in 2 seconds.")
    Open Browser    about:blank  chrome
    Handle Alert    timeout=2 seconds
    Close All Browsers
