FactoryBot.define do
  factory(:share) do
    association :author, factory: :user
    association :recipient, factory: :user
  end
end
