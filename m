Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC32F6E113
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Nov 2018 16:36:11 +0000 (UTC)
Message-ID: <68b8bb2880f8ef6e52b413c435abd151ae1c9e9f.camel@bootlin.com>
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Thu, 15 Nov 2018 17:36:00 +0100
In-Reply-To: <20181114165008.74a5f97e@bbrezillon>
References: <20181114153149.14912-1-paul.kocialkowski@bootlin.com>
 <20181114165008.74a5f97e@bbrezillon>
Mime-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_kms: Set writeback connector
 capacity to fix VC4 testing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0366495635=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, eben@raspberrypi.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0366495635==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-wed76e4yXvCnmp11s/v/"


--=-wed76e4yXvCnmp11s/v/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, 2018-11-14 at 16:50 +0100, Boris Brezillon wrote:
> Hi Paul,
>=20
> On Wed, 14 Nov 2018 16:31:49 +0100
> Paul Kocialkowski <paul.kocialkowski@bootlin.com> wrote:
>=20
> > Support for writeback connectors was recently introduced in DRM, with
> > an implementation in the VC4 DRM driver. This unfortunately broke IGT
> > testing for the driver due to always-failing atomic commits.
> >=20
> > After boot up, the writeback connector is attached to a CRTC, with a
> > virtual encoder and a plane (that takes the same framebuffer as the
> > primary plane).
>=20
> That's weird, the writeback connector should not be attached to its
> CRTC by default, unless someone explicitly requested that. Maybe
> something related to the fbdev emulation layer, but I'm not sure.

Thanks for the tip, this was definitely the cause of the writeback
connector being attached to the CRTC at boot.

I have just sent out a patch to blacklist writeback connectors in fbdev.

I am not sure it's worth keeping this patch around if that issue is to
be fixed in the kernel directly. It also conflicts with the upcoming
writeback series in IGT.

Cheers,

Paul

> > Because IGT configures all the available planes, this plane is no
> > longer associated with the writeback CRTC. The connector remains
> > associated with the CRTC as the core does not automatically clean it up=
.
> > IGT is not aware of the writeback connector (hidden by default), so it
> > does not detach the CRTC. As a result, the atomic commit fails because
> > the CRTC is moving to a disabled state with a connector still attached.
> >=20
> > Fix this issue by setting the writeback connector cap before getting
> > DRM resources so that the connector can be discovered and the CRTC
> > can be detached by IGT. Since it requires atomic support, make it
> > conditional and move the atomic capability before getting DRM resources=
.
> >=20
> > The associated cap definitions are also updated to include the required
> > writeback one.
> >=20
> > Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > ---
> >  include/drm-uapi/drm.h | 16 ++++++++++++++++
> >  lib/igt_kms.c          |  8 ++++++--
>=20
> Looks like [1] is doing pretty much the same thing.
>=20
> [1]https://patchwork.freedesktop.org/patch/260289/
--=20
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com

--=-wed76e4yXvCnmp11s/v/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAlvtoHAACgkQ3cLmz3+f
v9E8mAf/dc5jIXA5q7Pn1E0+FTNDSsCf9ef+1BnhQL+oW+ODhI8tAHk3knqnc6ox
dWmit9vCghq4KPLLr8VJY3yz15EUaBIHevCpX8/1Rw562GuUr8RWtkTnles/YHjy
kusCtAg2XkgI6I8OSuzVQWmvT4lEdJ2yBw3YF2VMTRH4PPifEFEXc8upHpuZZ16B
2KEn9WM7DIkBSNbZPvDzOKxFLiYTAP3IApLN3LVZ98yXyCCGT3LAtb8nEy2JD85e
lZmXYaynywPH5+LHyUPTf3PQCaAKkDWz5JK0wcM4TYKb285yqdhBrzhnyxtOjHO/
XruuLb6HkgQHS9TvUYGBP0uBNod5WA==
=3ezy
-----END PGP SIGNATURE-----

--=-wed76e4yXvCnmp11s/v/--


--===============0366495635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0366495635==--
