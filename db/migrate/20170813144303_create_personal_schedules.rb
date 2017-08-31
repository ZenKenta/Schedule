class CreatePersonalSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_schedules do |t|
      t.integer :eventid,null:false #イベントID
      t.string :shimei,null:false    #氏名
      t.date   :nengetsuhi,null:false#対象日付
      t.string :value               #予定内容
      t.timestamps
    end
    add_index :personal_schedules,[:eventid,:shimei]
  end
end
