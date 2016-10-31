require 'test_helper'

class CourseCompletedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_completed = course_completeds(:one)
  end

  test "should get index" do
    get course_completeds_url
    assert_response :success
  end

  test "should get new" do
    get new_course_completed_url
    assert_response :success
  end

  test "should create course_completed" do
    assert_difference('CourseCompleted.count') do
      post course_completeds_url, params: { course_completed: { code: @course_completed.code, credit: @course_completed.credit, grade: @course_completed.grade, name: @course_completed.name } }
    end

    assert_redirected_to course_completed_url(CourseCompleted.last)
  end

  test "should show course_completed" do
    get course_completed_url(@course_completed)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_completed_url(@course_completed)
    assert_response :success
  end

  test "should update course_completed" do
    patch course_completed_url(@course_completed), params: { course_completed: { code: @course_completed.code, credit: @course_completed.credit, grade: @course_completed.grade, name: @course_completed.name } }
    assert_redirected_to course_completed_url(@course_completed)
  end

  test "should destroy course_completed" do
    assert_difference('CourseCompleted.count', -1) do
      delete course_completed_url(@course_completed)
    end

    assert_redirected_to course_completeds_url
  end
end
