package com.acquirerhost.proxy;

import com.acquirerhost.model.AuthorisationInPCRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

public class RestProcessing {
    public static final String authorizeTransactionURLTemp =  "http://10.168.1.240:8080/datasnap/rest/TServerMethods1/ReverseString/";
    public static final String authorizeTransactionURL =  "http://localhost:9000/rest/example/";

    public ResponseEntity<AuthorisationInPCRequest> authorizeTransactionInPC(String object) {
        RestTemplate restTemplate = new RestTemplate();
        List<HttpMessageConverter<?>> messageConverters = new ArrayList<>();
        messageConverters.add(new MappingJackson2HttpMessageConverter());
        restTemplate.setMessageConverters(messageConverters);
        return restTemplate.postForEntity(authorizeTransactionURL, new AuthorisationInPCRequest(1, object), AuthorisationInPCRequest.class);
    }
}