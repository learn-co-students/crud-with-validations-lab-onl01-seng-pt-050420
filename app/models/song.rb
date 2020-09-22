class Song < ApplicationRecord
    validates :title, presence: true
    validates_presence_of :release_year, :if => :released?
    validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, :if => :released?
    validates :title, uniqueness: {
        scope: [:release_year, :artist_name],
        message: 'cannot be repeated by the same artist in the same year'
      }
    validates :artist_name, presence: true

end
