codeunit 50100 "ARD Car API"
{
    // trigger OnRun();
    // begin
    //     GetCars();
    // end;

    procedure GetCars(VIN: Code[17]; var Make: Text[50]; var Model: Text[50]; var Year: Integer)
    var
        HttpClient: HttpClient;
        HttpResponse: HttpResponseMessage;
        Response: Text;
        JsonObject: JsonObject;
        JsonArray: JsonArray;
        JsonToken: JsonToken;
        JsonValue: JsonValue;
        ResultToken: JsonToken;
        ResultObject: JsonObject;
        FinalToken: JsonToken;
        // Endpoint: Text;
        URL: Text;
    // Make: Text;
    // Model: Text;

    // URL: Label 'https://vpic.nhtsa.dot.gov/api/vehicles/decodevinvalues/1GNDT13S472122572?format=json';
    begin
        // Endpoint := '1GNDT13S472122572';
        URL := 'https://vpic.nhtsa.dot.gov/api/vehicles/decodevinvalues/' + VIN + '?format=json';
        if HttpClient.Get(URL, HttpResponse) then begin
            if HttpResponse.IsSuccessStatusCode then begin
                HttpResponse.Content.ReadAs(Response);
                JsonObject.ReadFrom(Response);
                JsonObject.Get('Results', JsonToken);
                JsonArray := JsonToken.AsArray();
                JsonArray.Get(0, ResultToken);
                ResultObject := ResultToken.AsObject();
                ResultObject.Get('Make', FinalToken);
                Make := FinalToken.AsValue().asText();
                ResultObject.Get('Model', FinalToken);
                Model := FinalToken.AsValue().AsText();
                ResultObject.Get('ModelYear', FinalToken);
                Year := FinalToken.AsValue().AsInteger();
            end
            else
                Error('VIN information search was unsuccessful.');
        end;

        // procedure GetJsonTextField(JsonOb: JsonObject; KeyField: Text): Text
        // var
        //     Result: JsonToken;
        // begin
        //     if JsonOb.Get(KeyField, Result) then
        //         exit(Result.AsValue().AsText());
    end;
}