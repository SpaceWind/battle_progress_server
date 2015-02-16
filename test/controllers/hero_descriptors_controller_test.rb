require 'test_helper'

class HeroDescriptorsControllerTest < ActionController::TestCase
  setup do
    @hero_descriptor = hero_descriptors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hero_descriptors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hero_descriptor" do
    assert_difference('HeroDescriptor.count') do
      post :create, hero_descriptor: { class: @hero_descriptor.class, exp: @hero_descriptor.exp, exp_to_next_lvl: @hero_descriptor.exp_to_next_lvl, heroid: @hero_descriptor.heroid, lvl: @hero_descriptor.lvl, map: @hero_descriptor.map, mood: @hero_descriptor.mood, name: @hero_descriptor.name, pack_max_size: @hero_descriptor.pack_max_size, race: @hero_descriptor.race, x: @hero_descriptor.x, y: @hero_descriptor.y }
    end

    assert_redirected_to hero_descriptor_path(assigns(:hero_descriptor))
  end

  test "should show hero_descriptor" do
    get :show, id: @hero_descriptor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hero_descriptor
    assert_response :success
  end

  test "should update hero_descriptor" do
    patch :update, id: @hero_descriptor, hero_descriptor: { class: @hero_descriptor.class, exp: @hero_descriptor.exp, exp_to_next_lvl: @hero_descriptor.exp_to_next_lvl, heroid: @hero_descriptor.heroid, lvl: @hero_descriptor.lvl, map: @hero_descriptor.map, mood: @hero_descriptor.mood, name: @hero_descriptor.name, pack_max_size: @hero_descriptor.pack_max_size, race: @hero_descriptor.race, x: @hero_descriptor.x, y: @hero_descriptor.y }
    assert_redirected_to hero_descriptor_path(assigns(:hero_descriptor))
  end

  test "should destroy hero_descriptor" do
    assert_difference('HeroDescriptor.count', -1) do
      delete :destroy, id: @hero_descriptor
    end

    assert_redirected_to hero_descriptors_path
  end
end
