FactoryBot.define do
  factory(:user) do
    email { "jane.doe@hey.com" }
    password { "SecretPassword123" }
    password_confirmation { "SecretPassword123" }

  end
end
