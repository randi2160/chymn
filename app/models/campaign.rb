class Campaign < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
   # validates :category, presence: true
end
