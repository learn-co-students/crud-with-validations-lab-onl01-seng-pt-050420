class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :release_year, message: "Cannot release the same song twice in a year."}
    validates :released, inclusion: { in: [true, false] }
    validate :release_year_presence
    validates :artist_name, presence: true

    def release_year_presence
        if self.released
          unless self.release_year
            errors.add(:release_year, "Released Song must have a released year.")
          else
            if Date.today.year < self.release_year
              errors.add(:release_year, "Release year is in the future.")
            end
          end
        end
    end
end