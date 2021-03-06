require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module At1
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

# config/application.rb

  config.generators do |generate|
    generate.helper false
    generate.assets false
    generate.view_specs false
    generate.helper_specs false
    generate.routing_specs false
    generate.controller_specs false
    generate.system_tests false
  end
  config.assets.enabled = true
  config.assets.paths << Rails.root.join("app", "assets", "fonts")
  config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/

  # config.stripe.secret_key = ENV['STRIPE_SECRET']
  # config.stripe.publishable_key = ENV['STRIPE_APP']
  # config.stripe.endpoint = '/payment/stripe-integration'
end
end
