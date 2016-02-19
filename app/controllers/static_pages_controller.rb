class StaticPagesController < ApplicationController
  def about
    @about = StaticPage.first.body
  end

  def help
  end
end
