require 'spec_helper'

describe User, :type => :model do


it "validates" do
		#task = Task.new(title: ' ' )
		#task.valid?
		#task.errors[:title].should_not be_empty
	end

describe "#self.authenticate" do

	it "authenticate " do
		#task2 = create(:task, due_date: Date.today - 1)
		pass = Faker::Internet.password(8)
		user1 = create(:user, password: pass)
		#binding.pry
		user = User.authenticate(user1.email, pass)
		#binding.pry
		#task.valid?
		#task.errors[:title].should_not be_empty
	end
end

end