class CreateKakoEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :kako_events do |t|
      t.string  :nengetsu              #イベント年月
      t.string  :name,null:false #イベント名
      t.date    :start_date      #イベント開始日
      t.date    :end_date
      t.string  :place      #開催場所
      t.string  :detail     #イベント詳細
      t.string  :kind
      t.timestamps
    end
    add_index :kako_events,:nengetsu 
    add_index :kako_events,[:start_date]
  end
end
