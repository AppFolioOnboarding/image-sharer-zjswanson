module PageObjects
  module Images
    class ShowPage < PageObjects::Document
      path :image

      def image_url
        image = node.find('.js-show-image')
        image['src']
      end

      def tags
        node.all('.js-tag').map(&:text)
      end

      def delete
        node.click_on('delete')
        yield node.driver.browser.switch_to.alert
      end

      def delete_and_confirm!
        node.click_on('delete')
        node.driver.browser.switch_to.alert.accept
        window.change_to(IndexPage)
      end

      def go_back_to_index!
        node.click_on('See all Images')
        window.change_to(IndexPage)
      end
    end
  end
end
