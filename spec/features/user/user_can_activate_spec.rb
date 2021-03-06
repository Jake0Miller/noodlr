require "rails_helper"

describe 'user can register an account' do
	it 'through email verification' do
		visit '/'
		click_on 'Sign In'
		click_on 'Sign Up'
		fill_in 'email[email]', with: 'jimbob@aol.com'
    fill_in 'email[password]', with: 'password'
    fill_in 'email[password_confirmation]', with: 'password'
    click_on 'Create Account'

    expect(current_path).to eq(dashboard_path)

		page.driver.submit :get, activation_path("#{User.last.id}-5"), {}

		expect(page).to have_content("Invalid activation code!")

		page.driver.submit :get, activation_path("#{User.last.id}-#{User.last.registered}"), {}

		expect(page).to have_content("Thank you! Your account is now active.")

		expect(current_path).to eq(dashboard_path)
		expect(page).to have_content("Status: Active")

		page.driver.submit :get, activation_path("#{User.last.id}-#{User.last.registered}"), {}

		expect(page).to have_content("Your account is already active.")

		expect(current_path).to eq(dashboard_path)
		expect(page).to have_content("Status: Active")

		page.driver.submit :get, activation_path("5000"), {}

		expect(page).to have_content("User not found!")
	end
end
