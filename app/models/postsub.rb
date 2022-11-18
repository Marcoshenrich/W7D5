# == Schema Information
#
# Table name: postsubs
#
#  id         :bigint           not null, primary key
#  post_id    :bigint           not null
#  sub_id     :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Postsub < ApplicationRecord
    validates :post, :sub, presence: true
    validates :post_id, uniqueness: {scope: :sub_id}

    belongs_to :post,
        inverse_of: :postsubs
    
    belongs_to :sub,
        inverse_of: :postsubs
end

