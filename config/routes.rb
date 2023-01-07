Rails.application.routes.draw do

  root to: 'tops#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
    }

  devise_scope :user do
    get 'mypages/home' => 'users/registrations#home'
  end

  def devise_scope(scope)
    constraint = lambda do |request|
      request.env["devise.mapping"] = Devise.mappings[scope]
      true
    end

    constraints(constraint) do
      yield
    end
  end

end
