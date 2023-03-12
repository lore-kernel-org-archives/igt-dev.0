Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1424610E3C2
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Mar 2023 16:13:29 +0000 (UTC)
Date: Sun, 12 Mar 2023 15:13:24 -0100
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>
Message-ID: <20230312161324.gxmmjquu3ydh4q6v@mail.igalia.com>
References: <20230214114211.96481-1-mwen@igalia.com>
 <c1032148-8dc0-fe98-4feb-b60f078093b9@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bhxc2qbqgsse3l3i"
Content-Disposition: inline
In-Reply-To: <c1032148-8dc0-fe98-4feb-b60f078093b9@amd.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/amdgpu/amd_color: check supported
 color prop before running tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--bhxc2qbqgsse3l3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03/06, Alex Hung wrote:
>=20
>=20
> On 2023-02-14 19:42, Melissa Wen wrote:
> > If a DRM CRTC color prop is not advertised, the test should skip instead
> > of fail. It currently fits DCE case. The driver doesn't support user
> > degamma, therefore, DRM CRTC degamma properties are disabled in the
> > kernel driver [1]. Previously the test just fails on DCE because the
> > driver advertises degamma props although user degamma isn't supported by
> > HW. Now we can just skip the test in case of a missing color prop
> > support.
> >=20
> > [1] https://lore.kernel.org/dri-devel/20221103184500.14450-1-mwen@igali=
a.com/
> >=20
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >   tests/amdgpu/amd_color.c | 36 ++++++++++++++++++++++++++----------
> >   1 file changed, 26 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
> > index defe57bd..2dbc3dfb 100644
> > --- a/tests/amdgpu/amd_color.c
> > +++ b/tests/amdgpu/amd_color.c
> > @@ -196,14 +196,6 @@ static void test_init(data_t *data)
> >   	igt_output_set_pipe(data->output, data->pipe_id);
> > -	data->degamma_lut_size =3D
> > -		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT_SIZE);
> > -	igt_assert_lt(0, data->degamma_lut_size);
> > -
> > -	data->regamma_lut_size =3D
> > -		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_GAMMA_LUT_SIZE);
> > -	igt_assert_lt(0, data->regamma_lut_size);
> > -
> >   	data->w =3D data->mode->hdisplay;
> >   	data->h =3D data->mode->vdisplay;
> >   }
> > @@ -221,6 +213,8 @@ static void test_fini(data_t *data)
> >    * matrix if not passed any. The whole pipe should be in linear bypas=
s mode
> >    * when all the matrices are NULL - CRCs for a linear degamma matrix =
and
> >    * a NULL one should match.
> > + *
> > + * This test skips on DCE because it doesn't support user degamma.
> >    */
> >   static void test_crtc_linear_degamma(data_t *data)
> >   {
> > @@ -231,6 +225,12 @@ static void test_crtc_linear_degamma(data_t *data)
> >   	test_init(data);
> > +	igt_require(igt_pipe_obj_has_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT));
> > +
> > +	data->degamma_lut_size =3D
> > +		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT_SIZE);
> > +	igt_assert_lt(0, data->degamma_lut_size);
> > +
> >   	lut_init(&lut_linear, data->degamma_lut_size);
> >   	lut_gen_linear(&lut_linear, 0xffff);
> > @@ -252,6 +252,8 @@ static void test_crtc_linear_degamma(data_t *data)
> >   	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
> >   	igt_assert_crc_equal(&ref_crc, &new_crc);
> > +	igt_pipe_obj_replace_prop_blob(data->pipe, IGT_CRTC_DEGAMMA_LUT, NULL=
, 0);
> > +
>=20
> These are not wrong, but isn't using "set_degamma_lut(data, NULL)" more
> symmetric?
>=20
> This also applies to other igt_pipe_obj_replace_prop_blob(data->pipe,
> IGT_CRTC_DEGAMMA_LUT/IGT_CRTC_GAMMA_LUT, NULL, 0) below:
>=20
> >   	test_fini(data);
> >   	igt_remove_fb(data->fd, &afb);
> >   	lut_free(&lut_linear);
> > @@ -273,6 +275,13 @@ static void test_crtc_linear_regamma(data_t *data)
> >   	test_init(data);
> > +	igt_require(igt_pipe_obj_has_prop(data->pipe, IGT_CRTC_GAMMA_LUT));
> > +
> > +
> > +	data->regamma_lut_size =3D
> > +		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_GAMMA_LUT_SIZE);
> > +	igt_assert_lt(0, data->regamma_lut_size);
> > +
> >   	lut_init(&lut_linear, data->regamma_lut_size);
> >   	lut_gen_linear(&lut_linear, 0xffff);
> > @@ -282,7 +291,6 @@ static void test_crtc_linear_regamma(data_t *data)
> >   	/* Draw the reference image. */
> >   	igt_plane_set_fb(data->primary, &afb);
> >   	set_regamma_lut(data, NULL);
> > -	set_degamma_lut(data, NULL);
>=20
> The set_degamma_lut is removed in test_crtc_linear_regamma(). Will it be a
> good idea to remove set_regamma_lut in earlier function
> test_crtc_linear_degamma() as well?
>=20
> >   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NU=
LL);
> >   	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
> > @@ -294,6 +302,8 @@ static void test_crtc_linear_regamma(data_t *data)
> >   	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
> >   	igt_assert_crc_equal(&ref_crc, &new_crc);
> > +	igt_pipe_obj_replace_prop_blob(data->pipe, IGT_CRTC_GAMMA_LUT, NULL, =
0);
> > +
>=20
> set_regamma_lut(data, NULL);
>=20
> >   	test_fini(data);
> >   	igt_remove_fb(data->fd, &afb);
> >   	lut_free(&lut_linear);
> > @@ -305,7 +315,7 @@ static void test_crtc_linear_regamma(data_t *data)
> >    * being CRC level accurate across a full test gradient but most valu=
es should
> >    * still match.
> >    *
> > - * This test can't pass on DCE because it doesn't support non-linear d=
egamma.
> > + * This test skips on DCE because it doesn't support user degamma.
> >    */
> >   static void test_crtc_lut_accuracy(data_t *data)
> >   {
> > @@ -331,6 +341,9 @@ static void test_crtc_lut_accuracy(data_t *data)
> >   	test_init(data);
> > +	igt_require(igt_pipe_obj_has_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT));
> > +	igt_require(igt_pipe_obj_has_prop(data->pipe, IGT_CRTC_GAMMA_LUT));
> > +
> >   	lut_init(&lut_degamma, data->degamma_lut_size);
> >   	lut_gen_degamma_srgb(&lut_degamma, 0xffff);
> > @@ -369,6 +382,9 @@ static void test_crtc_lut_accuracy(data_t *data)
> >   		igt_assert_crc_equal(&ref_crc, &new_crc);
> >   	}
> > +	igt_pipe_obj_replace_prop_blob(data->pipe, IGT_CRTC_GAMMA_LUT, NULL, =
0);
> > +	igt_pipe_obj_replace_prop_blob(data->pipe, IGT_CRTC_DEGAMMA_LUT, NULL=
, 0);
> > +
>=20
> set_regamma_lut(data, NULL);
> set_degamma_lut(data, NULL);

