// Helper function to map the technology name to your SVG asset path.
String getIconPath(String title) {
  // NOTE: REPLACE THESE PLACEHOLDERS with your ACTUAL ASSET PATHS
  switch (title) {
    case 'Flutter':
      return 'assets/icons/flutter.svg';
    case 'Dart':
      return 'assets/icons/dart.svg';
    case 'HTML 5':
      return 'assets/icons/html5.svg';
    case 'CSS 3':
      return 'assets/icons/css3.svg';
    case 'Bootstrap':
      return 'assets/icons/bootstrap.svg';
    case 'Javascript':
      return 'assets/icons/javascript.svg';
    case 'React':
      return 'assets/icons/react.svg';
    case 'Flask Restful':
      return 'assets/icons/flask.svg';
    case 'Node.js':
      return 'assets/icons/nodejs.svg';
    case 'Express.js':
      return 'assets/icons/express.svg';
    case 'REST APIs':
      return 'assets/icons/api.svg';
    case 'Dart Frog':
      return 'assets/icons/dart_frog.svg';
    case 'Firebase':
      return 'assets/icons/firebase.svg';
    case 'MongoDB':
      return 'assets/icons/mongodb.svg';
    case 'Postgres SQL':
      return 'assets/icons/postgresql.svg';
    case 'GitHub':
      return 'assets/icons/github.svg';
    case 'Jira':
      return 'assets/icons/jira.svg';
    case 'Notion':
      return 'assets/icons/notion.svg';
    case 'Figma':
      return 'assets/icons/figma.svg';
    case 'Adobe XD':
      return 'assets/icons/adobexd.svg';
    default:
    // A fallback path is necessary
      return 'assets/icons/default.svg';
  }
}

// Helper function for the main illustration's path
String getMainIllustrationPath() {
  // NOTE: REPLACE THIS PLACEHOLDER with the ACTUAL PATH to your main illustration SVG.
  return 'illustrations/developer_working.svg';
}