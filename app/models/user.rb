class User < ApplicationRecord
    validates :username, :email, :password, presence: true
    validates :username, length: {maximum:20}
    validates :password, length: { in: 6..20 }
    validates :username, 
        uniqueness: {
            # object = user object being validated
            # data = { model: "User", attribute: "Username", value: <username> }
            message: ->(object, data) do
            "#{object.username}, is already taken."
            end
            }
    validates :email, 
        uniqueness: {
            # object = user object being validated
            # data = { model: "User", attribute: "Email", value: <email> }
            message: ->(object, data) do
            " #{object.email},  is related to another account."
            end
            }
end
