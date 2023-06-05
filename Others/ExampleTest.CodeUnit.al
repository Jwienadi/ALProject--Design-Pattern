codeunit 50200 MyCodeunit
{
    [InherentPermissions(PermissionObjectType::TableData, Database::Example, 'rmd', InherentPermissionsScope::Both)]
    procedure SetDefaultDesc()
    var
        Example: Record Example;
    begin
        if Example.Get('') then begin
            Example.Validate(Description, 'emptyPK');
            Example.Modify();
        end;
    end;

}