#encoding: utf-8
Given /^I am on the user person page$/ do
  @browsers.each do |browsers|
    if browsers.fetch(1) == "ff" or "ch"
      browsers.fetch(0).goto @url
      main_page = MainPage.new(browsers.fetch(0))
      if main_page.login? == false
        main_page.login_open
        Watir::Wait.until {main_page.login_field_exist?}
        main_page.login_as(@first_user.fetch(0), @first_user.fetch(1))
        Watir::Wait.until {main_page.profile_button_exist?}
        Watir::Wait.until {main_page.profile_button_visible?}
        main_page.go_profile
      else
        main_page.go_profile_welcome
      end
    end
  end
end

When /^I change the (.+)$/ do |field|
  @browsers.each do |browsers|
    if browsers.fetch(1) == "ff" or "ch"
      user_page_person = UsePagerPerson.new(browsers.fetch(0))
      if field == "name"
        @default_name = user_page_person.get_first_name_text
        user_page_person.set_first_name(@first_user.fetch(2)+"k")
        @changed_name = user_page_person.get_first_name_text
      elsif field == "surname"
        @default_surname = user_page_person.get_last_name_text
        user_page_person.set_last_name(@first_user.fetch(3)+"k")
        @changed_surname = user_page_person.get_last_name_text
      end
    end
  end
end

When /^click save button$/ do
  @browsers.each do |browsers|
    if browsers.fetch(1) == "ff" or "ch"
      user_page_person = UsePagerPerson.new(browsers.fetch(0))
      user_page_person.save
    end
  end
end

Then /^(\w+) must be preserved$/ do |field|
  @browsers.each do |browsers|
    if browsers.fetch(1) == "ff" or "ch"
      if field == "name"
        @default_name != @changed_name
      elsif field == "surname"
        @default_surname != @changed_surname
      end
    end
  end
end

When /^I refresh page$/ do
  @browsers.each do |browsers|
    if browsers.fetch(1) == "ff" or "ch"
      user_page_person = UsePagerPerson.new(browsers.fetch(0))
      user_page_person.refresh
    end
  end
end

Then /^(\w+) should not change$/ do |field|
  @browsers.each do |browsers|
    if browsers.fetch(1) == "ff" or "ch"
      user_page_person = UsePagerPerson.new(browsers.fetch(0))
      if field == "name"
        @changed_name == user_page_person.get_first_name_text
      elsif field == "surname"
        @changed_surname == user_page_person.get_last_name_text
      end
    end
  end
end

Then /^I revert (.+)$/ do |field|
  @browsers.each do |browsers|
    if browsers.fetch(1) == "ff" or "ch"
      user_page_person = UsePagerPerson.new(browsers.fetch(0))
      if field == "name"
        user_page_person.set_first_name(@default_name)
      elsif field == "surname"
        user_page_person.set_last_name(@default_surname)
      end
      user_page_person.save
    end
  end
end
