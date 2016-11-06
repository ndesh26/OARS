json.extract! instructor, :id, :name, :dept, :password_digest, :email, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)