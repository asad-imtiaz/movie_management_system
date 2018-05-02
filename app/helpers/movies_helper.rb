module MoviesHelper

  def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      video_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      video_id = $5
    end

    %Q{<iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/#{ video_id }" frameborder="0" allowfullscreen></iframe>}
  end

end
