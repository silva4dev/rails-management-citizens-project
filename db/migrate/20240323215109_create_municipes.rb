class CreateMunicipes < ActiveRecord::Migration[7.0]
  def change
    create_table :municipes do |t|
      t.string :full_name, null: false
      t.string :cpf, index: { unique: true }, null: false
      t.string :cns, index: { unique: true }, null: false
      t.string :email, index: { unique: true }, null: false
      t.date :date_of_birth, null: false
      t.string :phone, null: false
      t.string :photo
      t.boolean :status, null: false, default: true

      t.timestamps
    end
  end
end
