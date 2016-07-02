require "properties_fetcher"

namespace :fetch do
  task properties: :environment do
    PropertiesFetcher.refresh!
  end
end
