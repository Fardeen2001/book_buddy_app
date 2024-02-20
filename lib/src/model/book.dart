class Book {
  String? imageUrl;
  String? title;
  String? author;
  bool? available;
  double? rating;
  List<String>? genre;
  String? description;

  Book(this.imageUrl, this.title, this.author, this.available, this.rating,
      this.genre, this.description);

  static List<Book> generateRecommendedBooks() {
    return [
      Book(
          "assets/images/book1.jpg",
          "Harry Potter and the Philosopher's Stone",
          "J. K. Rowling",
          true,
          4.7,
          ["Action", "Adventure", "Fantasy"],
          "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!"),
      Book(
          "assets/images/book2.jpg",
          "The Nightingale",
          "Kristin Hannah",
          true,
          4.6,
          ["Historical Fiction", "Fiction"],
          "In the quiet village of Carriveau, Vianne Mauriac says good-bye to her husband, Antoine, as he heads for the Front. She doesn’t believe that the Nazis will invade France…but invade they do, in droves of marching soldiers, in caravans of trucks and tanks, in planes that fill the skies and drop bombs upon the innocent. When a German captain requisitions Vianne’s home, she and her daughter must live with the enemy or lose everything. Without food or money or hope, as danger escalates all around them, she is forced to make one impossible choice after another to keep her family alive."),
      Book(
          "assets/images/book3.jpg",
          "Shuggie Bain",
          "Douglas Stuart",
          true,
          4.3,
          ["Fiction", "Historical Fiction"],
          "Shuggie Bain is the unforgettable story of young Hugh Shuggie Bain, a sweet and lonely boy who spends his 1980s childhood in run-down public housing in Glasgow, Scotland. Thatcher's policies have put husbands and sons out of work, and the city's notorious drugs epidemic is waiting in the wings."),
      Book(
          "assets/images/book14.jpg",
          "Yours Truly",
          "Abby Jimenez",
          false,
          4.33,
          ["Romance", "Contemporary", "Fiction"],
          "Dr. Briana Ortiz’s life is seriously flatlining. Her divorce is just about finalized, her brother’s running out of time to find a kidney donor, and that promotion she wants? Oh, that’s probably going to the new man-doctor who’s already registering eighty-friggin’-seven on Briana’s “pain in my ass” scale. But just when all systems are set to hate, Dr. Jacob Maddox completely flips the game . . . by sending Briana a letter."),
      Book(
          "assets/images/book15.jpg",
          "The Ashes & the Star-Cursed King",
          "Carissa Broadbent",
          true,
          4.18,
          ["Fantasy", "Romance", "Vampires"],
          "In the wake of the Kejari, everything Oraya once thought to be true has been destroyed. A prisoner in her own kingdom, grieving the only family she ever had, and reeling from a gutting betrayal, she no longer even knows the truth of her own blood. She’s left only with one certainty: she cannot trust anyone, least of all Raihn.The House of Night, too, is surrounded by enemies. Raihn’s own nobles are none too eager to accept a Turned king, especially one who was once a slave. And the House of Blood digs their claws into the kingdom, threatening to tear it apart from the inside.")
    ];
  }

  static List<Book> generateAllBooks() {
    return [
      Book(
          "assets/images/book1.jpg",
          "Harry Potter and the Philosopher's Stone",
          "J. K. Rowling",
          true,
          4.7,
          ["Action", "Adventure", "Fantasy"],
          "Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry's eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!"),
      Book(
          "assets/images/book2.jpg",
          "The Nightingale",
          "Kristin Hannah",
          true,
          4.6,
          ["Historical Fiction", "Fiction"],
          "In the quiet village of Carriveau, Vianne Mauriac says good-bye to her husband, Antoine, as he heads for the Front. She doesn’t believe that the Nazis will invade France…but invade they do, in droves of marching soldiers, in caravans of trucks and tanks, in planes that fill the skies and drop bombs upon the innocent. When a German captain requisitions Vianne’s home, she and her daughter must live with the enemy or lose everything. Without food or money or hope, as danger escalates all around them, she is forced to make one impossible choice after another to keep her family alive."),
      Book(
          "assets/images/book3.jpg",
          "Shuggie Bain",
          "Douglas Stuart",
          true,
          4.3,
          ["Fiction", "Historical Fiction"],
          "Shuggie Bain is the unforgettable story of young Hugh Shuggie Bain, a sweet and lonely boy who spends his 1980s childhood in run-down public housing in Glasgow, Scotland. Thatcher's policies have put husbands and sons out of work, and the city's notorious drugs epidemic is waiting in the wings."),
      Book(
          "assets/images/book4.jpg",
          "Fourth Wing",
          "Rebecca Yarros",
          true,
          4.6,
          ["Fantasy", "Romance"],
          "Twenty-year-old Violet Sorrengail was supposed to enter the Scribe Quadrant, living a quiet life among books and history. Now, the commanding general—also known as her tough-as-talons mother—has ordered Violet to join the hundreds of candidates striving to become the elite of Navarre: dragon riders."),
      Book(
          "assets/images/book5.jpg",
          "Hello Beautiful",
          "Ann Napolitano",
          false,
          4.1,
          ["Fiction", "Romance"],
          "William Waters grew up in a house silenced by tragedy, where his parents could hardly bear to look at him, much less love him. So it’s a relief when his skill on the basketball court earns him a scholarship to college, far away from his childhood home. He soon meets Julia Padavano, a spirited and ambitious young woman who surprises William with her appreciation of his quiet steadiness. With Julia comes her family; she is inseparable from her three younger sisters: Sylvie, the dreamer, is happiest with her nose in a book and imagines a future different from the expected path of wife and mother; Cecelia, the family’s artist; and Emeline, who patiently takes care of all of them. Happily, the Padavanos fold Julia’s new boyfriend into their loving, chaotic household."),
      Book(
          "assets/images/book6.jpg",
          "The Bee Sting",
          "Paul Murray",
          true,
          4.05,
          ["Contemporary", "Irish Literature", "Novels"],
          "The Barnes family is in trouble. Dickie’s once-lucrative car business is going under―but rather than face the music, he’s spending his days in the woods, building an apocalypse-proof bunker with a renegade handyman. His wife Imelda is selling off her jewelry on eBay, while their teenage daughter Cass, formerly top of her class, seems determined to binge-drink her way through her final exams. And twelve-year-old PJ is putting the final touches to his grand plan to run away from home."),
      Book(
          "assets/images/book7.jpg",
          "King of Pride",
          "Ana Huang",
          false,
          3.97,
          ["Romance", "Adult", "Contemporary"],
          "Reserved, controlled, and proper to a fault, Kai Young has neither the time nor inclination for chaos—and Isabella, with her purple hair and inappropriate jokes, is chaos personified.With a crucial CEO vote looming and a media empire at stake, the billionaire heir can’t afford the distraction she brings.Isabella is everything he shouldn’t want, but with every look and every touch, he’s tempted to break all his rules…and claim her as his own."),
      Book(
          "assets/images/book8.jpg",
          "What Lies in the Woods",
          "Kate Alice Marshall",
          true,
          3.97,
          ["Thriller",
            "Mystery",
            "Fiction"],
          "Naomi Shaw used to believe in magic. Twenty-two years ago, she and her two best friends, Cassidy and Olivia, spent the summer roaming the woods, imagining a world of ceremony and wonder. They called it the Goddess Game. The summer ended suddenly when Naomi was attacked. Miraculously, she survived her seventeen stab wounds and lived to identify the man who had hurt her. The girls’ testimony put away a serial killer, wanted for murdering six women. They were heroes."),
      Book(
          "assets/images/book9.jpg",
          "Final Offer",
          "Lauren Asher",
          true,
          4.25,
          ["Romance",
            "Contemporary Romance",
            "Contemporary"],
          "I’m the Kane brother everyone gossips about behind closed doors.Trust fund brat. Washed-up athlete. High-functioning alcoholic.No one knows the real me but her.Lana Castillo—my childhood best friend and the only woman I ever loved.When I broke her heart six years ago, I promised to never return to Lake Wisteria.I kept my word until my grandfather’s will changed everything.To receive my inheritance, I was tasked with spending a summer at the family lake house before selling it.The request was simple in theory until my entire plan blew up on the very first day.Turns out Lana doesn’t just live at the house, but she claims to own it, too."),
      Book(
          "assets/images/book10.jpg",
          "All the Dangerous Things",
          "Stacy Willingham",
          true,
          4.09,
          ["Thriller", "Mystery", "Fiction"],
          "One year ago, Isabelle Drake's life changed forever: her toddler son, Mason, was taken out of his crib in the middle of the night while she and her husband were asleep in the next room. With little evidence and few leads for the police to chase, the case quickly went cold. However, Isabelle cannot rest until Mason is returned to her—literally.Except for the occasional catnap or small blackout where she loses track of time, she hasn’t slept in a year"),
      Book(
          "assets/images/book11.jpg",
          "The Only One Left",
          "Riley Sager",
          false,
          4.15,
          ["Thriller",
            "Mystery",
            "Horror"],
          "Now reduced to a schoolyard chant, the Hope family murders shocked the Maine coast one bloody night in 1929. While most people assume seventeen-year-old Lenora was responsible, the police were never able to prove it. Other than her denial after the killings, she has never spoken publicly about that night, nor has she set foot outside Hope’s End, the cliffside mansion where the massacre occurred."),
      Book(
          "assets/images/book12.jpg",
          "Tom Lake",
          "Ann Patchett",
          true,
          4.08,
          ["Fiction", "Literary Fiction", "Romance"],
          "In the spring of 2020, Lara’s three daughters return to the family's orchard in Northern Michigan. While picking cherries, they beg their mother to tell them the story of Peter Duke, a famous actor with whom she shared both a stage and a romance years before at a theater company called Tom Lake. As Lara recalls the past, her daughters examine their own lives and relationship with their mother, and are forced to reconsider the world and everything they thought they knew."),
      Book(
          "assets/images/book13.jpg",
          "Things We Left Behind",
          "Lucy Score",
          true,
          4.45,
          ["Romance", "Contemporary Romance", "Contemporary"],
          "Lucian Rollins is a lean, mean vengeance-seeking mogul. On a quest to erase his father’s mark on the family name, he spends every waking minute pulling strings and building an indestructible empire. The more money and power he amasses, the safer he is from threats."),
      Book(
          "assets/images/book14.jpg",
          "Yours Truly",
          "Abby Jimenez",
          false,
          4.33,
          ["Romance", "Contemporary", "Fiction"],
          "Dr. Briana Ortiz’s life is seriously flatlining. Her divorce is just about finalized, her brother’s running out of time to find a kidney donor, and that promotion she wants? Oh, that’s probably going to the new man-doctor who’s already registering eighty-friggin’-seven on Briana’s “pain in my ass” scale. But just when all systems are set to hate, Dr. Jacob Maddox completely flips the game . . . by sending Briana a letter."),
      Book(
          "assets/images/book15.jpg",
          "The Ashes & the Star-Cursed King",
          "Carissa Broadbent",
          true,
          4.18,
          ["Fantasy", "Romance", "Vampires"],
          "In the wake of the Kejari, everything Oraya once thought to be true has been destroyed. A prisoner in her own kingdom, grieving the only family she ever had, and reeling from a gutting betrayal, she no longer even knows the truth of her own blood. She’s left only with one certainty: she cannot trust anyone, least of all Raihn.The House of Night, too, is surrounded by enemies. Raihn’s own nobles are none too eager to accept a Turned king, especially one who was once a slave. And the House of Blood digs their claws into the kingdom, threatening to tear it apart from the inside."),
    ];
  }
}
