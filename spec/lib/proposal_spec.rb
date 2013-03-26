# -*- coding: utf-8 -*-
require 'page-object'
require 'watir-webdriver'
require 'page-object/page_factory'
require 'rubygems'
 
class LoginPage 
  include PageObject
  direct_url "http://env15.ks.kuali.org/"

  text_field(:username, :name => 'j_username')
  text_field(:password, :name => 'j_password')
  button(:login, :value => 'Login')
end


describe 'Proposal' do

  before :all do
    caps = Selenium::WebDriver::Remote::Capabilities.firefox(:proxy => Selenium::WebDriver::Proxy.new(:http => "localhost:9000"))
    
    #@browser = Watir::Browser.new(:remote, :desired_capabilities => caps)
    @browser = Watir::Browser.new(:remote)
    @browser.goto "http://env15.ks.kuali.org"
  end

  it "can login as fred" do
    login_page = LoginPage.new(@browser)
    login_page.username = 'fred'
    login_page.password = 'fred'
    login_page.login
    sleep 1000
  end

  after :all do
    @browser.close
  end
end
