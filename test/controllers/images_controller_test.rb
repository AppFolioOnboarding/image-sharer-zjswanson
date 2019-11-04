require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  test 'Should GET Index' do
    get images_url
    assert_response :success
  end

  test 'Index should display image list' do
    (1..3).each do |i|
      image_params = {
        name: "test#{i}",
        url: "https://example.com/kitten#{i}",
        description: "kitten number: #{i}"
      }
      Image.new(image_params).save
    end

    get images_url
    assert_select '.js-image-container', Image.count
    assert_select '.js-image-name:first', 'test3'
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
          description: 'a kitten'
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
end
