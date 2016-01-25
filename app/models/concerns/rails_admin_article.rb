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
        field :state
        field :user do
          pretty_value do
            "sdsd"
          end
        end
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
              href: "article/#{bindings[:object].id}")
          end
         end
         field :image
         field :user do
          pretty_value do
            value.username
          end
         end
         field :source do
          formatted_value do
            bindings[:view].content_tag(:a, %{<span class="fa fa-link">&nbsp;</span><span class="text-link">#{value}</sapn>}.html_safe,
              target: "_blank", href: "#{bindings[:object].link_source}")
          end
         end
         field :state do
          pretty_value do
            color = if value == 0
              label = "Publish"
              "success"
            elsif value == 1
              label = "Unpublish"
              "danger"
            else
              label = "Draft"
              "warning"
            end
            %{<div class="label label-#{color}">#{label}</div >}.html_safe
          end
         end
         field :view do
          pretty_value do
            %{<div class="badge label badge-warning">#{value}</div >}.html_safe
          end
         end
         field :created_at do
          label "Publish at"
         end
         field :categories
         field :lists
      end
    end
  end
end
