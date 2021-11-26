class Chatroom < ApplicationRecord
  has_many :messages
  belong_to :activity
end
