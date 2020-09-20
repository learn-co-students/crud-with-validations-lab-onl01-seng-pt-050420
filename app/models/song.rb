class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :release_year, presence: true, 
    if: :released?
    validate :date

    def date
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "Cant be a future date")
        end
    end
end
