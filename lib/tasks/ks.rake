require 'open-uri'

namespace :ks do
	desc "Query Kickstarter"
	task :query => :environment do 
		html_doc = Nokogiri::HTML(open('https://www.kickstarter.com/help/stats'))
		new_total = html_doc.css("#main_content .main .total span.money").text[1..-1].gsub(',', '').to_i
		curr_total = Overall.first.total
		diff = new_total - curr_total
		already_exists = Day.find_by(:day => Date.today.day, :month => Date.today.month, :year => Date.today.year)
		if already_exists
			already_exists.update_attributes :total => already_exists.total + diff
		else
			Day.create(:total => diff)
		end		

		Overall.first.update_attributes :total => new_total
	end

end
