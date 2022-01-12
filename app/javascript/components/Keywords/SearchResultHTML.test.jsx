import React from 'react';
import { shallow } from 'enzyme';
import SearchResultHTML from './SearchResultHTML';

describe(SearchResultHTML, () => {
  const dirtyHtml =
    '<div class="my-html-class">' +
    '<h1>Valid Content</h1>' +
    '<script type="text/javascript">alert("bad hacker here");</script>' +
    '<p>More valid content</p>' +
    '<iframe src=javascript:alert("xss")></iframe>' +
    '</div>';

  const validContent =
    '<div class="my-html-class">' +
    '<h1>Valid Content</h1>' +
    '<p>More valid content</p>' +
    '</div>';

  const output = shallow(<SearchResultHTML html={dirtyHtml} />);

  test('renders sanitized html', () => {
    expect(output.find('div.sanitized-html').props().dangerouslySetInnerHTML.__html).toEqual(
      validContent,
    );
  });
});
