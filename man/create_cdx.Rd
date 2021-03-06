% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_cdx.r
\name{create_cdx}
\alias{create_cdx}
\title{Create a CDX from a WARC file}
\usage{
create_cdx(warc_path, warc_record_types = "response",
  field_spec = "abmsrVgu", cdx_path)
}
\arguments{
\item{warc_path}{path to the WARC file to index}

\item{warc_record_types}{the WARC record types to index in \code{cdx_file}. Should be a
character vector of field names or "\code{all}" to index all records. NOTE: Most CDX
files index WARC \code{response} records.}

\item{field_spec}{(See \code{Description})}

\item{cdx_path}{where to output the CDX file}
}
\description{
Takes as input an optionally compressed WARC file and creates a CDX file
of \code{warc_record_types} with the specified fields (if available) and
writes it to \code{cdx_path}. If the WARC file is compressed the CDX/WARC
specification expects each WARC record to be in it's own "gzstream" (i.e you
can't just \code{gzip} a plaintext WARC file and expect any CDX indexer
to work.)
}
\details{
Use an atomic character vector of single character CDX field specifications
in the order you want them in the CDX file. The default value
"\code{abmsrVgu}" is taken from the defaults used by \code{wget} in
"WARC mode" and will output the:

\itemize{
\item{original url}
\item{date}
\item{mime type of original document}
\item{response code}
\item{redirect}
\item{compressed arc file offset}
\item{file name}
\item{URN (warc record id)}
}

in that order.
}
\note{
Only "\code{response}" is the currently supported value for
  \code{warc_record_types} and it only indexes gz WARC files...hey, it's alpha s/w.
}
\references{
\url{https://iipc.github.io/warc-specifications/specifications/cdx-format/cdx-2015/}
}

