Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9C46E02A
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Sep 2021 15:36:22 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Sun, 12 Sep 2021 15:36:19 +0000
Message-ID: <DM8PR11MB571904ADF3819C3AC6AB13748DD89@DM8PR11MB5719.namprd11.prod.outlook.com>
References: <20210903162743.29851-1-ville.syrjala@linux.intel.com>
 <20210903162743.29851-6-ville.syrjala@linux.intel.com>
 <DM8PR11MB571907CF887F2CBAFC65A24F8DD29@DM8PR11MB5719.namprd11.prod.outlook.com>
 <YTeitC71qNjpahfk@intel.com>
In-Reply-To: <YTeitC71qNjpahfk@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 5/7] tests/kms_color: Run each
 subtest only for a single connector
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Tuesday, September 7, 2021 11:05 PM
> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t v3 5/7] tests/kms_color: Run each subtest only =
for a
> single connector
>=20
> On Mon, Sep 06, 2021 at 06:38:26AM +0000, Modem, Bhanuprakash wrote:
> > > From: Ville Syrjala <ville.syrjala@linux.intel.com>
> > > Sent: Friday, September 3, 2021 9:58 PM
> > > To: igt-dev@lists.freedesktop.org
> > > Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> > > Subject: [PATCH i-g-t v3 5/7] tests/kms_color: Run each subtest only =
for a
> > > single connector
> > >
> > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > >
> > > For most of the subtests the used connector should not matter,
> > > so run each subtest just for a single connector.
> > >
> > > Suggested-by: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>
> > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > ---
> > >  tests/kms_color.c | 612 +++++++++++++++++++++++---------------------=
--
> > >  1 file changed, 306 insertions(+), 306 deletions(-)
> > >
> > > diff --git a/tests/kms_color.c b/tests/kms_color.c
> > > index dabc6963e9e0..d78c7e211511 100644
> > > --- a/tests/kms_color.c
> > > +++ b/tests/kms_color.c
> > > @@ -37,6 +37,10 @@ static void test_pipe_degamma(data_t *data,
> > >  		{ 0.0, 1.0, 0.0 },
> > >  		{ 0.0, 0.0, 1.0 }
> > >  	};
> > > +	drmModeModeInfo *mode;
> > > +	struct igt_fb fb_modeset, fb;
> > > +	igt_crc_t crc_fullgamma, crc_fullcolors;
> > > +	int fb_id, fb_modeset_id;
> > >
> > >  	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_L=
UT));
> > >  	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT=
));
> > > @@ -44,69 +48,65 @@ static void test_pipe_degamma(data_t *data,
> > >  	degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
> > >  	degamma_full =3D generate_table_max(data->degamma_lut_size);
> > >
> > > -	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe,
> > > output) {
> > > -		drmModeModeInfo *mode;
> > > -		struct igt_fb fb_modeset, fb;
> > > -		igt_crc_t crc_fullgamma, crc_fullcolors;
> > > -		int fb_id, fb_modeset_id;
> > > +	output =3D igt_get_single_output_for_pipe(&data->display, primary->=
pipe-
> > > >pipe);
> > > +	igt_require(output);
> > >
> > > -		igt_output_set_pipe(output, primary->pipe->pipe);
> > > -		mode =3D igt_output_get_mode(output);
> > > +	igt_output_set_pipe(output, primary->pipe->pipe);
> > > +	mode =3D igt_output_get_mode(output);
> > >
> > > -		/* Create a framebuffer at the size of the output. */
> > > -		fb_id =3D igt_create_fb(data->drm_fd,
> > > +	/* Create a framebuffer at the size of the output. */
> > > +	fb_id =3D igt_create_fb(data->drm_fd,
> > > +			      mode->hdisplay,
> > > +			      mode->vdisplay,
> > > +			      DRM_FORMAT_XRGB8888,
> > > +			      DRM_FORMAT_MOD_NONE,
> > > +			      &fb);
> > > +	igt_assert(fb_id);
> >
> > Minor: we can get rid of extra variables by updating like
> > `igt_assert(igt_create_fb());`
>=20
> I'm not going to be doing any unrelated changes in this
> patch. The indentation change alone is already bad enough
> to review.
>=20
> >
> > And this is applicable for all the places.
> >
> > > +
> > > +	fb_modeset_id =3D igt_create_fb(data->drm_fd,
> > >  				      mode->hdisplay,
> > >  				      mode->vdisplay,
> > >  				      DRM_FORMAT_XRGB8888,
> > >  				      DRM_FORMAT_MOD_NONE,
> > > -				      &fb);
> > > -		igt_assert(fb_id);
> > > +				      &fb_modeset);
> > > +	igt_assert(fb_modeset_id);
> > >
> > > -		fb_modeset_id =3D igt_create_fb(data->drm_fd,
> > > -					      mode->hdisplay,
> > > -					      mode->vdisplay,
> > > -					      DRM_FORMAT_XRGB8888,
> > > -					      DRM_FORMAT_MOD_NONE,
> > > -					      &fb_modeset);
> > > -		igt_assert(fb_modeset_id);
> > > +	igt_plane_set_fb(primary, &fb_modeset);
> > > +	disable_ctm(primary->pipe);
> > > +	disable_gamma(primary->pipe);
> > > +	set_degamma(data, primary->pipe, degamma_linear);
> > > +	igt_display_commit(&data->display);
> > >
> > > -		igt_plane_set_fb(primary, &fb_modeset);
> > > -		disable_ctm(primary->pipe);
> > > -		disable_gamma(primary->pipe);
> > > -		set_degamma(data, primary->pipe, degamma_linear);
> > > -		igt_display_commit(&data->display);
> > > +	/* Draw solid colors with linear degamma transformation. */
> > > +	paint_rectangles(data, mode, red_green_blue, &fb);
> > > +	igt_plane_set_fb(primary, &fb);
> > > +	igt_display_commit(&data->display);
> > > +	igt_wait_for_vblank(data->drm_fd,
> > > +			    display->pipes[primary->pipe->pipe].crtc_offset);
> > > +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
> > >
> > > -		/* Draw solid colors with linear degamma transformation. */
> > > -		paint_rectangles(data, mode, red_green_blue, &fb);
> > > -		igt_plane_set_fb(primary, &fb);
> > > -		igt_display_commit(&data->display);
> > > -		igt_wait_for_vblank(data->drm_fd,
> > > -				display->pipes[primary->pipe->pipe].crtc_offset);
> > > -		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
> > > +	/* Draw a gradient with degamma LUT to remap all
> > > +	 * values to max red/green/blue.
> > > +	 */
> > > +	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
> > > +	igt_plane_set_fb(primary, &fb);
> > > +	set_degamma(data, primary->pipe, degamma_full);
> > > +	igt_display_commit(&data->display);
> > > +	igt_wait_for_vblank(data->drm_fd,
> > > +			    display->pipes[primary->pipe->pipe].crtc_offset);
> > > +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
> > >
> > > -		/* Draw a gradient with degamma LUT to remap all
> > > -		 * values to max red/green/blue.
> > > -		 */
> > > -		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
> > > -		igt_plane_set_fb(primary, &fb);
> > > -		set_degamma(data, primary->pipe, degamma_full);
> > > -		igt_display_commit(&data->display);
> > > -		igt_wait_for_vblank(data->drm_fd,
> > > -				display->pipes[primary->pipe->pipe].crtc_offset);
> > > -		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
> > > +	/* Verify that the CRC of the software computed output is
> > > +	 * equal to the CRC of the degamma LUT transformation output.
> > > +	 */
> > > +	igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
> > >
> > > -		/* Verify that the CRC of the software computed output is
> > > -		 * equal to the CRC of the degamma LUT transformation output.
> > > -		 */
> > > -		igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
> > > -
> > > -		disable_degamma(primary->pipe);
> > > -		igt_plane_set_fb(primary, NULL);
> > > -		igt_output_set_pipe(output, PIPE_NONE);
> > > -		igt_display_commit(&data->display);
> > > -		igt_remove_fb(data->drm_fd, &fb);
> > > -		igt_remove_fb(data->drm_fd, &fb_modeset);
> > > -	}
> > > +	disable_degamma(primary->pipe);
> > > +	igt_plane_set_fb(primary, NULL);
> > > +	igt_output_set_pipe(output, PIPE_NONE);
> > > +	igt_display_commit(&data->display);
> > > +	igt_remove_fb(data->drm_fd, &fb);
> > > +	igt_remove_fb(data->drm_fd, &fb_modeset);
> > >
> > >  	free_lut(degamma_linear);
> > >  	free_lut(degamma_full);
> > > @@ -127,73 +127,73 @@ static void test_pipe_gamma(data_t *data,
> > >  		{ 0.0, 1.0, 0.0 },
> > >  		{ 0.0, 0.0, 1.0 }
> > >  	};
> > > +	drmModeModeInfo *mode;
> > > +	struct igt_fb fb_modeset, fb;
> > > +	igt_crc_t crc_fullgamma, crc_fullcolors;
> > > +	int fb_id, fb_modeset_id;
> > >
> > >  	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT=
));
> > >
> > >  	gamma_full =3D generate_table_max(data->gamma_lut_size);
> > >
> > > -	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe,
> > > output) {
> > > -		drmModeModeInfo *mode;
> > > -		struct igt_fb fb_modeset, fb;
> > > -		igt_crc_t crc_fullgamma, crc_fullcolors;
> > > -		int fb_id, fb_modeset_id;
> > > +	output =3D igt_get_single_output_for_pipe(&data->display, primary->=
pipe-
> > > >pipe);
> > > +	igt_require(output);
> > >
> > > -		igt_output_set_pipe(output, primary->pipe->pipe);
> > > -		mode =3D igt_output_get_mode(output);
> > > +	igt_output_set_pipe(output, primary->pipe->pipe);
> > > +	mode =3D igt_output_get_mode(output);
> > >
> > > -		/* Create a framebuffer at the size of the output. */
> > > -		fb_id =3D igt_create_fb(data->drm_fd,
> > > +	/* Create a framebuffer at the size of the output. */
> > > +	fb_id =3D igt_create_fb(data->drm_fd,
> > > +			      mode->hdisplay,
> > > +			      mode->vdisplay,
> > > +			      DRM_FORMAT_XRGB8888,
> > > +			      DRM_FORMAT_MOD_NONE,
> > > +			      &fb);
> > > +	igt_assert(fb_id);
> > > +
> > > +	fb_modeset_id =3D igt_create_fb(data->drm_fd,
> > >  				      mode->hdisplay,
> > >  				      mode->vdisplay,
> > >  				      DRM_FORMAT_XRGB8888,
> > >  				      DRM_FORMAT_MOD_NONE,
> > > -				      &fb);
> > > -		igt_assert(fb_id);
> > > +				      &fb_modeset);
> > > +	igt_assert(fb_modeset_id);
> > >
> > > -		fb_modeset_id =3D igt_create_fb(data->drm_fd,
> > > -					      mode->hdisplay,
> > > -					      mode->vdisplay,
> > > -					      DRM_FORMAT_XRGB8888,
> > > -					      DRM_FORMAT_MOD_NONE,
> > > -					      &fb_modeset);
> > > -		igt_assert(fb_modeset_id);
> > > +	igt_plane_set_fb(primary, &fb_modeset);
> > > +	disable_ctm(primary->pipe);
> > > +	disable_degamma(primary->pipe);
> > > +	set_gamma(data, primary->pipe, gamma_full);
> >
> > This could be disable_gamma(), right?
>=20
> Getting matching crcs has been rather problematic in this
> test. I don't recall the specifics on which LUT is needed
> in each case to guarantee that.
>=20
> >
> > > +	igt_display_commit(&data->display);
> > >
> > > -		igt_plane_set_fb(primary, &fb_modeset);
> > > -		disable_ctm(primary->pipe);
> > > -		disable_degamma(primary->pipe);
> > > -		set_gamma(data, primary->pipe, gamma_full);
> > > -		igt_display_commit(&data->display);
> > > +	/* Draw solid colors with no gamma transformation. */
> > > +	paint_rectangles(data, mode, red_green_blue, &fb);
> > > +	igt_plane_set_fb(primary, &fb);
> > > +	igt_display_commit(&data->display);
> > > +	igt_wait_for_vblank(data->drm_fd,
> > > +			    display->pipes[primary->pipe->pipe].crtc_offset);
> > > +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
> > >
> > > -		/* Draw solid colors with no gamma transformation. */
> > > -		paint_rectangles(data, mode, red_green_blue, &fb);
> > > -		igt_plane_set_fb(primary, &fb);
> > > -		igt_display_commit(&data->display);
> > > -		igt_wait_for_vblank(data->drm_fd,
> > > -				display->pipes[primary->pipe->pipe].crtc_offset);
> > > -		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
> > > +	/* Draw a gradient with gamma LUT to remap all values
> > > +	 * to max red/green/blue.
> > > +	 */
> > > +	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
> > > +	igt_plane_set_fb(primary, &fb);
> >
> > And here we need to set the gamma: set_gamma(gamma_max)
>=20
> Also a totally unrelated change. If you think there's a bug here
> pls submit a separate patch.

Sure I'll submit a new patch, I Think we are in good shape to merge
this series (I already reviewed remaining patches in this series).

- Bhanu

>=20
> >
> > With these changes, this patch is
> > Reviewed-by: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>
> >
> > - Bhanu
> >
> > > +	igt_display_commit(&data->display);
> > > +	igt_wait_for_vblank(data->drm_fd,
> > > +			    display->pipes[primary->pipe->pipe].crtc_offset);
> > > +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
> > >
> > > -		/* Draw a gradient with gamma LUT to remap all values
> > > -		 * to max red/green/blue.
> > > -		 */
> > > -		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
> > > -		igt_plane_set_fb(primary, &fb);
> > > -		igt_display_commit(&data->display);
> > > -		igt_wait_for_vblank(data->drm_fd,
> > > -				display->pipes[primary->pipe->pipe].crtc_offset);
> > > -		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
> > > +	/* Verify that the CRC of the software computed output is
> > > +	 * equal to the CRC of the gamma LUT transformation output.
> > > +	 */
> > > +	igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
> > >
> > > -		/* Verify that the CRC of the software computed output is
> > > -		 * equal to the CRC of the gamma LUT transformation output.
> > > -		 */
> > > -		igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
> > > -
> > > -		disable_gamma(primary->pipe);
> > > -		igt_plane_set_fb(primary, NULL);
> > > -		igt_output_set_pipe(output, PIPE_NONE);
> > > -		igt_display_commit(&data->display);
> > > -		igt_remove_fb(data->drm_fd, &fb);
> > > -		igt_remove_fb(data->drm_fd, &fb_modeset);
> > > -	}
> > > +	disable_gamma(primary->pipe);
> > > +	igt_plane_set_fb(primary, NULL);
> > > +	igt_output_set_pipe(output, PIPE_NONE);
> > > +	igt_display_commit(&data->display);
> > > +	igt_remove_fb(data->drm_fd, &fb);
> > > +	igt_remove_fb(data->drm_fd, &fb_modeset);
> > >
> > >  	free_lut(gamma_full);
> > >  }
> > > @@ -216,6 +216,10 @@ static void test_pipe_legacy_gamma(data_t *data,
> > >  	drmModeCrtc *kms_crtc;
> > >  	uint32_t i, legacy_lut_size;
> > >  	uint16_t *red_lut, *green_lut, *blue_lut;
> > > +	drmModeModeInfo *mode;
> > > +	struct igt_fb fb_modeset, fb;
> > > +	igt_crc_t crc_fullgamma, crc_fullcolors;
> > > +	int fb_id, fb_modeset_id;
> > >
> > >  	kms_crtc =3D drmModeGetCrtc(data->drm_fd, primary->pipe->crtc_id);
> > >  	legacy_lut_size =3D kms_crtc->gamma_size;
> > > @@ -225,80 +229,76 @@ static void test_pipe_legacy_gamma(data_t *data=
,
> > >  	green_lut =3D malloc(sizeof(uint16_t) * legacy_lut_size);
> > >  	blue_lut =3D malloc(sizeof(uint16_t) * legacy_lut_size);
> > >
> > > -	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe,
> > > output) {
> > > -		drmModeModeInfo *mode;
> > > -		struct igt_fb fb_modeset, fb;
> > > -		igt_crc_t crc_fullgamma, crc_fullcolors;
> > > -		int fb_id, fb_modeset_id;
> > > +	output =3D igt_get_single_output_for_pipe(&data->display, primary->=
pipe-
> > > >pipe);
> > > +	igt_require(output);
> > >
> > > -		igt_output_set_pipe(output, primary->pipe->pipe);
> > > -		mode =3D igt_output_get_mode(output);
> > > +	igt_output_set_pipe(output, primary->pipe->pipe);
> > > +	mode =3D igt_output_get_mode(output);
> > >
> > > -		/* Create a framebuffer at the size of the output. */
> > > -		fb_id =3D igt_create_fb(data->drm_fd,
> > > +	/* Create a framebuffer at the size of the output. */
> > > +	fb_id =3D igt_create_fb(data->drm_fd,
> > > +			      mode->hdisplay,
> > > +			      mode->vdisplay,
> > > +			      DRM_FORMAT_XRGB8888,
> > > +			      DRM_FORMAT_MOD_NONE,
> > > +			      &fb);
> > > +	igt_assert(fb_id);
> > > +
> > > +	fb_modeset_id =3D igt_create_fb(data->drm_fd,
> > >  				      mode->hdisplay,
> > >  				      mode->vdisplay,
> > >  				      DRM_FORMAT_XRGB8888,
> > >  				      DRM_FORMAT_MOD_NONE,
> > > -				      &fb);
> > > -		igt_assert(fb_id);
> > > -
> > > -		fb_modeset_id =3D igt_create_fb(data->drm_fd,
> > > -					      mode->hdisplay,
> > > -					      mode->vdisplay,
> > > -					      DRM_FORMAT_XRGB8888,
> > > -					      DRM_FORMAT_MOD_NONE,
> > > -					      &fb_modeset);
> > > -		igt_assert(fb_modeset_id);
> > > -
> > > -		igt_plane_set_fb(primary, &fb_modeset);
> > > -		disable_degamma(primary->pipe);
> > > -		disable_gamma(primary->pipe);
> > > -		disable_ctm(primary->pipe);
> > > -		igt_display_commit(&data->display);
> > > -
> > > -		/* Draw solid colors with no gamma transformation. */
> > > -		paint_rectangles(data, mode, red_green_blue, &fb);
> > > -		igt_plane_set_fb(primary, &fb);
> > > -		igt_display_commit(&data->display);
> > > -		igt_wait_for_vblank(data->drm_fd,
> > > -				display->pipes[primary->pipe->pipe].crtc_offset);
> > > -		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
> > > -
> > > -		/* Draw a gradient with gamma LUT to remap all values
> > > -		 * to max red/green/blue.
> > > -		 */
> > > -		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
> > > -		igt_plane_set_fb(primary, &fb);
> > > -
> > > -		red_lut[0] =3D green_lut[0] =3D blue_lut[0] =3D 0;
> > > -		for (i =3D 1; i < legacy_lut_size; i++)
> > > -			red_lut[i] =3D green_lut[i] =3D blue_lut[i] =3D 0xffff;
> > > -		igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe-
> > > >crtc_id,
> > > -						  legacy_lut_size, red_lut, green_lut,
> > > blue_lut), 0);
> > > -		igt_display_commit(&data->display);
> > > -		igt_wait_for_vblank(data->drm_fd,
> > > -				display->pipes[primary->pipe->pipe].crtc_offset);
> > > -		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
> > > -
> > > -		/* Verify that the CRC of the software computed output is
> > > -		 * equal to the CRC of the gamma LUT transformation output.
> > > -		 */
> > > -		igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
> > > -
> > > -		/* Reset output. */
> > > -		for (i =3D 1; i < legacy_lut_size; i++)
> > > -			red_lut[i] =3D green_lut[i] =3D blue_lut[i] =3D i << 8;
> > > -
> > > -		igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe-
> > > >crtc_id,
> > > -						  legacy_lut_size, red_lut, green_lut,
> > > blue_lut), 0);
> > > -		igt_display_commit(&data->display);
> > > -
> > > -		igt_plane_set_fb(primary, NULL);
> > > -		igt_output_set_pipe(output, PIPE_NONE);
> > > -		igt_remove_fb(data->drm_fd, &fb);
> > > -		igt_remove_fb(data->drm_fd, &fb_modeset);
> > > -	}
> > > +				      &fb_modeset);
> > > +	igt_assert(fb_modeset_id);
> > > +
> > > +	igt_plane_set_fb(primary, &fb_modeset);
> > > +	disable_degamma(primary->pipe);
> > > +	disable_gamma(primary->pipe);
> > > +	disable_ctm(primary->pipe);
> > > +	igt_display_commit(&data->display);
> > > +
> > > +	/* Draw solid colors with no gamma transformation. */
> > > +	paint_rectangles(data, mode, red_green_blue, &fb);
> > > +	igt_plane_set_fb(primary, &fb);
> > > +	igt_display_commit(&data->display);
> > > +	igt_wait_for_vblank(data->drm_fd,
> > > +			    display->pipes[primary->pipe->pipe].crtc_offset);
> > > +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
> > > +
> > > +	/* Draw a gradient with gamma LUT to remap all values
> > > +	 * to max red/green/blue.
> > > +	 */
> > > +	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
> > > +	igt_plane_set_fb(primary, &fb);
> > > +
> > > +	red_lut[0] =3D green_lut[0] =3D blue_lut[0] =3D 0;
> > > +	for (i =3D 1; i < legacy_lut_size; i++)
> > > +		red_lut[i] =3D green_lut[i] =3D blue_lut[i] =3D 0xffff;
> > > +	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc=
_id,
> > > +					  legacy_lut_size, red_lut, green_lut, blue_lut),
> > > 0);
> > > +	igt_display_commit(&data->display);
> > > +	igt_wait_for_vblank(data->drm_fd,
> > > +			    display->pipes[primary->pipe->pipe].crtc_offset);
> > > +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
> > > +
> > > +	/* Verify that the CRC of the software computed output is
> > > +	 * equal to the CRC of the gamma LUT transformation output.
> > > +	 */
> > > +	igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
> > > +
> > > +	/* Reset output. */
> > > +	for (i =3D 1; i < legacy_lut_size; i++)
> > > +		red_lut[i] =3D green_lut[i] =3D blue_lut[i] =3D i << 8;
> > > +
> > > +	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc=
_id,
> > > +					  legacy_lut_size, red_lut, green_lut, blue_lut),
> > > 0);
> > > +	igt_display_commit(&data->display);
> > > +
> > > +	igt_plane_set_fb(primary, NULL);
> > > +	igt_output_set_pipe(output, PIPE_NONE);
> > > +	igt_remove_fb(data->drm_fd, &fb);
> > > +	igt_remove_fb(data->drm_fd, &fb_modeset);
> > >
> > >  	free(red_lut);
> > >  	free(green_lut);
> > > @@ -331,93 +331,93 @@ static void test_pipe_legacy_gamma_reset(data_t
> *data,
> > >  		degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
> > >  	gamma_zero =3D generate_table_zero(data->gamma_lut_size);
> > >
> > > -	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe,
> > > output) {
> > > -		igt_output_set_pipe(output, primary->pipe->pipe);
> > > +	output =3D igt_get_single_output_for_pipe(&data->display, primary->=
pipe-
> > > >pipe);
> > > +	igt_require(output);
> > >
> > > -		/* Ensure we have a clean state to start with. */
> > > -		disable_degamma(primary->pipe);
> > > -		disable_ctm(primary->pipe);
> > > -		disable_gamma(primary->pipe);
> > > -		igt_display_commit(&data->display);
> > > +	igt_output_set_pipe(output, primary->pipe->pipe);
> > >
> > > -		/* Set a degama & gamma LUT and a CTM using the
> > > -		 * properties and verify the content of the
> > > -		 * properties. */
> > > -		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
> > > -			set_degamma(data, primary->pipe, degamma_linear);
> > > -		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
> > > -			set_ctm(primary->pipe, ctm_identity);
> > > -		set_gamma(data, primary->pipe, gamma_zero);
> > > -		igt_display_commit(&data->display);
> > > +	/* Ensure we have a clean state to start with. */
> > > +	disable_degamma(primary->pipe);
> > > +	disable_ctm(primary->pipe);
> > > +	disable_gamma(primary->pipe);
> > > +	igt_display_commit(&data->display);
> > >
> > > -		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT)) {
> > > -			blob =3D get_blob(data, primary->pipe, IGT_CRTC_DEGAMMA_LUT);
> > > -			igt_assert(blob &&
> > > -				   blob->length =3D=3D (sizeof(struct drm_color_lut) *
> > > -						    data->degamma_lut_size));
> > > -			drmModeFreePropertyBlob(blob);
> > > -		}
> > > +	/* Set a degama & gamma LUT and a CTM using the
> > > +	 * properties and verify the content of the
> > > +	 * properties. */
> > > +	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
> > > +		set_degamma(data, primary->pipe, degamma_linear);
> > > +	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
> > > +		set_ctm(primary->pipe, ctm_identity);
> > > +	set_gamma(data, primary->pipe, gamma_zero);
> > > +	igt_display_commit(&data->display);
> > >
> > > -		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM)) {
> > > -			blob =3D get_blob(data, primary->pipe, IGT_CRTC_CTM);
> > > -			igt_assert(blob &&
> > > -				   blob->length =3D=3D sizeof(struct drm_color_ctm));
> > > -			drmModeFreePropertyBlob(blob);
> > > -		}
> > > -
> > > -		blob =3D get_blob(data, primary->pipe, IGT_CRTC_GAMMA_LUT);
> > > +	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT)) {
> > > +		blob =3D get_blob(data, primary->pipe, IGT_CRTC_DEGAMMA_LUT);
> > >  		igt_assert(blob &&
> > >  			   blob->length =3D=3D (sizeof(struct drm_color_lut) *
> > > -					    data->gamma_lut_size));
> > > -		lut =3D (struct drm_color_lut *) blob->data;
> > > -		for (i =3D 0; i < data->gamma_lut_size; i++)
> > > -			igt_assert(lut[i].red =3D=3D 0 &&
> > > -				   lut[i].green =3D=3D 0 &&
> > > -				   lut[i].blue =3D=3D 0);
> > > +					    data->degamma_lut_size));
> > >  		drmModeFreePropertyBlob(blob);
> > > +	}
> > >
> > > -		/* Set a gamma LUT using the legacy ioctl and verify
> > > -		 * the content of the GAMMA_LUT property is changed
> > > -		 * and that CTM and DEGAMMA_LUT are empty. */
> > > -		kms_crtc =3D drmModeGetCrtc(data->drm_fd, primary->pipe->crtc_id);
> > > -		legacy_lut_size =3D kms_crtc->gamma_size;
> > > -		drmModeFreeCrtc(kms_crtc);
> > > +	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM)) {
> > > +		blob =3D get_blob(data, primary->pipe, IGT_CRTC_CTM);
> > > +		igt_assert(blob &&
> > > +			   blob->length =3D=3D sizeof(struct drm_color_ctm));
> > > +		drmModeFreePropertyBlob(blob);
> > > +	}
> > >
> > > -		red_lut =3D malloc(sizeof(uint16_t) * legacy_lut_size);
> > > -		green_lut =3D malloc(sizeof(uint16_t) * legacy_lut_size);
> > > -		blue_lut =3D malloc(sizeof(uint16_t) * legacy_lut_size);
> > > +	blob =3D get_blob(data, primary->pipe, IGT_CRTC_GAMMA_LUT);
> > > +	igt_assert(blob &&
> > > +		   blob->length =3D=3D (sizeof(struct drm_color_lut) *
> > > +				    data->gamma_lut_size));
> > > +	lut =3D (struct drm_color_lut *) blob->data;
> > > +	for (i =3D 0; i < data->gamma_lut_size; i++)
> > > +		igt_assert(lut[i].red =3D=3D 0 &&
> > > +			   lut[i].green =3D=3D 0 &&
> > > +			   lut[i].blue =3D=3D 0);
> > > +	drmModeFreePropertyBlob(blob);
> > >
> > > -		for (i =3D 0; i < legacy_lut_size; i++)
> > > -			red_lut[i] =3D green_lut[i] =3D blue_lut[i] =3D 0xffff;
> > > +	/* Set a gamma LUT using the legacy ioctl and verify
> > > +	 * the content of the GAMMA_LUT property is changed
> > > +	 * and that CTM and DEGAMMA_LUT are empty. */
> > > +	kms_crtc =3D drmModeGetCrtc(data->drm_fd, primary->pipe->crtc_id);
> > > +	legacy_lut_size =3D kms_crtc->gamma_size;
> > > +	drmModeFreeCrtc(kms_crtc);
> > >
> > > -		igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd,
> > > -						  primary->pipe->crtc_id,
> > > -						  legacy_lut_size,
> > > -						  red_lut, green_lut, blue_lut),
> > > -			      0);
> > > -		igt_display_commit(&data->display);
> > > +	red_lut =3D malloc(sizeof(uint16_t) * legacy_lut_size);
> > > +	green_lut =3D malloc(sizeof(uint16_t) * legacy_lut_size);
> > > +	blue_lut =3D malloc(sizeof(uint16_t) * legacy_lut_size);
> > >
> > > -		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
> > > -			igt_assert(get_blob(data, primary->pipe,
> > > -					    IGT_CRTC_DEGAMMA_LUT) =3D=3D NULL);
> > > +	for (i =3D 0; i < legacy_lut_size; i++)
> > > +		red_lut[i] =3D green_lut[i] =3D blue_lut[i] =3D 0xffff;
> > >
> > > -		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
> > > -			igt_assert(get_blob(data, primary->pipe, IGT_CRTC_CTM) =3D=3D
> > > NULL);
> > > +	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd,
> > > +					  primary->pipe->crtc_id,
> > > +					  legacy_lut_size,
> > > +					  red_lut, green_lut, blue_lut), 0);
> > > +	igt_display_commit(&data->display);
> > >
> > > -		blob =3D get_blob(data, primary->pipe, IGT_CRTC_GAMMA_LUT);
> > > -		igt_assert(blob &&
> > > -			   blob->length =3D=3D (sizeof(struct drm_color_lut) *
> > > -					    legacy_lut_size));
> > > -		lut =3D (struct drm_color_lut *) blob->data;
> > > -		for (i =3D 0; i < legacy_lut_size; i++)
> > > -			igt_assert(lut[i].red =3D=3D 0xffff &&
> > > -				   lut[i].green =3D=3D 0xffff &&
> > > -				   lut[i].blue =3D=3D 0xffff);
> > > -		drmModeFreePropertyBlob(blob);
> > > +	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
> > > +		igt_assert(get_blob(data, primary->pipe,
> > > +				    IGT_CRTC_DEGAMMA_LUT) =3D=3D NULL);
> > >
> > > -		igt_plane_set_fb(primary, NULL);
> > > -		igt_output_set_pipe(output, PIPE_NONE);
> > > -	}
> > > +	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
> > > +		igt_assert(get_blob(data, primary->pipe, IGT_CRTC_CTM) =3D=3D NULL=
);
> > > +
> > > +	blob =3D get_blob(data, primary->pipe, IGT_CRTC_GAMMA_LUT);
> > > +	igt_assert(blob &&
> > > +		   blob->length =3D=3D (sizeof(struct drm_color_lut) *
> > > +				    legacy_lut_size));
> > > +	lut =3D (struct drm_color_lut *) blob->data;
> > > +	for (i =3D 0; i < legacy_lut_size; i++)
> > > +		igt_assert(lut[i].red =3D=3D 0xffff &&
> > > +			   lut[i].green =3D=3D 0xffff &&
> > > +			   lut[i].blue =3D=3D 0xffff);
> > > +	drmModeFreePropertyBlob(blob);
> > > +
> > > +	igt_plane_set_fb(primary, NULL);
> > > +	igt_output_set_pipe(output, PIPE_NONE);
> > >
> > >  	free_lut(degamma_linear);
> > >  	free_lut(gamma_zero);
> > > @@ -442,84 +442,84 @@ static bool test_pipe_ctm(data_t *data,
> > >  	igt_output_t *output;
> > >  	bool ret =3D true;
> > >  	igt_display_t *display =3D &data->display;
> > > +	drmModeModeInfo *mode;
> > > +	struct igt_fb fb_modeset, fb;
> > > +	igt_crc_t crc_software, crc_hardware;
> > > +	int fb_id, fb_modeset_id;
> > >
> > >  	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
> > >
> > >  	degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
> > >  	gamma_linear =3D generate_table(data->gamma_lut_size, 1.0);
> > >
> > > -	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe,
> > > output) {
> > > -		drmModeModeInfo *mode;
> > > -		struct igt_fb fb_modeset, fb;
> > > -		igt_crc_t crc_software, crc_hardware;
> > > -		int fb_id, fb_modeset_id;
> > > +	output =3D igt_get_single_output_for_pipe(&data->display, primary->=
pipe-
> > > >pipe);
> > > +	igt_require(output);
> > >
> > > -		igt_output_set_pipe(output, primary->pipe->pipe);
> > > -		mode =3D igt_output_get_mode(output);
> > > +	igt_output_set_pipe(output, primary->pipe->pipe);
> > > +	mode =3D igt_output_get_mode(output);
> > >
> > > -		/* Create a framebuffer at the size of the output. */
> > > -		fb_id =3D igt_create_fb(data->drm_fd,
> > > +	/* Create a framebuffer at the size of the output. */
> > > +	fb_id =3D igt_create_fb(data->drm_fd,
> > > +			      mode->hdisplay,
> > > +			      mode->vdisplay,
> > > +			      DRM_FORMAT_XRGB8888,
> > > +			      DRM_FORMAT_MOD_NONE,
> > > +			      &fb);
> > > +	igt_assert(fb_id);
> > > +
> > > +	fb_modeset_id =3D igt_create_fb(data->drm_fd,
> > >  				      mode->hdisplay,
> > >  				      mode->vdisplay,
> > >  				      DRM_FORMAT_XRGB8888,
> > >  				      DRM_FORMAT_MOD_NONE,
> > > -				      &fb);
> > > -		igt_assert(fb_id);
> > > +				      &fb_modeset);
> > > +	igt_assert(fb_modeset_id);
> > > +	igt_plane_set_fb(primary, &fb_modeset);
> > >
> > > -		fb_modeset_id =3D igt_create_fb(data->drm_fd,
> > > -					      mode->hdisplay,
> > > -					      mode->vdisplay,
> > > -					      DRM_FORMAT_XRGB8888,
> > > -					      DRM_FORMAT_MOD_NONE,
> > > -					      &fb_modeset);
> > > -		igt_assert(fb_modeset_id);
> > > -		igt_plane_set_fb(primary, &fb_modeset);
> > > -
> > > -		/*
> > > -		 * Don't program LUT's for max CTM cases, as limitation of
> > > -		 * representing intermediate values between 0 and 1.0 causes
> > > -		 * rounding issues and inaccuracies leading to crc mismatch.
> > > -		 */
> > > -		if (memcmp(before, after, sizeof(color_t))) {
> > > -			set_degamma(data, primary->pipe, degamma_linear);
> > > -			set_gamma(data, primary->pipe, gamma_linear);
> > > -		} else {
> > > -			/* Disable Degamma and Gamma for ctm max test */
> > > -			disable_degamma(primary->pipe);
> > > -			disable_gamma(primary->pipe);
> > > -		}
> > > -
> > > -		disable_ctm(primary->pipe);
> > > -		igt_display_commit(&data->display);
> > > -
> > > -		paint_rectangles(data, mode, after, &fb);
> > > -		igt_plane_set_fb(primary, &fb);
> > > -		set_ctm(primary->pipe, ctm_identity);
> > > -		igt_display_commit(&data->display);
> > > -		igt_wait_for_vblank(data->drm_fd,
> > > -				display->pipes[primary->pipe->pipe].crtc_offset);
> > > -		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
> > > -
> > > -		/* With CTM transformation. */
> > > -		paint_rectangles(data, mode, before, &fb);
> > > -		igt_plane_set_fb(primary, &fb);
> > > -		set_ctm(primary->pipe, ctm_matrix);
> > > -		igt_display_commit(&data->display);
> > > -		igt_wait_for_vblank(data->drm_fd,
> > > -				display->pipes[primary->pipe->pipe].crtc_offset);
> > > -		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
> > > -
> > > -		/* Verify that the CRC of the software computed output is
> > > -		 * equal to the CRC of the CTM matrix transformation output.
> > > -		 */
> > > -		ret &=3D !igt_skip_crc_compare || igt_check_crc_equal(&crc_softwar=
e,
> > > &crc_hardware);
> > > -
> > > -		igt_plane_set_fb(primary, NULL);
> > > -		igt_output_set_pipe(output, PIPE_NONE);
> > > -		igt_remove_fb(data->drm_fd, &fb);
> > > -		igt_remove_fb(data->drm_fd, &fb_modeset);
> > > +	/*
> > > +	 * Don't program LUT's for max CTM cases, as limitation of
> > > +	 * representing intermediate values between 0 and 1.0 causes
> > > +	 * rounding issues and inaccuracies leading to crc mismatch.
> > > +	 */
> > > +	if (memcmp(before, after, sizeof(color_t))) {
> > > +		set_degamma(data, primary->pipe, degamma_linear);
> > > +		set_gamma(data, primary->pipe, gamma_linear);
> > > +	} else {
> > > +		/* Disable Degamma and Gamma for ctm max test */
> > > +		disable_degamma(primary->pipe);
> > > +		disable_gamma(primary->pipe);
> > >  	}
> > >
> > > +	disable_ctm(primary->pipe);
> > > +	igt_display_commit(&data->display);
> > > +
> > > +	paint_rectangles(data, mode, after, &fb);
> > > +	igt_plane_set_fb(primary, &fb);
> > > +	set_ctm(primary->pipe, ctm_identity);
> > > +	igt_display_commit(&data->display);
> > > +	igt_wait_for_vblank(data->drm_fd,
> > > +			    display->pipes[primary->pipe->pipe].crtc_offset);
> > > +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
> > > +
> > > +	/* With CTM transformation. */
> > > +	paint_rectangles(data, mode, before, &fb);
> > > +	igt_plane_set_fb(primary, &fb);
> > > +	set_ctm(primary->pipe, ctm_matrix);
> > > +	igt_display_commit(&data->display);
> > > +	igt_wait_for_vblank(data->drm_fd,
> > > +			    display->pipes[primary->pipe->pipe].crtc_offset);
> > > +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
> > > +
> > > +	/* Verify that the CRC of the software computed output is
> > > +	 * equal to the CRC of the CTM matrix transformation output.
> > > +	 */
> > > +	ret &=3D !igt_skip_crc_compare || igt_check_crc_equal(&crc_software=
,
> > > &crc_hardware);
> > > +
> > > +	igt_plane_set_fb(primary, NULL);
> > > +	igt_output_set_pipe(output, PIPE_NONE);
> > > +	igt_remove_fb(data->drm_fd, &fb);
> > > +	igt_remove_fb(data->drm_fd, &fb_modeset);
> > > +
> > >  	free_lut(degamma_linear);
> > >  	free_lut(gamma_linear);
> > >
> > > --
> > > 2.31.1
> >
>=20
> --
> Ville Syrj=E4l=E4
> Intel
