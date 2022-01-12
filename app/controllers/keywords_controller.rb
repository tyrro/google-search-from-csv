class KeywordsController < ApplicationController
  before_action :set_keyword, only: :show

  def index
    @keywords = current_user.keywords
    @keywords = Queries::Search.call(params, @keywords)
    @keywords = Queries::Paginate.call(params, @keywords)
  end

  def show; end

  def import
    importer = KeywordImport.new(current_user)
    result = ImportCsv.call(
      importer: importer,
      params: params,
    )

    if result.success?
      SearchKeywords.call(keywords: importer.keywords)
      render json: { error: nil }
    else
      render json: { error: result.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_keyword
    @keyword = current_user.keywords.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
