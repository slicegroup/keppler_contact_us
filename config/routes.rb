KepplerContactUs::Engine.routes.draw do
  scope :admin do
    resources :messages do
      get '(page/:page)', action: :index, on: :collection, as: ''
      post '/reply', action: :reply
      delete(
        '/destroy_multiple',
        action: :destroy_multiple,
        on: :collection,
        as: :destroy_multiple
      )
    end

    resources :message_settings, only: [] do
      collection do
        get '/', to: 'message_settings#edit', as: 'edit'
        patch '/', to: 'message_settings#update', as: 'update'
      end
    end
  end
end
