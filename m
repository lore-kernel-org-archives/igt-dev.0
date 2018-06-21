Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A3C6E26E
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Jun 2018 18:24:29 +0000 (UTC)
From: "Lankhorst, Maarten" <maarten.lankhorst@intel.com>
Date: Thu, 21 Jun 2018 18:24:26 +0000
Message-ID: <1529605464.11846.3.camel@intel.com>
References: <1529587920-23489-1-git-send-email-vandita.kulkarni@intel.com>
In-Reply-To: <1529587920-23489-1-git-send-email-vandita.kulkarni@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_available_modes_crc: Enable
 test for ARGB888/ABGR8888
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1270049701=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kulkarni, Vandita" <vandita.kulkarni@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1270049701==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-RPoYT9FwmG+7CwqYddVz"

--=-RPoYT9FwmG+7CwqYddVz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

tor 2018-06-21 klockan 19:02 +0530 skrev Vandita Kulkarni:
> icl onwards hw supports bypass for 0xff and 0x00 per-pixel alpha,
> fixing the crc mismatch problem.
> Hence enabling this test for ARGB8888/ABGR8888 format planes.
>=20
> Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
> ---
>  tests/kms_available_modes_crc.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/tests/kms_available_modes_crc.c
> b/tests/kms_available_modes_crc.c
> index b70ef5d..2c6f707 100644
> --- a/tests/kms_available_modes_crc.c
> +++ b/tests/kms_available_modes_crc.c
> @@ -143,7 +143,7 @@ static const struct {
>  	 * and getting crc is skipped.
>  	 */
>  	{ DRM_FORMAT_ARGB8888, 0, SKIP4, 0xffffffff},
> -	{ DRM_FORMAT_ABGR8888, 0, SKIP4, 0x00ffffff},
> +	{ DRM_FORMAT_ABGR8888, 0, SKIP4, 0xffffffff},
> =20
>  	{ DRM_FORMAT_XRGB2101010, 0, BYTES_PP_4, 0xffffffff},
>  	{ DRM_FORMAT_XBGR2101010, 0, BYTES_PP_4, 0xffffffff},
> @@ -223,21 +223,21 @@ static bool fill_in_fb(data_t *data,
> igt_output_t *output, igt_plane_t *plane,
>  		writesize =3D data->size+data->size/2;
>  		break;
>  	case SKIP4:
> -		if (fillers[i].fourcc =3D=3D DRM_FORMAT_ARGB8888 &&
> -		    plane->type =3D=3D DRM_PLANE_TYPE_CURSOR) {
> +		ptemp_32_buf =3D (unsigned int *)data->buf;
> +		for (c =3D 0; c < data->size/4; c++)
> +			ptemp_32_buf[c] =3D fillers[i].value;
> +		writesize =3D data->size;
>  		/*
> -		 * special for cursor plane where blending works
> correctly.
> +		 * HW WA to fix per-pixel alpha 0x00 and 0xff
> +		 * on non cursor planes is icl onwards only.
>  		 */
> -			ptemp_32_buf =3D (unsigned int*)data->buf;
> -			for (c =3D 0; c < data->size/4; c++)
> -				ptemp_32_buf[c] =3D fillers[i].value;
> -			writesize =3D data->size;
> -			break;
> +		if ((intel_gen(intel_get_drm_devid(data->gfx_fd)) <
> 11) &&
> +			plane->type !=3D DRM_PLANE_TYPE_CURSOR) {
> +			igt_info("Format %s CRC comparison skipped
> by design.\n",
> +				 (char *)&fillers[i].fourcc);
> +			return false;
>  		}
> -		igt_info("Format %s CRC comparison skipped by
> design.\n",
> -			 (char*)&fillers[i].fourcc);
> -
> -		return false;
> +		break;
>  	default:
>  		igt_info("Unsupported mode for test %s\n",
>  			 (char*)&fillers[i].fourcc);
Could we only blacklist gen9 and gen10? Earlier platforms should handle
alpha correctly.

~Maarten
--=-RPoYT9FwmG+7CwqYddVz
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKfTCCBOsw
ggPToAMCAQICEFLpAsoR6ESdlGU4L6MaMLswDQYJKoZIhvcNAQEFBQAwbzELMAkGA1UEBhMCU0Ux
FDASBgNVBAoTC0FkZFRydXN0IEFCMSYwJAYDVQQLEx1BZGRUcnVzdCBFeHRlcm5hbCBUVFAgTmV0
d29yazEiMCAGA1UEAxMZQWRkVHJ1c3QgRXh0ZXJuYWwgQ0EgUm9vdDAeFw0xMzAzMTkwMDAwMDBa
Fw0yMDA1MzAxMDQ4MzhaMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2Fu
dGEgQ2xhcmExGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRl
cm5hbCBCYXNpYyBJc3N1aW5nIENBIDRBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
4LDMgJ3YSVX6A9sE+jjH3b+F3Xa86z3LLKu/6WvjIdvUbxnoz2qnvl9UKQI3sE1zURQxrfgvtP0b
Pgt1uDwAfLc6H5eqnyi+7FrPsTGCR4gwDmq1WkTQgNDNXUgb71e9/6sfq+WfCDpi8ScaglyLCRp7
ph/V60cbitBvnZFelKCDBh332S6KG3bAdnNGB/vk86bwDlY6omDs6/RsfNwzQVwo/M3oPrux6y6z
yIoRulfkVENbM0/9RrzQOlyK4W5Vk4EEsfW2jlCV4W83QKqRccAKIUxw2q/HoHVPbbETrrLmE6RR
Z/+eWlkGWl+mtx42HOgOmX0BRdTRo9vH7yeBowIDAQABo4IBdzCCAXMwHwYDVR0jBBgwFoAUrb2Y
ejS0Jvf6xCZU7wO94CTLVBowHQYDVR0OBBYEFB5pKrTcKP5HGE4hCz+8rBEv8Jj1MA4GA1UdDwEB
/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMDYGA1UdJQQvMC0GCCsGAQUFBwMEBgorBgEEAYI3
CgMEBgorBgEEAYI3CgMMBgkrBgEEAYI3FQUwFwYDVR0gBBAwDjAMBgoqhkiG+E0BBQFpMEkGA1Ud
HwRCMEAwPqA8oDqGOGh0dHA6Ly9jcmwudHJ1c3QtcHJvdmlkZXIuY29tL0FkZFRydXN0RXh0ZXJu
YWxDQVJvb3QuY3JsMDoGCCsGAQUFBwEBBC4wLDAqBggrBgEFBQcwAYYeaHR0cDovL29jc3AudHJ1
c3QtcHJvdmlkZXIuY29tMDUGA1UdHgQuMCygKjALgQlpbnRlbC5jb20wG6AZBgorBgEEAYI3FAID
oAsMCWludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAKcLNo/2So1Jnoi8G7W5Q6FSPq1fmyKW3
sSDf1amvyHkjEgd25n7MKRHGEmRxxoziPKpcmbfXYU+J0g560nCo5gPF78Wd7ZmzcmCcm1UFFfIx
fw6QA19bRpTC8bMMaSSEl8y39Pgwa+HENmoPZsM63DdZ6ziDnPqcSbcfYs8qd/m5d22rpXq5IGVU
tX6LX7R/hSSw/3sfATnBLgiJtilVyY7OGGmYKCAS2I04itvSS1WtecXTt9OZDyNbl7LtObBrgMLh
ZkpJW+pOR9f3h5VG2S5uKkA7Th9NC9EoScdwQCAIw+UWKbSQ0Isj2UFL7fHKvmqWKVTL98sRzvI3
seNC4DCCBYowggRyoAMCAQICEzMAAKy/3G1bO81ImVcAAAAArL8wDQYJKoZIhvcNAQEFBQAweTEL
MAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRQwEgYDVQQHEwtTYW50YSBDbGFyYTEaMBgGA1UEChMR
SW50ZWwgQ29ycG9yYXRpb24xKzApBgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3Vpbmcg
Q0EgNEEwHhcNMTcxMDIzMTMwNjAwWhcNMTgxMDE4MTMwNjAwWjBJMRswGQYDVQQDExJMYW5raG9y
c3QsIE1hYXJ0ZW4xKjAoBgkqhkiG9w0BCQEWG21hYXJ0ZW4ubGFua2hvcnN0QGludGVsLmNvbTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKgdSd2jCANFF8kf/86t0JEJtzIGlarSmghj
bT8yJW87KEyBSqKOOoN5fE/tZ0ahyLlsGeiXK+DsAowaP5GP4fMLBP+GUwab8IxTYEcF6ddxgT+F
63DO/sTzKtKyIfcPz0YEl2WPZaVBPRNPirHLjaqqvr6QbzrqHsTm6SpL605UBcZnf4BhHRrG0mrv
4hBwGj4HAglW2qEfHyPHJ2VGJXFk9fwYD4NZVvW/DGbM2UMcT9G+PWPpZwZB7tbO5MMEiJwbtNyX
F2TV2+XSKn8UG1zPdFC7JTlLhsVFYM3NY6pi0lWk7rwsMgtYBGgv6zh8iLunLP0xuM+MQonT9KEo
9kkCAwEAAaOCAjkwggI1MB0GA1UdDgQWBBQzvZm2BWwDAD408y8HzIxxsewayTAfBgNVHSMEGDAW
gBQeaSq03Cj+RxhOIQs/vKwRL/CY9TBlBgNVHR8EXjBcMFqgWKBWhlRodHRwOi8vd3d3LmludGVs
LmNvbS9yZXBvc2l0b3J5L0NSTC9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5nJTIw
Q0ElMjA0QS5jcmwwgZ8GCCsGAQUFBwEBBIGSMIGPMGkGCCsGAQUFBzAChl1odHRwOi8vd3d3Lmlu
dGVsLmNvbS9yZXBvc2l0b3J5L2NlcnRpZmljYXRlcy9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMl
MjBJc3N1aW5nJTIwQ0ElMjA0QS5jcnQwIgYIKwYBBQUHMAGGFmh0dHA6Ly9vY3NwLmludGVsLmNv
bS8wCwYDVR0PBAQDAgeAMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIbDjHWEmeVRg/2BKIWO
n1OCkcAJZ4HevTmV8EMCAWQCAQkwHwYDVR0lBBgwFgYIKwYBBQUHAwQGCisGAQQBgjcKAwwwKQYJ
KwYBBAGCNxUKBBwwGjAKBggrBgEFBQcDBDAMBgorBgEEAYI3CgMMMFMGA1UdEQRMMEqgKwYKKwYB
BAGCNxQCA6AdDBttYWFydGVuLmxhbmtob3JzdEBpbnRlbC5jb22BG21hYXJ0ZW4ubGFua2hvcnN0
QGludGVsLmNvbTANBgkqhkiG9w0BAQUFAAOCAQEAJfZIpZQN1A6IaAcFZHe1oPyJW27+Jjg//4v4
E0ElHzO9OgQqqmZjngWwurgHmFpViwKkNeSN1xYHFt4+apmLzI6x7F3s3abJr5BpBv1vHqhL6cuS
dFtsU8D24AhYoaWaYe3EhoDO8dG3VmO/vMarERoHokvqmSLVzZ+jeSRM/re/y+qkOfZNF62PRpvJ
iAO71ed8USzrGowddFOshoXRnjvTPRIBzBHEVqJ/Ju0C5Vb2AwvRlXxzlcRw8BnwjFOJOig6x65o
c18EGXYWYydy+h95Lq0DcqnLEvdRWFCLsKhG0lXa32Lb9CrcfDrXF/xnOb9dNXpJDGEhCPKvKDNm
NjGCAhcwggITAgEBMIGQMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2Fu
dGEgQ2xhcmExGjAYBgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRl
cm5hbCBCYXNpYyBJc3N1aW5nIENBIDRBAhMzAACsv9xtWzvNSJlXAAAAAKy/MAkGBSsOAwIaBQCg
XTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xODA2MjExODI0MjRa
MCMGCSqGSIb3DQEJBDEWBBQKPevgN+Fmn6+6xq2eqkZylqCwmDANBgkqhkiG9w0BAQEFAASCAQBY
39WT6Esr+eaMVJZOsSM0vucqeXRIbi3O3nzb+3DkTsrUy1OzTXOi5JTPYT7oLyygvEHA6K4qloXB
UJZM32XaJ8Avk66UU9cHG2j+uy/pdyRFbjhZq7XoJrwBxOqVSm7JUqjCngJEEOYqct3aQ6PxJDcv
Dr7vLy92u2DaYKwBC8+ewWuKzW1erh97VAVAhxA/FBd0Y2v4lXt7gl0muoW1TucX8r6jvfEjfcE7
s8MHqXxGZtkR9Y9L2Y8tS5gRQgibZcfg/QmAtoMQxKBEwqfW6cJaE0cvghy26zlz3oWyYZG07cNz
J/RtiKKhN3lAR8DKwpc6zc2kaDNLRA2hJ1sRAAAAAAAA


--=-RPoYT9FwmG+7CwqYddVz--

--===============1270049701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1270049701==--
