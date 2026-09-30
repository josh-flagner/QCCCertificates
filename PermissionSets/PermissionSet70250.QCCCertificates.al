permissionset 70250 "QCC CERTIFICATES"
{
    Assignable = true;
    Caption = 'QCC Certificates';

    Permissions =
        tabledata "QCC Certificate Header" = RIMD,
        tabledata "QCC Certificate Setup" = RIMD,
        tabledata "QCC Certificate Line" = RIMD,
        tabledata "QCC Cert Tracking Line" = RIMD;
}