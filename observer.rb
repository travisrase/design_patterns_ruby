class Subject
  def attach(observer)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def detach(observer)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def notify
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class PoliceDispatcher < Subject
  attr_accessor :zone

  def initialize
    @police_cars = []
  end

  def attach(police_car)
    @police_cars << police_car
  end

  def detach(police_car)
    @police_cars.delete(police_car)
  end

  def notify
    puts 'Subject: Notifying police cars...'
    @police_cars.each { |police_car| police_car.update(self) }
  end

  def some_business_logic
    puts "\nCrime has happened."
    @zone = rand(0..10)

    puts "Crime in zone: #{@zone}"
    notify
  end
end

class Observer
  def update(_subject)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class PoliceCarA < Observer
  def update(subject)
    puts 'Police Car A en route to zone: #{subject.zone}' if subject.zone < 5
  end
end

class PoliceCarB < Observer
    def update(subject)
      puts 'Police Car B en route to zone: #{subject.zone}' if subject.zone >= 5
    end
end

policeDispatcher = PoliceDispatcher.new

policeCar_a = PoliceCarA.new
policeDispatcher.attach(policeCar_a)

policeCar_b = PoliceCarB.new
policeDispatcher.attach(policeCar_b)

policeDispatcher.some_business_logic
