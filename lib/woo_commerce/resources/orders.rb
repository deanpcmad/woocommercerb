module WooCommerce
  class OrdersResource < Resource
    
    def list(**params)
      response = get_request("orders", params: params)
      Collection.from_response(response, type: Order)
    end

  end
end
