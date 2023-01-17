class User < ApplicationRecord
    has_secure_password
    validates :userName, :password, presence: true
end
