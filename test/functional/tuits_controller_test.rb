require 'test_helper'

class TuitsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Tuit.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Tuit.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Tuit.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to tuit_url(assigns(:tuit))
  end

  def test_edit
    get :edit, :id => Tuit.first
    assert_template 'edit'
  end

  def test_update_invalid
    Tuit.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Tuit.first
    assert_template 'edit'
  end

  def test_update_valid
    Tuit.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Tuit.first
    assert_redirected_to tuit_url(assigns(:tuit))
  end

  def test_destroy
    tuit = Tuit.first
    delete :destroy, :id => tuit
    assert_redirected_to tuits_url
    assert !Tuit.exists?(tuit.id)
  end
end
