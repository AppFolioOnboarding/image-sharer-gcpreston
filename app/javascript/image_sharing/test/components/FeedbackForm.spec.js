/* eslint-env mocha */

import assert from 'assert';
import { shallow } from 'enzyme';
import React from 'react';
import FeedbackForm from '../../components/FeedbackForm';

describe('<FeedbackForm />', () => {
  it('should render correctly', () => {
    const wrapper = shallow(<FeedbackForm />);
    const label = wrapper.find('Label');
    const input = wrapper.find('Input');
    const button = wrapper.find('Button');

    assert.strictEqual(label.length, 2);
    assert.strictEqual(input.length, 2);
    assert.strictEqual(button.length, 1);

    assert.strictEqual(label.at(0).children().text(), 'Your name:');
    assert.strictEqual(label.at(1).children().text(), 'Comments:');
  });
});
