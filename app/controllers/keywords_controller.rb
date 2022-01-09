class KeywordsController < ApplicationController
  before_action :set_keyword, only: :destroy

  def index
    @keywords = current_user.keywords
    @keywords = Queries::Search.call(params, @keywords)
    @keywords = Queries::Paginate.call(params, @keywords)
  end

  def destroy
    @keyword.destroy!
    render json: { message: t('destroyed', resource: @keyword.model_name.human) }
  end

  def import
    result = ImportCsv.call(
      importer: KeywordImport.new(current_user),
      params: params,
    )

    if result.success?
      render json: { error: nil }
    else
      render json: { error: result.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_keyword
    @keyword = current_user.keywords.find(params[:id])
  end
end
