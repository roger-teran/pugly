OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '137312383269319', 'a4c08f05a2683dcfdf2c11c329bfe34d'
end