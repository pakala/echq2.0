require 'test_helper'

class ChequesControllerTest < ActionController::TestCase
  setup do
    @cheque = cheques(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cheques)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cheque" do
    assert_difference('Cheque.count') do
      post :create, cheque: { amount: @cheque.amount, amount_text: @cheque.amount_text, date: @cheque.date, recipient_id: @cheque.recipient_id }
    end

    assert_redirected_to cheque_path(assigns(:cheque))
  end

  test "should convert amount to amount in words" do
    chqCtrl = ChequesController.new
    text = chqCtrl.wordify_amount(120.00)
    assert_equal text, "One Hundred Twenty Dollars and Zero Cents only."
    assert_not_equal text, "Two Hundred Twenty Dollars and Zero Cents only."    
    end

  test "should show cheque" do
    get :show, id: @cheque
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cheque
    assert_response :success
  end

  test "should update cheque" do
    patch :update, id: @cheque, cheque: { amount: @cheque.amount, amount_text: @cheque.amount_text, date: @cheque.date, recipient_id: @cheque.recipient_id }
    assert_redirected_to cheque_path(assigns(:cheque))
  end

  test "should destroy cheque" do
    assert_difference('Cheque.count', -1) do
      delete :destroy, id: @cheque
    end

    assert_redirected_to cheques_path
  end


end
