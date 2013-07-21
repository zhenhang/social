Social::Application.routes.draw do

  get "gist/index"

  get "gist/new"

  get "gist/edit"

  get "gist/show"

  get "friend/index"

  get "friend/search"

  get "admin/index"

  root :to => 'topics#index'

  match  'node/new/:node' => 'topics#new', :as => :new_topic
  get  'node/:node' => "topics#node", :as => :node

  match  't/:id/edit' => 'topics#edit', :as => :edit_topic
  post 't/:id/reply' => 'topics#reply', :as => :reply
  post 't/:id/fav' => 'topics#fav', :as => :fav
  post 't/:id/unfav' => 'topics#unfav', :as => :unfav
  post 't/:id/like' => 'topics#like', :as => :like
  post 't/:id/dislike' => 'topics#dislike', :as => :dislike
  post 't/:id/ban' => 'topics#ban', :as => :ban
  get  't/:id' => 'topics#show', :as => :topic

  post 'r/:id/like' => 'topics#reply_like', :as => :reply_like
  post 'r/:id/dislike' => 'topics#reply_dislike', :as => :reply_dislike

  get  'news' => "news#index", :as => :all_news
  match  'news/new' => 'news#new', :as => :new_news
  match  'news/:id/edit' => 'news#edit', :as => :edit_news
  post 'news/:id/reply' => 'news#reply', :as => :reply_news
  get  'news/:id' => 'news#show', :as => :news
  
  get  'page' => "page#index", :as => :pages
  match  'page/new' => 'page#new', :as => :new_page
  match  'page/:id/edit' => 'page#edit', :as => :edit_page
  post 'gist/:id/reply' => 'gist#reply', :as => :reply_gist
  get  'page/:id' => 'page#show', :as => :page

  get  'gist' => "gist#index", :as => :gists
  match  'gist/new' => 'gist#new', :as => :new_gist
  match  'gist/:id/edit' => 'gist#edit', :as => :edit_gist
  get  'gist/:id' => 'gist#show', :as => :gist

  get  'asks' => "ask#index", :as => :asks
  match  'ask/new' => 'ask#new', :as => :new_ask
  get  'ask/node/:node' => "ask#node", :as => :ask_node
  match  'ask/:id/edit' => 'ask#edit', :as => :edit_ask
  post 'ask/:id/answer' => 'ask#answer', :as => :answer
  post 'ask/:id/fav' => 'ask#fav', :as => :fav_ask
  post 'ask/:id/unfav' => 'ask#unfav', :as => :unfav_ask
  post 'ask/:id/like' => 'ask#like', :as => :like_answer
  post 'ask/:id/dislike' => 'ask#dislike', :as => :dislike_answer
  get  'ask/:id' => 'ask#show', :as => :ask

  get  'friend/(:user)' => "friend#index", :as => :friends
  get  'friend/search/:user' => "friend#search", :as => :search_friends
  post 'friend/:id/follow' => 'friend#follow', :as => :follow_friend
  post 'friend/:id/unfollow' => 'friend#unfollow', :as => :unfollow_friend
  post 'friend/:id/block' => 'friend#block', :as => :block_friend
  post 'friend/:id/unblock' => 'friend#unblock', :as => :unblock_friend

  get  'share' => "share#index", :as => :shares
  match  'share/new/:node' => 'share#new', :as => :new_share
  get  'share/node/:node' => "share#node", :as => :share_node
  match  'share/:id/edit' => 'share#edit', :as => :edit_share
  post 'share/:id/reply' => 'share#reply', :as => :reply_share
  get  'share/:id' => 'share#show', :as => :share

  get  'users' => 'users#index', :as => :users
  get  'users/city/:city' => 'users#city', :as => :users_by_city
  match  'u/setting' => 'users#setting', :as => :user_setting
  match  'u/avatar' => 'users#avatar', :as => :user_avatar
  get  'u/:id/topics' => 'users#topics', :as => :user_topics
  get  'u/:id/replies' => 'users#replies', :as => :user_replies
  get  'u/:id/favs' => 'users#favs', :as => :user_favs
  get  'u/:id' => 'users#show', :as => :user

  devise_for :users

  match 'login' => 'users#login', :as => :login
  match 'logout' => 'users#logout', :as => :logout
  match 'signup' => 'users#signup', :as => :signup
  match 'change_pwd' => 'users#change_pwd', :as => :change_pwd
  match 'forgot_pwd' => 'users#forgot_pwd', :as => :forgot_pwd

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
