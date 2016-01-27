module RailsAdminCategory
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_icon "fa fa-folder-open padding-right-icon"

      edit do
        include_all_fields
        exclude_fields :category_articles
      end

      show do
        include_all_fields
        exclude_fields :category_articles
      end

      list do
         field :id do
          pretty_value do
            %{<div class="badge">#{value}</div >}.html_safe
          end
         end
         field :title do
          formatted_value do
            bindings[:view].content_tag(:a, "#{value}",
              href: "category/#{bindings[:object].id}")
          end
         end
         field :description
         field :image
         field :created_at do
          label "Publish at"
         end
      end
    end
  end
end
