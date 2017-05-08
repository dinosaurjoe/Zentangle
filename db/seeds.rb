# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "yaml"
require "open-uri"

Request.destroy_all
Role.destroy_all
Project.destroy_all
User.destroy_all


password = Faker::Internet.password(8)
SKILLS = ["acting", "directing", "writing", "editting", "sound"]


20.times do
  User.create(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Food.ingredient,
    bio: Faker::Lorem.paragraph(2),
    profile_picture: "http://placehold.it/220x220",
    portfolio_url: "www.portfolio.com",
    skills: "#{SKILLS.sample} and #{SKILLS.sample}"
    )
end

category = Project::CATEGORIES.keys.sample.to_s
subcategory = Project::CATEGORIES[category.to_sym].sample

address = ["Spreekanal, 10179 Berlin", "Alexanderplatz, 10178 Berlin", "Kollwitzplatz, Kollwitzstraße 1, 10405 Berlin", "Zionskirchplatz, Zionskirchstraße, 10119 Berlin"]

Project.create(
    title: "Noches de teatro. A documentary short film.",
    full_description: "Noches de teatro (or Theatre Nights) is a documentary short-film in production selected for the Identidad y Pertenencia contest at the Guanajuato International Film Festival. Our story is about Ivanna Tovar, a young transgender actress from Guanajuato, Mexico. We follow Ivanna as she directs and rehearses for Noches de Cabaret with her theatre group La Cabaretera Escénica. Center stage are her fears, her deepest feelings, the concerns of being different and the desire of being a spokeswoman for people whose voices are often misheard.
",
    category: "film",
    subcategory: "documentary",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "A documentary short-film about a young transgender actress and her theatre group in Guanajuato, Mexico.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/205/161/dc52b24cf918b327820fe59cd9286b66_original.png?w=680&fit=max&v=1491844850&auto=format&lossless=true&s=e9f5719089c4b5dd161ccb69fe2958e0",
    owner: User.all.sample,
    total_budget: "$20,000"
  )

Project.create(
    title: "In the Air",
    full_description: "Environmental justice is the fair treatment and meaningful involvement of all people regardless of race, color, national origin, or income, with respect to the development, implementation, and enforcement of environmental laws, regulations, and policies. It will be achieved when all people have the same degree of protection from environmental and health hazards, as well as equal access to the decision making process to have a healthy environment in which to live, learn, and work.",
    category: "film",
    subcategory: "drama",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "A feature film in which artists from the Gulf Coast use dance, spoken word, and visual art to tell stories of environmental justice.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/118/731/1e64c31529f786fee57fb6b78125b995_original.jpg?w=680&fit=max&v=1491248233&auto=format&q=92&s=38783ac2eadede486bb5f2348ed7674b",
    owner: User.all.sample,
    total_budget: "$50,000"
  )

Project.create(
    title: "Legal Termination of a Warlock... and Other Tales",
    full_description: "It's a genre bender filtering urban fantasy, horror and detective fiction through a sardonic worldview.  The influences are The Night Stalker by way of Raymond Chandler, Dashiell Hammett and Art Buchwald.",
    category: "journalism",
    subcategory: "print",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "Six monthly satirical urban fantasy novelettes about a fixer of supernatural problems.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/063/697/187f0c894fa55e864f0bdfea333c5706_original.png?w=680&fit=max&v=1490870733&auto=format&lossless=true&s=241882d4b02654f5c98012859b9a8b00",
    owner: User.all.sample,
    total_budget: "$1,000"
  )

Project.create(
    title: "Molissa Fenley at the Florence Dance Festival",
    full_description: "Molissa, assisted by Christiana Axelsen will be very busy while in Florence, as the week residency will require her to teach contemporary classes, set a new work on the dancers of Toscana Dance HUB, mentor dance musicians of Music HUB and student choreographers, plus rehearse and perform at the Florence Dance Festival.",
    category: "theater",
    subcategory: "dance",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "Molissa performed at the first Florence Dance Festival in 1989 and is this summer coming back for its 28th edition, both are showing artistic longevity and grace.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/481/464/84ac7de1832e19a38cb480e70672cd7f_original.jpg?w=680&fit=max&v=1493666758&auto=format&q=92&s=5aa629f3e0622619194178a49a28a02e",
    owner: User.all.sample,
    total_budget: "$3,000"
  )


