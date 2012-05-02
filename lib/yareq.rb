require "yareq/version"
require "curb"
require "nokogiri"
require "addressable/uri"

module Yareq

  class YareqError < StandardError; end

  class Request

    PROVIDER_URL = "http://yandex.ru/yandsearch"
    PATTERN      = "a.b-serp-item__title-link"
    AD_PATTERN   = "yabs.yandex.ru"

    def initialize query, query_params = {}, params = {}
      @uri              = Addressable::URI.new
      @uri.query_values = { text: query }.merge query_params
      @query            = PROVIDER_URL + '/?' + @uri.query
      @pattern          = params[:pattern] || PATTERN
      @ad_pattern       = params[:ad_pattern] || AD_PATTERN
      init_client       @query
    end

    def process
      send_request
      process_response
    end

    private
  
      def send_request
        @client.perform
        @response = @client.body_str
      end

      def process_response
        @doc = Nokogiri::HTML.parse @response
        @results = @doc.css(@pattern).map { |node| node['href'] unless node['href'].include? @ad_pattern }.compact
        @results
      end

      def init_client request_str

        @client = Curl::Easy.new(request_str) do |curl|
          curl.headers["User-Agent"] = "YaReQ was here."
          curl.verbose               = true
        end

      end

  end
end
