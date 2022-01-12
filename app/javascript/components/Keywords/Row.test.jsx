import React from 'react';
import { shallow } from 'enzyme';

import KeywordRow from './Row';

const props = {
  id: 1,
  name: 'keyword',
  totalSearchResultsWithTimeTakenText: 'About 1000000 results in 0.001s',
  searchResultHtmlPath: '/keywords/1',
  totalAdwords: 1,
  totalLinks: 100,
  searchStatus: 'In Progress',
};

describe(KeywordRow, () => {
  const wrapper = shallow(<KeywordRow {...props} />);

  test('it renders 6 table data cells', () => {
    expect(wrapper.find('tr > td')).toHaveLength(6);
  });

  test('it renders the passed params as table row', () => {
    expect(wrapper.find('tr').childAt(1).text()).toEqual(props.totalSearchResultsWithTimeTakenText);
  });
});
