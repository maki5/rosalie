module Rosalie
  class Engine < Rails::Engine

    initializer "rosalie.models.messageable" do
      ActiveSupport.on_load(:active_record) do
        include Rosalie::Models::Messageable
      end
    end
  end

end
