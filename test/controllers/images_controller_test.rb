require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'Should GET Index' do
    get images_url
    assert_response :success
  end

  test 'Index should display image list' do
    (1..3).each do |i|
      FactoryBot.create(:image, name: "test#{i}")
    end

    get images_url
    assert_select '.js-image-container', 3
    assert_select '.js-image-name:first', 'test3'
  end

  def test_tags_are_displayed_on_index_page
    (1..3).each do |i|
      FactoryBot.create(:image, tag_list: "tag #{i}")
    end
    get images_path

    assert_select '.js-tag', 3
    assert_select '.js-tag', 'tag 1'
    assert_select '.js-tag', 'tag 2'
    assert_select '.js-tag', 'tag 3'
  end

  def test_filter_index_by_tag
    2.times do
      FactoryBot.create(:image, tag_list: 'tag to filter by')
    end

    FactoryBot.create(:image, tag_list: 'tag to be filtered out')

    get images_path(tag_filter: 'tag to filter')

    assert_select '.js-image-container', 3
    assert_select '.js-tag', count: 2, text: 'tag to filter by'
    assert_select '.js-tag', count: 0, text: 'tag be filtered out'
  end

  def test_index_return_all_images_when_tag_not_found
    3.times do
      FactoryBot.create(:image, tag_list: 'this tag exists')
    end

    get images_path(tag_filter: 'this tag does not')

    assert_select '.js-image-container', 3
  end

  test 'Should GET New' do
    get new_image_url
    assert_response :success
  end

  test 'Should create Image' do
    assert_difference(-> { Image.count }) do
      image_params = {
        image: {
          name: 'test',
          url: 'https://exammple.com/kitten',
          description: 'a kitten',
          tag_list: 'tag 1, tag2'
        }
      }
      post images_url(params: image_params)
    end
    assert_redirected_to image_url(Image.last)
  end

  test 'Should throw error with malformed params' do
    assert_raises ActionController::ParameterMissing do
      bad_image_params = {
        wrong_key_name: {
          name: 'test',
          url: 'https://exammple.com/kitten',
          description: 'a kitten'
        }
      }
      post images_url(params: bad_image_params)
    end
  end

  test 'Should display error messages on invalid form submission' do
    post images_url params: { image: { name: '', url: '', description: '' } }
    assert_select '#name_input small', /can't be blank/
    assert_select '#url_input small' do |small|
      assert_match(/Image links must use HTTP|Invalid URL format|can't be blank/, small.text)
    end
    assert_select '#description_input small', /can't be blank/
  end

  def test_tags_are_displayed_on_show_page
    FactoryBot.create(:image, tag_list: 'show test')
    image = Image.last
    get image_path(image)

    assert_select '.js-tag', 'show test'
  end
end
