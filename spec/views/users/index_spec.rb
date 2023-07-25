require 'rails_helper'

RSpec.describe 'users/index', type: :system do
    it 'displays users correctly' do
        visit users_index_path
        expect(page).to have_content('Post Title')
    end
  end
  