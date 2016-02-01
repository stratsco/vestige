require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Vestige
  class Application < Rails::Application
    config.autoload_paths += [
      Rails.root.join("lib")
    ]

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: true,
        helper_specs: true,
        routing_specs: false,
        controller_specs: true,
        request_specs: true
      g.integration_tool :rspec
      g.performance_tool :rspec
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    config.encoding = "utf-8"
    config.filter_parameters += [:password, :email]
    config.i18n.enforce_available_locales = true
    config.time_zone = 'Pacific Time (US & Canada)'

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
