require 'spec_helper'

feature "Deleting projects" do
  scenario "Deleting a project" do
    create(:project, name: "TextMate 2")

    visit "/"
    click_link I18n.t('projects.name')
    click_link I18n.t('projects.delete')

    expect(page).to have_content("Project has been destroyed.")

    visit "/"

    expect(page).to have_no_content I18n.t('projects.name')
  end
end