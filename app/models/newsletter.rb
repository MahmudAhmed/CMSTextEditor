class Newsletter < ApplicationRecord
  validates :date, 
    :uniqueness => {:message => "or should we say 'Newsletter' for the specfied date already exists."}

  def get_stories
    date = self.date;
    Story.all.select { |ele| ele.published_date == date }
  end

  

end 

