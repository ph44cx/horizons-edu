class PagesController < ApplicationController
    skip_before_action :authenticate_user!, :only => [ :index, :indexar ] 
def index
    
end


end