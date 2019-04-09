Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E5A891D5
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2019 15:00:00 +0000 (UTC)
Date: Tue, 9 Apr 2019 16:59:56 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190409145956.tginpkhkhs4chhkf@flea>
References: <20190405125216.6133-1-maarten.lankhorst@linux.intel.com>
 <0fca59efb26b8d319b1e90619697400ae818fe3e.camel@bootlin.com>
 <c2d9d711-74a8-faaf-2230-eb157ce9a3d0@linux.intel.com>
 <20190408085035.jduw3j5wcjm7dbpt@flea>
 <691be880-dcd1-76ad-5c9d-175c5e078a77@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <691be880-dcd1-76ad-5c9d-175c5e078a77@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: Use cairo conversion in
 igt_fb_convert_with_stride, v3.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0405400190=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0405400190==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2mdrnyonzpjoeucx"
Content-Disposition: inline


--2mdrnyonzpjoeucx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 08, 2019 at 01:04:42PM +0200, Maarten Lankhorst wrote:
> Op 08-04-2019 om 10:50 schreef Maxime Ripard:
> > On Fri, Apr 05, 2019 at 05:38:32PM +0200, Maarten Lankhorst wrote:
> >> Op 05-04-2019 om 15:54 schreef Paul Kocialkowski:
> >>> Hi,
> >>>
> >>> Le vendredi 05 avril 2019 =E0 14:52 +0200, Maarten Lankhorst a =E9cri=
t :
> >>>> Ever since commit 3fa65f4b532bd9a5b ("fb: Add support for conversions
> >>>> through pixman") we can generate a valid cairo surface for any plane,
> >>>> use this to avoid having to implement our own conversion routine.
> >>>>
> >>>> Instead of duplicating this functionality in igt_fb_convert_with_str=
ide,
> >>>> we can simply convert this to a few cairo calls, because we now supp=
ort
> >>>> cairo calls to any of the supported framebuffer formats.
> >>> I don't think this is the case: cairo *only* takes linear buffers, so
> >>> we need the explicit tiling conversion step after having converted to=
 a
> >>> new format with fb_convert. I don't see how it could work otherwise.
> >>>
> >>> Note that in igt, we're only interested in converting from linear to
> >>> tiled, not the other way round (for now, at least), so that's the
> >>> pipeline that the helper asssumes.
> >> We have code to handle this exact conversion in i-g-t already, both
> >> ways, see igt_get_cairo_surface(). :)
> >>
> >> You should be able to extend create_cairo_surface__convert() to
> >> handle broadcom tiling as well,
> >>
> >> I didn't see a function to convert from tiled to untiled, else I
> >> would have plugged it in for you.
> > That might be a bit dumb, but why do we need to use cairo all the
> > time in the first place?
> >
> > That seems like a waste of resources when the only thing you want to
> > do is a conversion of one buffer to the other.
>
> Cairo doesn't have its own internal buffer format, it uses the same pixman
> calls that igt_fb_convert_with_stride does, so it's not less efficient.
>
> The extra trip to convert the src buffer back after it's read from, or the
> unnecessary conversion of the target buffer before it's overwritten it wi=
th
> src buffer contents might be less efficient, but I don't think it's worth
> optimizing it.

Right, but I wasn't so much talking about the number of buffers, but
more about the function calls overhead.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--2mdrnyonzpjoeucx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXKyzbAAKCRDj7w1vZxhR
xbvsAP91XR4HWeTU5Sfsn/9YqbPDbse6vI83bojGiFArBHGsbAD/SY8rA2Rf+/mK
sZ2o4pB+x806EDv5sSgvdeKtprrMAAw=
=qwL0
-----END PGP SIGNATURE-----

--2mdrnyonzpjoeucx--

--===============0405400190==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0405400190==--
