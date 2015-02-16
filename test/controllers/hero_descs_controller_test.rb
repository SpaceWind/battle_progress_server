require 'test_helper'

class HeroDescsControllerTest < ActionController::TestCase
  setup do
    @hero_desc = hero_descs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hero_descs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hero_desc" do
    assert_difference('HeroDesc.count') do
      post :create, hero_desc: { class: @hero_desc.class, exp: @hero_desc.exp, exp_to_next_lvl: @hero_desc.exp_to_next_lvl, heroid: @hero_desc.heroid, lvl: @hero_desc.lvl, mood: @hero_desc.mood, name: @hero_desc.name, pack_max_size: @hero_desc.pack_max_size, race: @hero_desc.race, x: @hero_desc.x, y: @hero_desc.y }
    end

    assert_redirected_to hero_desc_path(assigns(:hero_desc))
  end

  test "should show hero_desc" do
    get :show, id: @hero_desc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hero_desc
    assert_response :success
  end

  test "should update hero_desc" do
    patch :update, id: @hero_desc, hero_desc: { class: @hero_desc.class, exp: @hero_desc.exp, exp_to_next_lvl: @hero_desc.exp_to_next_lvl, heroid: @hero_desc.heroid, lvl: @hero_desc.lvl, mood: @hero_desc.mood, name: @hero_desc.name, pack_max_size: @hero_desc.pack_max_size, race: @hero_desc.race, x: @hero_desc.x, y: @hero_desc.y }
    assert_redirected_to hero_desc_path(assigns(:hero_desc))
  end

  test "should destroy hero_desc" do
    assert_difference('HeroDesc.count', -1) do
      delete :destroy, id: @hero_desc
    end

    assert_redirected_to hero_descs_path
  end
end
