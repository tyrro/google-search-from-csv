import { configure as enzymeConfigure } from 'enzyme';
import Adapter from '@wojtekmaj/enzyme-adapter-react-17';

global.I18n = {
  locale: 'en-GB',
  t: jest.fn().mockImplementation(key => `Translation: ${key}`),
};

// *********************************
// Enzyme Integration
// *********************************
enzymeConfigure({ adapter: new Adapter() });
