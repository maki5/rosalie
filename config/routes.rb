Rails.application.routes.draw do
  resources :messages, :only => [:create, :index, :show, :new] do
    collection do
      get 'sent'
    end
  end
end
