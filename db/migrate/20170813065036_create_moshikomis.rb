class CreateMoshikomis < ActiveRecord::Migration[5.0]
  def change
    create_table :moshikomis do |t|
      t.integer :eventid          #対象イベント
      t.string :shimei,null:false #氏名
      t.string :email,null:false #email
      t.string :lineId           #line ID
      t.integer :mail ,default:0 #男性人数
      t.integer :femail ,default:0 #女性人数
      t.string   :biko            #備考
      t.timestamps
    end
  end
end
