module PageObjects
  module Images
    class NewPage < PageObjects::Document
      path :new_image
      path :images

      form_for :image do
        element :name, locator: '.js-name'
        element :url, locator: '.js-url'
        element :description, locator: '.js-description'
        element :tag_list, locator: '.js-tag-list'
      end

      def create_image!(url: nil, tags: nil, name: nil, description: nil)
        image.name.set(name)
        image.url.set(url)
        image.description.set(description)
        image.tag_list.set(tags)

        node.click_on('Create Image')
        window.change_to(ShowPage, NewPage)
      end
    end
  end
end
