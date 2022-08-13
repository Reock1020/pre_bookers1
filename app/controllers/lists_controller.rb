class ListsController < ApplicationController
  def new
     @list = List.new
  end
  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "Book was successfully created."
      redirect_to list_path(@list.id)
    else
      @lists = List.all
      render :index
    end
  end

  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
     @list = List.find(params[:id])
  end
  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    if @list.save
      flash[:notice] = "Book was successfully update."
      redirect_to list_path(@list.id)
    else
     
      render :edit
    end
  end
  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to '/lists'  # 投稿一覧画面へリダイレクト
  end
   private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
