class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
