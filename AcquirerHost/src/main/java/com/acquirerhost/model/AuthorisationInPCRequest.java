package com.acquirerhost.model;

public class AuthorisationInPCRequest {
    private int ref;
    private String body;

    public AuthorisationInPCRequest() {
    }

    public AuthorisationInPCRequest(int ref, String body) {
        this.ref = ref;
        this.body = body;
    }

    public int getRef() {
        return ref;
    }

    public String getBody() {
        return body;
    }

    public void setRef(int ref) {
        this.ref = ref;
    }

    public void setBody(String body) {
        this.body = body;
    }
}
