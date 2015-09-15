Lotus::Model.migration do
  change do
    create_table :children do
      primary_key :id
      column :name, String, null: false
      column :birthdate, Date
      column :age, Integer
      column :grade, String
    end
  end
end
