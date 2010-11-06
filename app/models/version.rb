class Version
  include Mongoid::Document

  identity :type => String
  key :data, Hash
  key :message, String
  key :date, Time

  key :user_id, String
  belongs_to :user

  def content(key)
    cdata = self.data[key]
    if cdata.respond_to?(:join)
      cdata.join(" ")
    else
      cdata || ""
    end
  end
end
