class User < ApplicationRecord
  validates :name, {presence: true, length: {maximum: 8}}
  validates :email, {presence: true, uniqueness: true, length: {maximum: 30}}
  validates :password, {presence: true, length: {maximum: 30}}

  def lists
    return List.where(user_id: self.id).all.order(created_at: :desc)
  end

end
