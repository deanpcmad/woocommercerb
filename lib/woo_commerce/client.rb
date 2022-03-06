module WooCommerce
  class Client

    attr_reader :url, :api_key, :api_secret, :adapter

    def initialize(url:, api_key:, api_secret:, adapter: Faraday.default_adapter, stubs: nil)
      @url = url
      @api_key = api_key
      @api_secret = api_secret
      @adapter = adapter

      # Test stubs for requests
      @stubs = stubs
    end

    def coupons
      CouponsResource.new(self)
    end

    def customers
      CustomersResource.new(self)
    end

    def orders
      OrdersResource.new(self)
    end

    def products
      ProductsResource.new(self)
    end

    def product_categories
      ProductCategoriesResource.new(self)
    end

    def connection
      @connection ||= Faraday.new("#{url}/wp-json/wc/v3") do |conn|
        conn.request :authorization, :basic, api_key, api_secret
        conn.request :json

        conn.response :json, content_type: "application/json"

        conn.adapter adapter, @stubs
      end
    end

  end
end
