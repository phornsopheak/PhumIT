require Rails.root.join("lib", "rails_admin", "show_user.rb")
RailsAdmin::Config::Actions.register(RailsAdmin::Config::Actions::ShowUser)

RailsAdmin.config do |config|

  config.excluded_models = ["CategoryArticle", "ListArticle"]

  config.navigation_static_links = {
    %{<div class="fa fa-facebook-square fa-2x" style="color: #3b5998;"></div>&nbsp;Facebook}.html_safe => WebDetail.first.fb_page,
    %{<div class="fa fa-twitter-square fa-2x" style="color: #55acee;"></div>&nbsp;Tweatter}.html_safe => WebDetail.first.tweatter,
    %{<div class="fa fa-google-plus-square fa-2x" style="color: #dc4e41;"></div>&nbsp;Google+}.html_safe => WebDetail.first.google_plus,
    %{<div class="fa fa-youtube-square fa-2x" style="color: #cd201f;"></div>&nbsp;Youtube}.html_safe => WebDetail.first.youtube
  }

  config.navigation_static_label = "Social Network"

  ## == Devise ==
   config.authenticate_with do
      warden.authenticate! scope: :user
   end
    config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard
    index
    new
    show do
      except "User"
    end
    export
    bulk_delete
    show_user do
      only "User"
    end
    edit
    delete
    show_in_app
  end
end
