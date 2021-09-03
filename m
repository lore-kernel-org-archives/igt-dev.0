Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143F76E8A7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 15:14:04 +0000 (UTC)
Date: Fri, 3 Sep 2021 18:14:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YTI7uMGds5/lGIhM@intel.com>
References: <20210514132643.30709-1-ville.syrjala@linux.intel.com>
 <20210514132643.30709-2-ville.syrjala@linux.intel.com>
 <DM8PR11MB5719FC27CFD8565570B9BD2D8DCF9@DM8PR11MB5719.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <DM8PR11MB5719FC27CFD8565570B9BD2D8DCF9@DM8PR11MB5719.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] tests/kms_color: Refactor invalid
 LUT size tests
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

On Fri, Sep 03, 2021 at 05:04:30AM +0000, Modem, Bhanuprakash wrote:
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Ville
> > Syrjala
> > Sent: Friday, May 14, 2021 6:57 PM
> > To: igt-dev@lists.freedesktop.org
> > Subject: [igt-dev] [PATCH i-g-t 1/4] tests/kms_color: Refactor invalid =
LUT
> > size tests
> >=20
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >=20
> > Reuse the same code for all invalid LUT size tests.
> >=20
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  tests/kms_color_helper.c | 81 +++++++++++++---------------------------
> >  1 file changed, 26 insertions(+), 55 deletions(-)
> >=20
> > diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
> > index 5f223a88129f..f9fde340f4b7 100644
> > --- a/tests/kms_color_helper.c
> > +++ b/tests/kms_color_helper.c
> > @@ -277,77 +277,48 @@ pipe_set_property_blob(igt_pipe_t *pipe,
> >  				       COMMIT_ATOMIC : COMMIT_LEGACY);
> >  }
> >=20
> > -void
> > -invalid_gamma_lut_sizes(data_t *data)
> > +static void
> > +invalid_lut_sizes(data_t *data, enum igt_atomic_crtc_properties prop, =
int
> > size)
> >  {
> >  	igt_display_t *display =3D &data->display;
> >  	igt_pipe_t *pipe =3D &display->pipes[0];
> > -	size_t gamma_lut_size =3D data->gamma_lut_size *
> > -				sizeof(struct drm_color_lut);
> > -	struct drm_color_lut *gamma_lut;
> > +	struct drm_color_lut *lut;
> > +	size_t lut_size =3D size * sizeof(lut[0]);
> >=20
> > -	igt_require(igt_pipe_obj_has_prop(pipe, IGT_CRTC_GAMMA_LUT));
> > +	igt_require(igt_pipe_obj_has_prop(pipe, prop));
> >=20
> > -	gamma_lut =3D malloc(gamma_lut_size * 2);
> > +	lut =3D malloc(lut_size * 2);
> >=20
> >  	igt_display_commit2(display,
> >  			    display->is_atomic ?
> >  			    COMMIT_ATOMIC : COMMIT_LEGACY);
> >=20
> > -	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_GAMMA_LUT,
> > -					     gamma_lut, 1), -EINVAL);
> > -	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_GAMMA_LUT,
> > -					     gamma_lut, gamma_lut_size + 1),
> > -					     -EINVAL);
> > -	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_GAMMA_LUT,
> > -					     gamma_lut, gamma_lut_size - 1),
> > -					     -EINVAL);
> > -	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_GAMMA_LUT,
> > -					     gamma_lut, gamma_lut_size +
> > -					     sizeof(struct drm_color_lut)),
> > -					     -EINVAL);
> > -	igt_assert_eq(pipe_set_property_blob_id(pipe, IGT_CRTC_GAMMA_LUT,
> > -		      pipe->crtc_id), -EINVAL);
> > -	igt_assert_eq(pipe_set_property_blob_id(pipe, IGT_CRTC_GAMMA_LUT,
> > -		      4096 * 4096), -EINVAL);
> > +	igt_assert_eq(pipe_set_property_blob(pipe, prop, lut,
> > +					     1), -EINVAL);
> > +	igt_assert_eq(pipe_set_property_blob(pipe, prop, lut,
> > +					     lut_size + 1), -EINVAL);
> > +	igt_assert_eq(pipe_set_property_blob(pipe, prop, lut,
> > +					     lut_size - 1), -EINVAL);
> > +	igt_assert_eq(pipe_set_property_blob(pipe, prop, lut,
> > +					     lut_size + sizeof(struct drm_color_lut)), -
> > EINVAL);
> > +	igt_assert_eq(pipe_set_property_blob_id(pipe, prop,
> > +						pipe->crtc_id), -EINVAL);
> > +	igt_assert_eq(pipe_set_property_blob_id(pipe, prop,
> > +						4096 * 4096), -EINVAL);
> >=20
> > -	free(gamma_lut);
> > +	free(lut);
> > +}
> > +
> > +void
> > +invalid_gamma_lut_sizes(data_t *data)
> > +{
> > +	return invalid_lut_sizes(data, IGT_CRTC_GAMMA_LUT, data-
> > >gamma_lut_size);
> =20
> data->gamma_lut_size can be NULL.
>=20
> gamma_lut_size in struct data_t is not initialized before calling the
> invalid_gamma_lut_sizes()=20
>=20
> igt_runner will run gamma test first which will cache gamma_lut_size &
> then try to run the size tests, so we didn't see any issue.
> If we try to run the size tests alone, we may get improper result.
>=20
> Anyway it is not related this patch, but we must fix this at caller.

Hmm. Right. I think what we want to do is run the invalid LUT size tests
for each pipe since each pipe can have different LUT sizes. Currently we
just run them for pipe A.

--=20
Ville Syrj=E4l=E4
Intel
