import routes from './index';

describe('routes', () => {
  test('supports the required query params and format', () => {
    expect(routes.keywords.index()).toEqual('/keywords.json');
  });
});
