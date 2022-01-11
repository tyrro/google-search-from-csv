import React from 'react';
import PropTypes from 'prop-types';

function KeywordRow({
  name,
  totalSearchResultsWithTimeTakenText,
  searchResultHtmlPath,
  totalAdwords,
  totalLinks,
  searchStatus,
}) {
  return (
    <tr>
      <td>{name}</td>
      <td>{totalSearchResultsWithTimeTakenText}</td>
      <td>{totalAdwords}</td>
      <td>{totalLinks}</td>
      <td>{searchStatus}</td>
      <td>
        <a href={searchResultHtmlPath} className="">
          See Results
        </a>
      </td>
    </tr>
  );
}

KeywordRow.propTypes = {
  name: PropTypes.string.isRequired,
  totalSearchResultsWithTimeTakenText: PropTypes.string.isRequired,
  searchResultHtmlPath: PropTypes.string.isRequired,
  totalAdwords: PropTypes.number.isRequired,
  totalLinks: PropTypes.number.isRequired,
  searchStatus: PropTypes.string.isRequired,
};

export default KeywordRow;
