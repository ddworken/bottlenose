require 'test_helper'

class SandboxesControllerTest < ActionController::TestCase
  setup do
    # @sandbox = create(:sandbox)
  end

  test "should get index" do
    skip

    get :index
    assert_response :success
    assert_not_nil assigns(:sandboxes)
  end

  test "should get new" do
    skip

    get :new
    assert_response :success
  end

  test "should create sandbox" do
    skip

    assert_difference('Sandbox.count') do
      post :create, params: {
        sandbox: { name: @sandbox.name, submission_id: @sandbox.submission_id }
      }
    end

    assert_redirected_to sandbox_path(assigns(:sandbox))
  end

  test "should show sandbox" do
    skip

    get :show, params: {id: @sandbox}
    assert_response :success
  end

  test "should get edit" do
    skip

    get :edit, params: {id: @sandbox}
    assert_response :success
  end

  test "should update sandbox" do
    skip

    patch :update, params: {
      id: @sandbox, sandbox: { name: @sandbox.name, submission_id: @sandbox.submission_id }
    }
    assert_redirected_to sandbox_path(assigns(:sandbox))
  end

  test "should destroy sandbox" do
    skip

    assert_difference('Sandbox.count', -1) do
      delete :destroy, params: { id: @sandbox }
    end

    assert_redirected_to sandboxes_path
  end
end
