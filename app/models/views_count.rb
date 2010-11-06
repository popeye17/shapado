class ViewsCount
  include Mongoid::Document
  timestamps!

  identity :type => String

  def self.cleanup!
    ViewsCount.delete_all(:created_at.lt => 8.days.ago)
  end
end