Project.create(
    title: "Gravity: The Weighted Blanket for Sleep, Stress and Anxiety",
    full_description: "Gravity is a premium-grade, therapeutic weighted blanket that harnesses the power of deep touch stimulation – a proven anxiety treatment – to gently distribute deep pressure across your body.",
    category: "design",
    subcategory: "product design",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "A weighted blanket engineered to be 10 percent of your body weight to naturally reduce stress and increase relaxation.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/316/565/cff9e7bdc4eb8fefbfb5c0e47e179a43_original.png?w=680&fit=max&v=1492614995&auto=format&lossless=true&s=0cbd8b4a2669c9b24a015a34fa1a3260",
    owner: User.all.sample,
    total_budget: "$20,000"
  )

Project.create(
    title: "Johannes Voss - Magic: The Gathering Print Collection",
    full_description: "Hey there! My name's Johannes Voss and I'm an illustrator on Magic: The Gathering. You might have seen my work, my Patreon or my previous campaigns. And while I've been selling prints at conventions or GPs here and there, I've never made them available online. By popular demand, this changes today!",
    category: "art",
    subcategory: "illustration",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "An autographed collection of prints from Magic: The Gathering illustrator Johannes Voss.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/232/905/a9a82a9694a07f6fb9c7b01e59d8f72f_original.jpg?w=1024&h=576&fit=fill&bg=000000&v=1492012411&auto=format&q=92&s=87fc2ba11671c136bf6abf0834860676",
    owner: User.all.sample,
    total_budget: "$5,000"
  )


Project.create(
    title: "'The Conquest of Space: Curiosity' Poster",
    full_description: "Hi! We are Totem, a design studio based in Mexico. We are a team of creative people strongly influenced by videogame culture, movies, japanese animation, science fiction and comics with the necessity to create valuable content that is inspiring and educative for people around the world.",
    category: "art",
    subcategory: "illustration",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "19x27 Curiosity: The conquest of space series poster.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/378/245/8746113bdae37b9b6ec3aa7c8837c61c_original.png?w=680&fit=max&v=1493051688&auto=format&lossless=true&s=3838c5638a73704c54bbe178531c0549",
    owner: User.all.sample,
    total_budget: "$10,000"
  )

Project.create(
    title: "LOVE IS A DIRTY WORD",
    full_description: "Our country is riven by lines that separate us into groups of identity, affinity, and ideology. And to some extent, perhaps more than we'd like to admit, it's our ability to fit neatly into boxes that determines who loves us, and exactly how lovable we are.",
    category: "theater",
    subcategory: "experimental",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "Love Is A Dirty Word is a solo written and performed by Giovanni Adams. Directed by Becca Wolff.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/514/773/2318d1e4d5733cc509f7f2f98a768f56_original.jpg?w=680&fit=max&v=1493834292&auto=format&q=92&s=4f5cc6df7d29b55afe94a9fdb37b7328",
    owner: User.all.sample,
    total_budget: "$5,000"
  )

Project.create(
    title: "Beatnik Prints Topographic Clothing",
    full_description: "The initial designs available focus mainly on National Parks, America's best idea. There are also a few other locations available, but there are so many more locations yet to be printed, how to decide where to make the next map? That's where you can help!
If this campaign gets 10 backers from the same state, I will create a series of designs for that state! And who better to find out cool map locations from then some locals. So if you back this project, hit me up and tell me the cool locations I'm missing.
",
    category: "fashion",
    subcategory: "apparel",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "What are those awesome patterns? TOPO MAPS! Topographic Maps from around the US creating the coolest patterns since tie-dye",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/401/019/a35613ffa71924e02b66c1b186cdc95b_original.jpg?w=680&fit=max&v=1493165247&auto=format&q=92&s=c0e3c1e2c030e40a11300bbc2e8f8c54",
    owner: User.all.sample,
    total_budget: "$10,000"
  )
