import React from 'react';
import { Container } from 'reactstrap';
import FeedbackForm from './FeedbackForm';
import Footer from './Footer';
import Header from './Header';

export default function App() {
  return (
    <Container>
      <Header title="Tell us what you think" />
      <FeedbackForm />
      <Footer text="Copyright: Appfolio Inc. Onboarding" />
    </Container>
  );
}
