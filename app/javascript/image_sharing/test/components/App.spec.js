/* eslint-env mocha */

import assert from 'assert';
import { shallow } from 'enzyme';
import React from 'react';
import App from '../../components/App';

describe('<App />', () => {
  it('should render correctly', () => {
    const wrapper = shallow(<App />);
    const header = wrapper.find('Header');
    const footer = wrapper.find('Footer');
    const form = wrapper.find('FeedbackForm');

    assert.strictEqual(header.length, 1);
    assert.strictEqual(footer.length, 1);
    assert.strictEqual(form.length, 1);

    assert.strictEqual(header.prop('title'), 'Tell us what you think');
    assert.strictEqual(footer.prop('text'), 'Copyright: Appfolio Inc. Onboarding');
  });
});
