module WooCommerce
  class ProductCategoriesResource < Resource
    
    def list(**params)
      response = get_request("products/categories", params: params)
      Collection.from_response(response, type: ProductCategory)
    end

    def retrieve(id:)
      ProductCategory.new get_request("products/categories/#{id}").body
    end

    def create(email:, **params)
      attributes = {email: email}
      ProductCategory.new post_request("products/categories", body: attributes.merge(params)).body
    end

    def update(id:, **params)
      ProductCategory.new put_request("products/categories/#{id}", body: params).body
    end

    def delete(id:)
      response = delete_request("products/categories/#{id}", params: {force: true})
      return true if response.success?
    end

  end
end
