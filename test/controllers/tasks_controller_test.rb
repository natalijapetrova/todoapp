require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  setup do
    @task = tasks(:one)
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:done)
    assert_not_nil assigns(:todo)
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should create task" do
    sign_in @user
    assert_difference('Task.count') do
      post :create, task: { deadline: @task.deadline, done: @task.done, duration: @task.duration, name: @task.name }
    end
    assert_redirected_to tasks_url
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    sign_in @user
    patch :update, id: @task, task: { deadline: @task.deadline, done: @task.done, duration: @task.duration, name: @task.name }
    assert_redirected_to tasks_url
  end

  test "should destroy task" do
    sign_in @user
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end
    assert_redirected_to tasks_path
  end

  test "should not get edit if not logged in" do
    get :edit, id: @task
    assert_response :redirect
  end

 ## test "should not get access if not user1" do
  ##  sign_in @user
  ##  get :edit, id: @task
  ##  assert_response :redirect
 ## end

end
