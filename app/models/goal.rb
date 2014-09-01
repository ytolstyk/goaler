# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  body       :text
#  deadline   :date
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#  private    :boolean
#

class Goal < ActiveRecord::Base
  validates :title, :user_id, presence: true
  validates :private, inclusion: { in: [true, false] }

  belongs_to :user
end
