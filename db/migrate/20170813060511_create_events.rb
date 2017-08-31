class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string  :name,null:false #イベント名
      t.date    :start_date #イベント開始日
      t.date    :end_date
      t.string  :place      #開催場所
      t.string  :detail     #イベント詳細
      t.string  :kind       #種類
      t.integer :status ,default:0    # 0:有効,1:中止,2,削除
      t.timestamps
    end

    add_index :events,:start_date
    add_index :events,:name
    add_index :events,:status
  end
end
