class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :account,null:false
      t.string :password,null:false
      t.string :kind,:false
      t.timestamps
    end
  end
end
