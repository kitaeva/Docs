#encoding: utf-8
Given /^I am on the user person page$/ do
  @browsers.each do |browsers|
    browsers.goto "http://docs.pravo.ru"
    main_page = MainPage.new(browsers)
    main_page.login_open
    Watir::Wait.until {main_page.login_field_exist?}
    main_page.login_as("elufimov@gmail.com", "zxx")
    Watir::Wait.until {main_page.profile_button_exist?}
    Watir::Wait.until {main_page.profile_button_visible?}
    main_page.go_profile
  end
end

When /^I change the name$/ do
  @browsers.each do |browser|
    user_page_person = UsePagerPerson.new(browser)
    @default_name = user_page_person.get_first_name_text
    user_page_person.set_first_name("Михаилл")
    @changed_name = user_page_person.get_first_name_text
  end
end

When /^click save button$/ do
  @browsers.each do |browser|
    user_page_person = UsePagerPerson.new(browser)
    user_page_person.save
  end
end

Then /^name must be preserved$/ do
  @browsers.each do
    @default_name != @changed_name
  end
end

When /^I refresh page$/ do
  @browsers.each do |browser|
    user_page_person = UsePagerPerson.new(browser)
    user_page_person.refresh
  end
end

Then /^name should not change$/ do
  @browsers.each do |browser|
    user_page_person = UsePagerPerson.new(browser)
    @changed_name == user_page_person.get_first_name_text
  end
end

Then /^I revert name$/ do
  @browsers.each do |browser|
    user_page_person = UsePagerPerson.new(browser)
    user_page_person.set_first_name(@default_name)
    user_page_person.save
  end
end
