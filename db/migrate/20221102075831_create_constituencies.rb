class CreateConstituencies < ActiveRecord::Migration[7.0]
  def change
    create_table :constituencies do |t|
      t.string :name
      t.boolean :display_in_navbar, default:true

      t.timestamps
    end
  end
end
