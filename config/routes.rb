Rails.application.routes.draw do
  resources :projects
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end
    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end
  root to: 'visitors#index'
  devise_for :users
  resources :users

  mount Commontator::Engine => '/commontator'

end
