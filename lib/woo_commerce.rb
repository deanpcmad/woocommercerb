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
  autoload :CustomersResource, "woo_commerce/resources/customers"
  autoload :OrdersResource, "woo_commerce/resources/orders"
  autoload :OrderNotesResource, "woo_commerce/resources/order_notes"
  autoload :ProductsResource, "woo_commerce/resources/products"
  autoload :ProductCategoriesResource, "woo_commerce/resources/product_categories"
  autoload :ProductVariationsResource, "woo_commerce/resources/product_variations"

  autoload :Coupon, "woo_commerce/objects/coupon"
  autoload :Customer, "woo_commerce/objects/customer"
  autoload :Order, "woo_commerce/objects/order"
  autoload :OrderNote, "woo_commerce/objects/order_note"
  autoload :Product, "woo_commerce/objects/product"
  autoload :ProductCategory, "woo_commerce/objects/product_category"
  autoload :ProductVariation, "woo_commerce/objects/product_variation"

end
