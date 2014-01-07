class Task < ActiveRecord::Base
belongs_to :project
belongs_to :user
belongs_to :delegated, class_name: "User", foreign_key: "delegated_id"
validates :name, presence: true
validates :deadline, presence: true
validates :duration, presence: true, numericality: true

	def distance_from_now_in_days
	  (self.deadline - Date.today).to_i     
	end

	def is_delayed?
	 self.deadline < Date.today
	end

end
