Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBF689739
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Feb 2019 16:08:06 +0000 (UTC)
From: "Summers, Stuart" <stuart.summers@intel.com>
Date: Thu, 21 Feb 2019 16:08:04 +0000
Message-ID: <c81dd9646d3319a2c8d23b32c09a26f524011f44.camel@intel.com>
References: <20190215004043.21500-1-stuart.summers@intel.com>
 <20190215004043.21500-3-stuart.summers@intel.com>
 <20190221153727.pnjb4goz74q67tzk@ahiler-desk1.fi.intel.com>
In-Reply-To: <20190221153727.pnjb4goz74q67tzk@ahiler-desk1.fi.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] i915/kms_chamelium: Pull chameleond
 logs for debugging
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0938128892=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Hiler, Arkadiusz" <arkadiusz.hiler@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0938128892==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-0J+i7U+SwR8QtZulWN8x"

--=-0J+i7U+SwR8QtZulWN8x
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-02-21 at 17:37 +0200, Arkadiusz Hiler wrote:
> On Thu, Feb 14, 2019 at 04:40:43PM -0800, Stuart Summers via igt-dev
> wrote:
> > IGT currently logs some state information when passing commands
> > to the Chamelium. There is a daemon running on the Chamelium
> > itself,
> > chameleond, which logs some additional information locally. Add
> > a new set of libssh calls to extract those logs to be used in CI
> > debug.
> >=20
> > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > ---
> >  Dockerfile.debian   |   1 +
> >  Dockerfile.fedora   |   1 +
> >  lib/igt_chamelium.c | 150
> > +++++++++++++++++++++++++++++++++++++++++++-
> >  lib/meson.build     |   4 ++
> >  meson.build         |   4 +-
> >  5 files changed, 158 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Dockerfile.debian b/Dockerfile.debian
> > index b9c3be394..77928a9ef 100644dy have another way of talking to
> > chameli
> > --- a/Dockerfile.debian
> > +++ b/Dockerfile.debian
> > @@ -18,6 +18,7 @@ RUN apt-get install -y \
> >  			libudev-dev \
> >  			libgsl-dev \
> >  			libasound2-dev \
> > +			libssh-dev \
> >  			libxmlrpc-core-c3-dev \
> >  			libjson-c-dev \
> >  			libcurl4-openssl-dev \
> > diff --git a/Dockerfile.fedora b/Dockerfile.fedora
> > index 08a4bd224..b041bf252 100644
> > --- a/Dockerfile.fedora
> > +++ b/Dockerfile.fedora
> > @@ -16,6 +16,7 @@ RUN dnf install -y gcc \
> >  		json-c-devel \
> >  		libdrm-devel \
> >  		libudev-devel \
> > +		libssh-devel \
> >  		xmlrpc-c-devel \
> >  		elfutils-devel \
> >  		libunwind-devel \
> > diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> > index 32b859eac..61b563e08 100644
> > --- a/lib/igt_chamelium.c
> > +++ b/lib/igt_chamelium.c
> > @@ -30,6 +30,7 @@
> >  #include <errno.h>
> >  #include <xmlrpc-c/base.h>
> >  #include <xmlrpc-c/client.h>
> > +#include <libssh/libssh.h>
>=20
> The logs looks super useful to have, indeed!dy have another way of
> talking to chameli
>=20
> Pulling ssh library and adding all the complexity, especially when we
> already have another way of talking to chamelium, seems a little too
> much though.
>=20
> Have you looked into how complex it would be to add a XMLRPC call
> to fetch them instead?
>=20

Yeah I thought about that...

Basically I'm thinking we have a few options:
1) Do nothing. Don't get the logs.
2) Implement C-based SSH. Obviously there is the code complexity.
3) Implement shell-based SSH. This seems contradictory to the rest of
IGT, but would of course remove the code complexity. Assuming this was
some sort of post script, it would also not give you quite the fine
grained granular logging I have in this patch (i.e. only take the logs
leading up to an assert).
4) Implement RPC based approach. I like this idea, since like you said
we already have the interface. It means we're adding more code here
(minimal) and in chameleond (also minimal). Which means the turn-around=20
time is going to be greater.
5) Implement in both SSH here and in RPC in chameleond. This could be a
two staged approach where we first push something like what I have,
then either get rid of it once we get the RPC interface in chameleond.
or support both options if that makes sense.

Thoughts?

> > diff --git a/lib/meson.build b/lib/meson.build
> > index dd36f8180..40d1cb65e 100644
> > --- a/lib/meson.build
> > +++ b/lib/meson.build
> > @@ -97,6 +97,10 @@ if alsa.found()
> >  	lib_sources +=3D 'igt_alsa.c'
> >  endif
> > =20
> > +if libssh.found()
> > +	lib_deps +=3D libssh
> > +endif
> > +
> >  if chamelium.found()
> >  	lib_deps +=3D chamelium
> >  	lib_sources +=3D 'igt_chamelium.c'
> > diff --git a/meson.build b/meson.build
> > index 356a54142..3b4e40ce5 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -166,6 +166,8 @@ cairo =3D dependency('cairo', version :
> > '>1.12.0', required : true)
> >  libudev =3D dependency('libudev', required : true)
> >  glib =3D dependency('glib-2.0', required : true)
> > =20
> > +libssh =3D dependency('libssh', required : true)
>=20
> "required : true"  makes this dependency mandatory for the whole
> project, making the build fail.
>=20
> What you want to do here is to make it not-required. The check you
> have
> below, 'libssh.found()' will make sure that the dependency is there
> for
> just the Chamelium.

Thanks for the tip! If we get the infrastructure to support libssh on
the chamelium hosts, I'll post an update with this change.

>=20

