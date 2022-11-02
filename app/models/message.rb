class Message < ApplicationRecord
  belongs_to :user

  scope :custom_display, -> { all.includes(:user).last(20) }
end
