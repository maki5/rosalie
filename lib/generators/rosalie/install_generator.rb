require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record'

class Rosalie::InstallGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  def model_path
    @model_path ||= File.join("app", "models", "message.rb")
  end

  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.new.utc.strftime("%Y%m%d%H%M%S")
    else
      "%.3d" % (current_migration_number(dirname) + 1)
    end
  end

  def create_migration_file
    migration_template 'migration.rb', 'db/migrate/create_messages.rb'
  end

  def generate_model
    invoke("active_record:model", ["message"], :migration => false)
  end
end
