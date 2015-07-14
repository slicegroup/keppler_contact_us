KepplerContactUs::Engine.routes.draw do  

	scope :admin do

  	resources :messages, except:[:new, :edit] do 
      get '(page/:page)', action: :index, on: :collection, as: ''
      delete '/destroy_multiple', action: :destroy_multiple, on: :collection, as: :destroy_multiple
    end
    
  end
end
