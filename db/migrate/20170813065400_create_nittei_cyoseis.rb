class CreateNitteiCyoseis < ActiveRecord::Migration[5.0]
  def change
    create_table :nittei_cyoseis do |t|
      t.integer :eventid
      t.date :nengetsuhi,null: false
      t.timestamps
    end
  end
end
