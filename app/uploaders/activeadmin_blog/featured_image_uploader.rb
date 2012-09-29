# encoding: utf-8
class ActiveadminBlog::FeaturedImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or ImageScience support:
  include CarrierWave::RMagick
  #include CarrierWave::MiniMagick
  # include CarrierWave::ImageScience

  # Instance
  def strip
    manipulate! do |img|
      img.strip
      img = yield(img) if block_given?
      img
    end
  end

  # process :quality => 85
  def quality(percentage)
    manipulate! do |img|
      img.quality(percentage)
      img = yield(img) if block_given?
      img
    end
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "system/blog/featured_images/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process :resize_to_fill => [118, 100]
  end


  version :preview do
    process :resize_to_fill => [320, 320]
  end

  version :full do
    process :resize_by_width => 720
  end


  def resize_up_to_width(width)
    manipulate! do |img|
      if img.columns.to_i > 1000
        img.resize_to_fit!(width, 0)
      end
      img
    end
  end

  def resize_by_width(width)
    manipulate! do |img|
      img.resize_to_fit!(width, 0)
    end
  end

  #version :content do
  #  process :resize_to_limit => [800, 800]
  #end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    ActiveadminSettings.image_file_types
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
