import React from 'react';
import PropTypes from 'prop-types';

function SearchBar({ searchParam, onSearchParamChange }) {
  return (
    <input
      type="text"
      className="form-control mr-2"
      placeholder={I18n.t(`attributes.keyword.name.placeholder`)}
      value={searchParam}
      onChange={event => onSearchParamChange(event)}
    />
  );
}

SearchBar.propTypes = {
  searchParam: PropTypes.string.isRequired,
  onSearchParamChange: PropTypes.func.isRequired,
};

export default SearchBar;
