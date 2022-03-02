require "faraday"
require "json"
require_relative "woo_commerce/version"

module WooCommerce
  class Error < StandardError; end

  autoload :Client, "woo_commerce/client"
  autoload :Collection, "woo_commerce/collection"
  autoload :Resource, "woo_commerce/resource"
  autoload :Object, "woo_commerce/object"

  autoload :CouponsResource, "woo_commerce/resources/coupons"
  autoload :OrdersResource, "woo_commerce/resources/orders"

  autoload :Coupon, "woo_commerce/objects/coupon"
  autoload :Order, "woo_commerce/objects/order"

end
