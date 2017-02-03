json.extract! rent, :id, :student_id, :book_id, :returned, :bring_back, :obs, :created_at, :updated_at
json.url rent_url(rent, format: :json)