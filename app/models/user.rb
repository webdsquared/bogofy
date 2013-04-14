class User < ActiveRecord::Base
  #attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid
 
  extend FriendlyId
  friendly_id :name, use: :slugged
 
  def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  		user.provider = auth.provider
  		user.uid = auth.uid
  		user.name = auth.info.name
  		user.oauth_token = auth.credentials.oauth_token
  		user.oauth_expires_at = Time.at(auth.credentials.expires_at) unless auth.credentials.expires_at.nil?
  		user.save!
  	end
  end

  #def to_param
  #  "#{:id} - #{current_user.name}"
  #end
end
