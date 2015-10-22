class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.username = user.name
      user.private_key_string = RbNaCl::PrivateKey.generate.to_s
      user.public_key_string =  RbNaCl::PrivateKey.new(user.private_key_string.force_encoding("BINARY")).public_key.to_s
      user.save!
    end
  end

  def private_key
    @private_key ||= RbNaCl::PrivateKey.new(private_key_string.force_encoding("BINARY"))
  end

  def public_key
    @public_key ||= RbNaCl::PrivateKey.new(public_key_string.force_encoding("BINARY"))
  end

  private
end
