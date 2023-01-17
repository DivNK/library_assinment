class Book < ApplicationRecord
validates :bookName, :bookAuthor, presence: true
validates :bookQuantity, presence: true, comparison: {greater_than: 0, less_than: 20 }
end
