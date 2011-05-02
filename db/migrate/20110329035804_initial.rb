class Initial < ActiveRecord::Migration

  def self.up


    create_table "projects" do |t|
      t.column :key,                        :string
      t.column :name,                       :string
      t.column :description,                :string
      t.column :created,                    :datetime
    end

    Project.new(:key => 'foo', :name => 'Watermelon kombucha', :description => 'Tasty stuff!', :created => Time.now).save!
    Project.new(:key => 'test', :name => 'BATCH1', :description => 'Tasty stuff!', :created => Time.now).save!

    create_table "probe_types" do |t|
      t.column :name,                       :string
      t.column :long_name,                  :string
      t.column :description,                :string
    end

    ProbeType.new(:name => 'PH', :long_name => 'pH', :description => 'A pH probe').save!
    ProbeType.new(:name => 'TC', :long_name => 'Temperature', :description => 'A temperature probe').save!
    ProbeType.new(:name => 'NIR', :long_name => 'Near-infrared', :description => 'A near-infrared probe').save!

    create_table "probes" do |t|
      t.column :project_id,                 :integer
      t.column :probe_type_id,              :integer
      t.column :name,                       :string
      t.column :arduino_name,               :string
      t.column :description,                :string
    end

    create_table "measurements" do |t|
      t.column :probe_id,                   :integer
      t.column :type,                       :string
      t.column :time,                       :datetime
      t.column :value,                      :float
    end

#    create_table "settings" do |t|
#      t.column :name,                       :string
#      t.column :value,                      :string
#    end

#    DefaultValue.new(:name => 'default_window', :value => '150').save!


  end

  def self.down
  end
end
