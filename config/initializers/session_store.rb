# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_SASite_session',
  :secret      => 'a8d4c25bd0004314f5a4d176c07dc6358664c9173fedcb485fd5ff3892ae2d135da42c0284377df58a9c51f3534ca321b2661e46f519b1067ddb0736b58c071a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
