import 'package:flutter/material.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sai Rakesh - Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    AboutScreen(),
    SkillsScreen(),
    ProjectsScreen(),
    ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.grey[600],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.code), label: 'Skills'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Projects'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: 'Contact'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Profile Photo
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.blue.withAlpha((255 * 0.3).round()), // Fix applied here
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg', // Placeholder URL
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                      // Fallback to icon if image fails to load
                      return Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: <Color>[Colors.blue[400]!, Colors.blue[600]!],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 80,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              
              // Name
              Text(
                'Sai Rakesh',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 10),
              
              // Title
              Text(
                'Flutter Developer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              
              // Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Passionate mobile app developer specializing in Flutter and Dart. Creating beautiful, performant applications for iOS and Android.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              
              // Action Buttons - REMOVED
            ],
          ),
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.person_outline, color: Colors.blue[600]),
                        const SizedBox(width: 10),
                        Text(
                          'About Me',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'I am a dedicated Flutter developer with a passion for creating innovative mobile applications. My journey in software development has been driven by curiosity and a desire to build solutions that make a difference.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.school, color: Colors.blue[600]),
                        const SizedBox(width: 10),
                        Text(
                          'Education',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    
                    EducationItem(
                      degree: 'Bachelor of Technology in Computer Science',
                      institution: 'CR Rao AIMSCS',
                      duration: '2023 - 2027',
                      description: 'Specialized in Software Engineering and Mobile App Development. Graduated with distinction.',
                    ),
                    const SizedBox(height: 15),
                    
                    EducationItem(
                      degree: 'Higher Secondary Education',
                      institution: 'Kothari International School',
                      duration: '2022 - 2023',
                      description: 'Mathematics, Physics, Chemistry with 89% aggregate.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EducationItem extends StatelessWidget {
  final String degree;
  final String institution;
  final String duration;
  final String description;

  const EducationItem({
    super.key,
    required this.degree,
    required this.institution,
    required this.duration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        border: Border( 
          left: BorderSide(
            color: Colors.blue[600]!,
            width: 4,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            degree,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            institution,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            duration,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class SkillsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills & Certifications'),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.code, color: Colors.blue[600]),
                        const SizedBox(width: 10),
                        Text(
                          'Technical Skills',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    
                    SkillCategory(
                      title: 'Mobile Development',
                      skills: const <String>['Flutter', 'Dart', 'React Native', 'Android (Java/Kotlin)', 'iOS (Swift)'],
                    ),
                    const SizedBox(height: 15),
                    
                    SkillCategory(
                      title: 'Programming Languages',
                      skills: const <String>['Dart', 'Java', 'Python', 'JavaScript', 'C++', 'Swift'],
                    ),
                    const SizedBox(height: 15),
                    
                    SkillCategory(
                      title: 'Backend & Database',
                      skills: const <String>['Firebase', 'Node.js', 'MongoDB', 'MySQL', 'REST APIs', 'GraphQL'],
                    ),
                    const SizedBox(height: 15),
                    
                    SkillCategory(
                      title: 'Tools & Others',
                      skills: const <String>['Git', 'VS Code', 'Android Studio', 'Figma', 'Postman', 'AWS'],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.verified, color: Colors.blue[600]),
                        const SizedBox(width: 10),
                        Text(
                          'Certifications',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    
                    CertificationItem(
                      title: 'Devops using HCL Devops deploy ',
                      issuer: 'HCLTech',
                      date: '2025',
                    ),
                    const SizedBox(height: 10),
                    
                    CertificationItem(
                      title: 'Google AI essentials',
                      issuer: 'Coursera',
                      date: '2024',
                    ),
                    const SizedBox(height: 10),
                    
                    CertificationItem(
                      title: 'ML learning for beginners',
                      issuer: 'Simplilearn',
                      date: '2024',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillCategory extends StatelessWidget {
  final String title;
  final List<String> skills;

  const SkillCategory({super.key, required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills.map<Widget>((String skill) => Chip(
            label: Text(
              skill,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            backgroundColor: Colors.blue[600],
          )).toList(),
        ),
      ],
    );
  }
}

class CertificationItem extends StatelessWidget {
  final String title;
  final String issuer;
  final String date;

  const CertificationItem({
    super.key,
    required this.title,
    required this.issuer,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue[600],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.verified,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '$issuer • $date',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            ProjectCard(
              title: 'E-Commerce Flutter App',
              description: 'A full-featured e-commerce application built with Flutter and Firebase. Includes user authentication, product catalog, shopping cart, and payment integration.',
              technologies: const <String>['Flutter', 'Firebase', 'Stripe API', 'Provider'],
              status: 'Completed',
            ),
            const SizedBox(height: 15),
            
            ProjectCard(
              title: 'Weather Forecast App',
              description: 'Beautiful weather application with location-based forecasts, interactive maps, and weather alerts. Clean UI with smooth animations.',
              technologies: const <String>['Flutter', 'OpenWeather API', 'Google Maps', 'Riverpod'],
              status: 'Completed',
            ),
            const SizedBox(height: 15),
            
            ProjectCard(
              title: 'Task Management System',
              description: 'Productivity app for managing tasks and projects. Features include task scheduling, team collaboration, and progress tracking.',
              technologies: const <String>['Flutter', 'Node.js', 'MongoDB', 'Socket.io'],
              status: 'In Progress',
            ),
            const SizedBox(height: 15),
            
            ProjectCard(
              title: 'Social Media Analytics',
              description: 'Dashboard application for analyzing social media metrics and engagement. Real-time data visualization and reporting features.',
              technologies: const <String>['Flutter', 'Charts', 'REST API', 'SQLite'],
              status: 'Planning',
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final String status;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
    required this.status,
  });

  @override
  Widget build(BuildContext
      context) {
    Color statusColor = status == 'Completed' ? Colors.green :
                       status == 'In Progress' ? Colors.orange :
                       Colors.blue;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: statusColor.withAlpha((255 * 0.1).round()), // Fix applied here
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 15),
            
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: technologies.map<Widget>((String tech) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Text(
                  tech,
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )).toList(),
            ),
            const SizedBox(height: 15),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.code, size: 16),
                  label: const Text('View Code'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue[600],
                  ),
                ),
                const SizedBox(width: 10),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.launch, size: 16),
                  label: const Text('Live Demo'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Me'),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Get In Touch',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Feel free to reach out for collaborations or just a friendly hello!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 30),
                    
                    ContactItem(
                      icon: Icons.email,
                      title: 'Email',
                      subtitle: 'sairakesh.saisrinivasan@gmail.com',
                    ),
                    const SizedBox(height: 15),
                    
                    ContactItem(
                      icon: Icons.phone,
                      title: 'Phone',
                      subtitle: '+91 12345 67890',
                    ),
                    const SizedBox(height: 15),
                    
                    ContactItem(
                      icon: Icons.location_on,
                      title: 'Location',
                      subtitle: 'Hyderabad, Telangana, India',
                    ),
                    const SizedBox(height: 30),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SocialButton(
                          icon: Icons.link,
                          label: 'LinkedIn',
                          color: Colors.blue[700]!,
                        ),
                        SocialButton(
                          icon: Icons.code,
                          label: 'GitHub',
                          color: Colors.grey[800]!,
                        ),
                        SocialButton(
                          icon: Icons.web,
                          label: 'Portfolio',
                          color: Colors.green[600]!,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Send Message section REMOVED
          ],
        ),
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ContactItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            color: Colors.blue[600],
            size: 24,
          ),
        ),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const SocialButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color.withAlpha((255 * 0.1).round()),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
