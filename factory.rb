class ProductSuper
  def factory_method
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def getPrice
    price = factory_method.price
  end
end

class Product < ProductSuper
    def initialize
        @price = 0
    end

    def price=(price)
        @price = price
    end

    def price
        @price
    end

    def factory_method
        Product.new
    end
end

coffee = Product.new
coffee.price = 5
puts "coffee price: " + coffee.getPrice.to_s
puts "should be 0"