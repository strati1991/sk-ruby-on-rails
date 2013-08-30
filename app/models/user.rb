class User < ActiveRecord::Base
  attr_accessible :mail, :name, :uid

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.mail = auth["info"]["email"]
    end
  end

end
