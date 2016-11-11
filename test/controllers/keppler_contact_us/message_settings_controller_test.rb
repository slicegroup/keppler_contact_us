require 'test_helper'

module KepplerContactUs
  class MessageSettingsControllerTest < ActionController::TestCase
    setup do
      @message_setting = keppler_contact_us_message_settings(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:message_settings)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create message_setting" do
      assert_difference('MessageSetting.count') do
        post :create, message_setting: { mailer_to: @message_setting.mailer_to, recaptcha_pb: @message_setting.recaptcha_pb, recaptcha_pv: @message_setting.recaptcha_pv }
      end

      assert_redirected_to message_setting_path(assigns(:message_setting))
    end

    test "should show message_setting" do
      get :show, id: @message_setting
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @message_setting
      assert_response :success
    end

    test "should update message_setting" do
      patch :update, id: @message_setting, message_setting: { mailer_to: @message_setting.mailer_to, recaptcha_pb: @message_setting.recaptcha_pb, recaptcha_pv: @message_setting.recaptcha_pv }
      assert_redirected_to message_setting_path(assigns(:message_setting))
    end

    test "should destroy message_setting" do
      assert_difference('MessageSetting.count', -1) do
        delete :destroy, id: @message_setting
      end

      assert_redirected_to message_settings_path
    end
  end
end
