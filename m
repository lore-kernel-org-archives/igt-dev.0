Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BD06E08E
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Sep 2021 17:26:57 +0000 (UTC)
Date: Tue, 7 Sep 2021 20:26:53 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YTeg3Yi6Q1vX+Pd0@intel.com>
References: <20210903162743.29851-1-ville.syrjala@linux.intel.com>
 <20210903162743.29851-5-ville.syrjala@linux.intel.com>
 <DM8PR11MB571939F2C5F6BFCF7A7D80C68DD29@DM8PR11MB5719.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <DM8PR11MB571939F2C5F6BFCF7A7D80C68DD29@DM8PR11MB5719.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 4/7] tests/kms_color: Pass pipe to
 invalid LUT size tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 06, 2021 at 06:37:39AM +0000, Modem, Bhanuprakash wrote:
> > From: Ville Syrjala <ville.syrjala@linux.intel.com>
> > Sent: Friday, September 3, 2021 9:58 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> > Subject: [PATCH i-g-t v3 4/7] tests/kms_color: Pass pipe to invalid LUT=
 size
> > tests
> >=20
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >=20
> > Each pipe can have a different LUT sizes, so run the invalid LUT
> > size tests once for each pipe.
> >=20
> > This also makes sure data->(de)gamma_lut_size are properly initialized
> > prior to running these subtests.
> >=20
> > Cc: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  tests/kms_color.c        | 73 +++++++++++++++++++++++++---------------
> >  tests/kms_color_helper.c | 17 +++++-----
> >  tests/kms_color_helper.h |  7 ++--
> >  3 files changed, 58 insertions(+), 39 deletions(-)
> >=20
> > diff --git a/tests/kms_color.c b/tests/kms_color.c
> > index 9105076aba4f..dabc6963e9e0 100644
> > --- a/tests/kms_color.c
> > +++ b/tests/kms_color.c
> > @@ -638,6 +638,26 @@ static void test_pipe_limited_range_ctm(data_t *da=
ta,
> >  }
> >  #endif
> >=20
> > +static void
> > +prep_pipe(data_t *data, enum pipe p)
> > +{
> > +	igt_require_pipe(&data->display, p);
> > +
> > +	if (igt_pipe_obj_has_prop(&data->display.pipes[p],
> > IGT_CRTC_DEGAMMA_LUT_SIZE)) {
> > +		data->degamma_lut_size =3D
> > +			igt_pipe_obj_get_prop(&data->display.pipes[p],
> > +					      IGT_CRTC_DEGAMMA_LUT_SIZE);
> > +		igt_assert_lt(0, data->degamma_lut_size);
> > +	}
> > +
> > +	if (igt_pipe_obj_has_prop(&data->display.pipes[p],
> > IGT_CRTC_GAMMA_LUT_SIZE)) {
> > +		data->gamma_lut_size =3D
> > +			igt_pipe_obj_get_prop(&data->display.pipes[p],
> > +					      IGT_CRTC_GAMMA_LUT_SIZE);
> > +		igt_assert_lt(0, data->gamma_lut_size);
> > +	}
> > +}
> > +
> >  static void
> >  run_tests_for_pipe(data_t *data, enum pipe p)
> >  {
> > @@ -652,10 +672,10 @@ run_tests_for_pipe(data_t *data, enum pipe p)
> >  	};
> >=20
> >  	igt_fixture {
> > +		prep_pipe(data, p);
> > +
> >  		igt_require_pipe_crc(data->drm_fd);
> >=20
> > -		igt_require_pipe(&data->display, p);
> > -
> >  		pipe =3D &data->display.pipes[p];
> >  		igt_require(pipe->n_planes >=3D 0);
> >=20
> > @@ -665,20 +685,6 @@ run_tests_for_pipe(data_t *data, enum pipe p)
> >  						  primary->pipe->pipe,
> >  						  INTEL_PIPE_CRC_SOURCE_AUTO);
> >=20
> > -		if (igt_pipe_obj_has_prop(&data->display.pipes[p],
> > IGT_CRTC_DEGAMMA_LUT_SIZE)) {
> > -			data->degamma_lut_size =3D
> > -				igt_pipe_obj_get_prop(&data->display.pipes[p],
> > -						      IGT_CRTC_DEGAMMA_LUT_SIZE);
> > -			igt_assert_lt(0, data->degamma_lut_size);
> > -		}
> > -
> > -		if (igt_pipe_obj_has_prop(&data->display.pipes[p],
> > IGT_CRTC_GAMMA_LUT_SIZE)) {
> > -			data->gamma_lut_size =3D
> > -				igt_pipe_obj_get_prop(&data->display.pipes[p],
> > -						      IGT_CRTC_GAMMA_LUT_SIZE);
> > -			igt_assert_lt(0, data->gamma_lut_size);
> > -		}
> > -
> >  		igt_display_require_output_on_pipe(&data->display, p);
> >  	}
> >=20
> > @@ -865,6 +871,25 @@ run_tests_for_pipe(data_t *data, enum pipe p)
> >  	}
> >  }
> >=20
> > +static void
> > +run_invalid_tests_for_pipe(data_t *data, enum pipe p)
> > +{
> > +	igt_fixture
> > +		prep_pipe(data, p);
> > +
> > +	igt_describe("Negative check for invalid gamma lut sizes");
> > +	igt_subtest_f("pipe-%s-invalid-gamma-lut-sizes", kmstest_pipe_name(p))
> > +		invalid_gamma_lut_sizes(data, p);
> > +
> > +	igt_describe("Negative check for invalid degamma lut sizes");
> > +	igt_subtest_f("pipe-%s-invalid-degamma-lut-sizes", kmstest_pipe_name(=
p))
> > +		invalid_degamma_lut_sizes(data, p);
> > +
> > +	igt_describe("Negative check for color tranformation matrix sizes");
> > +	igt_subtest_f("pipe-%s-invalid-ctm-matrix-sizes", kmstest_pipe_name(p=
))
> > +		invalid_ctm_matrix_sizes(data, p);
> > +}
> > +
> >  igt_main
> >  {
> >  	data_t data =3D {};
> > @@ -879,21 +904,13 @@ igt_main
> >  		igt_display_require(&data.display, data.drm_fd);
> >  	}
> >=20
> > -	for_each_pipe_static(pipe)
> > +	for_each_pipe_static(pipe) {
> >  		igt_subtest_group
> >  			run_tests_for_pipe(&data, pipe);
> >=20
> > -	igt_describe("Negative check for invalid gamma lut sizes");
> > -	igt_subtest_f("pipe-invalid-gamma-lut-sizes")
> > -		invalid_gamma_lut_sizes(&data);
> > -
> > -	igt_describe("Negative check for invalid degamma lut sizes");
> > -	igt_subtest_f("pipe-invalid-degamma-lut-sizes")
> > -		invalid_degamma_lut_sizes(&data);
> > -
> > -	igt_describe("Negative check for color tranformation matrix sizes");
> > -	igt_subtest_f("pipe-invalid-ctm-matrix-sizes")
> > -		invalid_ctm_matrix_sizes(&data);
> > +		igt_subtest_group
> > +			run_invalid_tests_for_pipe(&data, pipe);
> > +	}
> >=20
> >  	igt_fixture {
> >  		igt_display_fini(&data.display);
> > diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
> > index 8b08cdaeea5f..d71e7bb2e6f9 100644
> > --- a/tests/kms_color_helper.c
> > +++ b/tests/kms_color_helper.c
> > @@ -287,10 +287,11 @@ pipe_set_property_blob(igt_pipe_t *pipe,
> >  }
> >=20
> >  static void
> > -invalid_lut_sizes(data_t *data, enum igt_atomic_crtc_properties prop, =
int
> > size)
> > +invalid_lut_sizes(data_t *data, enum pipe p,
> > +		  enum igt_atomic_crtc_properties prop, int size)
> >  {
> >  	igt_display_t *display =3D &data->display;
> > -	igt_pipe_t *pipe =3D &display->pipes[0];
> > +	igt_pipe_t *pipe =3D &display->pipes[p];
> >  	struct drm_color_lut *lut;
> >  	size_t lut_size =3D size * sizeof(lut[0]);
> >=20
> > @@ -319,21 +320,21 @@ invalid_lut_sizes(data_t *data, enum
> > igt_atomic_crtc_properties prop, int size)
> >  }
> >=20
> >  void
> > -invalid_gamma_lut_sizes(data_t *data)
> > +invalid_gamma_lut_sizes(data_t *data, enum pipe p)
> >  {
> > -	invalid_lut_sizes(data, IGT_CRTC_GAMMA_LUT, data->gamma_lut_size);
> > +	invalid_lut_sizes(data, p, IGT_CRTC_GAMMA_LUT, data->gamma_lut_size);
> =20
> Still, it is possible to get data->gamma_lut_size as NULL, b'coz prep_pip=
e()
> will not initialize if GAMMA_LUT_SIZE prop is not present.
>=20
> `igt_require(data->gamma_lut_size);` or
> `igt_require(igt_pipe_obj_has_prop(p, IGT_CRTC_GAMMA_LUT_SIZE));` before
> calling invalid_lut_sizes() can fix this.

invalid_lut_sizes() already has the necessary igt_require().

>=20
> >  }
> >=20
> >  void
> > -invalid_degamma_lut_sizes(data_t *data)
> > +invalid_degamma_lut_sizes(data_t *data, enum pipe p)
> >  {
> > -	invalid_lut_sizes(data, IGT_CRTC_DEGAMMA_LUT, data->degamma_lut_size);
> > +	invalid_lut_sizes(data, p, IGT_CRTC_DEGAMMA_LUT, data-
> > >degamma_lut_size);
> =20
> Please consider the above comment.
>=20
> With above change, this patch is
> Reviewed-by: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>
>=20
> - Bhanu
>=20
> >  }
> >=20
> > -void invalid_ctm_matrix_sizes(data_t *data)
> > +void invalid_ctm_matrix_sizes(data_t *data, enum pipe p)
> >  {
> >  	igt_display_t *display =3D &data->display;
> > -	igt_pipe_t *pipe =3D &display->pipes[0];
> > +	igt_pipe_t *pipe =3D &display->pipes[p];
> >  	void *ptr;
> >=20
> >  	igt_require(igt_pipe_obj_has_prop(pipe, IGT_CRTC_CTM));
> > diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
> > index 3f49e7cae4c0..bb6f0054f388 100644
> > --- a/tests/kms_color_helper.h
> > +++ b/tests/kms_color_helper.h
> > @@ -103,8 +103,9 @@ int pipe_set_property_blob_id(igt_pipe_t *pipe,
> >  int pipe_set_property_blob(igt_pipe_t *pipe,
> >  			   enum igt_atomic_crtc_properties prop,
> >  			   void *ptr, size_t length);
> > -void invalid_gamma_lut_sizes(data_t *data);
> > -void invalid_degamma_lut_sizes(data_t *data);
> > -void invalid_ctm_matrix_sizes(data_t *data);
> > +void invalid_gamma_lut_sizes(data_t *data, enum pipe p);
> > +void invalid_degamma_lut_sizes(data_t *data, enum pipe p);
> > +void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
> > +
> >  #endif
> >=20
> > --
> > 2.31.1
>=20

--=20
Ville Syrj=E4l=E4
Intel
