Sequel.migration do
  change do
    create_table(:rabbits) do
      primary_key :id
      String :name
      Text :description
      Integer :age
      String :colour
      Timestamp :created_at
      Timestamp :updated_at
    end
  end
end