Zengun::Application.routes.draw do
  # match 'in_notes' => 'in_notes#create', :via => :post
  resources :in_notes, :except => [:destroy, :update, :index, :show]
end
