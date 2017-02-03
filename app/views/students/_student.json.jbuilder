json.extract! student, :id, :name, :phone, :email, :blocked, :active, :created_at, :updated_at
json.url student_url(student, format: :json)