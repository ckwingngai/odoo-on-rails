Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'hDb34f1c3evZ6o4nTW8WRdlbELoGdpE7',
    '7eyn7-rtBLkwrs4cmH6FxpWgtg__fI4TEFLHNc7K2n1O4XEG3Kl8MxqnIrzhvCSM',
    'raymondcheng.auth0.com',
    callback_path: "/auth/auth0/callback"
  )
end
