class CreateTelnos < ActiveRecord::Migration[6.0]
  def change
    create_table :telnos do |t|
      t.string :name
      t.string :telno
      t.string :owner

      t.timestamps
    end
  end
end
