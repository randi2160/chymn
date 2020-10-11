class Campaign < ApplicationRecord
    validates_presence_of :title, :published
    validates :title, presence: true
    validates :description, presence: true
   # validates :category, presence: true
end
