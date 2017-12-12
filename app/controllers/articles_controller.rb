class ArticlesController < ApplicationController
  #/articles
  def index
    @article = Article.all #Index tendrá todos los registros de la tabla articles
    #Con el arriba lo puede usar tanto la vista como el controlador, si no lo tuviera sería solo del controlador.
  end
  #/articles/:id
  def show
    @article = Article.find(params[:id])
  end
  #GET /articles/new
  def new
    @article = Article.new
  end

  #POST /articles
  def create
    @article = Article.new(article_params)
    if @article.save #Si pasaron las validaciones, redirecciona, sinó, nos devuelve.
      redirect_to @article
    else
      render :new
    end
  end

  #Delete /articles/:id
  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
    #Esto es por seguridad, para que no llenen datos como la cantidad de visitas, que se hace solo.
  end

end
