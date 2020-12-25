class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,       null:false 
      t.string :area_id,           null:false
      t.string :city_town,         null:false
      t.string :house_number,      null:false
      t.string :bilding_number,    null:false
      t.string :phone_number,      null:false
      t.references :history,       foreign_key:true
      t.timestamps
    end
  end
end
