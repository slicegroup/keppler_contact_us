require 'test_helper'

module KepplerContactUs
  class MessagesControllerTest < ActionController::TestCase
    setup do
      @message = keppler_contact_us_messages(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:messages)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create message" do
      assert_difference('Message.count') do
        post :create, message: { content: @message.content, email: @message.email, name: @message.name, read: @message.read, subject: @message.subject }
      end

      assert_redirected_to message_path(assigns(:message))
    end

    test "should show message" do
      get :show, id: @message
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @message
      assert_response :success
    end

    test "should update message" do
      patch :update, id: @message, message: { content: @message.content, email: @message.email, name: @message.name, read: @message.read, subject: @message.subject }
      assert_redirected_to message_path(assigns(:message))
    end

    test "should destroy message" do
      assert_difference('Message.count', -1) do
        delete :destroy, id: @message
      end

      assert_redirected_to messages_path
    end
  end
end
