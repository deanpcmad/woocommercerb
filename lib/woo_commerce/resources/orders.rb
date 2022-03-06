module WooCommerce
  class OrdersResource < Resource
    
    def list(**params)
      response = get_request("orders", params: params)
      Collection.from_response(response, type: Order)
    end

    def retrieve(id:)
      Order.new get_request("orders/#{id}").body
    end

    def create(**params)
      Order.new post_request("orders", body: params).body
    end

    def update(id:, **params)
      Order.new put_request("orders/#{id}", body: params).body
    end

    def delete(id:)
      response = delete_request("orders/#{id}", params: {force: true})
      return true if response.success?
    end

  end
end
