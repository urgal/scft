package com.acquirerhost.model;

public class AuthorisationResponse {
    private int ref;
    private AuthorisationInPCRequest body;

    public AuthorisationResponse() {
    }

    public AuthorisationResponse(int ref, AuthorisationInPCRequest body) {
        this.ref = ref;
        this.body = body;
    }

    public int getRef() {
        return ref;
    }

    public AuthorisationInPCRequest getBody() {
        return body;
    }

    public void setRef(int ref) {
        this.ref = ref;
    }

    public void setBody(AuthorisationInPCRequest body) {
        this.body = body;
    }
}
