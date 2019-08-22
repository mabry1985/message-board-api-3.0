class User < ApplicationRecord
  has_secure_password

  def call
    JsonWebToken.encode(user_id: self.id)
  end
end
