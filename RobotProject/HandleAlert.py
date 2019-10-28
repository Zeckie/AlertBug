from SeleniumLibrary import SeleniumLibrary
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait
from SeleniumLibrary.base.librarycomponent import LibraryComponent
from robot.libraries.BuiltIn import BuiltIn



def alt_handle_alert(timeout:str=None):
    # based on AlertKeywords.handle_alert
    sl=BuiltIn().get_library_instance("SeleniumLibrary")
    
    timeout = LibraryComponent(sl).get_timeout(timeout)
    wait = WebDriverWait(sl.driver, timeout)

    alert = wait.until(EC.alert_is_present())
    alert.dismiss()



