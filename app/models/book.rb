class Book < ApplicationRecord
has_many :reviews 
validates :title, :author, :ISBN, :copies, presence: true
validates :ISBN, length: {minimum: 10}, uniqueness: true
validates :copies, numericality: { only_integer: true}
end
