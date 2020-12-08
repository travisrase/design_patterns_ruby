class Dog
    attr_accessor :state
    private :state

    def initialize(state)
      transition_to(state)
    end
  
    def transition_to(state)
      puts "Context: Transition to #{state.class}"
      @state = state
      @state.context = self
    end
  
    def bark
      @state.bark
    end
  
    def cry
      @state.cry
    end
  end
  
  class State
    attr_accessor :context

    def bark
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  
    def cry
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
  
  class Happy < State
    def bark
        puts "Dog is excited"
      #@context.transition_to(ConcreteStateB.new)
    end
  
    def cry
      puts 'Dog wants to play'
    end
  end
  
  class Sad < State
    def bark
      puts 'Dog is mad'
    end
  
    def cry
      puts 'Dog is scared'
      #@context.transition_to(ConcreteStateA.new)
    end
  end
  
  # The client code.
  
dog = Dog.new(Happy.new)
dog.bark
dog.cry

puts "Dog state transition to sad"

dog.transition_to(Sad.new)
dog.bark
dog.cry