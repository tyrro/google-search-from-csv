import urlTemplate from 'url-template';

function url(template, params) {
  const myParams = { ...params };
  if (myParams.format === undefined) {
    myParams.format = 'json';
  }
  return urlTemplate.parse(template).expand(myParams);
}

const routes = {
  keywords: {
    index: params => url('/keywords{.format}{?q,page}', params),
    destroy: params => url('/keywords/{carId}{.format}', params),
  },
};

export default routes;
