require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)

    @purchase = FactoryBot.build(:purchase)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'postal_code、area_id、city_town、house_number、phone_number、user_id、item_idが存在するとき' do
        expect(@purchase).to be_valid
      end

      it 'postal_codeにハイフンがあること' do
        @purchase.postal_code = '123-4567'
        expect(@purchase).to be_valid
      end

      it 'bilding_numberが空でも購入できること' do
        @purchase.bilding_number = ''
        expect(@purchase).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空では登録できない' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンがないと登録できない' do
        @purchase.postal_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid")
      end
      
      it 'area_idが空では登録できない' do
        @purchase.area_id = 0
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Area must be other than 0')
      end

      it 'city_townが空では登録できない' do
        @purchase.city_town = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City town can't be blank")
      end

      it 'house_numbetが空では登録できない' do
        @purchase.house_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberにハイフンがあると登録できない' do
        @purchase.phone_number = '111-1111-1111'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberが11桁以上だと登録できない' do
        @purchase.phone_number = '111111111111'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空では登録できない' do
        @purchase.token = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空だと登録ができない' do
        @purchase.user_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと登録ができない' do
        @purchase.item_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
