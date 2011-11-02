class MainPage < BrowserContainer
  URL = "http://docs.pravo.ru"

  def open
    @browser.goto URL
    self
  end

  def close
    @browser.close
    self
  end

  def login_open
    login_button.click
  end

  def login_as(user, pass)
    login_field.send_keys user
    password_field.send_keys pass
    auth_button.click
    Watir::Wait.until {profile_button.exist?}
  end

  def login?
    login_button.exist?
  end

  def logout
    if login? == false
      logout_button.click
    end
  end

  def go_profile
    profile_button.click
  end

  private

  def login_button
    @browser.element(:xpath => ".//*[@id='user_login_info']/a")
  end

  def logout_button
    @browser.element(:xpath => ".//*[@id='user_login_info']/a[1]")
  end

  def login_field
    @browser.frame(:index, 1).element_by_xpath(".//*[@id='email']")
  end

  def password_field
    @browser.frame(:index, 1).element_by_xpath(".//*[@id='password']")
  end

  def auth_button
    @browser.frame(:index, 1).element_by_xpath(".//*[@id='popup_container']/div[2]/form/fieldset[2]/div[2]/button")
  end

  def about_button
    @browser.element(:xpath => ".//*[@id='main-menu']/li[1]/a")
  end

  def favorites_button
    @browser.element(:class => "favorites")
  end

  def notes_button
    @browser.element(:class => "notes new")
  end

  def profile_button
    @browser.element(:class => "profile")
  end

  def blog_button
    @browser.element(:class => "social new")
  end

  def cases_button
    @browser.element(:xpath => "cases new")
  end

  def stats_button
    @browser.element(:xpath => "statistics new")
  end

  def help_button
    @browser.element(:xpath => "help")
  end

end