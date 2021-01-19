import React, { useState } from 'react';
import { Button, Form, FormGroup, Input, Label } from 'reactstrap';
import { post } from '../utils/helper';

export default function FeedbackForm() {
  const [name, setName] = useState('');
  const [comments, setComments] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();

    post('/api/feedbacks', { name, comments });
  };

  return (
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
      <Button type="submit" color="primary">Submit</Button>
    </Form>
  );
}
