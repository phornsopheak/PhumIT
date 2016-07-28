module RailsAdmin
  module Config
    module Actions
      class ShowActivity < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :root? do
          true
        end

        register_instance_option :breadcrumb_parent do
          nil
        end

        register_instance_option :controller do
          proc do
            @activities = PublicActivity::Activity.all
          end
        end

        register_instance_option :route_fragment do
          'activities'
        end

        register_instance_option :link_icon do
          'icon-list'
        end

        register_instance_option :statistics? do
          true
        end
      end
    end
  end
end