Project.create(
    title: "Vanessa",
    full_description: "You may be wondering why would you want to see 'Vanessa' realized? Simply  because, like you, we are lovers of cinema. Our team is made up of 10 students of Sciences of Communication; we have always been friends, but our dream of telling stories that have an effect on the viewer both by the depth of the story told, and the quality of the realization; both elements that well applied, change to who observes from a good audiovisual experience. You still do not know us, but we are sure that after joining our family with your support, you will not want to miss a single moment of our adventures. Because, come on ... We're crazy! And if you do not believe us, expect to know about our story and how we want to carry it out.",
    category: "film",
    subcategory: "short",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "Vanessa, is the story of a woman with a mark, who chooses a forbidden lifestyle obtaining pleasure, witnessing it in others.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/064/532/6e1be095526593c84819a04266c907c9_original.jpg?w=680&fit=max&v=1490876711&auto=format&q=92&s=92b546e9318dace6825e66f2280bb7a2",
    owner: User.all.sample,
    total_budget: "$30,000"
  )

Project.create(
    title: "VH-80: The World's First Bilateral Laser Distance Measurer",
    full_description: "VH-80 shoots two pulses of laser light from two sources in opposite directions and measures the amount of time it takes for each pulse to bounce back to its accompanied sensors. Since light moves at a constant, VH-80 can calculate the distance between itself and the targets with high accuracy.",
    category: "technology",
    subcategory: "gadgets",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "It's true, VH-80 is the world's first bilateral LDM. Let us show you what that means, what changes, and how awesome it really is.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/015/921/024/926c699c919787601d4fac16269900db_original.png?w=680&fit=max&v=1489929489&auto=format&lossless=true&s=02c653752d09f974046553c992d47fa0",
    owner: User.all.sample,
    total_budget: "20,000"
  )

Project.create(
    title: "Last of the Great White Bears with Paul Nicklen",
    full_description: "I want to engage and inform those who can’t see the effects of climate change first-hand. We will use our visual story-telling to inspire and educate those who do not believe polar bears, or their environments, should be protected. Scientists expect polar bears will be extinct in the next 100 years. If we cannot save a species as charismatic as the polar bears, how can we save ourselves? We are all in this together.",
    category: "photography",
    subcategory: "animals",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "Paul Nicklen and the SeaLegacy team are traveling to Svalbard, Norway, to document the effects of disappearing sea ice on polar bears.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/519/023/afbe09236f0380ac2bd686be0c109050_original.jpg?w=680&fit=max&v=1493851430&auto=format&q=92&s=81f2b4a6fdb3bb984db44adda4652498",
    owner: User.all.sample,
    total_budget: "$60,000"
  )


Project.create(
    title: "Solo Piano Album Inspired By Neuroscience",
    full_description: "Howdy! I'm John C. O'Leary III, a jazz pianist and neuroscientist in the Tampa Bay area and I absolutely love making music.
The purpose of this project is to make my first solo recording! I'm going to write all new original music for this recording inspired by scientific discoveries in neuroscience.
Here are two pieces, which will be on the record, that I performed live at the Timucua Arts White House in Orlando, FL.",
    category: "music",
    subcategory: "jazz",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "John draws inspiration from neuroscience to compose all original music for the piano and other keyboards.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/096/227/c9fb997136460417244951e16a60e454_original.jpg?w=680&fit=max&v=1491079857&auto=format&q=92&s=377804bcc67a3e1e14644b13e721bc3b",
    owner: User.all.sample,
    total_budget: "$5,000"
  )


Project.create(
    title: "Archive: Historical People, Places, and Events for RPGs",
    full_description: "Archive is a collection of adventure sites, NPCs, and events ripped right out of history and perfect for your campaign. It’s a 265-page book with 80 subjects. All have everything you need to make them come alive at your table: sights, smells, history, local color, and even plot hooks and ideas to help you adapt them to your campaign setting.",
    category: "technology",
    subcategory: "game design",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "80 locations, landscapes, NPCs, and events ripped from history, and ways to use them to spice up your game.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/401/083/d51c02aec7c7c8fd4a6a85d01bcef25d_original.png?w=680&fit=max&v=1493165667&auto=format&lossless=true&s=ae3118ca4e5eb6f3b28f6172980a101a",
    owner: User.all.sample,
    total_budget: "$14,000"
  )

