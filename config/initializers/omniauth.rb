OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "359516364120975", "dafc58a63c67b095b21185da26a9a964"
  provider :identity#, on_failed_registration: lambda { |env| IdentitiesController.action(:new).call(env) }
end