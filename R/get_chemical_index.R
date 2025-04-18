#-----------------------------------------------------------------------------------
#' @title get_chemical_index
#' @param input_toxval_file Filepath to input ToxVal file with DTXSID values.
#' @param input_qsar_file Filepath to input QSAR Ready Smiles file with DTXSID values.
#' @export 
#' @return Combined chemical index dataframe. A CSV file is also written to the input subfolder.
#' @description Generate a chemical index based on ToxVal DTXSID list and QSAR Ready Smiles.
#' @details DETAILS
#' @examples 
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso 
#'  \code{\link[readr]{read_delim}}, \code{\link[readr]{cols}}, \code{\link[readr]{write_delim}}
#'  \code{\link[dplyr]{select}}, \code{\link[dplyr]{mutate-joins}}, \code{\link[dplyr]{distinct}}, \code{\link[dplyr]{c("rowwise", "rowwise")}}, \code{\link[dplyr]{mutate}}, \code{\link[dplyr]{group_by}}
#'  \code{\link[purrr]{map}}
#'  \code{\link[digest]{digest}}
#' @rdname index_generation_script
#' @importFrom readr read_csv cols write_csv
#' @importFrom dplyr select left_join distinct rowwise mutate ungroup
#' @importFrom purrr map_chr
#' @importFrom digest digest
#-----------------------------------------------------------------------------------
get_chemcial_index <- function(input_toxval_file, input_qsar_file){
  dir = "data/"

  if(is.null(input_toxval_file) || input_toxval_file %in% c(NA, "NA", "")) stop("input_toxval_file must be a file path string...")
  if(!file.exists(input_toxval_file)) stop("input_toxval_file '", input_toxval_file, "' does not exist...")

  if(is.null(input_qsar_file) || input_qsar_file %in% c(NA, "NA", "")) stop("input_qsar_file must be a file path string...")
  if(!file.exists(input_qsar_file)) stop("input_qsar_file '", input_qsar_file, "' does not exist...")

  # This is a spreadsheet with all QSAR-ready structures from the 05/23 DSSTox snapshot.
  qsar_ready <- readr::read_csv(input_qsar_file,
                                col_types = readr::cols()) %>%
    dplyr::select(Original_DTXSID, QSAR_READY_SMILES=Canonical_QSARr)

  # Read in ToxVal input file
  in_toxval <- readr::read_csv(input_toxval_file,
                               col_types = readr::cols()) %>%
    # Combine with input QSAR Ready input file by DTXSID
    dplyr::left_join(qsar_ready,
                     by=c("DTXSID"="Original_DTXSID")) %>%
    # This creates the grouping index
    dplyr::select(DTXSID, QSAR_READY_SMILES) %>%
    dplyr::distinct() %>%
    dplyr::rowwise() %>%
    # Generate unique index hash
    dplyr::mutate(DCAP_INDEX = paste0("DCAP_INDEX_", purrr::map_chr(QSAR_READY_SMILES, digest::digest, algo = 'crc32'))) %>%
    dplyr::ungroup()
  #Write the DTXSID grouping file
  readr::write_csv(in_toxval, paste0(dir, "input/ToxVal_DTXSIDs_Grouped.csv"), na = "")
  # Return index dataframe
  return(in_toxval)
}
