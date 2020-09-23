class Song < ApplicationRecord
    validates :title, presence: true, uniquness: {scope: :year}
    validates :released, inclusion: {in: %w(true false)

    def released?
        byebug
        released
    end
end
