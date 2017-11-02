class CreateResults < ActiveRecord::Migration[5.0]
  def change

    create_table :results do |t|
      t.string :name
      t.string :standard
      t.string :score

      t.timestamps

    end
  end
end
