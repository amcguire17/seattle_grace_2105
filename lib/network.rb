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

  def doctors_by_specialty
    all_doctors_by_specialty = Hash.new { |all, hospital| all[hospital] = [] }
    @hospitals.select do |hospital|
      hospital.doctors.select do |doctor|
        all_doctors_by_specialty[doctor.specialty] << doctor.name
      end
    end
    all_doctors_by_specialty
  end

  def average_doctors_salary
    total_hospitals_salary = @hospitals.sum do |hospital|
      hospital.total_salary
    end

    total_number_of_doctors = []
    @hospitals.map do |hospital|
      total_number_of_doctors << hospital.doctors
    end

    total_hospitals_salary.to_f / total_number_of_doctors.flatten.length
  end
end
