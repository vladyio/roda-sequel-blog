# documentation available at http://sequel.jeremyevans.net/rdoc/files/doc/migration_rdoc.html
Sequel.migration do
  change do
    create_table(:articles) do
      primary_key :id
      String :title, null: false
      String :body, null: false
      Time :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      Time :updated_at, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
