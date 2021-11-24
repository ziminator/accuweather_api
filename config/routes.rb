Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get 'current', to: 'weather#current'
      get 'historical', to: 'weather#historical'
      get 'max', to: 'weather#max'
      get 'min', to: 'weather#min'
      get 'avg', to: 'weather#avg'
      #get 'by_time', to: 'weather#by_time'
    end
  end

end
