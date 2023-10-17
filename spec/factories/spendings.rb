FactoryBot.define do
  factory(:spending) do
    amount { 100 }
    description { "Lorem ipsum dolor sit amet" }
    user
    category
  end
end
