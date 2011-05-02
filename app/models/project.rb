class Project < ActiveRecord::Base

  has_many :probes

  def date
    created.strftime("%d/%m/%Y")
  end

end
