class ProjectController < ApplicationController

  def index

    @projects = Project.find(:all, :order => 'created asc')

  end


  def show

    @project = Project.find(params['id'], :include => {:probes => [:probe_type, :measurements]})

    @probes_data = []

    @project.probes.each do |probe|
      @probes_data << {
        'id' => probe.id,
        'name' => probe.probe_type.name,
        'long_name' => probe.probe_type.long_name,
        'plot_data' => probe.plot_data
      }
    end

#    measurements = Measurement.find(:all, :conditions => ["probe_id = ?", @project.probes[0].id])

  end

  def new

    @project = Project.new
    @project.created = Time.now

    begin
      @project.save!
      redirect_to :action => :show, :id => @project.id
    rescue ActiveRecord::RecordInvalid => e      
      flash[:notice] = "Error: Could not create new project."
      redirect_to :action => :index
    end
  end


  def ajax_save_name
    @project = Project.find(params['id'])
    @project.name = params['project_name']
    begin
      @project.save!
      render :text => 'success'
    rescue ActiveRecord::RecordInvalid => e
      render :text => 'failed', :status => 500
    end
  end

  def graph

    measurements = Measurement.find(:all)

    @pairs = measurements.collect do |m|
      [m.time.to_i * 1000, m.value]

    end

    @pairs = @pairs.to_json

  end


end
