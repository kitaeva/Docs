#encoding: utf-8
class UserPageContacts < UserPage

  def set_user_search_text(param)
    user_search_field.set(param)
  end

  def click_search
    search_button.click
  end

  private

  def user_search_field
    @browser.text_field(:id => "user-search")
  end

  def search_button
    @browser.button(:tag_name => "Найти")
  end


end