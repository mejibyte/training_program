class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :name
      t.string :status
      t.string :url

      t.timestamps
    end
  end
end
