# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :comments
  resources :likes
  resources :posts

  delete '/likes', to: 'likes#destroy'
  authenticated :user do
    root 'posts#index'
  end

  devise_scope :user do
    root to: 'devise/sessions#new', as: :sign_up_root
  end

  resources :posts do
    resources :likes
  end
end
