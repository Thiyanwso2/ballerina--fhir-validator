import wso2healthcare/healthcare.fhir.r4;

public function validator(json data) returns json|error {

    r4:FHIRValidationError? result = r4:validateFHIRResourceJson(data);

    if result is r4:FHIRValidationError {
        
        string message = result.message();
        string? detail = result.detail().issues[0].diagnostic;
        
        return {"message": message, "details": detail};
        
    } else {
        return {"message": "Validation success"};
    }

}
