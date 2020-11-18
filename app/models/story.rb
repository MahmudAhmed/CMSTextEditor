class Story < ApplicationRecord
  validates :body, :tag, presence: true
  validates :title, presence: true, uniqueness: true

end 