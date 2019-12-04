Rails.application.routes.draw do
  get '/posts/:id/md', to: 'posts#markdown'
  get '/posts/markdown', to: 'posts#helpmarkdown'
  get '/posts/howtomarkdown', to: 'posts#howtomarkdown'
  get '/home', to: 'home#show'
  get '/edit', to: 'test_sessions#edit'

  get '/test_papers/', to: 'test_papers#show',:as => :test_papers_page
  post '/test_papers/', to: 'users#home'
  post '/test_papers/final', to: 'test_papers#final'

  post '/test_sessions/update', to: 'test_sessions#update'
  post '/test_sessions/create', to: 'test_sessions#create'
  post '/test_sessions/create_test_paper', to: 'test_sessions#create_test_paper'
  post '/posts/create', to: 'posts#create'
  post '/posts/update', to: 'posts#update'
  get '/posts/:id/edit', to: 'posts#edit'
  post '/search/:id', to: 'search#index', :as => :search_page
  get '/users/home', to: 'users#home'
  post '/users/update', to: 'users#update'
  post '/exams/update', to: 'exams#update'
  post '/exams/create', to: 'exams#create'
  post '/jquery', to: 'search_jquery#getQuestion'
  get '/users/:id', to: 'users#show'

  #get '/exams/', to:'exams#show', :as :exams_page
  resources :posts
  resources :tests
  resources :test_sessions
  resources :exams

  root 'home#show', :as => :home_page
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'quiz'=>'tests#quiz'
  resources :test
  
end
