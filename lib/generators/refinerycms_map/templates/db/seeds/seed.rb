User.find(:all).each do |user|
  user.plugins.create(:name => "refinerycms_map",
                      :position => (user.plugins.maximum(:position) || -1) +1)
end

page = Page.create(
  :title => "Map",
  :link_url => "/map",
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => "^/map.*$"
)

Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end
