import React, { useEffect, useState, useRef } from 'react';
import PropTypes from 'prop-types';
import { debounce } from 'throttle-debounce';

import SearchBar from '../../components/SearchBar';
import CSVUpload from '../../components/CSVUpload';
import KeywordTable from '../../components/Keywords/Table';
import Pagination from '../../components/Pagination';

import httpClient from '../../shared/httpClient';
import routes from '../../routes';

function Keywords({ sampleCSVFile }) {
  const [keywords, setKeywords] = useState([]);
  const [searchParam, setSearchParam] = useState('');
  const [currentPage, setCurrentPage] = useState(1);
  const [totalPages, setTotalPages] = useState(1);
  const [retryCount, setRetryCount] = useState(0);
  const timer = useRef(null);

  const forcePage = currentPage - 1;
  const fetchKeywords = async (q, page) => {
    const { data } = await httpClient.get(
      routes.keywords.index({
        q,
        page,
      }),
    );
    setKeywords(data.keywords);
    setCurrentPage(data.pagination.currentPage);
    setTotalPages(data.pagination.totalPages);
  };

  const fetchKeywordsWithDebounce = useRef(
    debounce(500, q => {
      fetchKeywords(q);
    }),
  ).current;

  const onSearchParamChange = event => {
    setSearchParam(event.target.value);
    setRetryCount(0);
  };

  const onPageChange = selectedPage => {
    setCurrentPage(selectedPage);
    setRetryCount(0);
    fetchKeywords(searchParam, selectedPage);
  };

  useEffect(() => {
    fetchKeywordsWithDebounce(searchParam);
  }, [fetchKeywordsWithDebounce, searchParam]);

  useEffect(() => {
    timer.current = setInterval(() => {
      setRetryCount(prevCount => prevCount + 1);
      fetchKeywords(searchParam, currentPage);
    }, 2000);

    return () => {
      clearInterval(timer.current);
    };
  }, [currentPage, searchParam]);

  useEffect(() => {
    if (keywords.length === 0) {
      clearInterval(timer.current);
    }

    if (keywords.length > 0 && keywords.every(keyword => keyword.searchCompleted === true)) {
      clearInterval(timer.current);
    }

    if (retryCount < 5) {
      return;
    }

    clearInterval(timer.current);
  }, [keywords, retryCount, timer]);

  return (
    <div className="keywords-table">
      <div className="keywords-table__header input-group mt-4">
        <SearchBar searchParam={searchParam} onSearchParamChange={onSearchParamChange} />
        <CSVUpload sampleCSVFile={sampleCSVFile} fetchKeywords={fetchKeywords} />
      </div>
      <div className="keywords-table__body">
        <div className="keywords-table__pagination text-right align-center">
          <Pagination
            pageCount={totalPages}
            forcePage={forcePage}
            onPageChange={page => onPageChange(page.selected + 1)}
          />
        </div>
        <KeywordTable keywords={keywords} />
        <div className="keywords-table__pagination text-right align-center">
          <Pagination
            pageCount={totalPages}
            forcePage={forcePage}
            onPageChange={page => onPageChange(page.selected + 1)}
          />
        </div>
      </div>
    </div>
  );
}

export default Keywords;

Keywords.propTypes = {
  sampleCSVFile: PropTypes.string.isRequired,
};
