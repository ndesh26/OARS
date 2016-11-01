json.extract! course_request, :id, :user_id, :status, :course_id, :created_at, :updated_at
json.url course_request_url(course_request, format: :json)