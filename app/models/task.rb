class Task < ActiveRecord::Base
	belongs_to :user
	  #validates :priority, numericality: true
	  validates :title, presence: true,
                    length: { minimum: 5 }
      validates :priority, presence: true
      validate :due_date_cannot_be_in_the_past

      def due_date_cannot_be_in_the_past
      	if due_date.present? && due_date < Date.today
      	errors.add(:due_date, "can't be in the past")
      end
  	end
end
