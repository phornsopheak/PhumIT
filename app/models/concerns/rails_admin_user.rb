module RailsAdminUser
  extend ActiveSupport::Concern

  included do
    rails_admin do
      navigation_icon "fa fa-user padding-right-icon"

      list do
         field :id do
          pretty_value do
            %{<div class="badge">#{value}</div >}.html_safe
          end
         end
         field :username do
          formatted_value do
            bindings[:view].content_tag(:a, "#{value}",
              href: "user/#{bindings[:object].id}/show_user")
          end
         end
         field :nickname
         field :email
         field :image
         field :sign_in_count do
          pretty_value do
            %{<div class="badge badge-warning">#{value}</div >}.html_safe
          end
         end
         field :current_sign_in_at do
          label "Current sign in"
         end
         field :last_sign_in_at do
          label "Last sign in"
         end
         field :current_sign_in_ip do
          label "Current IP"
         end
         field :last_sign_in_ip do
           label "Last IP"
         end
         field :remember_created_at do
            label "Remember at"
         end
         field :reset_password_sent_at do
          label "Reset password at"
         end
         field :created_at
         field :updated_at
      end

      show do
         field :username
         field :nickname
         field :email
         field :image
         field :sign_in_count do
            pretty_value do
              %{<div class="badge label badge-warning">#{value}</div >}.html_safe
            end
         end
         field :current_sign_in_at do
          label "Current sign in"
         end
         field :last_sign_in_at do
          label "Last sign in"
         end
         field :current_sign_in_ip do
          label "Current IP"
         end
         field :last_sign_in_ip do
           label "Last IP"
         end
         field :remember_created_at do
            label "Remember at"
         end
         field :reset_password_sent_at do
          label "Reset password at"
         end
         field :created_at
         field :updated_at
      end

      edit do
         field :username
         field :nickname
         field :email
         field :password
         field :password_confirmation
         field :image
      end
    end
  end
end
