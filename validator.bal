import wso2healthcare/healthcare.fhir.r4;
import ballerina/http;

# This method will validate the FHIR resource
#
# + data - JSON FHIR resource
# + return - Return validation error, if the validation failed
public isolated function validator(json data) returns http:Response|error {

    r4:FHIRValidationError? result = r4:validateFHIRResourceJson(data);

    http:Response response = new ();

    if result is r4:FHIRValidationError {

        string message = result.message();
        string? detail = result.detail().issues[0].diagnostic;

        response.statusCode = 400;
        response.setJsonPayload({"message": message, "details": detail});

    } else {
        response.setJsonPayload({"message": "Validation success"});
    }

    return response;

}
