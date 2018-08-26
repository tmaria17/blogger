require 'rails_helper'
describe 'user can edit an article' do
  describe 'they link from the show page' do
    describe "they fill in an edit field and submit" do
      it 'displays edited article' do
        article_1 = Article.create!(title: "Title 1", body: "Body 1")
        visit article_path(article_1)
        #save_and_open_page
        click_link 'Edit'
        fill_in "article[title]", with: "Edited Title"
        fill_in "article[body]",  with: "Edited Body"
        click_on "Update Article"

        expect(current_path).to eq(article_path(article_1))
        expect(page).to have_content("Edited Title")
        expect(page).to_not have_content("Title 1")
        expect(page).to have_content("Edited Body")
        expect(page).to_not have_content("Body 1")
        expect(page).to have_content("Article 'Edited Title' Updated!")
      end
    end
  end
end
