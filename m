Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F9B6E0F0
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2019 08:45:07 +0000 (UTC)
From: "Vasilev, Oleg" <oleg.vasilev@intel.com>
Date: Wed, 3 Jul 2019 08:45:04 +0000
Message-ID: <b043246cf4b0b7247a4f21f5aeda1e68d36caf0a.camel@intel.com>
References: <20190701130326.8887-1-zbigniew.kempczynski@intel.com>
 <20190701130326.8887-2-zbigniew.kempczynski@intel.com>
 <d22e4f02cb7876ccf6d6a5501ca2a07d45411bd1.camel@intel.com>
 <aa67b24e7e8287ee230cbe3544b8d9079f134260.camel@intel.com>
In-Reply-To: <aa67b24e7e8287ee230cbe3544b8d9079f134260.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [EARLY RFC 1/1] Introduce new method of device
 selection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0632705904=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0632705904==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-L314GmuP3k8/EM+XH6v0"

--=-L314GmuP3k8/EM+XH6v0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-07-02 at 08:38 +0100, Kempczynski, Zbigniew wrote:
> On Mon, 2019-07-01 at 21:57 +0100, Vasilev, Oleg wrote:
> > Hi,
> >=20
> > First of all, thanks for working on this. This will definitely be
> > useful.
> >=20
> > On Mon, 2019-07-01 at 15:03 +0200, Zbigniew Kempczy=C5=84ski wrote:
> > > Change adds device selection based on implemented filters.
> > > Currently
> > > drm, dev and pci filters were added to address different device
> > > selection possibilities.
> > >=20
> > > drm filter allows selection /dev/dri/cardN node by using filter
> > >         drm:card=3DN
> > > where N is number of card.
> > >=20
> > > dev filter allows selection of N-th device in all gpus avilable
> > > (PCI devices at the moment). Regardless of driver load time
> > > and /dev/dri/cardN this filter will select same device until
> > > new card will be added. Filter syntax is as follows:
> > >         dev:card=3DN
> >=20
> > I am not sure I understand the purpose of this method. The first is
> > mostly for debugging. The third one is used to specify the exact
> > device. Why do we need this?
>=20
> Let we have two cards, first on pci slot 0000:00:01.0, second
> on 0000:00:02.0. Driver module load time makes influence which device
> will have /dev/dri/card0 and which /dev/dri/card1.=20
> Filter 'drm:card=3D0' always will return you /dev/dri/card0.
> Filter 'dev:card=3D0' will return you /dev/dri/card0 or /dev/dri/card1
> because it will find first card on PCI bus.=20

Nah, I still don't like it much. It wouldn't work for hotplug devices.
But if someone would use it for local debugging, I don't mind.

>=20
> > > pci filter gives vendor / device / card number selection. Only
> > > cards which match this filter will be returned. Filter syntax:
> > >         pci:vendor=3Dxxxx,device=3Dyyyy,card=3DN
> > > where xxxx, yyyy are hex numbers which identify vendor and
> > > device,
> > > card selects N-th matching card.
> > > New device selection uses --device filter or IGT_DEVICE
> > > environent
> > > variable.
> >=20
> > I think, we are still missing a method for specifying the device in
> > a
> > human-readable format. Is there any reliable way of projecting
> > strings
> > like "intel", "amd", "vkms", etc to an actual device, or we still
> > need
> > to maintain this mapping inside IGT runner?
>=20
> Adding '8086' -> 'intel' mapping and so on is easy. Small problem
> occurs
> for handling device, especially that set is larger and how to select
> that
> (string matching, what to do if device is not on the list?). I'd
> crazy idea
> to convert pci.ids to table but this is overkill IMHO for this case.
> And in
> this case we need to put data to library in compiled form because I
> guess we
> don't want to depend on pciutils package (or whichever contains
> pci.ids).=20

I think, maintaining this table inside IGT should be fine. We have a
finite number of vendors, who want to run IGT on their devices.=20

I suppose, we can even incorporate those human-readable names into the
same syntax,  such that 'pci:vendor=3Dintel' would be an alias to
'pci:vendor=3D8086'.=20


> > Also, should IGT_FORCE_DRIVER be kept? Seems like IGT_FORCE_DRIVER
> > and
> > IGT_DEVICE serve quite a similar purpose.
>=20
> IGT_FORCE_DRIVER ensures that this driver module is used for device=20
> opened with DRIVER_ANY. I didn't wanted to change this behavior for
> legacy
> usage. That's why I proposed new IGT_DEVICE to leave old device
> selection
> intact.=20

I think IGT_FORCE_DRIVER is not broadly used, and can be dropped. But
let others clarify this.=20

