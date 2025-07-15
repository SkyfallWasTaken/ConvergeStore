Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack,
    Rails.application.credentials.slack[:client_id],
    Rails.application.credentials.slack[:client_secret],
    scope: "identity.basic,identity.email"
end
