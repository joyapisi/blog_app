require_relative './my_spec_helper' 

RSpec.describe User, type model do
    describe 'validations' do
        it { should validate_presence_of(:name) }
        it { should validate_numericality_of(:posts_counter).only_integer.is_greater_than_or_equal_to(0) }
      end
    
      describe 'associations' do
        it { should have_many(:posts).class_name('Post').with_foreign_key('author_id') }
        it { should have_many(:likes).class_name('Like').with_foreign_key('author_id') }
        it { should have_many(:comments).class_name('Comment').with_foreign_key('author_id') }
      end
    

    end