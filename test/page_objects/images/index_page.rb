require_relative 'image_card'

module PageObjects
  module Images
    class IndexPage < PageObjects::Document
      path :images

      collection(
        :images,
        locator: '.js-image-block',
        item_locator: '.js-image-container',
        contains: ImageCard
      ) do
        def view!
          node.find('.js-image-name a').click
          window.change_to(ShowPage)
        end
      end

      def add_new_image!
        node.click_on('Add Image')
        window.change_to(NewPage)
      end

      def showing_image?(url:, tags: nil)
        images.any? do |image|
          image.url == url && (tags.nil? || image.tags.sort == tags.sort)
        end
      end

      def clear_tag_filter!
        node.click_on('See all Images')
        browser.find_document(IndexPage)
      end
    end
  end
end
