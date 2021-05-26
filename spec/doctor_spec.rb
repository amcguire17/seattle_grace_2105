require './lib/doctor'

RSpec.describe Doctor do
  it "exists" do
    meredith = Doctor.new({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", salary: 100_000})

    expect(meredith).to be_a(Doctor)
  end

  it "has attributes" do
    meredith = Doctor.new({name: "Meredith Grey", specialty: "General Surgery", education: "Harvard University", salary: 100_000})

    expect(meredith.name).to eq("Meredith Grey")
    expect(meredith.specialty).to eq("General Surgery")
    expect(meredith.education).to eq("Harvard University")
    expect(meredith.salary).to eq(100000)
  end
end
