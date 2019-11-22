# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users
  resource :posts
  resource :comments

  authenticated :user do
    root 'posts#index'
  end

  devise_scope :user do
    root to: 'devise/sessions#new', as: :sign_up_root
  end
end
