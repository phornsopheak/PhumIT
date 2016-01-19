module RailsAdminWebdetail
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_icon 'fa fa-info-circle padding-right-icon'

      edit do
        include_all_fields
        field :about_us, :ck_editor
        field :fb_page do
          help "Please add your facebook page link in text box above."
          label %{<div class="fa fa-facebook-square fa-3x" style="color: #3b5998;"></div >}.html_safe
        end
        field :google_plus do
          help "Please add your google+ page link in text box above."
          label %{<div class="fa fa-google-plus-square fa-3x" style="color: #dc4e41;"></div >}.html_safe
        end
        field :tweatter do
          help "Please add your tweatter page link in text box above."
          label %{<div class="fa fa-twitter-square fa-3x" style="color: #55acee;"></div >}.html_safe
        end
        field :youtube do
          help "Please add your youtube channel link in text box above."
          label %{<div class="fa fa-youtube-square fa-3x" style="color: #cd201f;"></div >}.html_safe
        end
      end

      list do
        include_all_fields
        field :id do
          pretty_value do
            %{<div class="badge">#{value}</div >}.html_safe
          end
         end
        field :about_us do
          pretty_value do
            value.html_safe
          end
        end
        field :fb_page do
          formatted_value do
            bindings[:view].content_tag(:a, %{<div class="fa fa-facebook-square fa-3x" style="color: #3b5998;"></div >}.html_safe,
              target: "_blank", href: "#{value}")
          end
        end
        field :google_plus do
          formatted_value do
            bindings[:view].content_tag(:a, %{<div class="fa fa-google-plus-square fa-3x" style="color: #dc4e41;"></div >}.html_safe,
              target: "_blank", href: "#{value}")
          end
        end
        field :tweatter do
          formatted_value do
            bindings[:view].content_tag(:a, %{<div class="fa fa-twitter-square fa-3x"></div >}.html_safe,
              target: "_blank", href: "#{value}")
          end
        end
        field :youtube do
          formatted_value do
            bindings[:view].content_tag(:a, %{<div class="fa fa-youtube-square fa-3x" style="color: #cd201f;"></div >}.html_safe,
              target: "_blank", href: "#{value}")
          end
        end
        field :created_at do
          label "Publish at"
        end
      end
    end
  end
end
