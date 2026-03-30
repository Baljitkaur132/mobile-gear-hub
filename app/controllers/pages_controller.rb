class PagesController < ApplicationController
  def about
    @about_content = SiteSetting.get('about_content')
  end

  def contact
    @contact_content = SiteSetting.get('contact_content')
  end
end
