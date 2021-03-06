% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/glamlassoRR.R
\name{glamlassoRR}
\alias{glamlassoRR}
\title{Penalized reduced rank regression  in a GLAM}
\usage{
glamlassoRR(X, 
            Y, 
            Z = NULL,
            family = "gaussian",
            penalty = "lasso",
            intercept = FALSE,
            weights = NULL,
            thetainit = NULL,
            alphainit = NULL,
            nlambda = 100,
            lambdaminratio = 1e-04,
            lambda = NULL,
            penaltyfactor = NULL,
            penaltyfactoralpha = NULL,
            reltolinner = 1e-07,
            reltolouter = 1e-04,
            reltolalt = 1e-04,
            maxiter = 15000,
            steps = 1,
            maxiterinner = 3000,
            maxiterouter = 25,
            maxalt = 10,
            btinnermax = 100,
            btoutermax  = 100,
            iwls = "exact",
            nu = 1)
}
\arguments{
\item{X}{A list containing the 3 tensor components of the tensor design matrix. These are  matrices of sizes \eqn{n_i   \times p_i}.}

\item{Y}{The response values, an array of size \eqn{n_1 \times n_2\times n_3}. For option 
\code{family = "binomial"} this array must contain the proportion of successes and the 
number of trials is then specified as \code{weights} (see below).}

\item{Z}{The non tensor structrured part of the design matrix. A matrix of size \eqn{n_1 n_2 n_3\times q}. 
Is set to \code{NULL} as default.}

\item{family}{A string specifying the model family (essentially the response distribution). Possible values 
are \code{"gaussian", "binomial", "poisson", "gamma"}.}

\item{penalty}{A string specifying the penalty. Possible values are \code{"lasso", "scad"}.}

\item{intercept}{Logical variable indicating if the model includes an intercept.  When \code{intercept = TRUE} the first 
coulmn in the non-tensor design component \code{Z} is all 1s. Default is \code{FALSE}.}

\item{weights}{Observation weights, an array of size \eqn{n_1 \times \cdots \times n_d}. For option 
\code{family = "binomial"} this array must contain the number of trials and must be provided.}

\item{thetainit}{A list (length 2) containing the initial parameter values for each of the parameter factors. 
Default is NULL in which case all parameters are initialized at 0.01.}

\item{alphainit}{A \eqn{q\times 1} vector containing the initial parameter values for the non-tensor parameter. 
Default is NULL in which case all parameters are initialized at 0.}

\item{nlambda}{The number of \code{lambda} values.}

\item{lambdaminratio}{The smallest value for \code{lambda}, given as a fraction of 
\eqn{\lambda_{max}}; the (data derived) smallest value for which all coefficients are zero.}

\item{lambda}{The sequence of penalty parameters for the regularization path.}

\item{penaltyfactor}{A list of length two containing an array of size \eqn{p_1 \times  p_2} and a \eqn{p_3 \times  1} vector.
Multiplied  with each element in \code{lambda} to allow differential shrinkage on the (tensor) coefficients blocks.}

\item{penaltyfactoralpha}{A \eqn{q \times 1} vector multiplied with each element in \code{lambda} to allow differential shrinkage on the non-tensor coefficients.}

\item{reltolinner}{The convergence tolerance for the inner loop}

\item{reltolouter}{The convergence tolerance for the outer loop.}

\item{reltolalt}{The convergence tolerance for the alternation loop over the two parameter blocks.}

\item{maxiter}{The maximum number of inner iterations allowed for each \code{lambda}
value, when  summing over all outer iterations for said \code{lambda}.}

\item{steps}{The number of steps used in the multi-step adaptive lasso algorithm for non-convex penalties. Automatically set to 1 when \code{penalty = "lasso"}.}

\item{maxiterinner}{The maximum number of inner iterations allowed for each outer iteration.}

\item{maxiterouter}{The maximum number of outer iterations allowed for each lambda.}

\item{maxalt}{The maximum number of  alternations over parameter blocks.}

\item{btinnermax}{Maximum number of backtracking steps allowed in each inner iteration. Default is \code{btinnermax = 100}.}

\item{btoutermax}{Maximum number of backtracking steps allowed in each outer iteration. Default is \code{btoutermax = 100}.}

\item{iwls}{A string indicating whether to use the exact iwls weight matrix or use a tensor structured approximation to it.}

\item{nu}{A number between 0 and 1 that controls the step size \eqn{\delta} in the proximal algorithm (inner loop) by 
scaling the upper bound \eqn{\hat{L}_h} on the Lipschitz constant \eqn{L_h} (see \cite{Lund et al., 2017}). 
For \code{nu = 1} backtracking never occurs and the proximal step size is always \eqn{\delta = 1 / \hat{L}_h}. 
For \code{nu = 0} backtracking always occurs and the proximal step size is initially \eqn{\delta = 1}. 
For \code{0 < nu < 1} the proximal step size is initially \eqn{\delta = 1/(\nu\hat{L}_h)} and backtracking 
is only employed if the objective function does not decrease. A \code{nu} close  to 0 gives large step 
sizes and presumably more backtracking in the inner loop. The default is \code{nu = 1} and the option is only 
used if \code{iwls = "exact"}.}
}
\description{
Efficient design matrix free procedure for fitting large scale penalized reduced rank
 regressions in a 3-dimensional generalized linear array model. To obtain a factorization of the parameter array, 
 the \code{glamlassoRR} function performes a block relaxation scheme within the gdpg algorithm, see \cite{Lund et al., 2017}.
}
\details{
Given the setting from \code{\link{glamlasso}} we  place a reduced rank
 restriction on the \eqn{p_1\times p_2\times p _3} parameter array \eqn{\Theta} given by
\deqn{\Theta=(\Theta_{i,j,k})_{i,j,k} = (\gamma_{k}\beta_{i,j})_{i,j,k}, \ \ \ \gamma_k,\beta_{i,j}\in \mathcal{R}.}  
 The  \code{glamlassoRR} function  solves the PMLE problem by combining a block relaxation scheme with the gdpg algorithm. This scheme alternates between  optimizing over the first 
parameter block \eqn{\beta=(\beta_{i,j})_{i,j}} and  the second block \eqn{\gamma=(\gamma_k)_k} while fixing the second resp. first block. We note that the 
individual parameter blocks are only identified up to a multiplicative constant.
}
\examples{
\dontrun{
##size of example 
n1 <- 65; n2 <- 26; n3 <- 13; p1 <- 12; p2 <- 6; p3 <- 4

##marginal design matrices (tensor components)
X1 <- matrix(rnorm(n1 * p1), n1, p1) 
X2 <- matrix(rnorm(n2 * p2), n2, p2) 
X3 <- matrix(rnorm(n3 * p3), n3, p3) 
X <- list(X1, X2, X3)
Beta12 <- matrix(rnorm(p1 * p2), p1, p2) * matrix(rbinom(p1 * p2, 1, 0.5), p1, p2)
Beta3 <- matrix(rnorm(p3) * rbinom(p3, 1, 0.5), p3, 1)
Beta <- outer(Beta12, c(Beta3))
Mu <- RH(X3, RH(X2, RH(X1, Beta)))
Y <- array(rnorm(n, Mu), dim = c(n1, n2, n3))  

system.time(fit <- glamlassoRR(X, Y))

modelno  <- length(fit$lambda)
par(mfrow = c(1, 3))
plot(c(Beta), type = "h")
points(c(Beta))
lines(c(outer(fit$coef12[, modelno], c(fit$coef3[, modelno]))), col = "red", type = "h")
plot(c(Beta12), ylim = range(Beta12, fit$coef12[, modelno]), type = "h")
points(c(Beta12))
lines(fit$coef12[, modelno], col = "red", type = "h")
plot(c(Beta3), ylim = range(Beta3, fit$coef3[, modelno]), type = "h")
points(c(Beta3))
lines(fit$coef3[, modelno], col = "red", type = "h")

###with non tensor design component Z
q <- 5
alpha <- matrix(rnorm(q)) * rbinom(q, 1, 0.5)
Z <- matrix(rnorm(n1 * n2 * n3 * q), n1 * n2 * n3, q) 
Y <- array(rnorm(n1 * n2 * n3, Mu + array(Z \%*\% alpha, c(n1, n2, n3))), c(n1, n2, n3))
system.time(fit <- glamlassoRR(X, Y, Z))

modelno <- length(fit$lambda)
par(mfrow = c(2, 2))
plot(c(Beta), type = "h")
points(c(Beta))
lines(c(outer(fit$coef12[, modelno], c(fit$coef3[, modelno]))), col = "red", type = "h")
plot(c(Beta12), ylim = range(Beta12,fit$coef12[, modelno]), type = "h")
points(c(Beta12))
lines(fit$coef12[, modelno], col = "red", type = "h")
plot(c(Beta3), ylim = range(Beta3, fit$coef3[, modelno]), type = "h")
points(c(Beta3))
lines(fit$coef3[, modelno], col = "red", type = "h")
plot(c(alpha), ylim = range(alpha, fit$alpha[, modelno]), type = "h")
points(c(alpha))
lines(fit$alpha[, modelno], col = "red", type = "h")

################ poisson example
Beta12 <- matrix(rnorm(p1 * p2, 0, 0.5), p1, p2) * matrix(rbinom(p1 * p2, 1, 0.1), p1, p2)
Beta3 <-  matrix(rnorm(p3, 0, 0.5) * rbinom(p3, 1, 0.5), p3, 1)
Beta <- outer(Beta12, c(Beta3))
Mu <- RH(X3, RH(X2, RH(X1, Beta)))
Y <- array(rpois(n1 * n2 * n3, exp(Mu)), dim = c(n1, n2, n3))
system.time(fit <- glamlassoRR(X, Y, family = "poisson"))

modelno <- length(fit$lambda)
par(mfrow = c(1, 3))
plot(c(Beta), type = "h")
points(c(Beta))
lines(c(outer(fit$coef12[, modelno], c(fit$coef3[, modelno]))), col = "red", type = "h")
plot(c(Beta12), ylim = range(Beta12, fit$coef12[, modelno]), type = "h")
points(c(Beta12))
lines(fit$coef12[, modelno], col = "red", type = "h")
plot(c(Beta3), ylim = range(Beta3, fit$coef3[, modelno]), type = "h")
points(c(Beta3))
lines(fit$coef3[, modelno], col = "red", type = "h")

}
}
\references{
Lund, A. and N. R. Hansen (2017). Sparse Network  Estimation for  Dynamical Spatio-temporal Array Models. 
 \emph{ArXiv}.
}
\author{
Adam Lund

Maintainer: Adam Lund, \email{adam.lund@math.ku.dk}
}
