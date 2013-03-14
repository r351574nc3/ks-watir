require 'spec_helper'
require 'watir'
require 'selenium-webdriver'

describe 'Proposal' do

  before :all do
    caps = Selenium::WebDriver::Remote::Capabilities.firefox(:proxy => Selenium::WebDriver::Proxy.new(:http => "localhost:9000"))
    
    @browser = Watir::Browser.new(:remote, :desired_capabilities => caps)
    @browser.goto "http://env2.ks.kuali.org"
  end

  it "can login as fred" do
    sleep 5
  end

  after :all do
    @browser.close
  end
end
