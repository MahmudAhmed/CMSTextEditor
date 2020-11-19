class Story < ApplicationRecord
  validates :body, presence: true
  validates :title, presence: true, uniqueness: true
  validate :tag_in_1_word

  def date
    date = self.created_at
    date.strftime("%B %d, %Y")
  end

  private

  def tag_in_1_word
    if tag.to_s.squish.split.size != 1
      errors.add(:tag, "must be one word.")
    end
  end

end 