module ApiHelper
  include Rack::Test::Methods

  def app
    Rails.application
  end

  def api_path path
    version_module = described_class.parent.name
    version = version_module.scan(/.+::V(\d)/).flatten.first
    "/api/v#{version}/#{path}"
  end
end

RSpec.configure do |c|
  c.include ApiHelper
end
