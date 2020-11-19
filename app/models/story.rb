class Story < ApplicationRecord
  validates :body, :tag, presence: true
  validates :title, presence: true, uniqueness: true

  def date
    date = self.created_at
    date.strftime("%B %d, %Y")
  end

end 