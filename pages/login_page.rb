#encoding: utf-8
module Login

  def login_as(user, pass)
    login_field.send_keys user
    password_field.send_keys pass
    auth_button.click
  end

  def get_login_text
    login_field.text
  end

  def get_password_text
    password_field.text
  end

  def login_field_exist?
    begin
      sleep 2
      login_field.exist?
    rescue Selenium::WebDriver::Error::ObsoleteElementError
      sleep 2
      login_field.exist?
    end
  end

  def login_iframe_exist?
    begin
      sleep 2
      login_iframe.exist?
    rescue Selenium::WebDriver::Error::ObsoleteElementError
      sleep 2
      login_iframe.exist?
    end
  end

  private

  def login_iframe
    @browser.frame(:index => 1)
  end

  def login_field
    @browser.frame(:index => 1).text_field(:id => "email")
  end

  def password_field
    @browser.frame(:index => 1).text_field(:id => "password")
  end

  def auth_button
    @browser.frame(:index => 1).button(:type => "submit")
  end

  def remember_checkbox
    @browser.frame(:index => 1).checkbox(:name => "remember_me")
  end

  def remember_button
    @browser.frame(:index => 1).button(:tag_name => "Вспомнить пароль")
  end

  def goto_registration
    @browser.frame(:index => 1).button(:tag_name => "Зарегистрируйся сейчас!")
  end

end

module Registration

  private

  def first_name_field
    @browser.frame(:index => 1).text_field(:id => "first_name")
  end

  def last_name_field
    @browser.frame(:index => 1).text_field(:id => "first_name")
  end

  def email_field
    @browser.frame(:index => 1).text_field(:id => "email")
  end

  def password_field
    @browser.frame(:index => 1).text_field(:id => "password")
  end

  def registration_button
    @browser.frame(:index => 1).button(:class_name => "b-popup-form-button b-popup-form-button--submit")
  end

end