class SloganMaker
    attr_reader :company_name
  
    @instance_mutex = Mutex.new
  
    private_class_method :new
  
    def initialize(company_name)
      @company_name = company_name
    end
  
    def self.instance(company_name)
      return @instance if @instance
  
      @instance_mutex.synchronize do
        @instance ||= new(company_name)
      end
  
      @instance
    end
  
    def slogan1
      company_name + " sells the best product!"
    end

    def slogan2
        company_name + " is the best there is!"
    end

    def slogan3
        company_name + " they're great!"
    end
end
  
singleton = SloganMaker.instance("Marketron")
puts singleton.slogan1
puts singleton.slogan2
puts singleton.slogan3

