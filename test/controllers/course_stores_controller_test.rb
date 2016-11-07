require 'test_helper'

class CourseStoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_store = course_stores(:one)
  end

  test "should get index" do
    get course_stores_url
    assert_response :success
  end

  test "should get new" do
    get new_course_store_url
    assert_response :success
  end

  test "should create course_store" do
    assert_difference('CourseStore.count') do
      post course_stores_url, params: { course_store: { code: @course_store.code, credit: @course_store.credit, dept: @course_store.dept, grade: @course_store.grade, sem: @course_store.sem, title: @course_store.title, user_id: @course_store.user_id } }
    end

    assert_redirected_to course_store_url(CourseStore.last)
  end

  test "should show course_store" do
    get course_store_url(@course_store)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_store_url(@course_store)
    assert_response :success
  end

  test "should update course_store" do
    patch course_store_url(@course_store), params: { course_store: { code: @course_store.code, credit: @course_store.credit, dept: @course_store.dept, grade: @course_store.grade, sem: @course_store.sem, title: @course_store.title, user_id: @course_store.user_id } }
    assert_redirected_to course_store_url(@course_store)
  end

  test "should destroy course_store" do
    assert_difference('CourseStore.count', -1) do
      delete course_store_url(@course_store)
    end

    assert_redirected_to course_stores_url
  end
end
