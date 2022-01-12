// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import WebpackerReact from 'webpacker-react';
import 'bootstrap';
import '../shared/i18n-js';

import '../stylesheets/index.scss';

import Keywords from '../components/Keywords';
import KeywordSearchResultHTML from '../components/Keywords/SearchResultHTML';

WebpackerReact.setup({ Keywords, KeywordSearchResultHTML });
