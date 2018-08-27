require 'rails_helper'

describe 'user can delete an article' do
  describe 'they link from the show page' do
    it 'displays all articles without deleted article' do
      article_1 = Article.create!(title: "New Title", body: "New Body")
      article_2 = Article.create!(title: "New Title", body: "New Body")
      article_3 = Article.create!(title: "New Title", body: "New Body")
      visit article_path(article_1)
      #save_and_open_page
      click_link 'Delete'
      expect(current_path).to eq(articles_path)
      expect(page).to_not have_content(article_1)
      expect(page).to have_content("Article New Title Deleted!")

    end
  end
end
