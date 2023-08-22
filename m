Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1C510E352
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Aug 2023 13:26:36 +0000 (UTC)
Date: Tue, 22 Aug 2023 15:26:28 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Harry Wentland <harry.wentland@amd.com>
Message-ID: <z63pwygl73s6tdiusqx7vxu7ara6eung3l6bkaa4ffy4twwau2@iidh6mhtqq7c>
References: <20230816205316.867195-1-alex.hung@amd.com>
 <20230816205316.867195-3-alex.hung@amd.com>
 <5zt2ctyod27qaw7sld4ejvvemgxm6chh4dtf7cnjiil2rizksm@bfiezcb3zo3q>
 <5cd3fc34-f6c7-21ff-f710-cb3f543fcb80@amd.com>
 <sa6iblbqyfnu4oropbazlakghwh3ekcnajojmj4th4bswjqlxg@sfmkfo7d7tsj>
 <28f80f34-c7a9-44c8-a33a-6ded92458e29@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o5ipwzcwyti5v5um"
Content-Disposition: inline
In-Reply-To: <28f80f34-c7a9-44c8-a33a-6ded92458e29@amd.com>
Subject: Re: [igt-dev] [PATCH 3/3] tests/kms_writeback: support
 DRM_FORMAT_XRGB2101010 for writeback
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, brian.starkey@arm.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--o5ipwzcwyti5v5um
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 10:15:04AM -0400, Harry Wentland wrote:
>=20
>=20
> On 2023-08-17 03:50, Maxime Ripard wrote:
> > On Thu, Aug 17, 2023 at 01:09:44AM -0600, Alex Hung wrote:
> >>
> >>
> >> On 2023-08-17 00:32, Maxime Ripard wrote:
> >>> Hi,
> >>>
> >>> On Wed, Aug 16, 2023 at 02:53:16PM -0600, Alex Hung wrote:
> >>>> Allow kms_writeback to run with DRM_FORMAT_XRGB8888 if supported
> >>>> or to try DRM_FORMAT_XRGB2101010 if DRM_FORMAT_XRGB8888 is not
> >>>> available.
> >>>
> >>> XRGB8888 is always supposed to be available, if it's not, it's a driv=
er
> >>> issue. Which means that XRGB2101010 will never actually be tested.
> >>
> >> It is up to a device driver to support specific format(s), not necessa=
ry an
> >> issue. At least for now amdgpu won't support XRGB8888 but XRGB2101010.
> >=20
> > I guess it's unrelated to that patch in particular, but it's not ok from
> > a KMS standpoint. It was poorly documented before, but see
> >=20
> > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_fb_h=
elper.c#L430
> > https://lore.kernel.org/dri-devel/20230807140317.26146-2-jfalempe@redha=
t.com/
> >=20
>=20
> Our HW writeback can't do 8888. This would be a silly reason to not be
> able to use it for testing purposes.

Ah, right, sorry for the brainfart.

> I don't even understand what "SW Color Conversion" means here. Is it
> expected that drivers use CPU code in kernel to walk the buffer and
> "color convert" from XRGB8888 to whatever the HW supports (and the
> inverse for the writeback buffer)? That seems a bit ridiculous.

That's exactly what that means. We have a bunch of helpers to do that
already, used for example by simpledrm if it's backed by a different
format. See:
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_format_h=
elper.c#L914

Maxime

--o5ipwzcwyti5v5um
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOS3hAAKCRDj7w1vZxhR
xdyPAQDhNlTdD5NdXM5F6FY1XbSs2YK2++hLhVDGkBLKDCLmbwEA+rDvmWHIKDdA
YMobISCU+GdDZ+omNWetyIEIBd2lSQ0=
=UDry
-----END PGP SIGNATURE-----

--o5ipwzcwyti5v5um--
