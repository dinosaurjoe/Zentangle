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
  u = User.new(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    bio: Faker::Lorem.paragraph(2),
    portfolio_url: "www.portfolio.com",
    skills: "#{SKILLS.sample} and #{SKILLS.sample}"
    )
  u.remote_profile_picture_url = "http://lorempixel.com/50/50/people"
  u.save!
end

category = Project::CATEGORIES.keys.sample.to_s
subcategory = Project::CATEGORIES[category.to_sym].sample

address = ["Spreekanal, 10179 Berlin", "Alexanderplatz, 10178 Berlin", "Kollwitzplatz, Kollwitzstraße 1, 10405 Berlin", "Zionskirchplatz, Zionskirchstraße, 10119 Berlin"]

Project.create(
    title: "Noches de teatro.",
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
    title: "Legal Termination of a Warlock.",
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
    title: "The Florence Dance Festival",
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
    title: "Gravity: The Weighted Blanket",
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
    title: "Johannes Voss - Magic",
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
    title: "'The Conquest of Space",
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
    title: "VH-80: The Laser Distance Measurer",
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
    title: "Last Polar Bears",
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
    title: "Neuroscience Piano Album",
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
    title: "Archive: Historical People",
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
    title: "Hellpoint - A Dark Sci Fi",
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
    title: "Steadfast Diamond Movement",
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
    title: "A Trip to the Moon",
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
    title: "HOPE WHERE THERE WAS NONE",
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
    title: "SUPAY",
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
    title: "Robot Core",
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
    title: "Vacillation - Adolescence",
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

Project.create(
    title: "DELTA ENDURING TAROT",
    full_description: "There is a savage beauty in the depths of the swamp. For each drop of blood spilled into those dark waters, the delta rises. She thrives. She continues to resist the encroaching gulf. So too is the way of her people, who despite endless struggle, continue to find love and wonder in the ruins of the natural world.",
    category: "art",
    subcategory: "illustration",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "A modern 82-card color illustrated tarot deck centering on the natural beauty and struggles of life in the Mississippi Delta.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/487/822/bd72e66c4a71a315a9860e1a2afb575b_original.jpg?w=680&fit=max&v=1493695657&auto=format&q=92&s=bbbaffae2b473ccc0c333551e75e6879",
    owner: User.all.sample,
    total_budget: "$6,000"
  )

Project.create(
    title: "The Circuit: Urbiessa",
    full_description: "The purpose of this Kickstarter is to finance the very first episode of 'The Circuit' anthology. Help us make an incredible episode, and maybe more! It's up to you!",
    category: "film",
    subcategory: "science fiction",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "A film quality Sci-fi Anthology series, where fans, celebrities, and professional filmmakers work together.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/310/749/6ae7ff79ff4f80e98682925be3cf73b0_original.jpg?w=680&fit=max&v=1492575349&auto=format&q=92&s=6b35baca432ba81663600c03f03d3a8c",
    owner: User.all.sample,
    total_budget: "$75,000"
  )

Project.create(
    title: "Duty Free: A Documentary Film",
    full_description: "After working every day of her adult life, my mom - a single mom - was fired from her job at age 75. To help her deal with the pain of this loss, I encouraged her to write out a list of all the things she could never do while on the clock, and one by one, we ticked the items off her bucket list. Throughout these adventures, my mom really lived -- she took a hip hop class with a 'Hamilton' dancer; she finally got to visit her sister's grave in the UK; she reunited with her daughter and the granddaughter she hadn't seen in a decade. But without an income, the realities of unemployment loomed.",
    category: "film",
    subcategory: "documentary",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "After being abruptly fired, my struggling 75 year old mom and I go on her bucket list journey to find meaning in a life without work.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/330/245/8ce2a5179b335b9e4f489398d0266dc3_original.jpg?w=680&fit=max&v=1492697632&auto=format&q=92&s=673e970acd520afedf1ed7e0d4a37d02",
    owner: User.all.sample,
    total_budget: "$23,000"
  )

Project.create(
    title: "Meant to be Broken",
    full_description: "Harvey has led a cautious and conscientious life until he gets fired and finds out he has one month to live. Throwing caution to the wind, he finally steps into the bar he passes every day on the way to work. There he meets Luke and confesses he's never broken any rules. Luke responds 'Do you want to?,' and so the quest begins. Along the way they accidentally kidnap a woman who joins them on their adventure, but she might prove to be more trouble than they are looking for. 'Meant to be Broken' is a crazy journey of law breaking and discovery that culminates in Miami where competing forces catch up to the unlikely trio.",
    category: "film",
    subcategory: "comedy",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "'Meant to Be Broken' is a feature length dark comedy that follows 3 unlikely companions on a road trip crime spree down the East Coast.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/523/460/6db4abe045466fc62186bdef78c761f4_original.jpg?w=680&fit=max&v=1493878649&auto=format&q=92&s=195bb4a612c2af791f8851895460e2e6",
    owner: User.all.sample,
    total_budget: "$6,200"
  )

Project.create(
    title: "Night Run",
    full_description: "The year was 1985, Daniel McCormack was like any other man, dreaming of sports cars and a brighter future with his girlfriend, Jennifer. One night Daniel stops an assault on several civilians by the notorious Kano Gang who have been overpowering the city of Santa Mira. Unfortunately, Daniel’s bravery is short lived as he is murdered by Johnny, the gang’s leader. A year later, on a thunderous October night, Daniel rises from his grave seeking revenge on the men who took his life, his future and his dreams.",
    category: "film",
    subcategory: "action",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "An action film set in 1985, filled with explosions, synth music, and a man who will stop at nothing to get his revenge.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/411/532/f22c28f40166b5232ce21f86fd326adc_original.jpg?w=680&fit=max&v=1493224424&auto=format&q=92&s=9707257028e7ac59109cbe75f738fee9",
    owner: User.all.sample,
    total_budget: "$20,000"
  )

Project.create(
    title: "Sembene Across Africa",
    full_description: "Europeans dominated African culture until African independence in the late 1950s and early 1960s. They ran the schools, newspapers, TV and movie theaters. African language was outlawed in many places; in French West Africa, the birthplace of Ousmane Sembene, Africans were evenb forbidden to use cameras.
      Many Africans lost their connection with their cultures, but Sembene, an unlikely Senegalese hero, was determined to give African stories back to the African people. Sembene was kicked out of school at age 13 and worked for nearly 25 years as a manual laborer. He taught himself how to write at the age of 30, and soon was writing novels that inspired the battle for African independence.",
    category: "film",
    subcategory: "documentary",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "Join the largest community screening in history, featuring a film about 'the father of African cinema,' shown in every African nation.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/462/864/bcdfa44c85b3ef1ffe22f4cab4278fda_original.jpg?w=680&fit=max&v=1493559775&auto=format&q=92&s=560af71426da774ac4e66542f4fec41d",
    owner: User.all.sample,
    total_budget: "$14,500"
  )

Project.create(
    title: "PANS",
    full_description: "Set in a quiet beach town in grunge-saturated 1994, Pans puts a feminist twist on the classic, Peter Pan. Wynne Darling, 15, is physically broken, socially displaced, and emotionally torn between her newly separated parents.
      With nowhere to turn, Wynne hooks up with a new crowd led by bad boy skateboarder, Pete, and his riot grrrl sister, Belle. Surrounded by 'lost boys' and with the help of found friendship, Wynne learns what it means to grow up of her own free will...",
    category: "film",
    subcategory: "narrative film",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "Set in a quiet beach town in grunge-saturated 1994, Pans puts a feminist twist on the classic Peter Pan.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/384/675/91b99f791f6925bc29d11d26499ac3e9_original.jpg?w=680&fit=max&v=1493083120&auto=format&q=92&s=756a07dcee33c807a4067ac1c05f18dc",
    owner: User.all.sample,
    total_budget: "$50,000"
  )

Project.create(
    title: "V",
    full_description: "V is a confrontational and challenging coming-of-age drama that uses vampire mythology and horror genre tropes to explore femininity and sexual abuse. Think: Fish Tank meets Let the Right One In. The film slowly reveals how Minnie, a punchy word-a-second teenage girl, became a vampire as a result of being groomed online. Her vampirism is a physical embodiment of the damage caused.",
    category: "film",
    subcategory: "short",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "V is a confrontational coming-of-age drama that uses vampire mythology to explore themes of femininity, isolation and sexual abuse.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/463/044/b27f1f064831d084bbb2f467ad675b0f_original.png?w=680&fit=max&v=1493561075&auto=format&lossless=true&s=2133d8de7e7c407920e687ea9562bc7a",
    owner: User.all.sample,
    total_budget: "$3,000"
  )
Project.create(
    title: "BETTER EATING",
    full_description: "Better Eating International is a 501(c)(3) nonprofit organization that is inspiring compassion and sparing animals from miserable lives and cruel deaths through smart, personalized educational videos. Our inclusive and empowering model will help create a future where animals are valued as unique individuals and no longer exploited for human gain. With a diverse and talented team armed with the latest technologies, we'll give people the knowledge and tools they’ll need to live more ethically.",
    category: "film",
    subcategory: "animation",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "Creating smart and inclusive animated videos to expose animal abuse, inspire compassion, and empower millions to explore vegan eating",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/227/143/0f05f81dad388a7fe1e1cd87ec83690f_original.png?w=680&fit=max&v=1491971620&auto=format&lossless=true&s=56ee3ea5adc789214b34fa75b566cb3d",
    owner: User.all.sample,
    total_budget: "$95,000"
  )
Project.create(
    title: "FOODIES",
    full_description: "Foodies is a gonzo and artful horror-comedy film about young love, killer Kombucha, and mind-expanding science. When awkward loser Avery can't get his on-again off-again lover Sarah to commit, he decides to bio-hack his way back onto the dating scene. With the help of some genetically-altered health drinks, he sets out to pursue his romantic fantasies, utilizing yolked jocks to act as shared-consciousness avatars to score babes. It isn't long though before he finds the meat market is much more terrifying than he remembered...",
    category: "film",
    subcategory: "horror",
    address: address.sample,
    start_date: Faker::Date.backward(14).to_datetime,
    finish_date: Faker::Date.forward(23).to_datetime,
    short_description: "We are shooting a short horror-comedy film using vintage camera equipment and old-school DIY filmmaking techniques.",
    remote_picture_url: "https://ksr-ugc.imgix.net/assets/016/435/830/8f6e2d4e566a01d85de1c0e5e1f92b60_original.JPG?w=680&fit=max&v=1493345613&auto=format&q=92&s=c1380c99f4b8ecb100125384d84e6ab3",
    owner: User.all.sample,
    total_budget: "$1,475"
  )

COMPENSATION = ["pizza", "20 dollars", "free coffee", "1,000 dollars"]

projects = Project.all

ROLES = {
  "Lead Designer" => "A Conceptual or Lead Designer is an individual who works on the overall conceptualization and design of a media project. Projects may include a game, web site, interactive CD ROM, film, video, or other type of multimedia product. A person taking on the role of Lead Designer assumes a high level of responsibility. He or she is the creative driving force behind the conceptualization of a product.",
  "Illustrator" => "Illustrators combine art, design and creative skills to develop ideas and produce original visual images for a wide range of products.",
  "Director" => "If you lead, they'll follow. Director jobs typically lead large groups of employees that work directly under their guidance. Directors make sure that employees work together for the good of the company, ensure that company policy is upheld. Some directors will create operations and marketing plans, interview and hire employees, and work with customers.",
  "Writer" => "A writer is someone who writes for a living, creating fiction (e.g. novels, short stories, scripts for films, theatre and television), non-fiction (e.g. biographies, autobiographies, web content and reference books) or poetry.",
  "Art Director"=> "They are involved in creating a campaign that has an instant, positive impact on the consumer in order to promote the product or brand being advertised. They can be involved in all of the different forms of advertising, including advertising on television and radio, the internet, posters and direct mailings.",
  "Producer"=> "Producers play an integral role in the television, film and video industries. In this role you will oversee each project from conception to completion and may also be involved in the marketing and distribution process.",
  "Junior Art Director"=> "Junior art directors need to be natural visual thinkers, ready to expand on their skills and learn from senior art directors in order to flourish.",
  "Assistant Producer"=> "The Assistant to the Producer is an administrator who works closely with producers throughout the production process. They are involved at the pre-production stage through to post production and marketing and distribution.",
  "Production Assistant"=> "Production Runners are deployed by the producer and by other film/television production staff, such as the production coordinator, to assist wherever they are needed on productions. Their responsibilities vary considerably depending on where Production Runners are assigned.",
  "Technical Director"=> "The Technical Director (TD) or technical producer (TP) is usually the most senior technical person within a theatrical company or television studio. This person usually possesses the highest level of competence in a specific technical field and may be recognized as an expert in that industry. ",
  "Engineer"=> "Engineers work in a variety of fields to analyze, develop and evaluate large-scale, complex systems. This can mean and improve and maintaining current systems or creating brand new projects. Engineers will design and draft blueprints, visit systems in the field and manage projects."}



EXPERIENCE_YEARS = (1..5).to_a

count = 0
80.times do
  rolenow = ROLES.to_a.sample
  Role.create(
    project: projects[count],
    description: rolenow[1],
    requirements: "#{EXPERIENCE_YEARS.sample} years of experience",
    compensation: COMPENSATION.sample,
    title: rolenow[0],
    status: true
  )

   count = (count + 1) % 22
end


rolestodelete = Role.all

25.times do
  rolestodelete = Role.all

   samrole =  rolestodelete.sample
   samrole.destroy unless samrole.project.roles.length < 3
end

count = projects.length
ind = 0

count.times do
  Role.create(
    project: projects[ind],
    description: "As a film or video editor, you'll be responsible for assembling recorded raw material into a finished product that's suitable for broadcasting. The material may include camera footage, dialogue, sound effects, graphics and special effects.",
    requirements: "#{EXPERIENCE_YEARS.sample} years of experience",
    compensation: COMPENSATION.sample,
    title: "Editor",
    status: true
  )

  ind += 1
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




