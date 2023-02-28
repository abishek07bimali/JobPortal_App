class NavigationItem {

  String title;

  NavigationItem(this.title);

}

List<NavigationItem> getNavigationItemList(){
  return <NavigationItem>[
    NavigationItem("Jobs"),
    NavigationItem("Applications"),
    // NavigationItem("Profile"),

  ];
}

class Application {

  String position;
  String company;
  String status;
  String price;
  String logo;

  Application(this.position, this.company, this.status, this.price, this.logo);

}

List<Application> getApplications(){
  return <Application>[
    Application("Flutter UI / UX Designer", "Nike Inc.", "Delivered", "40", "assets/image/nike.png"),
    Application("Product Designer", "Google LLC", "Opened", "60", "assets/image/google.png"),
    Application("UI / UX Designer", "Uber Technologies Inc.", "Cancelled", "55", "assets/image/canon.png"),
    Application("Lead UI / UX Designer", "Apple Inc.", "Delivered", "80", "assets/image/apple.png"),
    Application("Flutter UI Designer", "Amazon Inc.", "Not selected", "60", "assets/image/amazon.png"),
  ];
}

class Job {

  String position;
  String company;
  String price;
  String concept;
  String logo;
  String city;

  Job(this.position, this.company, this.price, this.concept, this.logo, this.city);

}

List<Job> getJobs(){
  return <Job>[
    Job("Flutter UI/UX", "Nike Inc.", "40", "Full-Time", "assets/image/google.png", "San Francisco, California"),
    Job("Product Designer", "Google LLC", "60", "Part-Time", "assets/image/nike.png", "San Francisco, California"),
    Job("UI / UX Designer", "Meta Technologies Inc.", "55", "Full-Time", "assets/image/meta.png", "San Francisco, California"),
    Job("Lead UI/UX Designer", "Apple Inc.", "80", "Part-Time", "assets/image/apple.png", "San Francisco, California"),
    Job("Flutter Developer", "Google Inc.", "60", "Full-Time", "assets/image/google.png", "San Francisco, California"),
    Job("Product Designer", "Acer Inc.", "60", "Full-Time", "assets/image/acer.png", " Hsinchu, Taiwan"),
    Job("Software Engineer", "Samsung Inc.", "60", "Full-Time", "assets/image/samsung.png", "San Francisco, California"),
    Job("Flutter Developer", "Netflix Inc.", "60", "Full-Time", "assets/image/netflix.png", "San Francisco, California"),
    Job("Content Creator", "Amazon Inc.", "60", "Full-Time", "assets/image/amazon.png", "San Francisco, California"),
  ];
}


List<String> getJobsRequirements(){
  return <String>[
    "Exceptional communication skills and team-working skills",
    "Know the principles of animation and you can create high fidelity prototypes",
    "Direct experience using Adobe Premiere, Adobe After Effects & other tools used to create videos, animations, etc.",
    "Good UI/UX knowledge",
  ];
}


class NationalJob {

  String position;
  String company;
  String price;
  String concept;
  String logo;
  String city;

  NationalJob(this.position, this.company, this.price, this.concept, this.logo, this.city);

}

List<NationalJob> getNationalJobs(){
  return <NationalJob>[
    NationalJob("Java Teacher", "Softwarica College of IT", "40", "Full-Time", "assets/image/google.png", "Dillibazar, Kathmandu"),
    NationalJob("IOT Instructor", "Karma Point", "60", "Full-Time", "assets/image/nike.png", "Purano Baneshwor, Kathmandu"),
    NationalJob("Spring Developer", "Point Zero", "60", "Part-Time", "assets/image/apple.png", "Dillibazar, Kathmandu"),
    NationalJob("Market Analysis", "Karma Shares", "60", "Full-Time", "assets/image/canon.png", "Purano Baneshwor, Kathmandu"),
    NationalJob("IOT Instructor", "Karma Point", "60", "Full-Time", "assets/image/acer.png", "Purano Baneshwor, Kathmandu"),
    // NationalJob("UI / UX Designer", "Meta Technologies Inc.", "55", "Full-Time", "assets/images/meta.png", "San Francisco, California"),
    // NationalJob("Lead UI/UX Designer", "Apple Inc.", "80", "Part-Time", "assets/images/apple.png", "San Francisco, California"),
    // NationalJob("Flutter Developer", "Google Inc.", "60", "Full-Time", "assets/images/google.png", "San Francisco, California"),
    // NationalJob("Product Designer", "Acer Inc.", "60", "Full-Time", "assets/images/acer.png", " Hsinchu, Taiwan"),
    // NationalJob("Software Engineer", "Samsung Inc.", "60", "Full-Time", "assets/images/samsung.png", "San Francisco, California"),
    // NationalJob("Flutter Developer", "Netflix Inc.", "60", "Full-Time", "assets/images/netflix.png", "San Francisco, California"),
    // NationalJob("Content Creator", "Amazon Inc.", "60", "Full-Time", "assets/images/amazon.png", "San Francisco, California"),
  ];
}


List<String> getNationalJobsRequirements(){
  return <String>[
    "Exceptional communication skills and team-working skills",
    "Know the principles of animation and you can create high fidelity prototypes",
    "Direct experience using required tools and techniques, & other tools that are used to directly or indirectly during the project .",
    "Good knowledge on particular field",
  ];
}