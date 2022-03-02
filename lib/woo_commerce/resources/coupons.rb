module WooCommerce
  class CouponsResource < Resource
    
    def list(**params)
      response = get_request("coupons", params: params)
      Collection.from_response(response, type: Coupon)
    end

    def retrieve(id:)
      Coupon.new get_request("coupons/#{id}").body
    end

    def create(code:, discount_type:, amount:, **params)
      attributes = {code: code, discount_type: discount_type, amount: amount.to_s}
      Coupon.new post_request("coupons", body: attributes.merge(params)).body
    end

    def update(id:, **params)
      Coupon.new put_request("coupons/#{id}", body: params).body
    end

    def delete(id:)
      response = delete_request("coupons/#{id}", params: {force: true})
      return true if response.success?
    end

  end
end
