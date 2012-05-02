require "minitest/autorun"
require_relative "../lib/yareq"
require 'webmock/minitest'

STUB_FILE_PATH = File.join(File.dirname(__FILE__), "data", "response.html")
STUB_LINKS = %w(http://www.ford.ru/ http://www.ford-spb.ru/ http://www.Alarm-Motors.ru/ http://www.rolf-ford.ru/ http://www.rolf-ford.ru/spb/ http://www.ford.com/ http://www.euro-motors.ru/ http://www.tdv-auto.ru/ http://ru.wikipedia.org/wiki/Ford http://www.spbdrive.ru/autosaloons_list.php?mark=10)

describe "Request", "Yareq's Request example" do

  let(:request) { Yareq::Request.new "ford", { lr: "2" } }

  before do  
    stub_request(:get, request.instance_variable_get("@query")).
    with(:headers => {'User-Agent'=>'YaReQ was here.'}).
    to_return(:status => 200, :body =>  File.read(STUB_FILE_PATH), :headers => {})
  end

  it "has to initialize all necessary stuff" do
    %w(client pattern antipattern query doc).each do |attr|
      request.instance_variable_get("@#{attr}").wont_match nil
    end
  end

  it "has to send request to provider and get a response" do
    request.send(:send_request)
    request.instance_variable_get("@response").wont_match nil
  end

  it "has to process a response and return valid links" do
    request.process
    request.instance_variable_get("@results").must_equal STUB_LINKS
  end

end
