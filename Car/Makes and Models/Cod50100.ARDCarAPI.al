codeunit 50100 "ARD Car API"
{
    local procedure GetRequest() ResponseText: Text
    var
        Client: HttpClient;
        IsSuccessful: Boolean;
        Response: HttpResponseMessage;
    // ResponseText: Text;
    begin
        IsSuccessful := Client.Get('https://jsonplaceholder.typicode.com/todos/3', Response);

        // if not IsSuccessful then begin
        //     // handle the error
        // end;

        if not Response.IsSuccessStatusCode() then begin
            // HttpStatusCode := response.HttpStatusCode();
            Message('Failed to retrieve information.');
            // handle the error (depending on the HTTP status code)
        end;

        Response.Content().ReadAs(ResponseText);

        // Expected output:
        //   GET https://jsonplaceholder.typicode.com/todos/3 HTTP/1.1
        //   {
        //     "userId": 1,
        //     "id": 3,
        //     "title": "fugiat veniam minus",
        //     "completed": false
        //   }
    end;

}
