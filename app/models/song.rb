class Song < ApplicationRecord

    validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name],
    message: "Cannot release the same song twice in a year."}
    validates :released, inclusion: {in: [true, false]}
    validate :released_year
    validates :artist_name, presence: true
    validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, allow_nil: true


    def released_year
       
        if self.released == true
            unless self.release_year
                errors.add(:release_year, "A song must have realese year.")
            end
        end
end

end
