class Network
  attr_reader :name, :hospitals

  def initialize(name)
    @name = name
    @hospitals = []
  end

  def add_hospital(hospital)
    @hospitals << hospital
  end

  def highest_paid_doctor
    highest = @hospitals[0].doctors[0].salary
    @hospitals.select do |hospital|
      hospital.doctors.select do |doctor|
        return doctor if doctor.salary > highest
      end
    end
  end

  def doctors_by_hospital
    all_doctors_by_hospital = Hash.new { |all, hospital| all[hospital] = [] }
    @hospitals.select do |hospital|
      hospital.doctors.select do |doctor|
        all_doctors_by_hospital[hospital] << doctor.name
      end
    end
    all_doctors_by_hospital
  end

  
end
