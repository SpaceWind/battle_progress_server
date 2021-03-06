BattleFiftos::Application.routes.draw do
  resources :h_descriptors

  resources :user_x_heros

  resources :active_keys

  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get 'signup' => 'infoapi#signup'
  get 'login' => 'infoapi#login'
  get 'heroes' => 'infoapi#heroes'
  get 'temphero' => 'infoapi#createTempHero'
  get 'ctuxh' => 'infoapi#createTempUserxHero'
  get 'userExists' => 'infoapi#userExists'
  get 'ping' => 'infoapi#ping'
  
  get 'hero/roll' => 'infoapi#rollHero'
  get 'hero/save' => 'infoapi#saveRolledChamp'
  get 'hero/use' => 'infoapi#useHero'
  get 'hero/preview' => 'infoapi#heroPreview'
  get 'libs/setup' => 'libs_api#setupLibs'
  
  get 'admin/promote' => 'admin_api#promote'
  get 'admin/check'	=> 'admin_api#check'
  get 'admin/newFaction' => 'admin_api#newFaction'
  get 'admin/newClass' => 'admin_api#newClass'
  get 'admin/heroes' => 'admin_api#heroes'
  get 'admin/spells' => 'spells_controller#getSpells'
  get 'admin/spells/save' => 'spells_controller#saveSpells'
  get 'admin/spells/destroy' => 'spells_controller#destroySpell'
  get 'meta/spells' => 'spells_controller#getAllSpellNames'
  get 'meta/classes' => 'admin_api#classes'
  get 'meta/factions' => 'admin_api#factions'
  
  
  get 'admin/faction/cleanDesc' => 'admin_api#cleanFactionDesc'
  get 'admin/class/cleanDesc' => 'admin_api#cleanClassDesc'
  get 'admin/faction/appendDesc' => 'admin_api#factionAppendDesc'
  get 'admin/class/appendDesc' => 'admin_api#classAppendDesc'
  
  get 'meta/relations' => 'admin_api#getRelations'
  get 'meta/checkRelation' => 'admin_api#checkRelation'
  get 'admin/createRelation' => 'admin_api#createRelation'
  
  get 'meta/rl' => 'admin_api#relList'
  get 'meta/allspecs' => 'admin_api#allspecs'

  get 'meta/specs' => 'admin_api#getClassSpecs'
  get 'admin/class/setSpecs' => 'admin_api#setupClassSpecs'
  
  
  get 'admin/creatures' => 'creature#getCreatures'
  get 'admin/creatures/save' => 'creature#saveCreature'
  get 'admin/creatures/remove' => 'creature#removeCreature'
  get 'admin/creatures/spells/save' => 'creature#saveSpellsForCreature'
  get 'admin/creatures/spells/extra/save' => 'creature#saveAdditionalSpellsForCreature'
  get 'admin/creatures/spells/remove' => 'creature#removeSpell'
  
  
  
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
