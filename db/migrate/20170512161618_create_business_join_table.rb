class CreateBusinessJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:business) do |t|
      t.column(:brand_id, :integer)
      t.column(:store_id, :integer)

      t.timestamps()
    end
  end
end
