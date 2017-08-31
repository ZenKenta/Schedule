class CreateKakoPersonalSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :kako_personal_schedules do |t|
      t.string :nengetsu,null:false   #年月
      t.integer :eventid,null:false   #イベントID
      t.string :shimei,null:false     #氏名 
      t.date   :nengetsuhi,null:false #対象日付
      t.string :valuse               #予定内容
      t.timestamps
    end
    add_index :kako_personal_schedules,:nengetsu
    add_index :kako_personal_schedules,:shimei
  end
end
