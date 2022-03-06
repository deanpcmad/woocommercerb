module WooCommerce
  class OrderNotesResource < Resource
    
    def list(order:, **params)
      response = get_request("orders/#{order}/notes", params: params)
      Collection.from_response(response, type: OrderNote)
    end

    def retrieve(order:, id:)
      OrderNote.new get_request("orders/#{order}/notes/#{id}").body
    end

    def create(order:, note:, **params)
      attributes = {note: note}
      OrderNote.new post_request("orders/#{order}/notes", body: attributes.merge(params)).body
    end

    def update(order:, id:, **params)
      OrderNote.new put_request("orders/#{order}/notes/#{id}", body: params).body
    end

    def delete(order:, id:)
      response = delete_request("orders/#{order}/notes/#{id}", params: {force: true})
      return true if response.success?
    end

  end
end
