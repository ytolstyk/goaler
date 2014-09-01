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

require 'rails_helper'

RSpec.describe Goal, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
