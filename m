Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E924389704
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2019 09:27:36 +0000 (UTC)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 13EF53A1A64
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2019 08:50:57 +0000 (UTC)
Date: Mon, 8 Apr 2019 10:50:35 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190408085035.jduw3j5wcjm7dbpt@flea>
References: <20190405125216.6133-1-maarten.lankhorst@linux.intel.com>
 <0fca59efb26b8d319b1e90619697400ae818fe3e.camel@bootlin.com>
 <c2d9d711-74a8-faaf-2230-eb157ce9a3d0@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <c2d9d711-74a8-faaf-2230-eb157ce9a3d0@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: Use cairo conversion in
 igt_fb_convert_with_stride, v3.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0894451451=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0894451451==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6pklomendler3qyp"
Content-Disposition: inline


--6pklomendler3qyp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maarten

On Fri, Apr 05, 2019 at 05:38:32PM +0200, Maarten Lankhorst wrote:
> Op 05-04-2019 om 15:54 schreef Paul Kocialkowski:
> > Hi,
> >
> > Le vendredi 05 avril 2019 =E0 14:52 +0200, Maarten Lankhorst a =E9crit :
> >> Ever since commit 3fa65f4b532bd9a5b ("fb: Add support for conversions
> >> through pixman") we can generate a valid cairo surface for any plane,
> >> use this to avoid having to implement our own conversion routine.
> >>
> >> Instead of duplicating this functionality in igt_fb_convert_with_strid=
e,
> >> we can simply convert this to a few cairo calls, because we now support
> >> cairo calls to any of the supported framebuffer formats.
> > I don't think this is the case: cairo *only* takes linear buffers, so
> > we need the explicit tiling conversion step after having converted to a
> > new format with fb_convert. I don't see how it could work otherwise.
> >
> > Note that in igt, we're only interested in converting from linear to
> > tiled, not the other way round (for now, at least), so that's the
> > pipeline that the helper asssumes.
>
> We have code to handle this exact conversion in i-g-t already, both
> ways, see igt_get_cairo_surface(). :)
>
> You should be able to extend create_cairo_surface__convert() to
> handle broadcom tiling as well,
>
> I didn't see a function to convert from tiled to untiled, else I
> would have plugged it in for you.

That might be a bit dumb, but why do we need to use cairo all the
time in the first place?

That seems like a waste of resources when the only thing you want to
do is a conversion of one buffer to the other.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--6pklomendler3qyp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKsLWwAKCRDj7w1vZxhR
xXemAP9Mt+q0xHRkiHyFyOuDjtQSujYUL6AKikYXyOSy7OG9TQEA4FyRj/4QbyMk
lA/wOghb+hM8Ssn+utmbITgdlOnHEAQ=
=6/N9
-----END PGP SIGNATURE-----

--6pklomendler3qyp--

--===============0894451451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0894451451==--
