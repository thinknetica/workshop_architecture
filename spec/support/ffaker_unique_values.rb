RSpec.configure do |config|
  config.before do
    FFaker::UniqueUtils.clear
  end
end
