#' The number of times a team chooses to start batting and fielding in all the IPL
#' matches they have played
#'
#' @param team_name a team for whom number batting versus fielding statistics have to be calculated
#'
#' @return `toss_choice` returns a tibble with 2 columns and 2 rows
#'
#' @examples
#' library(ipl)
#'
#' # The number of times Dehli Daredevils chooses to start batting and fielding
#' toss_choice("Delhi Daredevils")
#' @importFrom magrittr "%>%"
#' @import dplyr
#' @export
#'
toss_choice <- function(team_name) {
  if (!is.character(team_name)) {
    stop("Invalid input: team name input should be a character vector")
  } else if (!(team_name %in% ipl$team1) | !(team_name %in% ipl$team2)) {
    stop("Invalid team name")
  } else {
    toss_decision <- ipl %>%
      filter(
        toss_winner == team_name
      ) %>%
      group_by(toss_decision) %>%
      summarize(
        num = n()
      )
    return(toss_decision)
  }
}
