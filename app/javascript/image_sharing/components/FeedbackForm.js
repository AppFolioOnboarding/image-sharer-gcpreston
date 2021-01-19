import React, { useState } from 'react';
import { Alert, Button, Form, FormGroup, Input, Label } from 'reactstrap';
import { post } from '../utils/helper';

export default function FeedbackForm() {
  const [name, setName] = useState('');
  const [comments, setComments] = useState('');
  const [alertData, setAlertData] = useState(null);

  const handleSubmit = (e) => {
    e.preventDefault();

    post('/api/feedbacks', { name, comments })
      .then(() => {
        setAlertData({ color: 'success', message: 'Feedback successfully submitted!' });
        setName('');
        setComments('');
      })
      .catch(() => {
        setAlertData({ color: 'danger', message: 'Error submitting feedback :(' });
      });
  };

  return (
    <>
      { alertData && <Alert color={alertData.color}>{alertData.message}</Alert>}
      <Form onSubmit={handleSubmit}>
        <FormGroup>
          <Label for="name">Your name:</Label>
          <Input
            type="text"
            name="name"
            id="name"
            value={name}
            onChange={e => setName(e.target.value)}
          />
        </FormGroup>
        <FormGroup>
          <Label for="comments">Comments:</Label>
          <Input
            type="textarea"
            name="comments"
            id="comments"
            value={comments}
            onChange={e => setComments(e.target.value)}
          />
        </FormGroup>
        <Button color="primary">Submit</Button>
      </Form>
    </>
  );
}
