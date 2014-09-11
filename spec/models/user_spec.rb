require 'spec_helper'

#, :type => :model

describe User, :type => :model do

  subject { FactoryGirl.build(:user) }

    it { should be_valid }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
    it { should validate_confirmation_of :password }
    it { should validate_numericality_of :age}


#begin
describe "#self.authenticate" do

  it "authenticate " do
    #task2 = create(:task, due_date: Date.today - 1)
    pass = Faker::Internet.password(8)
    user1 = create(:user, password: pass)
    #binding.pry
    user = User.authenticate(user1.email, pass)
    #binding.pry
    #expect(user).to have(1).items
    #task.valid?
    #task.errors[:title].should_not be_empty
  end
end
#end
end
