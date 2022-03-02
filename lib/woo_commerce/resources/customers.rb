module WooCommerce
  class CustomersResource < Resource
    
    def list(**params)
      response = get_request("customers", params: params)
      Collection.from_response(response, type: Customer)
    end

    def retrieve(id:)
      Customer.new get_request("customers/#{id}").body
    end

    def create(email:, **params)
      attributes = {email: email}
      Customer.new post_request("customers", body: attributes.merge(params)).body
    end

    def update(id:, **params)
      Customer.new put_request("customers/#{id}", body: params).body
    end

    def delete(id:)
      response = delete_request("customers/#{id}", params: {force: true})
      return true if response.success?
    end

  end
end
