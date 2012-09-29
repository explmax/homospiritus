desc "Import images into the blog"

def asset_image_file(image_path)
  File.open(File.join(Rails.root, "/app/assets/images/", image_path))
end

namespace :data do
  task :import_images => :environment do
    puts 'Importing images...'

    names = Dir.entries("lib/tasks/image_names").collect do |name|
      name.gsub('.jpg', '')
    end

    names.delete('.')
    names.delete('..')

    slug = 'plakaty-sieminarov'
    image_category = ActiveadminBlog::BlogCategory.where(slug: slug).first()

    names.each_with_index do |name, index|
      puts name
      index = index + 1
      index = '0' + index.to_s if index < 10
      image_post = ActiveadminBlog::BlogPost.create!(
        title: name,
        content: '',
        categories: [image_category],
        published: true,
        tags: 'image',
        featured_image: asset_image_file("posters/#{index}.jpg")
        )
    end
  end
end