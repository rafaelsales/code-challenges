RSpec::Matchers.define :match_json_schema do |schema|
  chain :as_list do
    @as_list = true
  end

  match do |json|
    @as_list ||= false
    schema = File.read(Rails.root.join 'spec', 'api_schemas', "#{schema}.json")
    JSON::Validator.validate!(schema, json, strict: true, list: @as_list)
  end
end
