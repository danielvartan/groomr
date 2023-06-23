list_files <- function(dir = utils::choose.dir()){
  list.files(dir, full.names = TRUE)[!(
    list.files(dir, full.names = TRUE) %in% list.dirs(dir, full.names = TRUE)
  )]
}
