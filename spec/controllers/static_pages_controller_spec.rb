require 'spec_helper'

describe StaticPagesController do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "home page" do
    before { visit root_path }
    let(:heading) {'Craig Burton'}
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }
  end 

  describe "about page" do
    before { visit about_path }
    let(:heading) { "About" }
    let(:page_title) { "About" }

    it_should_behave_like "all static pages"
  end

  describe "contact page" do
    before { visit contact_path }
    let(:heading) { "Contact Me" }
    let(:title) { "Contact Me" }

    it_should_behave_like "all static pages"
  end
end
