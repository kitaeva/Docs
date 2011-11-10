#encoding: utf-8
#require "browser_container.rb"
class UserPage < BrowserContainer

  def goto_my_data
    my_data_button.click
    UsePagerPerson.new(@browser)
  end

  def goto_my_contact
    my_contact_button.click
    UserPageContacts.new(@browser)
  end

  def goto_my_company
    my_company_button.click
    UserCompanyPage.new(@browser)
  end

  def contact_invite?
    contact_invite.exist?
  end

  def company_invite?
    company_invite.exist?
  end

  def my_contact_button_activ?
    if my_contact_button_activ.exist? == false
      return true
    else
      return false
    end
  end

  def my_company_button_activ?
    if my_company_button_activ.exist? == false
      return true
    else
      return false
    end
  end

  def my_data_button_activ?
    if my_data_button_activ.exist? == false
      return true
    else
      return false
    end
  end

  private

  def my_data_button
    @browser.element(:xpath => ".//*[@id='left_column_content']/div/div/ul/li[1]/span")
  end

  def my_contact_button
    @browser.element(:xpath => ".//*[@id='left_column_content']/div/div/ul/li[2]/span")
  end

  def my_company_button
    @browser.element(:xpath => ".//*[@id='left_column_content']/div/div/ul/li[2]/span")
  end

  def contact_invite
    @browser.element(:xpath => ".//*[@id='left_column_content']/div/div/ul/li[2]/span/a/i[2]")
  end

  def company_invite
    @browser.element(:xpath => ".//*[@id='left_column_content']/div/div/ul/li[2]/span/a/i[3]")
  end

  def my_data_button_activ
    @browser.element(:xpath => ".//*[@id='left_column_content']/div/div/ul/li[1]/span/a")
  end

  def my_contact_button_activ
    @browser.element(:xpath => ".//*[@id='left_column_content']/div/div/ul/li[2]/span/a")
  end

  def my_company_button_activ
    @browser.element(:xpath => ".//*[@id='left_column_content']/div/div/ul/li[2]/span/a")
  end
end
