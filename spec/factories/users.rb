FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '000aaa' }
    password_confirmation { password }
    first_name            { 'テスト' }
    last_name             { 'テスト' }
    first_name_kana       { 'テスト' }
    last_name_kana        { 'テスト' }
    birthday              { '1900/01/01' }
  end
end
