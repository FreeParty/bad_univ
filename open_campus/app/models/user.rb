class User < ActiveRecord::Base
   validates :name, presence: true
   validates :password, presence: true
   validates :password_confirm, presence: true
end
