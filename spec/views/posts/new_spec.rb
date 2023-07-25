RSpec.describe 'comments/new', type: :system do
    it 'renders the create new comment form' do
      visit new_comment_path
      expect(page).to have_content('New Comment')
    end
  end
  