--=-0J+i7U+SwR8QtZulWN8x
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKcTCCBOsw
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
4WjK8DCCBX4wggRmoAMCAQICEzMAAHThOHejBjRRsRQAAAAAdOEwDQYJKoZIhvcNAQEFBQAweTEL
MAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRQwEgYDVQQHEwtTYW50YSBDbGFyYTEaMBgGA1UEChMR
SW50ZWwgQ29ycG9yYXRpb24xKzApBgNVBAMTIkludGVsIEV4dGVybmFsIEJhc2ljIElzc3Vpbmcg
Q0EgNEIwHhcNMTkwMTIzMTcxMTA0WhcNMjAwMTE4MTcxMTA0WjBDMRgwFgYDVQQDEw9TdW1tZXJz
LCBTdHVhcnQxJzAlBgkqhkiG9w0BCQEWGHN0dWFydC5zdW1tZXJzQGludGVsLmNvbTCCASIwDQYJ
KoZIhvcNAQEBBQADggEPADCCAQoCggEBAL7LpY79h4eyLdxekwAblnyPAHSCaXvVTUmnPKxWXs9g
VCcf7gjGg8qg/HLCwvgGKGqtVkn2EaCKd85rqklaTp07JciV6a77qodO0yOgyz96hRVuSFAIP0UQ
TXP+PuVIfYuqNSSgh2x2HzJy2DzpG12ZMldy6r2zAa6ypWevjFp5+3/mscAVNAmSHnyj838uukd/
YwrFtEG2j5l/EoijzGMRFUD0tS5eD2y0WmRfmc4xkv1Qjr8AN3ogZr4arGr+rF2F4aakLmoDUCZk
PwuHX1mRETAlwqXCZa6ba8eraUCltlCb/ZiEk9UFRVLjbLNPh9IYOi+sWkS6n5CovLKAqhMCAwEA
AaOCAjMwggIvMB0GA1UdDgQWBBSgeYqvLV4nBaCUzAXLr0TeMJYR5zAfBgNVHSMEGDAWgBTaQSOc
Wo9xr1eDPiDT42XbDMsL2zBlBgNVHR8EXjBcMFqgWKBWhlRodHRwOi8vd3d3LmludGVsLmNvbS9y
ZXBvc2l0b3J5L0NSTC9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5nJTIwQ0ElMjA0
Qi5jcmwwgZ8GCCsGAQUFBwEBBIGSMIGPMCIGCCsGAQUFBzABhhZodHRwOi8vb2NzcC5pbnRlbC5j
b20vMGkGCCsGAQUFBzAChl1odHRwOi8vd3d3LmludGVsLmNvbS9yZXBvc2l0b3J5L2NlcnRpZmlj
YXRlcy9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5nJTIwQ0ElMjA0Qi5jcnQwCwYD
VR0PBAQDAgeAMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIbDjHWEmeVRg/2BKIWOn1OCkcAJ
Z4HevTmV8EMCAWQCAQkwHwYDVR0lBBgwFgYIKwYBBQUHAwQGCisGAQQBgjcKAwwwKQYJKwYBBAGC
NxUKBBwwGjAKBggrBgEFBQcDBDAMBgorBgEEAYI3CgMMME0GA1UdEQRGMESgKAYKKwYBBAGCNxQC
A6AaDBhzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb22BGHN0dWFydC5zdW1tZXJzQGludGVsLmNvbTAN
BgkqhkiG9w0BAQUFAAOCAQEAfyIC7rzSi6S8O+sdH384K8zyeMRJnl6vR7whl9PuEat+BkKpoxHn
jQ0SFyF/cyI4lH/n938Pm3/Ctq0Z5GTldX6hhxxcLAR0qbk6AQU0Cq2nYMlZfX4FUz3FRsazbjTW
1qObcvPRUAVScaa7SRGdensvbNV++pN1XqEdc++szxo58UzPaEgDlHIe2sEIVXnFkHnJv0ikRHG3
urcA1bdj7Rac7dJBeQOQMdZEGmrWWmmbJzvk3OmoK9tKN7wcErQSdlqyYOMLesPfa7YNyLFYEJQd
CC/N7V8U9yFZx8akWREb8lJYDl9KypirEsufleiew26CWrwcbmdlldDCFS6/HDGCAhcwggITAgEB
MIGQMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2FudGEgQ2xhcmExGjAY
BgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJ
c3N1aW5nIENBIDRCAhMzAAB04Th3owY0UbEUAAAAAHThMAkGBSsOAwIaBQCgXTAYBgkqhkiG9w0B
CQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTAyMjExNjA4MDFaMCMGCSqGSIb3DQEJ
BDEWBBTvLQCnTZEyapRryPkGMT9HZKuPbTANBgkqhkiG9w0BAQEFAASCAQCnXZryf7VCGg1Jve5S
WETh9J8RkzNZ4YItbg1BYqFPifecuv/GkXmK0RWkhIymnRCVvRB/b+73raSCiaO/uXBAMZgQO4x9
BV3us+IcitC0YEWZMoYmsZ+yBicTDfw4JDe/KHUPa3dKInS0yVA3xrOPAK5DvdcSn8SpV+ZxLFaj
h+65tB1YWrVk43hnE/9wHNBd/uqi2UtXthx30hCRrfvx2SJlggUwwY6kWbF7LT86yhcoWJYGL2r3
HhKNTzYTCmngrjKjfkROFHHl0vo70kQ5LX4ikRtQBBorAmqQkwCf6V19L22ILZms4ez/GfyS4y9x
7BydUg0Sb0rfAt/KjbVcAAAAAAAA


--=-0J+i7U+SwR8QtZulWN8x--

--===============0938128892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0938128892==--
