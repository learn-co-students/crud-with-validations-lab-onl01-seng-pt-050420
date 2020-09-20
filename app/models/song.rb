class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year,
        message: "Cannot release the same song in a year"}
    
   
    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
            less_than_or_equal_to: Date.today.year
        }
    end

    def released?
        released
    end

end
