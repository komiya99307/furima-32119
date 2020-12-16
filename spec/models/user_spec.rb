require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくいかないとき' do
    
    it "nicknameがない場合は登録できないこと" do
      @user.nickname   = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
 
    
    it "emailに＠がないと登録できないこと" do
      @user.email = "test.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "emailが空の場合登録できないこと" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    
    it " 重複したemailが存在する場合は登録できないこと " do
      first_user = FactoryBot.create(:user,email: 'test@test.com')
      another_user = FactoryBot.build(:user,email: 'test@test.com')
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    
    it "first_nameがない場合は登録できないこと" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
 
    
    it "last_nameがない場合は登録できないこと" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
 
    
    it "first_name_kanaがない場合は登録できないこと" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
 
    
    it "last_name_kanaがない場合は登録できないこと" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.first_name = "/\A[ぁ-んァ-ヶ一-龥]+\z/"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'last_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
      @user.last_name = "/\A[ぁ-んァ-ヶ一-龥]+\z/"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it 'first_name_kanaが全角カタカナ以外では登録できないこと' do
      @user.first_name_kana = "/\A[\p{katakana}]+\z/"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it 'last_name_kanaが全角カタカナ以外では登録できないこと' do
      @user.last_name_kana = "/\A[\p{katakana}]+\z/"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
 
 
    
    it "birthdayがない場合は登録できないこと" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

 
    it " passwordが6文字以上であれば登録できること " do
      @user.password = "aaa111"
      @user.password_confirmation = "aaa111"
      @user.valid?
      expect(@user).to be_valid
    end

 
    
    it " passwordが5文字以下であれば登録できないこと " do
      @user.password = "aaa11"
      @user.password_confirmation = "aaa11"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it " passwordは半角英数字混合でないと登録できないこと	 " do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    




    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

 
    
    it "nicknameとemail、passwordとpassword_confirmation、first_name、last_name、first_name_kana、last_name_kana、birthdayが存在すれば登録できること" do
      expect(@user).to be_valid
    end
 
  end
 end
end