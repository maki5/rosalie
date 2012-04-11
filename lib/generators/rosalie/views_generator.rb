class Rosalie::ViewsGenerator < Rails::Generators::Base
  source_root File.expand_path("../../../../app/views", __FILE__)

  def copy_views
    directory('messages', 'app/views/messages')
  end
end
