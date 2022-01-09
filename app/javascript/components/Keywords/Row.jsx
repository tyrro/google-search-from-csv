import React from 'react';
import PropTypes from 'prop-types';

function KeywordRow({
  name,
  totalSearchResults,
  totalSearchTime,
  totalAdwords,
  totalLinks,
  searchStatus,
}) {
  return (
    <tr>
      <td>{name}</td>
      <td>{totalSearchResults}</td>
      <td>{totalSearchTime}</td>
      <td>{totalAdwords}</td>
      <td>{totalLinks}</td>
      <td className="text-transform-capitalize">{searchStatus}</td>
      <td>@mdo</td>
    </tr>
  );
}

KeywordRow.propTypes = {
  name: PropTypes.string.isRequired,
  totalSearchResults: PropTypes.number.isRequired,
  totalSearchTime: PropTypes.number.isRequired,
  totalAdwords: PropTypes.number.isRequired,
  totalLinks: PropTypes.number.isRequired,
  searchStatus: PropTypes.string.isRequired,
};

export default KeywordRow;
