import ballerina/http;

// import wso2healthcare/healthcare.fhir.r4;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # This will validate the FHIR resource at runtime
    #
    # + data - JSON FHIR resource
    # + return - Return validation error, if the validation failed
    resource isolated function post validate(@http:Payload json data) returns http:Response|error {
        return validator(data);
    }

}