> > > Tool 'lsgpu' which uses device scanning feature was added.
> > >=20
> > > Signed-off-by: Zbigniew Kempczy=C5=84ski <
> > > zbigniew.kempczynski@intel.com>
> > > Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Petri Latvala <petri.latvala@intel.com>
> >=20
> > BTW, about multiple devices tests and
> > drm_open_driver(DRIVER_INTEL).
> > One approach could be this:
> >=20
> > 1. We add another instance of this --device property, called for
> > example --device2, which would correspond to an auxiliary device.
> > This
> > approach allows us to have the same generic device selection
> > mechanism
> > in all places. Also, if we ever have the test involving 3 devices,
> > this
> > can scale :)
> > 2. With new selection mechanism active
> > fd =3D drm_open_driver(DRIVER_SOMETHING)
> > is an alias for
> > fd =3D drm_open_driver(DRIVER_ANY)
> > igt_require_something(fd)
> > Oleg
>=20
> If we need to handle more than one device it is possible to
> reimplement
> parsing of --device filter to something like this:
>=20
> --device pci:vendor=3D1234,card=3D0;pci:vendor=3D2345,card=3D2;...
>=20
> Splitting against ';' would extract separate device filters giving
> array
> as an output. Then access to device using array index would give you=20
> expected card.

I would rather have separate parameters/envvars for different devices.
It is more readable, we easier to copy-paste parameters, envvars for
different devices can come from different places. We might want to
specify only secondary device, and for primary rely on automatic
selection
=20
> Zbigniew

Oleg

--=-L314GmuP3k8/EM+XH6v0
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

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
DdWSiLBgHgGaO0ThuDGV4bz316/+F4Vy7z9hcMbMJs41eGz9tueMREgDNywNIAdzWQIDAQABo4IC
LjCCAiowHQYDVR0OBBYEFP8BYPvxsk8Ryh4Tt/ZBT5qIg2TiMB8GA1UdIwQYMBaAFB5pKrTcKP5H
GE4hCz+8rBEv8Jj1MGUGA1UdHwReMFwwWqBYoFaGVGh0dHA6Ly93d3cuaW50ZWwuY29tL3JlcG9z
aXRvcnkvQ1JML0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3VpbmclMjBDQSUyMDRBLmNy
bDCBngYIKwYBBQUHAQEEgZEwgY4waQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cuaW50ZWwuY29tL3Jl
cG9zaXRvcnkvY2VydGlmaWNhdGVzL0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3Vpbmcl
MjBDQSUyMDRBLmNydDAhBggrBgEFBQcwAYYVaHR0cDovL29jc3AuaW50ZWwuY29tMAsGA1UdDwQE
AwIHgDA8BgkrBgEEAYI3FQcELzAtBiUrBgEEAYI3FQiGw4x1hJnlUYP9gSiFjp9TgpHACWeB3r05
lfBDAgFkAgELMB8GA1UdJQQYMBYGCCsGAQUFBwMEBgorBgEEAYI3CgMMMCkGCSsGAQQBgjcVCgQc
MBowCgYIKwYBBQUHAwQwDAYKKwYBBAGCNwoDDDBJBgNVHREEQjBAoCYGCisGAQQBgjcUAgOgGAwW
b2xlZy52YXNpbGV2QGludGVsLmNvbYEWb2xlZy52YXNpbGV2QGludGVsLmNvbTANBgkqhkiG9w0B
AQUFAAOCAQEAffmCWGLFQzB82/D5fYYzYJ3/8uSfKWA4UPCKcqETG1Zb0vl2FPoCjNID1Bw2HNS7
TxYcXvrVDul3vdCQfQhKonJi4ioJJXPPAQBDKKPkVoL9f/maehuXJYjFNsGmHNYADJL+4bDRJJcq
wIQlFVGXvPJFuTSj9HjJAiwH4zehhiEuTTbDhbaaLVrDsEVKCFMj0nvxN4AsYfoBXbscUVLrZs8n
ZIht2nPvz2NlWwxWgl/7+T42CcriuoeLOPWjmaMncOnXaIR/XNpzvCd6N8Xurg9NhzZaCUwLPAX1
fyAyMXRsdpgqKqVNd+jLBGt87zB3FQQOh73i8+vBMqm1BfEoojGCAhcwggITAgEBMIGQMHkxCzAJ
BgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2FudGEgQ2xhcmExGjAYBgNVBAoTEUlu
dGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJc3N1aW5nIENB
IDRBAhMzAADRf+xxDzfl4feqAAAAANF/MAkGBSsOAwIaBQCgXTAYBgkqhkiG9w0BCQMxCwYJKoZI
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTA3MDMwODQ1MDNaMCMGCSqGSIb3DQEJBDEWBBSzhonI
778PemKzJe/X7CKc8lkcjDANBgkqhkiG9w0BAQEFAASCAQAydbv5GhW1jDri4QrwUIKLLzP1eE21
vEEWctdexyRbMbzDMZhFFb9pnkoaSRU7sbSL3WXoJ0UKQaOP6lTc+KfAxqku97PZE8UbeVnQEy5m
0k5ZHd4SoYOp7DM3kFUQ0v/Wf4NnQGTqTtU0bZ9KLUdV6hIEf8+e6EaNpzuADxoH6f8C5Yz7lo73
FZ7kJiDzanJDfWSUxu30qWQwhk+ifXKZ0iNxnRU/CMG+vTEILKhfji+VMfZxBdqd/pNv1Cavvo9x
FVhjrx88C3yLreGKFKaFVu1Egvr3ZxIYFHRhxCbOIHTDESB9aAbV5AtIc+K/WRsGsPCUkrTJ2me4
ztforPb5AAAAAAAA


--=-L314GmuP3k8/EM+XH6v0--

--===============0632705904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0632705904==--
