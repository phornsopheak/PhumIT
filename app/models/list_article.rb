class ListArticle < ActiveRecord::Base
  belongs_to :list
  belongs_to :article
end
