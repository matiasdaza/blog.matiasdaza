class ArticlesController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index] #Para autenticar usuario
  before_action :set_article, except: [:index, :new, :create] #Para reutilizar lo contenido en set_article
  #Para los permisos de usuario.
  before_action :authenticate_editor!, only: [:new, :create, :update]
  before_action :authenticate_admin!, only: [:destroy, :publish]

  #/articles
  def index
    @article = Article.publicados.ultimos #Esto viene del modelo!
    #Index tendrá todos los registros de la tabla articles
    #Con el arroba lo puede usar tanto la vista como el controlador, si no lo tuviera sería solo del controlador.
  end

#Función para cambiar de estado!
  def publish
		@article.publish!
		redirect_to @article
	end

  #/articles/:id
  def show
    @article.update_visits_count #Esto es para ir aumentando en uno las visitas! - revisar article.rb
    @comment = Comment.new #Para que de la opción de poder agregar nuevos comentarios
  end
  #GET /articles/new
  def new
    @article = Article.new
    @categories = Category.all
  end

  #delete /articles/:id
  def destroy
    @article.destroy
    redirect_to action: :index
  end

  def edit #METODO /articles/:id/edit
  end

  def update
    #@article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  #POST /articles
  def create
    @article = current_user.articles.new(article_params)
    @article.categories = params[:categories]
    if @article.save #Si pasaron las validaciones, redirecciona, sinó, nos devuelve.
      redirect_to @article
    else
      render :new
    end
  end



  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :cover, :categories)
    #Esto es por seguridad, para que no llenen datos como la cantidad de visitas, que se hace solo.
  end

end
