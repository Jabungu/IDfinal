class User < ActiveRecord::Base
    has_many :claims
    validates :phone, :first_name, :last_name, :company, :address, :city, :state, :zip, :title, :phone, :password, presence: true
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
