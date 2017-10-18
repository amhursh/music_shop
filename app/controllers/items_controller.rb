class ItemsController < ApplicationController
  def sync_repo
    repo = Settings.repositories[params[:id].to_i]

    files = `find #{repo} -name "*.mp3" -o -name "*.m4a" -o -name "*.ogg"`
    files = files.split("\n")

    files.each do |file|
      file_name = file.split('/')[-1]

      unless Item.find_by_title(file_name)
        Item.create(title: file_name, path: file, description: 'nil', price: 10, category: Category.first)

      end
    end

    flash[:info] = 'Repository sync successful.'
    redirect_to items_path
  end

  def stream
    audio = Audio.find(params[:id])
    if audio
      send_file audio.path
    end
    # item = Item.find(params[:id])
    # if item
    #   send_file item.audio.path
    # end
  end

	def index
		@items = Item.all
    @repositories = Settings.repositories ||= []
	end

	def show
		@item = Item.find(params[:id])
    @audio = @item.audio
	end

end
