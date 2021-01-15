/* eslint-env mocha */

import assert from 'assert';
import { shallow } from 'enzyme';
import React from 'react';
import Footer from '../../components/Footer';

describe('<Footer />', () => {
  it('should render correctly', () => {
    const wrapper = shallow(<Footer text='Footer text' />);
    const text = wrapper.find('footer');

    assert.strictEqual(text.length, 1);
    assert.strictEqual(text.text(), 'Footer text');
  });
});
