package com.acquirerhost.rest;

import com.acquirerhost.model.AuthorisationResponse;
import com.acquirerhost.proxy.RestProcessing;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

@RestController
public class AuthorizationResource {
    private Logger logger = LoggerFactory.getLogger("");

    @RequestMapping(value = "authorizeTransaction", method = RequestMethod.GET)
    public AuthorisationResponse authorizeTransactionXml(@RequestParam("transactionToken") String transactionToken) {
        RestProcessing restProcessing = new RestProcessing();
        return new AuthorisationResponse(1,  restProcessing.authorizeTransactionInPC(transactionToken).getBody());
    }

    @RequestMapping(value = "authorizeTransaction.json", method = RequestMethod.GET, produces = "application/json")
    public AuthorisationResponse authorizeTransactionJson(@RequestParam("transactionToken") String transactionToken) {
        RestProcessing restProcessing = new RestProcessing();
        return new AuthorisationResponse(1,  restProcessing.authorizeTransactionInPC(transactionToken).getBody());
    }

    @RequestMapping("whichKey")
    public String whichKey(@RequestParam("pancode") String pancode) {
        return "balapb";
    }
}
