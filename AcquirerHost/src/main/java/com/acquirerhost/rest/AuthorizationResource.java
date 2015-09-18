package com.acquirerhost.rest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AuthorizationResource {
    @ResponseBody
    @RequestMapping("authorizeTransaction")
    public String authorizeTransaction(@RequestParam("transactionToken") String transactionToken) {
        return transactionToken;
    }
}
