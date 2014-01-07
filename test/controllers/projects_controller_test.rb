require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

include Devise::TestHelpers

setup do
  @project = tasks(:one)
  @user = users(:one)
end

  test "should get index" do
  	sign_in @user
    get :index
    assert_response :success
  end

test "should get new" do
  sign_in @user
  xhr :get, :new
  assert_response :success
end

test "should create project" do
  sign_in @user
  assert_difference('Project.count') do
    xhr :post, :create, project: { name: "Project Name" }
  end
  assert_response :success
end

test "should not create project" do
  sign_in @user
  assert_no_difference('Project.count') do
    xhr :post, :create, project: { name: "" }
  end
  assert_response :success
end

test "should destroy project" do
  sign_in @user
  assert_difference('Project.count', -1) do
    xhr :delete, :destroy, id: @project
  end
  assert_response :success
end

test "should get edit" do
  sign_in @user
  xhr :get, :edit, id: @project
  assert_response :success
end

test "should update project" do
  sign_in @user
  xhr :patch, :update, id: @project, project: { name: @project.name }
  assert_response :success
end
end
