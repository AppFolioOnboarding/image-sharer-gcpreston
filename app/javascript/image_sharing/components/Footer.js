import PropTypes from 'prop-types';
import React from 'react';

export default function Footer(props) {
  return (
    <footer className="text-center">
      <small>{props.text}</small>
    </footer>
  );
}

Footer.propTypes = {
  text: PropTypes.string.isRequired
};
