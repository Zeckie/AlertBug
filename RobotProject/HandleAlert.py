from SeleniumLibrary import SeleniumLibrary
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from SeleniumLibrary.base.librarycomponent import LibraryComponent
from robot.libraries.BuiltIn import BuiltIn
from selenium.common.exceptions import TimeoutException, WebDriverException
from SeleniumLibrary.utils import secs_to_timestr


def alt_handle_alert(timeout:str=None):
    # based on AlertKeywords.handle_alert
    sl=BuiltIn().get_library_instance("SeleniumLibrary")
    
    timeout = LibraryComponent(sl).get_timeout(timeout)
    wait = WebDriverWait(sl.driver, timeout)

    try:
        #from AlertKeywords._wait_alert
        alert = wait.until(EC.alert_is_present())
        
        #from AlertKeywords._handle_alert
        alert.dismiss()
    except TimeoutException:
            raise AssertionError('Alert not found in %s.'
                             % secs_to_timestr(timeout))
    except WebDriverException as e:
        raise AssertionError('An exception occurred waiting for alert: %s'
                             % str(e))

  



