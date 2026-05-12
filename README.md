# Talib Jameel - Portfolio Website

A modern, responsive portfolio website built with Flutter Web showcasing professional experience, projects, and services.

## 🚀 Overview

This is a comprehensive portfolio website featuring:
- **Modern UI/UX** with glassmorphism design and smooth animations
- **Fully Responsive** design for desktop, tablet, and mobile devices
- **Multiple Sections**: Landing, About, Experience, Projects, Services, Tech Stack, and Contact
- **Interactive Elements**: Hover effects, animations, and micro-interactions
- **Real Functionality**: Working contact form with email integration
- **Professional Design**: Clean typography, modern color scheme, and premium aesthetics

## ✨ Features

### 🎨 Design & UI
- Glassmorphism-style components with backdrop blur effects
- Modern gradient backgrounds and subtle animations
- Professional typography using Google Fonts (Poppins, Inter)
- Dark theme with green accent colors
- Smooth transitions and hover effects
- Responsive grid layouts

### 📱 Sections
- **Landing Page**: Hero section with navigation and introduction
- **About**: Professional summary and background
- **Experience**: Timeline of work experience with detailed responsibilities
- **Projects**: Showcase of 13+ projects with images and descriptions
- **Services**: Service offerings with contact integration
- **Tech Stack**: Technology stack presentation
- **Contact**: Functional contact form with email integration

### 🛠 Technical Features
- Flutter Web with path URL strategy
- Material Design 3 components
- Custom animations and transitions
- Form validation and submission
- URL launcher for external links
- Responsive design patterns
- Clean architecture principles

## 🏗 Project Structure

```
lib/
├── Pages/
│   ├── landing_page.dart          # Main landing page
│   ├── about.dart                 # About section
│   ├── exprience_page.dart        # Experience timeline
│   ├── project_page.dart          # Projects showcase
│   ├── services_page.dart         # Services offerings
│   ├── tech_stack_page.dart       # Technology stack
│   └── contact_page.dart          # Contact form
├── Widgets/
│   └── header_widgets.dart        # Navigation components
├── Utility Funcation/
│   ├── social_icons.dart           # Social media icons
│   └── ...                       # Utility functions
├── Model/                         # Data models
├── app_colors.dart                # Color scheme
└── main.dart                      # App entry point
```

## 🛠 Technologies Used

### Core Framework
- **Flutter 3.8.1+** - Cross-platform development framework
- **Dart** - Programming language

### UI & Design
- **Google Fonts 6.3.2** - Typography (Poppins, Inter)
- **Font Awesome 10.9.1** - Icon library
- **Flutter SVG 2.2.1** - SVG image support

### Functionality
- **URL Launcher 6.3.2** - External link handling
- **Flutter Launcher Icons 0.14.4** - App icons

### Development Tools
- **Flutter Lints 5.0.0** - Code quality and style guidelines

## 🎨 Design System

### Color Palette
- **Background 1**: `#2D2E32` (Primary dark background)
- **Background 2**: `#25262A` (Secondary dark background)
- **Green**: `#6EF3A5` (Primary accent color)
- **Grey**: `#A0A0A0` (Supporting grey)
- **White**: `#FFFFFF` (Text and highlights)

### Typography
- **Primary**: Google Fonts Poppins
- **Secondary**: Google Fonts Inter
- **Hierarchical**: Consistent font sizes and weights throughout

## 📱 Responsive Breakpoints
- **Desktop**: ≥ 1000px (3-column layouts)
- **Tablet**: 600px - 999px (2-column layouts)
- **Mobile**: < 600px (1-column layouts)

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.8.1 or higher
- Dart SDK compatible with Flutter version
- Web browser for Flutter Web development

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd My_Portfolio_Web
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run -d chrome
   ```

4. **Build for production**
   ```bash
   flutter build web
   ```

### Development Setup

1. **Environment Setup**
   - Ensure Flutter is properly installed
   - Verify web development setup: `flutter doctor`
   - Install required IDE extensions (Flutter, Dart)

2. **Running Locally**
   ```bash
   # Development server
   flutter run -d chrome --web-port=8080
   
   # Release build
   flutter run -d chrome --release
   ```

3. **Building for Deployment**
   ```bash
   # Web build
   flutter build web --web-renderer canvaskit
   
   # Deploy to hosting service
   # Copy build/web contents to your hosting provider
   ```

## 📁 Assets Management

### Project Images
- Located in `assets/res/` directory
- Includes project thumbnails, profile images, and logos
- Optimized for web performance

### Icons & Illustrations
- Technology icons in `assets/icons/`
- Custom illustrations in `assets/illustrations/`
- SVG format for scalability

## 🌐 Deployment

### Static Hosting
The application builds to static files suitable for:
- **Netlify**: Drag-and-drop deployment
- **Vercel**: Git-based deployment
- **GitHub Pages**: Free static hosting
- **Firebase Hosting**: Google's hosting solution
- **AWS S3 + CloudFront**: Enterprise hosting

### Deployment Steps
1. Build the application: `flutter build web`
2. Upload `build/web/` directory to hosting provider
3. Configure routing for single-page application
4. Set up custom domain (optional)

## 🔄 Maintenance

### Regular Updates
- Update Flutter SDK and dependencies
- Review and optimize asset sizes
- Test responsive design on new devices
- Update content and project information

### Performance Optimization
- Monitor bundle size
- Optimize image compression
- Review animation performance
- Test loading speeds

## 🤝 Contributing

This is a personal portfolio project. For suggestions or improvements:

1. **Report Issues**: Use GitHub Issues for bugs or suggestions
2. **Feature Requests**: Submit enhancement ideas
3. **Code Contributions**: Fork and submit pull requests

## 📄 License

This project is proprietary and intended for personal/portfolio use only.

## 📞 Contact

- **Portfolio**: [Live Demo URL]
- **Email**: Developer82542@gmail.com


## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Google Fonts for typography
- Font Awesome for icons
- Open source community for inspiration and tools

---

**Built with ❤️ using Flutter Web**
