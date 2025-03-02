% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Reintegrate.R, R/Reintegrate_Utils.R
\name{reintegrate}
\alias{reintegrate}
\alias{validate_direction}
\alias{check_epoch}
\alias{reintegrate_setup}
\title{Reintegrate a data stream}
\usage{
reintegrate(
  ag,
  to,
  time_var = "Timestamp",
  direction = c("forwards", "backwards"),
  verbose = FALSE
)

## Related internal functions:

#  validate_direction(direction)

#  check_epoch(ag, to, time_var, verbose)

#  reintegrate_setup(ag, to, time_var = "Timestamp",
#    direction = c("forwards", "backwards"), verbose = FALSE)
}
\arguments{
\item{ag}{a data frame to reintegrate}

\item{to}{the desired epoch length of the output. Starting epoch length will
be determined automatically (while also verifying the data are continuous).}

\item{time_var}{The name of the column containing POSIX-formatted timestamp
information}

\item{direction}{The direction of reintegration, i.e. whether a timestamp
refers to the timespan after the previous data point ("backwards"), or
before the next data point ("forwards").}

\item{verbose}{logical. Print updates to console?}
}
\description{
Reintegrate a data stream
}
\examples{

test_file <- system.file(
  "extdata", "example1sec.csv", package = "AGread"
)

ag <- read_AG_counts(test_file, skip = 11)

# Forwards reintegration
  reintegrate(
    ag = ag,
    to = 60,
    time_var = "Timestamp",
    direction = c("forwards")
  )

# Backwards reintegration
  reintegrate(
    ag = ag,
    to = 60,
    time_var = "Timestamp",
    direction = c("backwards")
  )
\dontrun{
# Erronious usages that will give a warning
  reintegrate(
    ag = ag,
    to = 60,
    time_var = "Timestamp",
    direction = c("forwards", "backwards")
  )

  reintegrate(
    ag = ag,
    to = 60,
    time_var = "Timestamp"
  )
}

}
\keyword{internal}
