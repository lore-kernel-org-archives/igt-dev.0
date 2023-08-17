Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A6310E1BD
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 07:50:49 +0000 (UTC)
Date: Thu, 17 Aug 2023 09:50:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Alex Hung <alex.hung@amd.com>
Message-ID: <sa6iblbqyfnu4oropbazlakghwh3ekcnajojmj4th4bswjqlxg@sfmkfo7d7tsj>
References: <20230816205316.867195-1-alex.hung@amd.com>
 <20230816205316.867195-3-alex.hung@amd.com>
 <5zt2ctyod27qaw7sld4ejvvemgxm6chh4dtf7cnjiil2rizksm@bfiezcb3zo3q>
 <5cd3fc34-f6c7-21ff-f710-cb3f543fcb80@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2a6rrkvgqjevzhke"
Content-Disposition: inline
In-Reply-To: <5cd3fc34-f6c7-21ff-f710-cb3f543fcb80@amd.com>
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


--2a6rrkvgqjevzhke
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 01:09:44AM -0600, Alex Hung wrote:
>=20
>=20
> On 2023-08-17 00:32, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Wed, Aug 16, 2023 at 02:53:16PM -0600, Alex Hung wrote:
> > > Allow kms_writeback to run with DRM_FORMAT_XRGB8888 if supported
> > > or to try DRM_FORMAT_XRGB2101010 if DRM_FORMAT_XRGB8888 is not
> > > available.
> >=20
> > XRGB8888 is always supposed to be available, if it's not, it's a driver
> > issue. Which means that XRGB2101010 will never actually be tested.
>=20
> It is up to a device driver to support specific format(s), not necessary =
an
> issue. At least for now amdgpu won't support XRGB8888 but XRGB2101010.

I guess it's unrelated to that patch in particular, but it's not ok from
a KMS standpoint. It was poorly documented before, but see

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_fb_helpe=
r.c#L430
https://lore.kernel.org/dri-devel/20230807140317.26146-2-jfalempe@redhat.co=
m/

> > I think we should make a proper test for that format, instead of a
> > (silent) fallback?
>=20
> Not sure what's the proper test or the fallback you are referring to. The
> intention here is to test XRGB2101010 when possible without breaking the
> original behaviours for XRGB8888.

Right, but you're not even testing that XRGB2101010 is actually there,
so if amdgpu format listing was somehow broken and you were to expose
XRGB8888 instead of XRGB2101010, you wouldn't notice. That's not great.

> Changing kms_writeback to tests multiple formats requires significant
> modifications and tests which requires a driver capable of multiple forma=
ts
> in the first place.

That's fine, amdgpu will be that driver.

Maxime

--2a6rrkvgqjevzhke
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZN3RUwAKCRDj7w1vZxhR
xWS6AQC397kVPgpIsWMMyHJahLfqUO2SBAqDpYdD+/OURQnnegEA72stUuIExrFZ
CtdYba/zOh5/LH6eDe7d+Qk/gS9wDgM=
=5Y8k
-----END PGP SIGNATURE-----

--2a6rrkvgqjevzhke--
