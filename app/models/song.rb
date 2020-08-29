class Song < ActiveRecord::Base
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "Can only by used once per year by the same artist" }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released
    validates :release_year, numericality: { less_than_or_equal_to: Date.current.year }, if: :release_year
    validates :artist_name, presence: true
end