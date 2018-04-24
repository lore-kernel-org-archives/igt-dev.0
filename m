Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DDA6E026
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Apr 2018 13:24:45 +0000 (UTC)
From: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>
Date: Tue, 24 Apr 2018 13:24:41 +0000
Message-ID: <1524576280.27968.22.camel@intel.com>
References: <20180410135227.13779-1-piotr.piorkowski@intel.com>
 <20180424075004.18094-2-piotr.piorkowski@intel.com>
 <152455884489.12387.4829764259332975897@mail.alporthouse.com>
In-Reply-To: <152455884489.12387.4829764259332975897@mail.alporthouse.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 2/2] tests/debugfs_test: Add subtest
 guc_log_relay
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1511307955=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1511307955==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-Fv6f9vAhrNibuI2ktzns"

--=-Fv6f9vAhrNibuI2ktzns
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-04-24 at 09:34 +0100, Chris Wilson wrote:
> Quoting Piotr Piorkowski (2018-04-24 08:50:04)
> > From: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
> >=20
> > We doesn't have any tests to verify functionality of
> > i915_guc_log_relay.
> > I think we should test this component.
> >=20
> > Let's add simple subtest to debugfs_test, which will test if guc
> > is enabled:
> > - opening the i915_guc_log_relay and creating a file guc_log0,
> > - flushing GuC log buffer,
> > - closing i915_guc_log_relay with removing from debugfs guc_log0.
> > Otherwise, the test will check if the attempt to open the
> > guc_log_relay
> > returns an error ENODEV.
> >=20
> > v2:
> > - guc isn't required for run the subtest (Chris)
> > - rewrite subtest as function (Michal Winiarski)
> > - add case when the guc is not enabled
> >=20
> > Signed-off-by: Piotr Pi=C3=B3rkowski <piotr.piorkowski@intel.com>
> > Cc: Sagar Arun Kamble <sagar.a.kamble@intel.com>
> > Cc: Lukasz Fiedorowicz <lukasz.fiedorowicz@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  tests/debugfs_test.c | 93
> > ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> >=20
> > diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
> > index 2e87e442..c7a953b1 100644
> > --- a/tests/debugfs_test.c
> > +++ b/tests/debugfs_test.c
> > @@ -26,6 +26,7 @@
> >  #include <fcntl.h>
> >  #include <sys/types.h>
> >  #include <dirent.h>
> > +#include <errno.h>
> > =20
> >  static void read_and_discard_sysfs_entries(int path_fd, int
> > indent)
> >  {
> > @@ -87,6 +88,95 @@ static void read_and_discard_sysfs_entries(int
> > path_fd, int indent)
> >         closedir(dir);
> >  }
> > =20
> > +static bool is_guc_loaded(int gfx_fd)
> > +{
> > +       bool load;
> > +
> > +       load =3D igt_debugfs_search(gfx_fd, "i915_guc_load_status",
> > +                               "    status: fetch SUCCESS, load
> > SUCCESS");
> > +       igt_debug("GuC %s loaded\n", load ? "is" : "is not");
> > +
> > +       return load;
> > +}
> > +
> > +#define I915_GUC_LOG_RELAY_FILE  "i915_guc_log_relay"
> > +#define GUC_LOG_FILE  "guc_log0"
> > +
> > +static void check_guc_log_relay(int gfx_fd)
> > +{
> > +
> > +       int page_size =3D getpagesize();
> > +       int fd_relay =3D -1, fd_log =3D -1;
> > +       ssize_t read_size;
> > +       uint8_t *buffer;
> > +       bool guc_is_loaded;
> > +       int debugfs;
> > +
> > +       guc_is_loaded =3D is_guc_loaded(gfx_fd);
> > +
> > +       debugfs =3D igt_debugfs_dir(gfx_fd);
> > +       fd_relay =3D openat(debugfs, I915_GUC_LOG_RELAY_FILE,
> > O_RDWR);
> > +
> > +       if (!guc_is_loaded) {
> > +               igt_debug("Case when GuC is disabled\n");
>=20
> Debugging left over? Lots of fluff messages.
>=20
> > +               igt_debug("Attempt open file %s return value: %d (
> > %m )\n",
> > +                         I915_GUC_LOG_RELAY_FILE, errno);
>=20
> Push this into the failure message.
>=20
> > +
> > +               igt_assert(errno =3D=3D ENODEV);
>=20
> errno may have been scribbled over many times, and would have only
> been
> valid if fd_relay is -1.
>=20
> Use igt_assert_eq, but you really want igt_assert_f() if you want
> informative error messages rather than igt_debug spam.
>=20
> But is this the interface you really want to enforce? If the guc log
> relay is accessible is up to the kernel, not you. If the kernel tells
> you it is not available, skip and move on.

This subtest is to check if guc_log_relay works correctly, no matter if
the guc works or not. The correct behavior of guc_log_relay, when the
guc is disabled, is to return the error ENODEV, and this subtest checks
it (with fix if fd_relay is -1). So do you think that this way to
realize the subtest is wrong, and I should change it?=20

Piotr
--=-Fv6f9vAhrNibuI2ktzns
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKeTCCBOsw
ggPToAMCAQICEDabxALowUBS+21KC0JI8fcwDQYJKoZIhvcNAQEFBQAwbzELMAkGA1UEBhMCU0Ux
FDASBgNVBAoTC0FkZFRydXN0IEFCMSYwJAYDVQQLEx1BZGRUcnVzdCBFeHRlcm5hbCBUVFAgTmV0
d29yazEiMCAGA1UEAxMZQWRkVHJ1c3QgRXh0ZXJuYWwgQ0EgUm9vdDAeFw0xMzEyMTEwMDAwMDBa
Fw0yMDA1MzAxMDQ4MzhaMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2Fu
dGEgQ2xhcmExGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRl
cm5hbCBCYXNpYyBJc3N1aW5nIENBIDRCMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
yzuW/y/g0bznz8BD48M94luFzqHaqY9yGN9H/W0J7hOVBpl0rTQJ6kZ7z7hyDb9kf2UW4ZU25alC
i+q5m6NwHg+z9pcN7bQ84SSBueaYF7cXlAg7z3XyZbzSEYP7raeuWRf5fYvYzq8/uI7VNR8o/43w
PtDP10YDdO/0J5xrHxnC/9/aU+wTFSVsPqxsd7C58mnu7G4VRJ0n9PG4SfmYNC0h/5fLWuOWhxAv
6MuiK7MmvTPHLMclULgJqVSqG1MbBs0FbzoRHne4Cx0w6rtzPTrzo+bTRqhruaU18lQkzBk6OnyJ
UthtaDQIlfyGy2IlZ5F6QEyjItbdKcHHdjBX8wIDAQABo4IBdzCCAXMwHwYDVR0jBBgwFoAUrb2Y
ejS0Jvf6xCZU7wO94CTLVBowHQYDVR0OBBYEFNpBI5xaj3GvV4M+INPjZdsMywvbMA4GA1UdDwEB
/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMDYGA1UdJQQvMC0GCCsGAQUFBwMEBgorBgEEAYI3
CgMEBgorBgEEAYI3CgMMBgkrBgEEAYI3FQUwFwYDVR0gBBAwDjAMBgoqhkiG+E0BBQFpMEkGA1Ud
HwRCMEAwPqA8oDqGOGh0dHA6Ly9jcmwudHJ1c3QtcHJvdmlkZXIuY29tL0FkZFRydXN0RXh0ZXJu
YWxDQVJvb3QuY3JsMDoGCCsGAQUFBwEBBC4wLDAqBggrBgEFBQcwAYYeaHR0cDovL29jc3AudHJ1
c3QtcHJvdmlkZXIuY29tMDUGA1UdHgQuMCygKjALgQlpbnRlbC5jb20wG6AZBgorBgEEAYI3FAID
oAsMCWludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAp9XGgH85hk/3IuN8F4nrFd24MAoau7Uq
M/of09XtyYg2dV0TIPqtxPZw4813r78WwsGIbvtO8VQ18dNktIxaq6+ym2zebqDh0z6Bvo63jKE/
HMj8oNV3ovnuo+7rGpCppcda4iVBG2CetB3WXbUVr82EzECN+wxmC4H9Rup+gn+t+qeBTaXulQfV
TYOvZ0eZPO+DyC2pVv5q5+xHljyUsVqpzsw89utuO8ZYaMsQGBRuFGOncRLEOhCtehy5B5aCI571
i4dDAv9LPODrEzm3PBfrNhlp8C0skak15VXWFzNuHd00AsxXxWSUT4TG8RiAH61Ua5GXsP1BIZwl
4WjK8DCCBYYwggRuoAMCAQICEzMAAFxPtYQ0YXrsTWoAAAAAXE8wDQYJKoZIhvcNAQEFBQAweTEL
MAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRQwEgYDVQQHEwtTYW50YSBDbGFyYTEaMBgGA1UEChMR
SW50ZWwgQ29ycG9yYXRpb24xKzApBgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3Vpbmcg
Q0EgNEIwHhcNMTgwMjE5MTc0NTM4WhcNMTkwMjE0MTc0NTM4WjBHMRowGAYDVQQDExFQaW9ya293
c2tpLCBQaW90cjEpMCcGCSqGSIb3DQEJARYacGlvdHIucGlvcmtvd3NraUBpbnRlbC5jb20wggEi
MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCyl4w4oeJtPZQdB+OI/PDGp6tFU6hbUMuhFu/4
skBsXLThTJ+hN5Fa//ms2CAb/CZqJ7mQkF95Zimyoqu90rR59YgsPI0npWPr+JppFw2wF5Uchgnp
S+3DQV9+BwKna7tJsGDVDqaJ7G4hPPKLsLaLgs/4uJETCp4BQwh/tQfMqX6Fsr2bw+ttB+bfNB1q
0B4j1SbDJvy1FcGWcqCG3O/THg4BV7jg7LPFrCcux46Cf0P6ubsD/rTUGazbLMKCZZ/evHmwbS4+
iwe0MJtz29cIjJrZPnUPkyHtgmDMTRHi6uyykDRKQvhsenWsbKPL/C3wgNMHSb0d4n+6X/78/9zL
AgMBAAGjggI3MIICMzAdBgNVHQ4EFgQUR/MOmWgueksOzHfuwXuHg93rj28wHwYDVR0jBBgwFoAU
2kEjnFqPca9Xgz4g0+Nl2wzLC9swZQYDVR0fBF4wXDBaoFigVoZUaHR0cDovL3d3dy5pbnRlbC5j
b20vcmVwb3NpdG9yeS9DUkwvSW50ZWwlMjBFeHRlcm5hbCUyMEJhc2ljJTIwSXNzdWluZyUyMENB
JTIwNEIuY3JsMIGfBggrBgEFBQcBAQSBkjCBjzAiBggrBgEFBQcwAYYWaHR0cDovL29jc3AuaW50
ZWwuY29tLzBpBggrBgEFBQcwAoZdaHR0cDovL3d3dy5pbnRlbC5jb20vcmVwb3NpdG9yeS9jZXJ0
aWZpY2F0ZXMvSW50ZWwlMjBFeHRlcm5hbCUyMEJhc2ljJTIwSXNzdWluZyUyMENBJTIwNEIuY3J0
MAsGA1UdDwQEAwIHgDA8BgkrBgEEAYI3FQcELzAtBiUrBgEEAYI3FQiGw4x1hJnlUYP9gSiFjp9T
gpHACWeB3r05lfBDAgFkAgEJMB8GA1UdJQQYMBYGCCsGAQUFBwMEBgorBgEEAYI3CgMMMCkGCSsG
AQQBgjcVCgQcMBowCgYIKwYBBQUHAwQwDAYKKwYBBAGCNwoDDDBRBgNVHREESjBIoCoGCisGAQQB
gjcUAgOgHAwacGlvdHIucGlvcmtvd3NraUBpbnRlbC5jb22BGnBpb3RyLnBpb3Jrb3dza2lAaW50
ZWwuY29tMA0GCSqGSIb3DQEBBQUAA4IBAQAoJI/vcHFuPtqgAhV4hIfO3BGXYnIEvhBIVRJ2awq8
tpPArc3oGBv4ITRiwB43r4B8BBkhdFBAB8Y+xQm0NJ9itUs+QVQC6wXqJ6P1WWtAhIIl28dLNdnJ
7tMV49VHeWMhtCNQrfsCORqvD2/H6EilyN+48Vh2wuiK8MRnFx8RJ+9tP+meFn1bUDChxGuE42fB
TcyJv7yyF9zAFPZl5o9oxW3MQTacr6uYIrKBHmepV0BsUCh7NZXM4m0racvjt8vcWU70hGQNopN6
PN5+9YIV2ASxcPEusoifg52AjH3HFaZqG8IgzCSVlP3n0UGj4GMkM3hPKbWq3MAkZErtPcAlMYIC
FzCCAhMCAQEwgZAweTELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRQwEgYDVQQHEwtTYW50YSBD
bGFyYTEaMBgGA1UEChMRSW50ZWwgQ29ycG9yYXRpb24xKzApBgNVBAMTIkludGVsIEV4dGVybmFs
IEJhc2ljIElzc3VpbmcgQ0EgNEICEzMAAFxPtYQ0YXrsTWoAAAAAXE8wCQYFKw4DAhoFAKBdMBgG
CSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTE4MDQyNDEzMjQ0MFowIwYJ
KoZIhvcNAQkEMRYEFJhdlsc1o6aCzBx+hZUxrszXGjNeMA0GCSqGSIb3DQEBAQUABIIBAEVg+9j/
hIR/dGvWHqJSFAnCq8zVtdTzctE8JkilgTXxgAPa0oKmT4cPcACttYTSLYSomPytM/o8QMOwMR2L
PaIfih4uB6zGsiXm8fI4euhMkiKe1cjN8GZ7Yoc/G3JpLMbJD65XBa9XxgUEH2m6SDScjD2jpu+F
wHUoc1hYAbJv+wde694Gvq7PRCMt0s7kO9JpzXAabgANki/d0C1cBd5jt5tQIVxe38zigSTxv7RB
iI4uBj+YBJM3yV0RddFMDrlRdNgMHk3TdkyGcs65x/1R3dPH+EtRli07ePILS6zExZU0PNEEib+G
pCga62eA9kVSHc3U+ZtoVa5QyX70wWIAAAAAAAA=


--=-Fv6f9vAhrNibuI2ktzns--

--===============1511307955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1511307955==--
