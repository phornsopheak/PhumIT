module RailsAdminArticle
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_icon 'fa fa-file padding-right-icon'

      edit do
        field :title
        field :image
        field :categories
        field :lists
        field :description, :ck_editor
        field :source
        field :link_source
      end

      list do
         include_all_fields
         field :title do
          formatted_value do
            bindings[:view].content_tag(:a, "#{value}",
              href: "article/#{bindings[:object].id}")
          end
         end
         field :description do
          pretty_value do
            sanitize(value, tags: [])
          end
         end
         field :created_at do
          label "Publish at"
         end
         field :id do
          pretty_value do
            %{<div class="badge">#{value}</div >}.html_safe
          end
         end
         field :view do
          pretty_value do
            %{<div class="badge label badge-warning">#{value}</div >}.html_safe
          end
         end

         field :source do
          formatted_value do
            bindings[:view].content_tag(:a, %{<span class="fa fa-link">&nbsp;</span><span class="text-link">#{value}</sapn>}.html_safe,
              target: "_blank", href: "#{bindings[:object].link_source}")
          end
         end
        exclude_fields :link_source, :updated_at, :category_articles, :list_articles
      end
    end
  end
end
