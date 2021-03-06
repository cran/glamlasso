// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <RcppArmadillo.h>
#include <Rcpp.h>

using namespace Rcpp;

// gdpg
Rcpp::List gdpg(arma::mat Phi1, arma::mat Phi2, arma::mat Phi3, arma::mat Psi, arma::mat Psirot, arma::mat Y, arma::mat Yrot, arma::mat V, arma::mat Weights, arma::mat Weightsrot, arma::mat Betainit, arma::mat Beta12init, arma::mat Beta3init, arma::vec alphainit, std::string family, std::string penalty, int nonten, std::string iwls, double nu, arma::vec lambda, int makelamb, int nlambda, double lambdaminratio, arma::mat penaltyfactor, arma::mat penaltyfactor12, arma::mat penaltyfactor3, arma::mat penaltyfactoralpha, double reltolprox, double reltolnewt, double reltolalt, int maxiter, int steps, int maxiterprox, int maxiternewt, int maxalt, int btproxmax, int btnewtmax, int weightedgaussian, int S, int RR, int n1, int n2, int n3);
RcppExport SEXP _glamlasso_gdpg(SEXP Phi1SEXP, SEXP Phi2SEXP, SEXP Phi3SEXP, SEXP PsiSEXP, SEXP PsirotSEXP, SEXP YSEXP, SEXP YrotSEXP, SEXP VSEXP, SEXP WeightsSEXP, SEXP WeightsrotSEXP, SEXP BetainitSEXP, SEXP Beta12initSEXP, SEXP Beta3initSEXP, SEXP alphainitSEXP, SEXP familySEXP, SEXP penaltySEXP, SEXP nontenSEXP, SEXP iwlsSEXP, SEXP nuSEXP, SEXP lambdaSEXP, SEXP makelambSEXP, SEXP nlambdaSEXP, SEXP lambdaminratioSEXP, SEXP penaltyfactorSEXP, SEXP penaltyfactor12SEXP, SEXP penaltyfactor3SEXP, SEXP penaltyfactoralphaSEXP, SEXP reltolproxSEXP, SEXP reltolnewtSEXP, SEXP reltolaltSEXP, SEXP maxiterSEXP, SEXP stepsSEXP, SEXP maxiterproxSEXP, SEXP maxiternewtSEXP, SEXP maxaltSEXP, SEXP btproxmaxSEXP, SEXP btnewtmaxSEXP, SEXP weightedgaussianSEXP, SEXP SSEXP, SEXP RRSEXP, SEXP n1SEXP, SEXP n2SEXP, SEXP n3SEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type Phi1(Phi1SEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Phi2(Phi2SEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Phi3(Phi3SEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Psi(PsiSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Psirot(PsirotSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Y(YSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Yrot(YrotSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type V(VSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Weights(WeightsSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Weightsrot(WeightsrotSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Betainit(BetainitSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Beta12init(Beta12initSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Beta3init(Beta3initSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type alphainit(alphainitSEXP);
    Rcpp::traits::input_parameter< std::string >::type family(familySEXP);
    Rcpp::traits::input_parameter< std::string >::type penalty(penaltySEXP);
    Rcpp::traits::input_parameter< int >::type nonten(nontenSEXP);
    Rcpp::traits::input_parameter< std::string >::type iwls(iwlsSEXP);
    Rcpp::traits::input_parameter< double >::type nu(nuSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type lambda(lambdaSEXP);
    Rcpp::traits::input_parameter< int >::type makelamb(makelambSEXP);
    Rcpp::traits::input_parameter< int >::type nlambda(nlambdaSEXP);
    Rcpp::traits::input_parameter< double >::type lambdaminratio(lambdaminratioSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type penaltyfactor(penaltyfactorSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type penaltyfactor12(penaltyfactor12SEXP);
    Rcpp::traits::input_parameter< arma::mat >::type penaltyfactor3(penaltyfactor3SEXP);
    Rcpp::traits::input_parameter< arma::mat >::type penaltyfactoralpha(penaltyfactoralphaSEXP);
    Rcpp::traits::input_parameter< double >::type reltolprox(reltolproxSEXP);
    Rcpp::traits::input_parameter< double >::type reltolnewt(reltolnewtSEXP);
    Rcpp::traits::input_parameter< double >::type reltolalt(reltolaltSEXP);
    Rcpp::traits::input_parameter< int >::type maxiter(maxiterSEXP);
    Rcpp::traits::input_parameter< int >::type steps(stepsSEXP);
    Rcpp::traits::input_parameter< int >::type maxiterprox(maxiterproxSEXP);
    Rcpp::traits::input_parameter< int >::type maxiternewt(maxiternewtSEXP);
    Rcpp::traits::input_parameter< int >::type maxalt(maxaltSEXP);
    Rcpp::traits::input_parameter< int >::type btproxmax(btproxmaxSEXP);
    Rcpp::traits::input_parameter< int >::type btnewtmax(btnewtmaxSEXP);
    Rcpp::traits::input_parameter< int >::type weightedgaussian(weightedgaussianSEXP);
    Rcpp::traits::input_parameter< int >::type S(SSEXP);
    Rcpp::traits::input_parameter< int >::type RR(RRSEXP);
    Rcpp::traits::input_parameter< int >::type n1(n1SEXP);
    Rcpp::traits::input_parameter< int >::type n2(n2SEXP);
    Rcpp::traits::input_parameter< int >::type n3(n3SEXP);
    rcpp_result_gen = Rcpp::wrap(gdpg(Phi1, Phi2, Phi3, Psi, Psirot, Y, Yrot, V, Weights, Weightsrot, Betainit, Beta12init, Beta3init, alphainit, family, penalty, nonten, iwls, nu, lambda, makelamb, nlambda, lambdaminratio, penaltyfactor, penaltyfactor12, penaltyfactor3, penaltyfactoralpha, reltolprox, reltolnewt, reltolalt, maxiter, steps, maxiterprox, maxiternewt, maxalt, btproxmax, btnewtmax, weightedgaussian, S, RR, n1, n2, n3));
    return rcpp_result_gen;
END_RCPP
}
// getobj
Rcpp::List getobj(arma::mat Y, arma::mat Weights, arma::mat Phi1, arma::mat Phi2, arma::mat Phi3, Rcpp::NumericVector beta, arma::vec lambda, arma::mat penaltyfactor, std::string family, std::string penalty);
RcppExport SEXP _glamlasso_getobj(SEXP YSEXP, SEXP WeightsSEXP, SEXP Phi1SEXP, SEXP Phi2SEXP, SEXP Phi3SEXP, SEXP betaSEXP, SEXP lambdaSEXP, SEXP penaltyfactorSEXP, SEXP familySEXP, SEXP penaltySEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< arma::mat >::type Y(YSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Weights(WeightsSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Phi1(Phi1SEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Phi2(Phi2SEXP);
    Rcpp::traits::input_parameter< arma::mat >::type Phi3(Phi3SEXP);
    Rcpp::traits::input_parameter< Rcpp::NumericVector >::type beta(betaSEXP);
    Rcpp::traits::input_parameter< arma::vec >::type lambda(lambdaSEXP);
    Rcpp::traits::input_parameter< arma::mat >::type penaltyfactor(penaltyfactorSEXP);
    Rcpp::traits::input_parameter< std::string >::type family(familySEXP);
    Rcpp::traits::input_parameter< std::string >::type penalty(penaltySEXP);
    rcpp_result_gen = Rcpp::wrap(getobj(Y, Weights, Phi1, Phi2, Phi3, beta, lambda, penaltyfactor, family, penalty));
    return rcpp_result_gen;
END_RCPP
}
