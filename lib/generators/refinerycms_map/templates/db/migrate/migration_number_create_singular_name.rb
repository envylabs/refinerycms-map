class Create<%= table_name.camelize %> < ActiveRecord::Migration

  def self.up
    create_table :<%= table_name %> do |t|
<% attributes.each do |attribute| -%>
      t.<%= attribute.type %> :<%= attribute.name %>
<% end -%>
      t.decimal :lat, :precision => 9, :scale => 6, :default => 0.0
      t.decimal :lng, :precision => 9, :scale => 6, :default => 0.0
      t.timestamps
    end

    add_index :<%= table_name %>, :id
    load(Rails.root.join('db', 'seeds', 'refinerycms_map.rb').to_s)
  end

  def self.down
    UserPlugin.destroy_all({:name => "refinerycms_map"})

    Page.delete_all({:link_url => "/map"})

    drop_table :<%= table_name %>
  end

end
