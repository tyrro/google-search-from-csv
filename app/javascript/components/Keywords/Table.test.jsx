import React from 'react';
import { shallow } from 'enzyme';

import KeywordTable from './Table';

const props = {
  keywords: [
    {
      id: 1,
      name: 'keyword',
      totalSearchResultsWithTimeTakenText: 'About 1000000 results in 0.001s',
      searchResultHtmlPath: '/keywords/1',
      totalAdwords: 1,
      totalLinks: 100,
      searchStatus: 'In Progress',
    },
  ],
};

describe(KeywordTable, () => {
  const wrapper = shallow(<KeywordTable {...props} />);

  test('it renders 6 table header cells', () => {
    expect(wrapper.find('tr > th')).toHaveLength(6);
  });

  test('it passes each element in keywords array to separate KeywordRow component', () => {
    expect(wrapper.find('KeywordRow')).toHaveLength(props.keywords.length);
  });
});
