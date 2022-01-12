import React from 'react';
import { shallow } from 'enzyme';

import KeywordIndex from './index';

describe(KeywordIndex, () => {
  const props = { sampleCSVFile: '/link/to/file' };

  const wrapper = shallow(<KeywordIndex {...props} />);

  test('it renders SearchBar component', async () => {
    expect(wrapper.find('SearchBar')).toHaveLength(1);
  });

  test('it renders pagination in two places', async () => {
    expect(wrapper.find('Pagination')).toHaveLength(2);
  });
});
