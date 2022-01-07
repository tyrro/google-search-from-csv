require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GoogleSearchFromCsv
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    STDOUT.sync = true
    config.log_tags = {
      request_id: :request_id,
      remote_ip: :remote_ip,
      subdomain: :subdomain
    }
    # Semantic Logger defaults
    config.semantic_logger.application = 'GoogleSearchFromCSV'
    config.rails_semantic_logger.format = :json
    config.rails_semantic_logger.add_file_appender = false

    config.semantic_logger.add_appender(file_name: "log/#{Rails.env}.json", formatter: :json)
  end
end
