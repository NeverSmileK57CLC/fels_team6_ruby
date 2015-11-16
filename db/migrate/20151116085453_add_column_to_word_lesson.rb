class AddColumnToWordLesson < ActiveRecord::Migration
  def change
  	add_column :word_lessons, :answer, :string
  end
end
