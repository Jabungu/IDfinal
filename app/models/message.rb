class Message < ActiveRecord::Base
    validates :phone, length: { in: 6..20 }
end
