Rails.application.routes.draw do
  root 'surveys#index'
  get 'surveys/index'
  get 'surveys/thankyou'
  get 'surveys/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
