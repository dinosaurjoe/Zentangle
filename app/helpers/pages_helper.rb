module PagesHelper
  def cutoff_text(string)
    string.length > 121 ? string.first(120) + "..." : string
  end
end
