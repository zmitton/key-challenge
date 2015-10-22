OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['KEY_CHALLENGE_FACEBOOK_APP_ID'], ENV['KEY_CHALLENGE_FACEBOOK_APP_SECRET'], {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['KEY_CHALLENGE_GOOGLE_CLIENT_ID'], ENV['KEY_CHALLENGE_GOOGLE_CLIENT_SECRET'], {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
