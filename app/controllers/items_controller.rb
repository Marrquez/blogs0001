class ItemsController < ApplicationController
    #http_basic_authenticate_with name: "dhh", password: "secret",
     #   except: [:index, :show]

    def index
        @items = Item.all
    end

    def show
        @item = Item.find(params[:id])
    end

    def new
        @item = Item.new
    end

    def edit
        @item = Item.find(params[:id])
    end

    def create
        #render plain: params[:item].inspect
        puts "Hola"
        puts params[:item]

        @item = Item.new(item_params)

        if @item.save
            redirect_to @item
        else
            render 'new'
        end
    end

    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
            redirect_to @item
        else
            render 'edit'
        end
    end

    def destroy
        @item = Item.find(params[:id])
        @item.destroy

        redirect_to items_path
    end

    private
    def item_params
        params.require(:item).permit(:title, :text)
    end
end
