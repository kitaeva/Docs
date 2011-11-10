#encoding: utf-8
#require "user_page.rb"
class UserPageContacts < UserPage

  def set_user_search_text(param)
    user_search_field.set(param)
  end

  def click_search
    search_button.click
  end

  private

  def user_search_field
    @browser.input(:id => "user-search")
  end

  def search_button
    @browser.button(:tag_name => "Найти")
  end

  def contact_search_input
    @browser.text_field(:id => "document_query")
  end

  def friend_first
    @browser.element(:xpath => ".//*[@id='contact_list']/div/ul/li[1]/div")
  end

  def delete_friend_first_button
    @browser.element(:xpath => ".//*[@id='contact_list']/div/ul/li[1]/div/div[2]/div[2]/a")
  end

  def clean_contact_search_button
    @browser.element(:xpath => ".//*[@id='right_column_content']/div/div[1]/label/span/i[2]")
  end

  def requests_block
    @browser.element(:class_name => "b-requests")
  end


end