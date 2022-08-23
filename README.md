* Dependencys 
       "uri", "~> 0.10.0"
       'net-http', '~> 0.2.2'
       "openssl", "~> 2.2.1"
       
* Install
    gem install pix_kobana

* To do your own api call you need to pass your params 

    PixKobana::PixKobana.new(token: 'token', amount: 2.00, pix_account_id: id, expire_at: "", txid: txid ).api_request
