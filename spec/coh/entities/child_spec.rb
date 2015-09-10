require 'spec_helper'

RSpec.describe Child do
  context "with birth date" do
    it "knows the age" do
      child = Child.new birthdate: 10.years.ago.to_date
      expect(child.age).to eql 10
    end
  end
end
