#encoding: utf-8
require "watir-webdriver"
require 'rspec/expectations'
Dir[File.dirname(__FILE__) + '/../../../../pages/*.rb'].each {|file| require file }

#browser_ie = Watir::Browser.new(:remote, :url => "http://127.0.0.1:4444/wd/hub", :desired_capabilities => :internet_explorer)
browser_ff = Watir::Browser.new(:remote, :url => "http://127.0.0.1:4444/wd/hub", :desired_capabilities => :firefox)
#browser_op = Watir::Browser.new(:remote, :url => "http://127.0.0.1:4444/wd/hub", :desired_capabilities => :opera)
browser_ch = Watir::Browser.new(:remote, :url => "http://127.0.0.1:4444/wd/hub", :desired_capabilities => :chrome)
browsers = [browser_ch, browser_ff]
Before do
  @browsers = browsers
end




at_exit do
  browsers.each do |browser|
    browser.close
  end
end

