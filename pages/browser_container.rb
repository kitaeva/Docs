#encoding: utf-8
class BrowserContainer
  def initialize(browser)
    @browser = browser
  end

  def open
    @browser.goto URL
    self
  end

  def close
    @browser.close
    self
  end
end