require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  %i[name url description].each do |attr|
    test "requires #{attr} to be present" do
      default_params = {
        name: 'test Image',
        description: 'kitten image',
        url: 'https://images.unsplash.com/photo-1560114928-40f1f1eb26a0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80'
      }
      image = Image.new(default_params)
      assert image.valid?

      missing_param = default_params.except(attr)
      image2 = Image.new(missing_param)
      image2.valid?
      assert image2.errors[attr].include?("can't be blank")
    end
  end

  test 'Requires URL in valid format' do
    params = { name: 'url Test', description: 'Testing URL format' }

    params[:url] = 'https://thing.com/something'
    image = Image.new params
    assert image.valid?

    params[:url] = 'ftp://thing.com/something'
    image2 = Image.new params
    assert image2.invalid?
    assert_not image2.errors.details[:url].empty?

    params[:url] = 'this is totally a url'
    image3 = Image.new params
    assert image3.invalid?
    assert_not image3.errors.details[:url].empty?

    params[:url] = 'http://insecure.com/isstillvalid'
    image4 = Image.new params
    assert image4.valid?
    assert image4.errors.details[:url].empty?
  end

  def test_tag_list_correctly_applied
    FactoryBot.create(:image, name: 'tag test', tag_list: 'tag1, tag2')
    image = Image.last

    assert_equal 2, image.tags.count
    assert_equal(%w[tag1 tag2], image.tags.map(&:name).sort)
  end
end
