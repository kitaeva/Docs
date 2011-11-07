#encoding: utf-8
module Login

  def login_as(user, pass)
    login_field.send_keys user
    password_field.send_keys pass
    auth_button.click
    Watir::Wait.until {profile_button.exist?}
  end

  private

  def login_field
    @browser.frame(:index, 1).element_by_xpath(".//*[@id='email']")
  end

  def password_field
    @browser.frame(:index, 1).element_by_xpath(".//*[@id='password']")
  end

  def auth_button
    @browser.frame(:index, 1).element_by_xpath(".//*[@id='popup_container']/div[2]/form/fieldset[2]/div[2]/button")
  end

end