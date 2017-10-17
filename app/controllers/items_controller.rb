class ItemsController < ApplicationController
  def sync_repo
    repo = Settings.repositories[params[:id].to_i]

    files = `find #{repo} -name "*.mp3" -o -name "*.m4a" -o -name "*.ogg"`
    files = files.split("\n")

    files.each do |file|
      file_name = file.split('/')[-1]

      unless Item.find_by_name(file_name)
        Item.create(name: file_name, path: file)
      end
    end

    flash[:info] = 'Repository sync successful.'
    redirect_to audios_path
  end

  def stream
    audio = Item.find(params[:id])
    if audio
      send_file audio.path
    end
  end

	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
    @audio = @item.audio
	end

end
