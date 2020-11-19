class Newsletter < ApplicationRecord
  validates :date, 
    :uniqueness => {:message => "Newsletter for the specfied date already exists."}

  def get_stories
    date = self.date;
    Story.all.select { |ele| ele.created_at.strftime("%B %d, %Y") == date } 
  end

  

end 
