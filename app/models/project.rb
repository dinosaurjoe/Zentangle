class Project < ApplicationRecord

  CATEGORIES = {
    art: [
      "ceramics", "conceptual art", "digital art", "illustration", "installations",
    "mixed media", "painting", "performance art", "public art", "sculpture", "textiles",
    "video art", "printmaking"
    ],
    design: [
      "architecture", "civic design", "graphic design", "interactive design",
    "product design", "typography", "industrial design", "interior design"
    ],
    fashion: [
      "accessories", "apparel", "childrenswear", "couture", "footwear",
    "jewelry", "pet fashion"
    ],
    film: [
      "action", "animation", "comedy", "documentary", "drama", "experimental", "family",
    "fantasy", "horror", "music videos", "narrative film", "romance", "science fiction",
    "short"
    ],
    journalism: [
      "audio", "photo", "video", "print", "web"
    ],
    music: [
      "blues", "chiptune", "classical music", "comedy", "country & folk", "electronic music",
    "faith", "hip-hop", "indie rock", "jazz", "kids", "latin", "metal", "pop", "punk",
    "r&b", "rock", "world music"
    ],
    photography: [
      "animals", "fine art", "nature", "people", "places"
    ],
    technology: [
      "3d printing", "apps", "diy electronics", "fabrication tools",
    "gadgets", "hardware", "robots", "software", "game design", "sound", "web"
    ],
    theater: [
      "comedy", "experimental", "immersive", "musical", "plays",
    "set design", "dance"
    ]
  }

  belongs_to :user
  alias_attribute :owner, :user
  has_many :roles
  validates :title, presence: true
  validates :category, presence: true
  validates :subcategory, presence: true
  validates :short_description, presence: true
  mount_uploader :picture, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

# check validations

  class << self
    # Project.categories
    def categories
      CATEGORIES.keys
    end
    def cat_hash
      CATEGORIES
    end
  end

end
