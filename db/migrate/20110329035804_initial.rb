class Initial < ActiveRecord::Migration

  def self.up


    create_table "projects" do |t|

      t.column :name,                       :string
      t.column :description,                :string

    end

    create_table "measurement_sets" do |t|

      t.column :project_id,                 :integer
      t.column :type,                       :string
      t.column :time,                       :datetime
      t.column :value,                      :string

    end


    create_table "measurements" do |t|

      t.column :measurement_set_id,         :integer
      t.column :type,                       :string
      t.column :time,                       :datetime
      t.column :value,                      :string

    end

    create_table "default_values" do |t|

      t.column :name,                       :string
      t.column :value,                      :string

    end

#    DefaultValue.new(:name => 'default_window', :value => '150').save!


  end

  def self.down
  end
end
