class CreateMoshikomis < ActiveRecord::Migration[5.0]
  def change
    create_table :moshikomis do |t|
      t.integer :eventid          #対象イベント
      t.string :shimei,null:false #氏名
      t.string :email,null:false #email
      t.string :lineId           #line ID
      t.integer :male ,default:0 #男性人数
      t.integer :female ,default:0 #女性人数
      t.string   :biko            #備考
      t.integer :status ,default:0    # 0:有効,1:中止,2,削除
      t.timestamps
    end
  end
end
