# Mime::Type.register "application/xls", :xls

# @posts = Post.all

# #
# # default are export header and all fileds
# #

# @posts.to_xls
# @posts.to_xls(:only => [:title, :body])
# @posts.to_xls(:except => [:id])
# @posts.to_xls(:header => false)

# # Will prepend above header
# # | Col 0, Row 0 | Col 1, Row 0 |
# # | Col 0, Row 1 |              |
# @posts.to_xls(:prepend => [["Col 0, Row 0", "Col 1, Row 0"], ["Col 0, Row 1"]])

# # Translation of a column-value
# @posts.to_xls{|column, value, row_index| column==:salutation ? t(value) + " at #{row_index}" : value}

# # Added width options
# @posts.to_xls(:column_width => [17,15,15,40,25,37])
