permissionset 50200 ExamplesPermissions
{
    Assignable = true;
    Permissions = tabledata Example = RIMD,
        tabledata "Example Setup" = RIMD,
        tabledata ExampleType = RIMD,
        table Example = X,
        table "Example Setup" = X,
        table ExampleType = X,
        page "Example Card" = X,
        page "Example List" = X,
        page "Example Types" = X,
        page ExampleSetupCard = X,
        codeunit MyCodeunit = X;
}
permissionsetextension 50200 "Extended Sales Doc" extends "Map - Admin"
{
    Permissions = tabledata Currency = ID;

}