#encoding: utf-8
require "browser_container"
require "login_page"

class MainPage < BrowserContainer
  include Login
  URL = "http://docs.pravo.ru"

  def login_open
    login_button.click
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
    UserPersonPage.new(@browser)
  end

  def profile_exist?
    profile_button.exist?
  end

  private

  def login_button
    @browser.element(:xpath => ".//*[@id='user_login_info']/a")
  end

  def logout_button
    @browser.element(:xpath => ".//*[@id='user_login_info']/a[1]")
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