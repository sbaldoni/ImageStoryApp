class CreateBeats < ActiveRecord::Migration
  def change
    create_table :beats do |t|
      t.references :story, index: true

      t.timestamps
    end
  end
end
