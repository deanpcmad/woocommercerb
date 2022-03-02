module WooCommerce
  class ProductsResource < Resource
    
    def list(**params)
      response = get_request("products", params: params)
      Collection.from_response(response, type: Product)
    end

    def retrieve(id:)
      Product.new get_request("products/#{id}").body
    end

    def create(email:, **params)
      attributes = {email: email}
      Product.new post_request("products", body: attributes.merge(params)).body
    end

    def update(id:, **params)
      Product.new put_request("products/#{id}", body: params).body
    end

    def delete(id:)
      response = delete_request("products/#{id}", params: {force: true})
      return true if response.success?
    end

  end
end
