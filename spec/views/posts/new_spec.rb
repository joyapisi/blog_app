RSpec.describe 'posts/new', type: :system do
    it 'renders the new post form' do
        visit post_new_path
        expect(page).to have_content('New Post')
    end
  end