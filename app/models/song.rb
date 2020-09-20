class Song < ApplicationRecord
  validates :title, presence: true
  validates :released, acceptance: { accept: [true, false ] }
  # validate :invalid_release_year?

  # def invalid_release_year?
  #   if @@clickbait.none? { |e| e.match title }
  #     errors.add(:title, "post title must include clickbait")
  #   end
  # end
end
