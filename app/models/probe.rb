class Probe < ActiveRecord::Base

  belongs_to :probe_type
  belongs_to :project
  has_many :measurements

  def plot_data
    measurements.collect do |m|
      [m.time.to_i * 1000, m.value]
    end
  end

end
