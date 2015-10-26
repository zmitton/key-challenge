require 'base64'

class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.username = user.name
      user.base64_private_key = Base64.encode64(RbNaCl::PrivateKey.generate)
      user.base64_public_key =  Base64.encode64(RbNaCl::PrivateKey.new(Base64.decode64(user.base64_private_key)).public_key)
      user.save!
    end
  end

  def private_key
    @private_key ||= RbNaCl::PrivateKey.new(Base64.decode64(base64_private_key))
  end

  def public_key
    @public_key ||= private_key.public_key
  end
end
