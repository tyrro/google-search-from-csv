json.keywords @keywords do |keyword|
  json.id keyword.id
  json.name keyword.name
  json.total_search_results_with_time_taken_text keyword.total_search_results_with_time_taken_text
  json.total_adwords keyword.total_adwords
  json.total_links keyword.links.count
  json.search_status keyword.search_status.titleize
  json.search_result_html_path keyword_path(keyword)
  json.search_completed keyword.search_completed?
end
json.pagination do
  json.partial! 'paginations/pagination', locals: { collection: @keywords }
end
