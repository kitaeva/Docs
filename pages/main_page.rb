#encoding: utf-8
#require "browser_container.rb"
#require "login_page.rb"

class MainPage < BrowserContainer
  include Login
  URL = "http://docs.pravo.ru"

  def login_open
    login_button.click
  end

  def login?
    welcome_button.exist?
  end

  def logout
    if login? == false
      logout_button.click
    end
  end

  def go_profile
    #UsePagerPerson.new(@browser)
    profile_button.click
  end

  def profile_button_exist?
    begin
      sleep 2
      profile_button.exist?
    rescue Selenium::WebDriver::Error::ObsoleteElementError
      sleep 2
      profile_button.exist?
    end
  end

  def profile_button_visible?
    begin
      sleep 2
      profile_button.visible?
    rescue Selenium::WebDriver::Error::ObsoleteElementError
      sleep 2
      profile_button.visible?
    end
  end

  def search_input_focus
    search_input.click
  end

  def go_profile_welcome
    welcome_button.click
  end

  private

  def

  def search_input
    @browser.input(:id => "ac_big-field")
  end

  def login_button
    @browser.element(:xpath => ".//*[@id='user_login_info']/a")
  end

  def welcome_button
    @browser.element(:xpath => ".//*[@id='user_login_info']/a[2]")
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
    @browser.element(:xpath => ".//*[@id='main-menu']/li[4]/a")
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