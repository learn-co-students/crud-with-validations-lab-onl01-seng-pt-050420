class Song < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true 
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released
  validate :valid_year?

  def valid_year?
    if release_year.present? && release_year > Date.today.year 
      errors.add(:release_year, "A song's release year cannot be greater than the current year")
    end
  end

end