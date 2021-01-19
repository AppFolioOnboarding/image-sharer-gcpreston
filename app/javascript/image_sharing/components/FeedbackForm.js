import React from 'react';
import { Button, Form, FormGroup, Input, Label } from 'reactstrap';

export default function FeedbackForm() {
  return (
    <Form>
      <FormGroup>
        <Label for="name">Your name:</Label>
        <Input type="text" name="name" id="name" />
      </FormGroup>
      <FormGroup>
        <Label for="comments">Comments:</Label>
        <Input type="textarea" name="comments" id="comments" />
      </FormGroup>
      <Button type="submit" color="primary">Submit</Button>
    </Form>
  );
}
