class List < ApplicationRecord
    validates :user_id, {presence:true}
    validates :name, {presence:true, length:{maximum: 10}}

    def user
      return User.find_by(id: self.user_id)
    end

end
