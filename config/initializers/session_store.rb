# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rate_session',
  :secret      => 'a8e9d0b171d6843748a86f117785ad54418b4762bef4e376b8ffb8f24d00cd3e95a57b339ca639986c7bc47620a257c3af4ba5e4d0305288ac753a059c3cfb3b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
