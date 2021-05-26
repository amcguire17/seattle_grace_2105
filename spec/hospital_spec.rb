require './lib/doctor'
require './lib/hospital'

RSpec.describe Hospital do
  before(:each) do
    @meredith = Doctor.new({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", salary: 100_000})
    @alex = Doctor.new({name: "Alex Karev", specialty: "Pediatric Surgery", education: "John Hopkins University", salary: 90_000})
    @seattle_grace = Hospital.new("Seattle Grace", "Richard Webber", [@meredith, @alex])
  end

  it "exists" do
    expect(@seattle_grace).to be_a(Hospital)
  end

  it "has attributes" do
    expect(@seattle_grace.name).to eq("Seattle Grace")
    expect(@seattle_grace.chief_of_surgery).to eq("Richard Webber")
    expect(@seattle_grace.doctors).to eq([@meredith, @alex])
  end

  it "can tell total salary" do
    expect(@seattle_grace.total_salary).to eq(190000)
  end

  it "can tell the lowest paid doctor" do
    expect(@seattle_grace.lowest_paid_doctor).to eq("Alex Karev")
  end

  it "can list specialties" do
    expect(@seattle_grace.specialties).to eq(["General Surgery", "Pediatric Surgery"])
  end
end
