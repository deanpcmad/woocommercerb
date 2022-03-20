module WooCommerce
  class ProductVariationsResource < Resource
    
    def list(product:, **params)
      response = get_request("products/#{product}/variations", params: params)
      Collection.from_response(response, type: ProductVariation)
    end

    def retrieve(product:, id:)
      ProductVariation.new get_request("products/#{product}/variations/#{id}").body
    end

  end
end
