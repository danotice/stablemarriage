// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// find_stable_marriages
std::unordered_map<std::string, std::string> find_stable_marriages(List male_prefs, List female_prefs, std::string U);
RcppExport SEXP _stablemarriage_find_stable_marriages(SEXP male_prefsSEXP, SEXP female_prefsSEXP, SEXP USEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< List >::type male_prefs(male_prefsSEXP);
    Rcpp::traits::input_parameter< List >::type female_prefs(female_prefsSEXP);
    Rcpp::traits::input_parameter< std::string >::type U(USEXP);
    rcpp_result_gen = Rcpp::wrap(find_stable_marriages(male_prefs, female_prefs, U));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_stablemarriage_find_stable_marriages", (DL_FUNC) &_stablemarriage_find_stable_marriages, 3},
    {NULL, NULL, 0}
};

RcppExport void R_init_stablemarriage(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
