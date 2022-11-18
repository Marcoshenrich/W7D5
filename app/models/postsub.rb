class PostSub < ApplicationRecord
    validates :post, :sub, presence: true
    validates :post, uniqueness: {scope: :sub}

    belongs_to :post,
        inverse_of: :postsubs
    
    belongs_to :sub,
        inverse_of: :postsubs
end