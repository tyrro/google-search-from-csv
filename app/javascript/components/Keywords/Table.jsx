import React from 'react';
import PropTypes from 'prop-types';
import KeywordRow from './Row';

function KeywordTable({ keywords }) {
  return (
    <table className="table table-bordered table-hover">
      <thead className="thead-light">
        <tr>
          <th scope="col">{I18n.t(`attributes.keyword.name.title`)}</th>
          <th scope="col">{I18n.t(`attributes.keyword.total_search_results`)}</th>
          <th scope="col">{I18n.t(`attributes.keyword.total_search_time`)}</th>
          <th scope="col">{I18n.t(`attributes.keyword.total_adwords`)}</th>
          <th scope="col">{I18n.t(`attributes.keyword.total_links`)}</th>
          <th scope="col">{I18n.t(`attributes.keyword.search_status`)}</th>
          <th scope="col">Actions</th>
        </tr>
      </thead>
      <tbody>
        {keywords.map(keyword => (
          <KeywordRow {...keyword} key={keyword.id} />
        ))}
      </tbody>
    </table>
  );
}

KeywordTable.propTypes = {
  keywords: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.number,
      name: PropTypes.string,
      totalSearchResults: PropTypes.number,
      totalSearchTime: PropTypes.number,
      totalAdwords: PropTypes.number,
      totalLinks: PropTypes.number,
      searchStatus: PropTypes.string,
    }),
  ).isRequired,
};

export default KeywordTable;
