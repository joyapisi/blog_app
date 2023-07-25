require 'rails_helper'

RSpec.describe 'users/index', type: :system do
  it 'displays users correctly' do
    # Create some sample users
    User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    User.create(name: 'Jane Smith', email: 'jane@example.com', password: 'password')

    visit users_index_path

    # Expect user details to be displayed
    expect(page).to have_content('John Doe')
    expect(page).to have_content('Jane Smith')
  end
end
