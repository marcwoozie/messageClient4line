class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def parse_created_at format=nil
    format = '%Y/%m/%d %H:%M:%S' if format.nil?
    Time.at(self.created_at).strftime(format)
  end

  def parse_updated_at format=nil
    format = '%Y/%m/%d %H:%M:%S' if format.nil?
    Time.at(self.updated_at).strftime(format)
  end

end
