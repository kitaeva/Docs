#encoding: utf-8
#require "user_page.rb"
class UsePagerPerson < UserPage

  def set_avatar(param)
    path = Dir.pwd
    if param == "1"
      avatar_field.set(path+"/img/1.png")
    elsif param == "2"
      avatar_field.set(path+"/img/2.png")
    end
  end

  def get_region_text
    region_select.selected_options
  end

  def set_region(param)
    region_select.select(param)
  end

  def get_specialization_text
    specialization_select.selected_options
  end

  def set_specilization(param)
    specialization_select.select(param)
  end

  def get_phone_text
    phone_field.value
  end

  def set_phone(param)
    phone_field.set(param)
  end

  def get_first_name_text
    first_name_field.value
  end

  def set_first_name(param)
    first_name_field.set(param)
  end

  def get_last_name_text
    last_name_field.value
  end

  def set_last_name(param)
    last_name_field.set(param)
  end

  def save
    submit_button.click
  end
  private

  def avatar_field
    @browser.file_field(:id => "b-upload-file-input")
  end

  def avatar_img
    @browser.image(:xpath => ".//*[@id='module_content']/div/div/div/div/img")
  end

  def first_name_field
    @browser.text_field(:id => "first-name")
  end

  def last_name_field
    @browser.text_field(:id => "last-name")
  end

  def region_select
    @browser.select(:name => "data[region_id]")
  end

  def specialization_select
    @browser.select(:name => "data[specialization_id]")
  end

  def phone_field
    @browser.text_field(:id => "phone")
  end

  def password_field
    @browser.text_field(:xpath => ".//*[@id='module_content']/div/div/form/table/tbody/tr[4]/td[1]/label/span[2]/span/input[2]")
  end

  def password_re_field
    @browser.text_field(:xpath => ".//*[@id='module_content']/div/div/form/table/tbody/tr[4]/td[3]/label/span[2]/span/input[2]")
  end

  def submit_button
    @browser.button(:type => "submit")
  end

  def notification_popap
    @browser.element(:xpath => ".//*[@id='liquid_column']/div[1]/div")
  end

  def allow_news_checkbox
    @browser.checkbox(:name => "data[allow_news]")
  end
end