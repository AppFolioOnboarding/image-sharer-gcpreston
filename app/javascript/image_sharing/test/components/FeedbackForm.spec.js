/* eslint-env mocha */

import assert from 'assert';
import { shallow } from 'enzyme';
import React from 'react';
import sinon from 'sinon';
import FeedbackForm from '../../components/FeedbackForm';
import * as helper from '../../utils/helper';

describe('<FeedbackForm />', () => {
  let sandbox;

  beforeEach(() => {
    sandbox = sinon.createSandbox();
  });

  afterEach(() => {
    sandbox.restore();
  });

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

  it('should submit properly', () => {
    const wrapper = shallow(<FeedbackForm />);
    const input = wrapper.find('Input');
    const button = wrapper.find('Button');

    input.at(0).simulate('change', { target: { name: 'value', value: 'Test Name' } });
    input.at(1).simulate('change', { target: { name: 'value', value: 'Test comment' } });

    const stub = sandbox.stub(helper, 'post').resolves();

    button.simulate('click', { preventDefault: () => {} });

    setTimeout(() => {
      wrapper.update();

      assert.strictEqual(
        stub.calledWith('/api/feedbacks', { name: 'Test Name', comments: 'Test comment' }),
        true
      );

      const alert = wrapper.find('Alert');
      assert.strictEqual(alert.length, 1);
      assert.strictEqual(alert, 'Feedback successfully submitted!');
    }, 1000);
  });

  it('should display errors properly', () => {
    const wrapper = shallow(<FeedbackForm />);
    const input = wrapper.find('Input');
    const button = wrapper.find('Button');

    input.at(0).simulate('change', { target: { name: 'value', value: 'Test Name' } });
    input.at(1).simulate('change', { target: { name: 'value', value: 'Test comment' } });

    const stub = sandbox.stub(helper, 'post').rejects();

    button.simulate('click', { preventDefault: () => {} });

    setTimeout(() => {
      wrapper.update();

      assert.strictEqual(
        stub.calledWith('/api/feedbacks', { name: 'Test Name', comments: 'Test comment' }),
        true
      );

      const alert = wrapper.find('Alert');
      assert.strictEqual(alert.length, 1);
      assert.strictEqual(alert, 'Error submitting feedback :(');
    }, 1000);
  });
});
