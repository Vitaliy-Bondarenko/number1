class Task < ActiveRecord::Base
	belongs_to :user
	  #validates :priority, numericality: true
	  validates :title, presence: true,
                    length: { minimum: 5 }

end
