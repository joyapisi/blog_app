RSpec.describe 'posts/index', type: :system do
    it 'displays posts and comments correctly' do
        visit post_index_path
        expect(page).to have_content('Post Title')
    end
  end
  