from selenium import webdriver
import time

driver_path = "/home/blackdracula/.config/bin/chromedriver"
brave_path = "/usr/bin/brave"
option = webdriver.ChromeOptions()
option.binary_location = brave_path
browser = webdriver.Chrome(executable_path=driver_path, options=option)

url = "https://iiumwifilogin2.iium.edu.my/guest/IIUM-Student_login.php?cmd=login&mac=5c:ac:4c:96:4d:6a&ip=10.111.210.136&essid=IIUM%2DStudent&apname=BILAL%2FAP%2FBL%20E%2FL3%2F03-1&apgroup=iium-gombak-Mahallah-3-2&url=http%3A%2F%2Fiium%2Eedu%2Emy%2F&_browser=1"
browser.get(url)
username = "1821881"
password = "#" #literally forget with my plain text password
user_name_id = "ID_form9f568583_weblogin_user"
password_id = "ID_form9f568583_weblogin_password"
submit_id = "ID_form9f568583_weblogin_submit"
browser.find_element_by_id(user_name_id).send_keys(username)
browser.find_element_by_id(password_id).send_keys(password)
browser.find_element_by_id(submit_id).click()
time.sleep(2)
