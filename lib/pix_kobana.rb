require_relative "pix_kobana/version"
require 'uri'
require 'net/http'
require 'openssl'

module PixKobana
  class Error < StandardError; end

  class PixKobana
    attr_accessor :url, :token, :amount, :pix_account_id, :expire_at, :txid, :payer_document_number, :payer_name, :message
    def initialize(options = {})
        @url = URI("https://api-sandbox.kobana.com.br/v2/charge/pix")
        @token = options[:token]
        @amount = options[:amount]
        @pix_account_id = options[:pix_account_id]
        @expire_at = options[:expire_at]
        @txid = options[:txid]
        @payer_document_number = options[:payer_document_number]
        @payer_name = options[:payer_name]
        @message = options[:message]
    end
  
    def api_request
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
  
      request = Net::HTTP::Post.new(url)
      request["Accept"] = 'application/json'
      request["Content-Type"] = 'application/json'
      request["Authorization"] = "Bearer #{token}"
  
      request.body = "{ 
                        \"amount\":#{amount},
                        \"pix_account_id\":#{pix_account_id},
                        \"expire_at\":\"#{expire_at}\",
                        \"txid\":\"#{txid}\", 
                        \"payer\":{\"document_number\":\"#{payer_document_number}\",\"name\":\"#{payer_name}\"},
                        \"message\":\"#{message}\"
                      }" if payer_name != nil && payer_document_number != nil


      request.body = "{
                        \"amount\":#{amount},
                        \"pix_account_id\":#{pix_account_id},
                        \"expire_at\":\"#{expire_at}\",
                        \"txid\":\"#{txid}\",
                        \"message\":\"#{message}\"
                      }" if payer_document_number == nil || payer_name == nil
  
      response = http.request(request)
      response.body
    end
  end
end
