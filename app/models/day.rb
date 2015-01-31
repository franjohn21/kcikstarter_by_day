class Day < ActiveRecord::Base
	before_create :save_date 

	def save_date
		day_dict = {
			1 => "Monday",
			2 => "Tuesday",
			3 => "Wednesday",
			4 => "Thursday", 
			5 => "Friday", 
			6 => "Saturday",
			7 => "Sunday",
		}

		month_dict = {
		  	1 => "January", 
		  	2 => "February",
		  	3 => "March",
		  	4 => "April",
		  	5 => "May",
		  	6 => "June",
		  	7 => "July",
		  	8 => "August", 
		  	9 => "September",
		  	10 => "October",
		  	11 => "November",
		  	12 => "December"
		  }

		self.day = Date.today.day 
		self.weekday = Date.today.cwday 
		self.month = Date.today.month
		self.year = Date.today.month
		self.weekday_name = day_dict[Date.today.cwday]
		self.month_name = month_dict[Date.today.month]
	end
end
