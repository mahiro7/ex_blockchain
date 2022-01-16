import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ex_blockchain, ExBlockchainWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "VoUA2HIlt/1oypVGZNSYbhJ651CCDr8SevS92oarbzc1pTnyQzQxexYyhX/tAXv1",
  server: false

# In test we don't send emails.
config :ex_blockchain, ExBlockchain.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
