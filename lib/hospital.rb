class Hospital
  attr_reader :name, :chief_of_surgery, :doctors

  def initialize(name, chief_of_surgery, doctors)
    @name = name
    @chief_of_surgery = chief_of_surgery
    @doctors = doctors
  end

  def total_salary
    @doctors.sum do |doctor|
      doctor.salary
    end
  end

  def lowest_paid_doctor
    lowest = @doctors[0].salary
    @doctors.select do |doctor|
      return doctor.name if doctor.salary < lowest
    end
  end

  def specialties
    list_of_specialties = []
    @doctors.each do |doctor|
      list_of_specialties << doctor.specialty
    end
    list_of_specialties
  end
end
