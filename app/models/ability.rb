class Ability
  include CanCan::Ability

    def initialize(user)
        user ||= User.new # guest user (not logged in)
        if user.admin?
            can :access, :rails_admin
            can :manage, :all
        else
            can :access, :rails_admin
            can :dashboard
            can :manage, :all

            cannot [:new, :update, :destroy], WebDetail
            can :read, WebDetail

            cannot [:create, :destroy], User
            cannot :edit, User do |u|
                u.id != user.id
            end

            cannot :destroy, Article
            cannot :edit, Article do |a|
                a.user_id != user.id
            end

            cannot [:create, :update, :destroy], List

            cannot [:create, :update, :destroy], Category

            cannot [:export], :all
        end
    end
end
