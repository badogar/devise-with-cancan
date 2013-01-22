OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '277697599158', '8e3f11933d62274648478151a32fe728'
end