Hi Alex,

You're right. I just sent a v2 addressing your feedback.

Thanks for reviewing it,

Melissa

>=20
> >   	test_fini(data);
> >   	igt_remove_fb(data->fd, &afb);
> >   	lut_free(&lut_regamma);

--bhxc2qbqgsse3l3i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmQN+hkACgkQwqF3j0dL
ehx0Kw//Qga8ErRGPoeuimNZnR2iC+tCBqc3AjEtKiT1hRlrCoGcQZvCWo+4dB0x
c84Bw9JaniJzffXKfaZGXwa/UAhU1XPyGEC0nDToqamTbiJ93CO3NYh4mThu3OxD
RJcRGJrGhGPmyfZDvUV4JIhj6MjDGWk0iA0LNONvXnhZuEaf6bBFg1kSua3E8jOz
EQBUlfpn0O81x2QIX14hK5GgtA20qFmqHX3iCLE0kKbdIZ6xPnC+gj9WNDuZcTqU
veDdCpa/6rf7SV6oez1ldzl2uenVfBJv/WR1DpHIzRwZk7Whf0z55bflGKnpHBgj
uf9YGBUPbQpNw9RYMb9KbMzvBFh8B0jX4iLJJKdUHt1pFhs+sh7ALavLh+ADkqJA
FVvuSd4Jfud7SJ/LvR1P+fX8jqFHBxMGzelRDYjPOUAbmjof0rQuugVY5a59+lPf
zMY6Cgg8hJl3AQ9bZqyWvCNkXe+BYXYKnkRil+y+yGBIgpeeov55ZapGjXr7mB1I
pwYUSmoqTP1UeYdVcaxZVqo/MZZv9JMj67YNZhAZ5VuC8mURTFQWYqadSOkTz1xz
1StF97DGZWWwocG4YPFwmMeVMxF53MeioB5ebIzwQ4RMhxHKTXV0IqxWBg4v7H3t
vMyw6ZwqoJDJ4oHqHYpVwYqSoHBG9ANltfGkHrf5KApIC8/uM/A=
=Og3T
-----END PGP SIGNATURE-----

--bhxc2qbqgsse3l3i--
