#encoding: utf-8
Given /^I am on main page$/ do
  @browser_ch.goto "http://docs.pravo.ru"
end

When /^I Open regions select$/ do
  @browser_ch.goto "http://google.com"
end

Then /^Region popup present$/ do
  @browser_ch.goto "http://ya.ru"
end
