import React from 'react';
import { shallow } from 'enzyme';

import SearchBar from './index';

const props = {
  searchParam: 'keyword',
  onSearchParamChange: jest.fn(),
};

const newSearchParam = 'new keyword';

describe(SearchBar, () => {
  const wrapper = shallow(<SearchBar {...props} />);

  test('it renders the passed search param in search box', () => {
    expect(wrapper.find('input[type="text"]').prop('value')).toEqual(props.searchParam);
  });

  test('it calls the onSearchParamChange function in the calling component when typed', () => {
    wrapper.find('input[type="text"]').simulate('change', {
      target: { value: newSearchParam },
    });

    expect(props.onSearchParamChange).toHaveBeenCalled();
  });
});
