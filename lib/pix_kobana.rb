# frozen_string_literal: true

require_relative "pix_kobana/version"
require 'uri'
require 'net/http'
require 'openssl'

module PixKobana
  class Error < StandardError; end

  class PixKobana
    attr_accessor :url, :token, :amount, :pix_account_id, :expire_at, :txid
    def initialize(options = {})
        @url = URI("https://api-sandbox.kobana.com.br/v2/charge/pix")
        @token = options[:token]
        @amount = options[:amount]
        @pix_account_id = options[:pix_account_id]
        @expire_at = options[:expire_at]
        @txid = options[:txid]
    end
  
    def make
      api_request
    end
  
    def api_request
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
  
      request = Net::HTTP::Post.new(url)
      request["Accept"] = 'application/json'
      request["Content-Type"] = 'application/json'
      request["Authorization"] = "Bearer #{token}"
      request.body = "{\"amount\":#{amount},\"pix_account_id\":#{pix_account_id},\"expire_at\":\"#{expire_at}\"}"
      request.body = "{\"amount\":#{amount},\"pix_account_id\":#{pix_account_id},\"expire_at\":\"#{expire_at}\",\"txid\":\"#{txid}\"}"
      response = http.request(request)
      response.body
    end
  end  
end
