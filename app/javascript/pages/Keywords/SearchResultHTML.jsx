import React from 'react';
import PropTypes from 'prop-types';
import DOMPurify from 'dompurify';

function KeywordSearchResultHTML({ html }) {
  return (
    <div
      className="sanitized-html"
      // eslint-disable-next-line react/no-danger
      dangerouslySetInnerHTML={{ __html: DOMPurify.sanitize(html) }}
    />
  );
}

KeywordSearchResultHTML.propTypes = {
  html: PropTypes.string.isRequired,
};

export default KeywordSearchResultHTML;
