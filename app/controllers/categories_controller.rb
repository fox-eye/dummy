class CategoriesController < ApplicationController
  
  respond_to :json,:html
  
  def index
    @roots = Category.roots           
    @options_1 = @roots.map{|root| [root.name,root.id]}
  end
  
  def get_sub_cat
     id = params[:id]
     @children = Category.find(id).children      
     respond_with(@children)
  end

end
