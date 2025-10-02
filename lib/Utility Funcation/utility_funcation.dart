// Helper function to map the technology name to your SVG asset path.

String getIconPath(String title) {
  switch (title) {
    case 'Flutter':
      return 'icons/flutter.svg';
    case 'Dart':
      return 'icons/dart.svg';
    case 'Android':
      return 'icons/android.svg';
    case 'iOS':
      return 'icons/apple.svg';
    case 'Flutter Web':
      return 'icons/flutter_web.svg';
    case 'Node.js':
      return 'icons/node.svg';
    case 'Express.js':
      return 'icons/express.svg';
    case 'REST APIs':
      return 'icons/api.svg';
    case 'Postman':
      return 'icons/postman.svg';
    case 'Firebase':
      return 'icons/firebase.svg';
    case 'PostgresSQL':
      return 'icons/sql.svg';
    case 'AWS S3':
      return 'icons/AWS_S3.svg';
    case 'Jira':
      return 'icons/jira.svg';
    case 'ClickUp':
      return 'icons/clickUp.svg';
    case 'Windsurf':
      return 'icons/windsurf.svg';
    case 'Provider':
      return 'icons/dart.svg';
    case 'RiverPod':
      return 'icons/flutter.svg';
    case 'Responsive Design':
      return 'icons/responsive_design.svg';
    case 'WordPress':
      return 'icons/wordpress.svg';
    case 'Github':
      return 'icons/github.svg';
    default:
      return 'icons/flutter.svg';
  }
}

// Helper function for the main illustration's path
String getMainIllustrationPath() {
  // NOTE: REPLACE THIS PLACEHOLDER with the ACTUAL PATH to your main illustration SVG.
  return 'illustrations/developer_working.svg';
}