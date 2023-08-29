Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C13810E1F7
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 10:45:15 +0000 (UTC)
Date: Tue, 29 Aug 2023 09:44:58 -0100
From: Melissa Wen <mwen@igalia.com>
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Message-ID: <20230829104458.nd5igqrsgjpxzuvg@mail.igalia.com>
References: <20230824161524.14083-1-mwen@igalia.com>
 <cd8c0bf6-30a4-47f5-9eff-fe9d0e554cbd@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jpjupeglpbq4wynd"
Content-Disposition: inline
In-Reply-To: <cd8c0bf6-30a4-47f5-9eff-fe9d0e554cbd@amd.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_atomic: remove zpos <
 N-planes assert
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, igt-dev@lists.freedesktop.org,
 kernel-dev@igalia.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--jpjupeglpbq4wynd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/24, Rodrigo Siqueira Jordao wrote:
>=20
>=20
> On 8/24/23 10:15, Melissa Wen wrote:
> > Generalize plane-immutable-zpos test case by removing not-required
> > assert. zpos < N-planes is a condition not required by DRM
> > documentation. Removing this validation doesn't affect the test purpose
> > on verifying that planes with higher zpos always cover those with lower
> > zpos. Also, this assert doesn't fit driver's configuration where the
> > range of plane zpos is just defined by the plane type but its max value
> > doesn't need to be normalized to the number of planes in a CRTC, for
> > example, a cursor plane with the highest possible zpos value.
> >=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >   tests/kms_atomic.c | 1 -
> >   1 file changed, 1 deletion(-)
> >=20
> > diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> > index 22ddf5633..6986864f3 100644
> > --- a/tests/kms_atomic.c
> > +++ b/tests/kms_atomic.c
> > @@ -458,7 +458,6 @@ plane_immutable_zpos(igt_display_t *display, igt_pi=
pe_t *pipe,
> >   			continue;
> >   		zpos =3D igt_plane_get_prop(temp, IGT_PLANE_ZPOS);
> > -		igt_assert_lt(zpos, n_planes);
> >   		plane_ptr[zpos] =3D temp;
> >   	}
>=20
> lgtm,
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Applied, thanks.

--jpjupeglpbq4wynd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmTtzCUACgkQwqF3j0dL
ehwxaQ/7BPYLwYJ81R8uOVehIPYMNfEC03sKUAMEF3eKjgVetlneBSNB+YxSvwaO
2dUiAnxwaCWJce8kr5QHylJia0NV3NYjN/KS4fR9ogvW3B3c27s3Fup7HR/tfOdR
m6nM2yTUB3eWNRO0cK6vHQRGeik/0SQmsPokYyVOQkPGayImAydfNPKFjm59ImAD
Mw0aM8OR6RoLgHejE96BZ4xO4dBpSsNqmaZ8H2tDM8q4kAVyDUziT6axP3fkNeFN
lA1bkTBpXZwsYn5qmkq0YkzzswOyZHPTMwboQfDFs18J/w8SMAnObq22MUNuJ7+g
9E7VPSLFJ+Zs6X/mmaJpHD+C7YnRjHF+KlZBghdcYL6amVK9tfNKX8lLxLla+QhL
0tUzQgTkOJW+uLkuFcTvRwYhLroaJlIkz3oTl4PX76flqADJvnfaH04//Js0uKm4
9kliz3U4zE0YOo5s8chiAb72TcLbbGsFUn/KwzxdAhc7Gl2grS6gMeUQ+A+ehGPE
+1p219xAxig/a7neWw6ZfEhC5k84ZJtE9+IGtWJdy8G2kyTTm48aXThOW9cBzFEj
vdb8DabF7Dbi+mW3lv449DbG6KmFXR70VJ9dL2E+d122DbKEZCvAxPAMhck7AbJU
cKcb9azcXcKQ2gogdQc2yXUGcu0g4qhkWEVhpxK8Hw12xVZBVgE=
=Vh87
-----END PGP SIGNATURE-----

--jpjupeglpbq4wynd--
