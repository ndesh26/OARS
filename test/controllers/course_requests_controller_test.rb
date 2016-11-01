require 'test_helper'

class CourseRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_request = course_requests(:one)
  end

  test "should get index" do
    get course_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_course_request_url
    assert_response :success
  end

  test "should create course_request" do
    assert_difference('CourseRequest.count') do
      post course_requests_url, params: { course_request: { course_id: @course_request.course_id, status: @course_request.status, user_id: @course_request.user_id } }
    end

    assert_redirected_to course_request_url(CourseRequest.last)
  end

  test "should show course_request" do
    get course_request_url(@course_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_request_url(@course_request)
    assert_response :success
  end

  test "should update course_request" do
    patch course_request_url(@course_request), params: { course_request: { course_id: @course_request.course_id, status: @course_request.status, user_id: @course_request.user_id } }
    assert_redirected_to course_request_url(@course_request)
  end

  test "should destroy course_request" do
    assert_difference('CourseRequest.count', -1) do
      delete course_request_url(@course_request)
    end

    assert_redirected_to course_requests_url
  end
end
