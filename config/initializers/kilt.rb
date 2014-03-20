

Kilt::Database.class_eval do

  def find(slug)
    thing = Thing.where(slug: slug).first
    return nil unless thing
    thing.data
  end

  def find_all_by_type type
    things = Thing.where(object_type: "#{type.singularize.to_s}")
    things.map { |x| x.data }
  end

  def create(object)
    #result = Utils.db { objects_table.insert(object.values).run }
    #result['errors'] == 0
    thing = Thing.create(unique_id:   object['id'],
                         slug:        object['slug'],
                         object_type: object['type'],
                         data:        object.values)
    true
  end

  def update(object)
    thing = Thing.where(unique_id: object['id']).first
    return false unless thing
    thing.slug = object['slug']
    thing.data = object.values
    thing.save
  end

  def delete(slug)
    thing = Thing.where(slug: slug).first
    thing.delete if thing
    true
  end

end

RailsConfig.setup do |config|
  config.const_name = "Settings"
end

# Pull in the database configs
Settings.add_source!("#{Rails.root}/config/kilt/config.yml")
Settings.add_source!("#{Rails.root}/config/kilt/creds.yml")
Settings.reload!

# Attach the Kilt config the content pulled in by RailsConfig
Kilt.config = Settings

# Ensure we have a database set up
Kilt::Utils.setup_db
