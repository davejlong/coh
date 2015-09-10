RSpec.configure do |config|
  config.before(:context) do
    ChildRepository.clear
  end
  config.after(:suite) do
    ChildRepository.clear
  end
end
