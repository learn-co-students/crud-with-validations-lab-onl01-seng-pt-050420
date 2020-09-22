class Song < ApplicationRecord
    validates :title, presence: true
    validates_presence_of :release_year, :if => :released?
    validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, :if => :released?
    validates :artist_name && :release_year && :title, uniqueness: true
    validates :artist_name, presence: true

end
