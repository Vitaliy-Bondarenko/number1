FactoryGirl.define do
	factory :task do
		title { Faker::Name.name }
		description { Faker::Lorem.sentence(3, true) }
		priority "3"
		due_date Date.today + 7
	end
end