
#' AIC
#'
#' Akaike information criterion of a moveHMM model.
#'
#' @method AIC moveHMM
#'
#' @param object A \code{moveHMM} object.
#' @param ... Optional additional \code{moveHMM} objects, to compare AICs of the different models.
#' @param k Penalty per parameter. Default: 2; for classical AIC.
#'
#' @return The AIC of the model(s) provided. If several models are provided, the AICs are output
#' in ascending order.
#'
#' @examples
#' # m is a moveHMM object (as returned by fitHMM), automatically loaded with the package
#' m <- example$m
#' AIC(m)
#'
#' @export

AIC.moveHMM <- function(object,...,k=2)
{
    models <- list(...)

    if(length(models)>0) { # if several models are provided
        modNames <- all.vars(match.call()) # store the names of the models given as arguments

        # include "object" in "models"
        modcopy <- list()
        modcopy[[1]] <- object
        for(i in 1:length(models))
            modcopy[[i+1]] <- models[[i]]
        models <- modcopy

        # compute AICs of models
        AIC <- rep(NA,length(models))

        for(i in 1:length(models)) {
            m <- models[[i]]
            
            # do not count delta if stationary
            if(m$conditions$stationary)
                nbPar <- length(m$mle$stepPar)+length(m$mle$anglePar)+length(m$mle$beta)
            else
                nbPar <- length(m$mle$stepPar)+length(m$mle$anglePar)+length(m$mle$beta)+length(m$mle$delta)-1
            
            maxLogLike <- -m$mod$minimum
            AIC[i] <- -2*maxLogLike+k*nbPar
        }

        ord <- order(AIC) # order models by increasing AIC
        return(data.frame(Model=modNames[ord],AIC=AIC[ord]))
    }
    else { # if only one model is provided
        m <- object
        
        # do not count delta if stationary
        if(m$conditions$stationary)
            nbPar <- length(m$mle$stepPar)+length(m$mle$anglePar)+length(m$mle$beta)
        else
            nbPar <- length(m$mle$stepPar)+length(m$mle$anglePar)+length(m$mle$beta)+length(m$mle$delta)-1
        
        maxLogLike <- -m$mod$minimum
        AIC <- -2*maxLogLike+k*nbPar

        return(AIC)
    }
}
