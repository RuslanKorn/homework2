module ApplicationHelper
	def sortable(col, title)
    title = title.titleize
		link_to_if(session[:sort_by] != col && session[:sort_by] != "#{col} DESC", title,  movies_path(sort_by: col) ) do 
          link_to_if(session[:sort_by] == "#{col} DESC", "#{title} &dArr;".html_safe,  movies_path(sort_by: col) ) do
            link_to_if(session[:sort_by] == col, "#{title} &uArr;".html_safe,  movies_path(sort_by: "#{col} DESC") )
          end
        end 
    end

  def have_changes
    @movie = Movie.find(params[:id])
    @twin_move = Movie.all.where('twin_id = ?', @movie.twin_id)
    @twin_move.order(:created_at).last.id == @movie.id && @twin_move.many?
  end

  def link_to_change
    Movie.all.where('twin_id = ?', @movie.twin_id).order(:created_at).first
  end
end
