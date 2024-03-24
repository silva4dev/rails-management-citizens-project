# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Video
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Timezone and locale configuration
    config.time_zone = 'Brasilia'
    config.i18n.default_locale = 'pt-BR'

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
