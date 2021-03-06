require 'csv'

class KeywordImport
  attr_reader :user, :success, :errors, :results

  def initialize(user)
    @user = user
    @success = false
    @errors = []
    @results = []
  end

  def call(file)
    row_number = 0
    CSV.foreach(file) do |row|
      row_number += 1

      keyword = instantiate_new_record(row)
      if keyword.valid?
        results << keyword
      else
        errors << {
          row: row_number,
          message: keyword.errors.full_messages.to_sentence,
        }
      end
    end
    success = errors.empty?
    results.map(&:save) if success

    {
      success: success,
      errors: errors,
    }
  end

  def instantiate_new_record(params)
    Keyword.new(keyword_attributes(params))
  end

  def keyword_attributes(params)
    name = params.first
    {
      name: name,
      user: user,
    }
  end

  def keywords
    results
  end
end
