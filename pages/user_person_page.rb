class UserPersonPage < UserPage

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
end