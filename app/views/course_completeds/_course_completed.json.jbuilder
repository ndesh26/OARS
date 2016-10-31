json.extract! course_completed, :id, :name, :code, :credit, :grade, :created_at, :updated_at
json.url course_completed_url(course_completed, format: :json)