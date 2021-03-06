require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do

    before do
      @user = FactoryBot.create(:user)
    end

    context '新規登録がうまくいかない時'do
    it 'nicknameが空だと登録できない' do
      
      @user.nickname = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      
      @user.email = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスは、＠を含まないと入力できない' do
      
      @user.email = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'パスワードが空では登録できない' do
      
      @user.password = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは、６文字以上での入力が必須である' do
      
      @user.password = '00aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードは、半角英字数字での入力が必須である' do
      
      @user.password = '111111'

      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'パスワードは、半角英字数字での入力が必須である' do
      
      @user.password = 'aaaaaaa'

      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'パスワードは、半角英字数字での入力が必須である' do
      
      @user.password = 'AAAAA１１１１'

      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'パスワードは、確認用も含めて２回入力すること' do
      
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ユーザー本名は、名前がそれぞれ必須であること' do
      
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'ユーザー本名は、名字がそれぞれ必須であること' do
      
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
      
      @user.last_name_kana = 'ｱｱｱ'
     
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
      
    end

    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
      
      
      @user.first_name_kana = 'ｱｱｱ'
      @user.valid?
      
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it 'ユーザー本名は、全角（漢字、ひらがな、カタカナ）での入力が必須であること' do
      
      @user.last_name = 'ｱｱｱ'
      @user.first_name = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it '生年月日の入力が必須であること' do
      
      @user.birthday = 'ｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
   end
  end
end
