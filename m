Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD8C10E2E1
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 21:14:01 +0000 (UTC)
Message-ID: <9170d2eb9dc14fd75ff725dd9d81d39e65dc9835.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: juhapekka.heikkila@gmail.com, igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 23:13:57 +0200
In-Reply-To: <6ec7408d-7916-32e4-ff90-d02518b015c5@gmail.com>
References: <20230116203923.6292-1-juhapekka.heikkila@gmail.com>
 <00de8b4c21589dde63708d0ae6226f6ccf172156.camel@coelho.fi>
 <6ec7408d-7916-32e4-ff90-d02518b015c5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_plane_scaling: add invalid
 parameter tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 2023-01-17 at 23:03 +0200, Juha-Pekka Heikkila wrote:
> Hi Luca, thanks for looking into this.
>=20
> On 17.1.2023 14.29, Luca Coelho wrote:
> > On Mon, 2023-01-16 at 22:39 +0200, Juha-Pekka Heikkila wrote:
> > > Add skeleton for adding invalid parameter tests and add two tests whi=
ch are
> > > expected to return -EINVAL or -ERANGE
> > >=20
> > > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > ---
> >=20
> > Looks good! Though I have a few nitpicks and/or questions below.
> >=20
> >=20
> > >   tests/kms_plane_scaling.c | 73 ++++++++++++++++++++++++++++++++++++=
+++
> > >   1 file changed, 73 insertions(+)
> > >=20
> > > diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> > > index 887a55e63..4ec660bc9 100644
> > > --- a/tests/kms_plane_scaling.c
> > > +++ b/tests/kms_plane_scaling.c
> > > @@ -819,6 +819,77 @@ static void test_scaler_with_multi_pipe_plane(da=
ta_t *d)
> > >   	igt_assert_eq(ret1 && ret2, 0);
> > >   }
> > >  =20
> > > +static void invalid_parameter_tests(data_t *d) {
> > > +	enum pipe pipe =3D PIPE_A;
> > > +	igt_output_t *output;
> > > +	igt_fb_t fb;
> > > +	igt_plane_t* plane;
> > > +	int32_t rval;
> >=20
> > I'm not sure what the conventions are, but AFAICT
> > igt_display_try_commit2() is defined as returning int, and all the
> > other ret values in the code here are using "int ret".  Wouldn't it be
> > better for consistency?
>=20
> Yea, I guess it is better to call int as int.
>=20
> >=20
> >=20
> > > +
> > > +	const struct {
> > > +		const char* testname;
> > > +		uint32_t planesize[2];
> > > +		struct {
> > > +			enum igt_atomic_plane_properties prop;
> > > +			uint32_t value;
> > > +		} params[8];
> > > +	} paramtests[] =3D {
> > > +		{
> > > +			.testname =3D "less-than-1-height-src",
> > > +			.planesize =3D {256, 8},
> > > +			.params =3D {{IGT_PLANE_SRC_H, IGT_FIXED(0, 30) }, {~0}}
> > > +		},
> > > +		{
> > > +			.testname =3D "less-than-1-width-src",
> > > +			.planesize =3D {8, 256},
> > > +			.params =3D {{IGT_PLANE_SRC_W, IGT_FIXED(0, 30) }, {~0}}
> > > +		},
> > > +	};
> >=20
> > Why are these defined as locals? Wouldn't it be better to make them
> > global, if not for more readability, at least for consistency?
>=20
> Not sure why should these be global? On igt tests you'll see similar=20
> structures both global and local, for example kms_cursor_crc or=20
> kms_rotation_crc has similar tables defined locally but on kms_ccs I=20
> moved test defining table from local to global because it was needed to=
=20
> be accessed globally. Usually I try to avoid putting things global when=
=20
> not needed.

Well, you're making them constant, so it really makes no difference in
practice, because it will end up in the same text_section in memory as
if you had defined them as global consts outside the function.

I was just thinking that it would be a bit easier to read if you had
them outside the function.  But if there is common precedent for doing
this, who am I to say otherwise? =F0=9F=98=89


> > > +
> > > +	igt_fixture {
> > > +		output =3D igt_get_single_output_for_pipe(&d->display, pipe);
> > > +		igt_require(output);
> > > +
> > > +		igt_output_set_pipe(output, pipe);
> > > +		plane =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY=
);
> > > +
> > > +		igt_create_fb(d->drm_fd, 256, 256,
> > > +			DRM_FORMAT_XRGB8888,
> > > +			DRM_FORMAT_MOD_NONE,
> > > +			&fb);
> > > +	}
> > > +
> > > +	igt_subtest_group {
> >=20
> > Why do you need a group with a single subtest?
>=20
> This was forgotten here :) I earlier had those fixtures inside group but=
=20
> then reshaped and moved them around a bit.

--
Cheers,
Luca.
