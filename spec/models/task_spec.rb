require 'spec_helper'

describe Task, :type => :model do

	it "validates" do
		task = Task.new(title: ' ' )
		task.valid?
		task.errors[:title].should_not be_empty
	end

	it "#due_date_cannot_be_in_the_past" do
		#task2 = create(:task, due_date: Date.today - 1)
		task = Task.create(due_date: Date.today - 1)
		task.valid?
		#binding.pry
		task.errors[:title].should_not be_empty
	end


end
