Zengun::Application.routes.draw do
  # match 'in_notes' => 'in_notes#create', :via => :post
  # match 'out_notes' => 'out_notes#create', :via => :post
  resources :out_notes
  resources :in_notes
end
