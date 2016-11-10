require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @course = Course.new(title: "Test Course", code: "CS223", dept: "CSE", email: "ins1@abc.xyz", instructor: "Sample Prof", credit: 9, timing: "3:30-5:00 TTh")
  end

  test "should be valid" do
    assert @course.valid?
  end

 test "email validation should accept only valid instructor addresses" do
    valid_addresses = %w[ins1@abc.xyz ins2@abc.xyz]
    valid_addresses.each do |valid_address|
      @course.email = valid_address
      assert @course.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user@foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @course.email = invalid_address
      assert_not @course.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
end