Project.create(
    title: "Hellpoint - A Dark Sci Fi RPG",
    full_description: "An occult sci fi RPG with split-screen multiplayer and real-time events. Try the free demo!",
    category: "technology",
    subcategory: "game design",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/158/061/6c6287c44bd0fa5a83374f56812abd46_original.jpg?w=680&fit=max&v=1491486318&auto=format&q=92&s=8e1530e101d991720fa3c9e63c3e3c67",
    owner: User.all.sample,
    total_budget: "$1,000"
  )

Project.create(
    title: "Gear Supply Co. Guitar Pedals",
    full_description: "Since we started this company 2 years ago, we’ve been asked nonstop when we’re going to begin making guitar pedals. Our goal is to be the one-stop-shop brand for all guitarists, so it's a logical evolution for us. Because we only make high quality products that we ourselves use, we wanted to do it the right way.",
    category: "technology",
    subcategory: "gadgets",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "Gear Supply Co. is launching a new line of affordable, hand wired guitar pedals",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/570/611/32be15bd46af15b4db368b49ad6df52b_original.png?w=680&fit=max&v=1494191152&auto=format&lossless=true&s=046f59869a86b99cf10d4c9d913ae6a5",
    owner: User.all.sample,
    total_budget: "15,000"
  )

Project.create(
    title: "The Steadfast Diamond Movement",
    full_description: "Chicago is a place known for amazing art and architecture. From public art, to street art filled with rich vibrant colors we are one of the nations most known homes for art. While we continue to see amazing works of art created throughout the city, we also see art related programs rapidly dying in Chicago and its surrounding suburbs. When budgets are cut due to lack of funding usually art related programs are first to go. This is why your support to our campaign is vital. We understand the role art plays in the development of our children. Enhancing creativity gives our dancers an outlet to escape and be free.",
    category: "theater",
    subcategory: "dance",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "Two dance companies come together on a mission to find a studio space to call home. Where possibilities become reality.",
    remote_picture_url: "https://cdn.pixabay.com/photo/2016/03/10/21/14/dance-1249292_1280.jpg",
    owner: User.all.sample,
    total_budget: "$13,000"
  )

Project.create(
    title: "A Trip to the Moon Coloring Book",
    full_description: "This coloring book is twenty-three pages of illustrations inspired by the silent film A Trip to the Moon. As we launch this Kickstarter campaign, the creative work is 100% complete. All that’s needed is printing and shipping -- and that is where YOU come in!",
    category: "art",
    subcategory: "illustration",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "A Trip to the Moon by Georges Méliès, was the first science fiction film, ever. With your help it will be a coloring book…pretty soon.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/015/580/493/3d0b5226c4d920507088f1e98b3af45b_original.png?w=680&fit=max&v=1487642252&auto=format&lossless=true&s=84d23d78229ecf67f19415b2eb446aa2",
    owner: User.all.sample,
    total_budget: "$20,000"
  )

Project.create(
    title: "HOPE WHERE THERE WAS NONE by LOUD HARP",
    full_description: "A long time coming, HWTWN is a record born from a season of death, the new life that followed and the valley in between. When everything in us wanted to run away, to escape - we heard a still small voice saying there's no need to run. I'm with you - right here - in the middle of it all. Most of the songs on HWTWN are drenched in that theme - Immanuel, God with us.",
    category: "music",
    subcategory: "indie rock",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "Loud Harp's Third Full Length Album | Available everywhere June 09, 2017.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/015/610/119/199775de03ef6be802591ce56772060f_original.jpg?w=680&fit=max&v=1487828948&auto=format&q=92&s=8036a4c554352f4f6a241a8ca8523776",
    owner: User.all.sample,
    total_budget: "$17,500"
  )

