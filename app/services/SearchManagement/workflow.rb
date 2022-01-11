module SearchManagement
  class Workflow
    include Interactor::Organizer

    organize(
      SearchManagement::PerformSearch,
      SearchManagement::ParseSearchResult,
      SearchManagement::UpdateKeywordAttributes,
    )
  end
end
