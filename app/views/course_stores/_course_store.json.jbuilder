json.extract! course_store, :id, :title, :code, :dept, :credit, :grade, :sem, :user_id, :created_at, :updated_at
json.url course_store_url(course_store, format: :json)