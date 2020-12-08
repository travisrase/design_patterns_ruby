# from: https://dev.to/pashagray/simple-pub-sub-pattern-oop-using-pure-ruby-49eh

module Publisher
    def subscribe(subscribers)
        @subscribers ||= []
        @subscribers += subscribers
    end

    def broadcast(event, *payload)
        @subscribers ||= []
        @subscribers.each do |subscriber|
            subscriber.public_send(event.to_sym, *payload) if subscriber.respond_to?(event)
        end
    end
end

class Item
    attr_reader :code, :title

    def initialize(code:, title:)
        @code = code
        @title = title
    end

    def to_s
        "#{@code} #{@title}"
    end
end

class Checkout
    include Publisher

    attr_reader :items

    def initialize(subscribers:)
        @items = []
        subscribe(subscribers)
    end

    def add(item)
        @items << item
        broadcast(:item_added, item)
    end
end

class Printer
    def item_added(item)
        print(item)
    end

    private

    def print(message)
        puts "[#{Time.now}] #{message}"
    end
end


item1 = Item.new(code: "DRP", title: "Dr.Pepper")
item2 = Item.new(code: "CCL", title: "Coca-Cola")

checkout = Checkout.new(subscribers: [Printer.new])

checkout.add(item1)
checkout.add(item2)