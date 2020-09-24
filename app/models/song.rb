class Song < ApplicationRecord
    validates :title, presence: true
    # validates :released, inclusion: {in: %w(true false)}

    # def released?
    #     byebug
    #     released
    # end
end
