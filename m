Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0D96E4BB
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2019 19:46:54 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 2 Apr 2019 19:46:51 +0000
Message-ID: <0c028d738deadaa8fca6506738870547e07bd96b.camel@intel.com>
References: <20190328222827.18099-1-jose.souza@intel.com>
 <005633a0c49a33e66edd4d823f63828917cd565f.camel@intel.com>
In-Reply-To: <005633a0c49a33e66edd4d823f63828917cd565f.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/frontbuffer_tracking: Do not
 assert FBC state after a page flip changing stride
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0190335127=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0190335127==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-MiGY3Y8gk63WBLfu7Nqw"

--=-MiGY3Y8gk63WBLfu7Nqw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-02 at 11:49 -0700, Dhinakaran Pandiyan wrote:
> On Thu, 2019-03-28 at 15:28 -0700, Jos=C3=A9 Roberto de Souza wrote:
> > When the stridechange subtest was introduced f23ea58f1fbb
> > ("kms_frontbuffer_tracking: expand badstride and stridechange")
> > atomic was not around and change the stride using drmModePageFlip()
> > was not allowed so it was expected that it would return -EINVAL and
> > kernel would keep the old framebuffer with the smaller plane that
> > is
> > know to fit on CFB(if it don't fit the test will skip on the first
> > full-modeset because "not enough stolen memory" is set).
> >=20
> > But after the introduction of atomic the subtest was updated by
> > f63e070b469d ("kms_frontbuffer_tracking: Fix tests with the new
> > atomic reality.") to accept a no error return from
> > drmModePageFlip()
> > but the do_assertions() that follows it was not updated.
> > As the subtest function comment states, kernel will do fastsets in
> > this scenario and the allocated CFB could not be enough to keep FBC
> > enabled over the new framebuffer, so here adding the missing
> > DONT_ASSERT_FEATURE_STATUS to ignore the FBC state and just test if
> > CRC match and if kernel do not misbehave.
> >=20
> > Other way to solve this issue would be make the kernel do a
> > full-modeset when CFB is not enough for the new plane so FBC is
> > disabled with the CRC freeing the actual CFB and then after enable
> > CRTC again it will try to enable FBC again if it can allocate the
> > required CFB but by the subtest comment this is not intended.
> >=20
> > Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D105683
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> > ---
> >  tests/kms_frontbuffer_tracking.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/tests/kms_frontbuffer_tracking.c
> > b/tests/kms_frontbuffer_tracking.c
> > index 4d15ce1c..087fc473 100644
> > --- a/tests/kms_frontbuffer_tracking.c
> > +++ b/tests/kms_frontbuffer_tracking.c
> > @@ -2950,7 +2950,7 @@ static void stridechange_subtest(const struct
> > test_mode
> > *t)
> >  	 */
> >  	rc =3D drmModePageFlip(drm.fd, drm.display.pipes[params-
> > >pipe].crtc_id,
> > new_fb->fb_id, 0, NULL);
> >  	igt_assert(rc =3D=3D -EINVAL || rc =3D=3D 0);
> > -	do_assertions(0);
> > +	do_assertions(DONT_ASSERT_FEATURE_STATUS);
> The assertion is still valid if the page flip ioctl failed, isn't it?

Huum yeah, I guess non-atomic drivers would also return a error before
changing the hardware state.

So change to:

do_assertions(rc ? 0 : DONT_ASSERT_FEATURE_STATUS);


>=20
> -DK
>=20
> >  }
> > =20
> >  /**

--=-MiGY3Y8gk63WBLfu7Nqw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyjvCoACgkQVenbO/mO
Wkm6+Qf/a5ZL6CT75BQfAtAWuwdkJrY9KNIOfOp12TaURvHBEy7G5TaHjDqyW6HS
xINrfDGcjD1eFPycgwH12iAQ5/V82M+HTJ0wmo9Tw/WPxCjo6XNks0z4LjBsIqHV
mmadTBdA7vVElIgljUMmoEtxqHuQyJU1u0NvfcFuSqqp+qHU/BI7BfEUwbnCPlzk
8R0RSgXVedxi3AT/fcMQgqror8B0V1gxKBI6+OC9C7Z5rhj1eMR0/jpkgyX11cmW
wIoJHbaejSb0DUuHef83AHprRJ3H4geenGtTGP3s/AzZ6mPv+yY1GfSJX87hA+d1
sJTl/iWOL4TzDMCGxfTX1+ULAlLOjA==
=evcj
-----END PGP SIGNATURE-----

--=-MiGY3Y8gk63WBLfu7Nqw--

--===============0190335127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0190335127==--
