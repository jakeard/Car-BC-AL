codeunit 50100 "ARD Car API"
{
    trigger OnRun();
    begin
        GetCars();
    end;

    procedure GetCars()
    var
        HttpClient: HttpClient;
        HttpResponse: HttpResponseMessage;
        URL: Label 'https://jsonplaceholder.typicode.com/todos/1';
        Response: Text;
    begin
        if HttpClient.Get(URL, HttpResponse) then begin
            HttpResponse.Content.ReadAs(Response);
            Message(Response);
        end;
    end;
}