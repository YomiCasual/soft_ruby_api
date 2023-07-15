class Player < ApplicationRecord
    validates :first_name, presence: true, allow_blank: false
    validates :rotowire_id, presence: true, uniqueness: true

    has_and_belongs_to_many :analysis

end
