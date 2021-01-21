class BloggersController < ApplicationController

    def show
        @blogger = Blogger.find(params[:id])
    end

    def new
        @blogger = Blogger.new(blogger_params)
    end

    def create
        @blogger = Blogger.new(blogger_params)

        if @blogger.valid?
            @blogger.save
            redirect_to blogger_path(@blogger)
        else
            render :new
        end
    end

    private

    def blogger_params
        params.require(:blogger).permit(:name, :age, :bio)
    end

end