class AddNotesToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :notes, :text
  end
end
