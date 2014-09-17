require 'spec_helper'

describe ProjectsController do
  it "displays an error for a missing project" do
    get :show, id: "not-here"
    expect(response).to redirect_to(projects_path)
    expect(flash[:alert]).to eql I18n.t('projects.flashes.missing')
  end
end
