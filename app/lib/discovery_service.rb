class DiscoveryService
  @@service_url = "http://localhost:12345"

  def self.get_orders(user_id)
    resource = RestClient::Resource.new @@service_url + "/orders?user_id=#{user_id}"
    response = resource.get
    JSON.parse(response, symbolize_names: true)[:orders]
  end

  def self.get_order(order_id)
    resource = RestClient::Resource.new @@service_url + "/orders/#{order_id}"
    response = resource.get
    JSON.parse(response, symbolize_names: true)
  end

  def self.cancel_order(order_id)
    resource = RestClient::Resource.new @@service_url + "/orders/#{order_id}/cancel"
    resource.put({}.to_json)
  end

  def self.confirm_order(order_id)
    resource = RestClient::Resource.new @@service_url + "/orders/#{order_id}/confirm"
    resource.put({}.to_json)
  end

  def self.start_order(order_id, start_time)
    resource = RestClient::Resource.new @@service_url + "/orders/#{order_id}/start"
    resource.put({start_time: start_time}.to_json)
  end

  def self.complete_order(order_id, end_time)
    resource = RestClient::Resource.new @@service_url + "/orders/#{order_id}/complete"
    resource.put({end_time: end_time}.to_json)
  end

  def self.close_order(order_id)
    resource = RestClient::Resource.new @@service_url + "/orders/#{order_id}/close"
    resource.put({}.to_json)
  end

end