Project.create(
    title: "SUPAY - a film about a love against all odds",
    full_description: "SUPAY is a short (23 min) and was filmed during six days in August 2016 on some of the most beautiful and iconic locations in Cuzco city and the surrounding Sacred Valley. But filming is just the first step.To finish the film we need funding for the post production. Color Grading, Sound Production, and Music Composition have to be completed in order to have a film that meets all the requirements to succeed at international film festivals. All cast and crew members worked on a provision contract, each of them being great talents and highly trained, committed professionals should be compensated for their skilled labor of love. We endeavor to contribute to the development of Cuzco's growing local film scene and want to offer each cast and crew member at least a minimum compensation for their effort. ",
    category: "film",
    subcategory: "drama",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "A film about a lesbian couple in Peru calling upon Andean magic to fight against discrimination, produced by Berlinale participant D.S.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/013/690/796/0f6132f147b78032af0b12f91b2c3a70_original.jpg?w=1552&h=873&fit=fill&bg=000000&v=1475766504&auto=format&q=92&s=fab0a96e2a41aeb71a9c6c67d0840b0c",
    owner: User.all.sample,
    total_budget: "$20,000"
  )

Project.create(
    title: "Robot Core - The Ultimate Raspberry Pi Robot Controller",
    full_description: "The Robot Core is a robot control board for the Raspberry Pi and Arduino that brings many different elements into one awesome package! You can now power your Raspberry Pi, control motors, servos and read sensors without needing five additional boards to hook up. The boards can even be daisy chained to add even more functionality.",
    category: "technology",
    subcategory: "robots",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "Robot Core is a robot controller that connects to the Raspberry Pi, allowing you to easily control motors, servos, and read sensors.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/014/821/824/fdd29344fda8be7f80c46075842042bf_original.JPG?w=700&fit=max&v=1481248256&auto=format&q=92&s=a895d4c33c7ab2f03293a645339b5caf",
    owner: User.all.sample,
    total_budget: "$13,000"
  )

Project.create(
    title: "The Myth of Layla",
    full_description: "The Myth of Layla, by Iranian-American artist Amy Khoshbin, is a two-month interactive art exhibition and series of live reality show performances happening at Mana Contemporary September 25 – November 12 leading up to the 2016 Presidential Election. Set in a not-too-distant future, The Myth of Layla is about political ideology, celebrity-obsessed media, and an Iranian-American activist named Layla based on my personal history. A big-brother media conglomerate called The Network runs the country's government and is at war with a fictionalized Middle Eastern country akin to Iran. ",
    category: "art",
    subcategory: "installations",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "Art installation with reality show performances about political ideology, celebrity-obsessed media, and an Iranian-American activist.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/013/755/782/9ae2b2c17625d3e7b5a10077e39346d5_original.jpg?w=1552&h=873&fit=fill&bg=000000&v=1473988421&auto=format&q=92&s=331409da86f815c7f72929b7218097e1",
    owner: User.all.sample,
    total_budget: "$7,000"
  )

Project.create(
    title: "'Vacillation - Adolescence' Short Dance Film",
    full_description: "'Vacillation - Adolescence' is the second in a series of seven short dance films. The story is a snapshot of two teenagers in love and their surge of emotions and insecurities. Performed by two dancers, the story is portrayed through a classical ballet Pas de Deux with the London Thames path providing a wonderful backdrop.",
    category: "film",
    subcategory: "romance",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "'Vacillation - Adolescence' is a short dance film about teenage love.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/003/775/929/314c481354d012aa67852eea7128c053_original.jpg?w=680&fit=max&v=1431418793&auto=format&q=92&s=832da987e7c9422848130e269bfd3449",
    owner: User.all.sample,
    total_budget: "$2,000"
  )



COMPENSATION = ["pizza", "20 dollars", "free coffee", "1,000 dollars"]

projects = Project.all

ROLES = ["Lead Designer", "Illustrator", "Editor", "Director", "Writer", "Art Director", "Producer", "Junior Art Director", "Assistant Producer", "Production Assistant", "Technical Director", "Engineer"]
500.times do
  Role.create(
    project: projects.sample,
    description: Faker::Lorem.paragraph(2),
    requirements: "2 years of experience",
    compensation: COMPENSATION.sample,
    title: ROLES.sample,
    status: [true, false].sample
  )
end


200.times do
  user = User.order("RANDOM()").first
  Request.create(
    user: user,
    role: Role.order("RANDOM()").first,
    user_confirm: [true, false, nil].sample,
    owner_confirm: [true, false, nil].sample,
    owner_message: "join me",
    user_message: "how much $$$",
    created_by: user
  )

end




