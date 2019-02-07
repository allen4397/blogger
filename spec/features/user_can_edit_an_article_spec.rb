require "rails_helper"

describe "user edits article" do
	describe "they link from the articles page" do
		it "allows user to update the articles info" do
      article = Article.create!(title: "New Title", body: "New Body")

      visit article_path(article)

      click_link "Edit"

      expect(current_path).to eq(edit_article_path(article))

      fill_in "article[title]", with: "Better Title!"
      fill_in "article[body]",  with: "Better Body!"

      click_on "Update Article"

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content("Better Title!")
      expect(page).to have_content("Better Body!")
      expect(page).to have_content("Article 'Better Title!' Updated!")
		end
	end
end
