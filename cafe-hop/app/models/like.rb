class Like < ApplicationRecord
  validates :user_id,{presence: true}
  validates :list_id,{presence: true}
end
