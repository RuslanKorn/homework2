module ApplicationHelper
	def sortable(col, title)
    title = title.titleize
		link_to_if(session[:sort_by] != col && session[:sort_by] != "#{col} DESC", title,  movies_path(sort_by: col) ) do 
          link_to_if(session[:sort_by] == "#{col} DESC", "#{title} &dArr;".html_safe,  movies_path(sort_by: col) ) do
            link_to_if(session[:sort_by] == col, "#{title} &uArr;".html_safe,  movies_path(sort_by: "#{col} DESC") )
          end
        end 
    end
end
