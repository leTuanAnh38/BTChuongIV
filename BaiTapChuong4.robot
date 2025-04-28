*** Settings ***
Documentation    Viết test case kiểm thử đăng nhập trang OrangeHRM
Library    SeleniumLibrary

*** Variables ***
${URL}                 https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${TRINH_DUYET}         chrome
${USERNAME}            Admin
${PASSWORD}            admin123
${MATKHAU_SAI}         sai_mat_khau

*** Test Cases ***
Đăng nhập thành công
    # Mở trình duyệt và vào trang login
    Mở trình duyệt
    # Thực hiện đăng nhập với tài khoản đúng
    Đăng nhập    ${USERNAME}    ${PASSWORD}
    # Kiểm tra đăng nhập thành công
    Kiểm tra đăng nhập thành công
    # Đóng trình duyệt
    Đóng trình duyệt

Đăng nhập thất bại
    # Mở trình duyệt và vào trang login
    Mở trình duyệt
    # Thực hiện đăng nhập với mật khẩu sai
    Đăng nhập    ${USERNAME}    ${MATKHAU_SAI}
    # Kiểm tra đăng nhập thất bại
    Kiểm tra đăng nhập thất bại
    # Đóng trình duyệt
    Đóng trình duyệt

*** Keywords ***
Mở trình duyệt
    Open Browser    ${URL}    ${TRINH_DUYET}
    Maximize Browser Window

Đăng nhập
    Wait Until Element Is Visible    xpath=//input[@name="username"]    timeout=10s
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Input Text    xpath=//input[@name="username"]    ${USERNAME}
    Input Text    xpath=//input[@name="password"]    ${PASSWORD}
    Click Button    xpath=//button[@type="submit"]

Kiểm tra đăng nhập thành công
    Wait Until Page Contains    Dashboard    timeout=10s

Kiểm tra đăng nhập thất bại
    Wait Until Page Contains    Invalid credentials    timeout=10s

Đóng trình duyệt
    Close Browser
