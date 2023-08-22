Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B05A10E378
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Aug 2023 14:20:53 +0000 (UTC)
Date: Tue, 22 Aug 2023 16:14:11 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Alex Hung <alex.hung@amd.com>
Message-ID: <k6cahbb4qc3pxiyexroh2egb7dhrb4ljf6hqaffdwrmsfxzkzg@xjifh5hbu5bt>
References: <20230816205316.867195-1-alex.hung@amd.com>
 <20230816205316.867195-3-alex.hung@amd.com>
 <5zt2ctyod27qaw7sld4ejvvemgxm6chh4dtf7cnjiil2rizksm@bfiezcb3zo3q>
 <5cd3fc34-f6c7-21ff-f710-cb3f543fcb80@amd.com>
 <sa6iblbqyfnu4oropbazlakghwh3ekcnajojmj4th4bswjqlxg@sfmkfo7d7tsj>
 <28f80f34-c7a9-44c8-a33a-6ded92458e29@amd.com>
 <b5a1c8f7-0748-d3bb-fc8c-8cbee32e5168@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sabas7spgqzguwfp"
Content-Disposition: inline
In-Reply-To: <b5a1c8f7-0748-d3bb-fc8c-8cbee32e5168@amd.com>
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


--sabas7spgqzguwfp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 10:22:56AM -0600, Alex Hung wrote:
> > > > > I think we should make a proper test for that format, instead of a
> > > > > (silent) fallback?
> > > >=20
> > > > Not sure what's the proper test or the fallback you are referring t=
o. The
> > > > intention here is to test XRGB2101010 when possible without breakin=
g the
> > > > original behaviours for XRGB8888.
> > >=20
> > > Right, but you're not even testing that XRGB2101010 is actually there,
> > > so if amdgpu format listing was somehow broken and you were to expose
> > > XRGB8888 instead of XRGB2101010, you wouldn't notice. That's not grea=
t.
>=20
> Only XRGB2101010 is supported.
>=20
> > > > Changing kms_writeback to tests multiple formats requires significa=
nt
> > > > modifications and tests which requires a driver capable of multiple=
 formats
> > > > in the first place.
> > >=20
> > > That's fine, amdgpu will be that driver.
>=20
> The purpose of this patch is to improve kms_writeback coverage:
>=20
> - check XRGB8888, and test if supported or skip otherwise
> to
> - no XRGB8888? also check XRGB2101010, and test if supported or skip
> otherwise
>=20
> For amdgpu, no writeback -> support XRGB2101010 in writeback.
>=20
> XRGB2101010 will be used for testing. XRGB8888 may or may not be added la=
ter
> depending on whether there will be consumers of the feature but that is o=
ut
> of scope of this IGT patch.

My point is the fallback doesn't provide anything, and is harmful to
some extent. So far, we have some hardware that support XRGB8888 only,
and some that support XRGB2101010 only.

There's no point in falling back from one to the other, and if we ever
have hardware that would support both it prevents from checking both.

And sure, we could address it then, or we could address it now. It's
just adding an extra parameter to a couple of functions and a few new
subtests, it's not like we need to rewrite the whole thing.

Maxime

--sabas7spgqzguwfp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOTCswAKCRDj7w1vZxhR
xUpxAQC684Vq/B8QK+z9yS+3MX08A/ZHa1lnChKNK/C/NjNkWgD8CPXR80DcYxSx
bEBRFJGZUl60yrlycVLt+MVa2TykWA4=
=o0mk
-----END PGP SIGNATURE-----

--sabas7spgqzguwfp--
