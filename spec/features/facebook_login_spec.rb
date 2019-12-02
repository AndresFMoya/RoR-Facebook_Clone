# frozen_string_literal: true

require "rails_helper"

RSpec.feature "FacebookLogins", type: :feature do
  before :each do
    mock_auth_hash
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  scenario "authenticates successfully" do
    visit "/users/sign_in"
    click_on "Sign in with Facebook"
    expect(page).to have_content("Successfully authenticated from Facebook account.")
  end
end
