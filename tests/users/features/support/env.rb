#encoding: utf-8
require "watir-webdriver"
require 'rspec/expectations'
require "yaml"

Dir[File.dirname(__FILE__) + '/../../../../pages/*.rb'].each {|file| require file }
config_dir =  Dir[File.dirname(__FILE__) + '/../../../../config.yaml'].fetch(0)
config = File.open(config_dir) { |yf| YAML::load( yf ) }
hub_urls = config["hub_url"]
#browser_ie = Watir::Browser.new(:remote, :url => hub_urls+"/wd/hub", :desired_capabilities => :internet_explorer)
browser_ff = Watir::Browser.new(:remote, :url => hub_urls+"/wd/hub", :desired_capabilities => :firefox)
#browser_op = Watir::Browser.new(:remote, :url => hub_urls+"/wd/hub", :desired_capabilities => :opera)
browser_ch = Watir::Browser.new(:remote, :url => hub_urls+"/wd/hub", :desired_capabilities => :chrome)
browsers = [[browser_ch, "ch"], [browser_ff, "ff"]]

Before('@MainPage') do
  browser_ff.close
  browsers.delete_at(1)
  @url = config["urls"].fetch(0)
  @first_user = config["users"].fetch(1)
  @browsers = browsers
  @browser_ch = browser_ch
end

Before('@UserPerson') do
  @url = config["urls"].fetch(0)
  @first_user = config["users"].fetch(1)
  @browsers = browsers
  @browser_ch = browser_ch
  @browser_ff = browser_ff
end


at_exit do
  browsers.each do |browser|
    browser.fetch(0).close
  end
end