json.extract! course, :id, :dept, :code, :title, :instructor, :credit, :timing, :created_at, :updated_at
json.url course_url(course, format: :json)