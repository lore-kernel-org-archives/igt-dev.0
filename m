Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBE26E220
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Apr 2019 19:47:05 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Mon, 1 Apr 2019 19:47:03 +0000
Message-ID: <1cf9032d42196a98c8ce20073b2ae85795a5723c.camel@intel.com>
References: <20190330010328.28054-1-jose.souza@intel.com>
 <20190330010328.28054-3-jose.souza@intel.com>
 <dc503a653b7a6259f9789a8ce8238db691623aa8.camel@intel.com>
In-Reply-To: <dc503a653b7a6259f9789a8ce8238db691623aa8.camel@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/plane_lowres: Test each plane
 individually
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0476268197=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kahola,
 Mika" <mika.kahola@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0476268197==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-C9B4zoK7asmBkGOPnHdm"

--=-C9B4zoK7asmBkGOPnHdm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-04-01 at 14:18 +0100, Kahola, Mika wrote:
> I think in this test it would be sufficient to test only with one
> plane
> as this test is intended to test resolution change. We do have
> kms_plane_multiple test that tests all planes at once and thereofre
> exercises full bandwith. Therefore, I see this as valid change to the
> test.

Now it is pretty easy to change to just one plane if we want to.

>=20
> On Fri, 2019-03-29 at 18:03 -0700, Jos=C3=A9 Roberto de Souza wrote:
> > ICL has some many planes per pipe that it is causing this test to
> > skip due bandwidth limitation when combined with 4K displays.
> >=20
> > The objective of this test is test the visibility of the planes
> > when
> > switching between high and low resolution, more information in the
> > patch that added this test 12e34d8c909a ("tests/kms_plane_lowres:
> > Plane visibility after atomic modesets").
> > So it was setting all the planes the tested pipe in the bottom left
> > of the display using the height of high resolution,  checking the
> > visibility and then switching to the low resolution mode and
> > checking
> > again the visibility and now it is expected that all planes would
> > be
> > invisible.
> >=20
> > So to overcome ICL bandwidth issues, here it is testing each plane
> > individually.
> >=20
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Mika Kahola <mika.kahola@intel.com>
> > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> Reviewed-by: Mika Kahola <mika.kahola@intel.com>

Thanks for the reviews, merged.

>=20
> > ---
> >  lib/igt_kms.c            |  21 +--
> >  lib/igt_kms.h            |   2 +-
> >  tests/kms_plane_lowres.c | 274 ++++++++++++++++++-----------------
> > --
> > --
> >  3 files changed, 135 insertions(+), 162 deletions(-)
> >=20
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index ce9fe152..1e2415bf 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -1634,27 +1634,18 @@ static void kmstest_get_crtc(int device,
> > enum
> > pipe pipe, struct kmstest_crtc *cr
> >   *
> >   * Asserts only if the plane's visibility state matches the status
> > being passed by @visibility
> >   */
> > -void igt_assert_plane_visible(int fd, enum pipe pipe, bool
> > visibility)
> > +void igt_assert_plane_visible(int fd, enum pipe pipe, int
> > plane_index, bool visibility)
> >  {
> >  	struct kmstest_crtc crtc;
> > -	int i;
> > -	bool visible;
> > +	bool visible =3D true;
> > =20
> >  	kmstest_get_crtc(fd, pipe, &crtc);
> > =20
> > -	visible =3D true;
> > -	for (i =3D 0; i < crtc.n_planes; i++) {
> > -		if (crtc.planes[i].type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> > -			continue;
> > +	igt_assert(plane_index < crtc.n_planes);
> > =20
> > -		if (crtc.planes[i].pos_x > crtc.width) {
> > -			visible =3D false;
> > -			break;
> > -		} else if (crtc.planes[i].pos_y > crtc.height) {
> > -			visible =3D false;
> > -			break;
> > -		}
> > -	}
> > +	if (crtc.planes[plane_index].pos_x > crtc.width ||
> > +	    crtc.planes[plane_index].pos_y > crtc.height)
> > +		visible =3D false;
> > =20
> >  	free(crtc.planes);
> >  	igt_assert_eq(visible, visibility);
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index e392e0ef..38bdc08f 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -228,7 +228,7 @@ void *kmstest_dumb_map_buffer(int fd, uint32_t
> > handle, uint64_t size,
> >  void kmstest_dumb_destroy(int fd, uint32_t handle);
> >  void kmstest_wait_for_pageflip(int fd);
> >  unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int
> > flags);
> > -void igt_assert_plane_visible(int fd, enum pipe pipe, bool
> > visibility);
> > +void igt_assert_plane_visible(int fd, enum pipe pipe, int
> > plane_index, bool visibility);
> > =20
> >  /*
> >   * A small modeset API
> > diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
> > index 51bb7cd8..0b78573f 100644
> > --- a/tests/kms_plane_lowres.c
> > +++ b/tests/kms_plane_lowres.c
> > @@ -39,7 +39,8 @@ IGT_TEST_DESCRIPTION("Test atomic mode setting
> > with
> > a plane by switching between
> >  typedef struct {
> >  	int drm_fd;
> >  	igt_display_t display;
> > -	struct igt_fb *fb;
> > +	struct igt_fb fb_primary;
> > +	struct igt_fb fb_plane;
> >  } data_t;
> > =20
> >  static drmModeModeInfo
> > @@ -64,24 +65,6 @@ get_lowres_mode(int drmfd, igt_output_t *output,
> > drmModeModeInfo *mode_default)
> >  	return mode;
> >  }
> > =20
> > -static void
> > -test_fini(data_t *data, igt_output_t *output, enum pipe pipe)
> > -{
> > -	igt_plane_t *plane;
> > -
> > -	/* restore original mode */
> > -	igt_output_override_mode(output, NULL);
> > -
> > -	for_each_plane_on_pipe(&data->display, pipe, plane)
> > -		igt_plane_set_fb(plane, NULL);
> > -
> > -	/* reset the constraint on the pipe */
> > -	igt_output_set_pipe(output, PIPE_ANY);
> > -
> > -	free(data->fb);
> > -	data->fb =3D NULL;
> > -}
> > -
> >  static void
> >  check_mode(drmModeModeInfo *mode1, drmModeModeInfo *mode2)
> >  {
> > @@ -90,175 +73,160 @@ check_mode(drmModeModeInfo *mode1,
> > drmModeModeInfo *mode2)
> >  	igt_assert_eq(mode1->vrefresh, mode2->vrefresh);
> >  }
> > =20
> > -static drmModeModeInfo *
> > -test_setup(data_t *data, enum pipe pipe, uint64_t modifier,
> > -	   igt_output_t *output)
> > +/*
> > + * Return false if test on this plane should be skipped
> > + */
> > +static bool
> > +setup_plane(data_t *data, igt_plane_t *plane, drmModeModeInfo
> > *mode,
> > +	    uint64_t modifier)
> >  {
> > -	drmModeModeInfo *mode;
> > -	int size;
> > -	int i =3D 1, x, y;
> > -	igt_plane_t *plane;
> > -
> > -	igt_skip_on(!igt_display_has_format_mod(&data->display,
> > -						DRM_FORMAT_XRGB8888,
> > -						modifier));
> > -
> > -	igt_output_set_pipe(output, pipe);
> > -
> > -	mode =3D igt_output_get_mode(output);
> > -
> > -	data->fb =3D calloc(data->display.pipes[pipe].n_planes,
> > sizeof(struct igt_fb));
> > -	igt_assert_f(data->fb, "Failed to allocate memory for %d
> > FBs\n",
> > -	             data->display.pipes[pipe].n_planes);
> > -
> > -	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode-
> > > vdisplay,
> > -			    DRM_FORMAT_XRGB8888,
> > -			    modifier,
> > -			    0.0, 0.0, 1.0,
> > -			    &data->fb[0]);
> > -
> > -	/* yellow sprite plane in lower left corner */
> > -	for_each_plane_on_pipe(&data->display, pipe, plane) {
> > -		uint64_t plane_modifier;
> > -		uint32_t plane_format;
> > -
> > -		if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> > -			igt_plane_set_fb(plane, &data->fb[0]);
> > -			continue;
> > -		}
> > -
> > -		if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> > -			size =3D 64;
> > -		else
> > -			size =3D SIZE;
> > -
> > -		x =3D 0;
> > -		y =3D mode->vdisplay - size;
> > -
> > -		plane_format =3D plane->type =3D=3D DRM_PLANE_TYPE_CURSOR ?
> > -			DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888;
> > -
> > -		plane_modifier =3D plane->type =3D=3D DRM_PLANE_TYPE_CURSOR ?
> > -			LOCAL_DRM_FORMAT_MOD_NONE : modifier;
> > +	uint64_t plane_modifier;
> > +	uint32_t plane_format;
> > +	int size, x, y;
> > +
> > +	if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> > +		return false;
> > +
> > +	if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
> > +		size =3D 64;
> > +	else
> > +		size =3D SIZE;
> > +
> > +	x =3D 0;
> > +	y =3D mode->vdisplay - size;
> > +
> > +	if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR) {
> > +		plane_format =3D DRM_FORMAT_ARGB8888;
> > +		plane_modifier =3D LOCAL_DRM_FORMAT_MOD_NONE;
> > +	} else {
> > +		plane_format =3D DRM_FORMAT_XRGB8888;
> > +		plane_modifier =3D modifier;
> > +	}
> > =20
> > -		igt_skip_on(!igt_plane_has_format_mod(plane,
> > plane_format,
> > -						      plane_modifier));
> > +	if (!igt_plane_has_format_mod(plane, plane_format,
> > plane_modifier))
> > +		return false;
> > =20
> > -		igt_create_color_fb(data->drm_fd,
> > -				    size, size,
> > -				    plane_format,
> > -				    plane_modifier,
> > -				    1.0, 1.0, 0.0,
> > -				    &data->fb[i]);
> > +	igt_create_color_fb(data->drm_fd, size, size, plane_format,
> > +			    plane_modifier, 1.0, 1.0, 0.0, &data-
> > > fb_plane);
> > +	igt_plane_set_position(plane, x, y);
> > +	igt_plane_set_fb(plane, &data->fb_plane);
> > =20
> > -		igt_plane_set_position(plane, x, y);
> > -		igt_plane_set_fb(plane, &data->fb[i++]);
> > -	}
> > +	return true;
> > +}
> > =20
> > -	return mode;
> > +static igt_plane_t *
> > +primary_plane_get(igt_display_t *display, enum pipe pipe)
> > +{
> > +	unsigned plane_primary_id =3D display->pipes[pipe].plane_primary;
> > +	return &display->pipes[pipe].planes[plane_primary_id];
> >  }
> > =20
> > -static void
> > -test_plane_position_with_output(data_t *data, enum pipe pipe,
> > +static unsigned
> > +test_planes_on_pipe_with_output(data_t *data, enum pipe pipe,
> >  				igt_output_t *output, uint64_t
> > modifier)
> >  {
> > -	igt_crc_t crc_hires1, crc_hires2;
> > -	igt_crc_t crc_lowres;
> > -	drmModeModeInfo mode_lowres;
> > -	drmModeModeInfo *mode1, *mode2, *mode3;
> > -	int ret;
> > +	drmModeModeInfo *mode, mode_lowres;
> >  	igt_pipe_crc_t *pipe_crc;
> > +	unsigned tested =3D 0;
> > +	igt_plane_t *plane;
> > =20
> >  	igt_info("Testing connector %s using pipe %s\n",
> >  		 igt_output_name(output), kmstest_pipe_name(pipe));
> > =20
> > -	mode1 =3D test_setup(data, pipe, modifier, output);
> > +	igt_output_set_pipe(output, pipe);
> > +	mode =3D igt_output_get_mode(output);
> > +	mode_lowres =3D get_lowres_mode(data->drm_fd, output, mode);
> > =20
> > -	mode_lowres =3D get_lowres_mode(data->drm_fd, output, mode1);
> > +	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode-
> > > vdisplay,
> > +			    DRM_FORMAT_XRGB8888, modifier, 0.0, 0.0,
> > 1.0,
> > +			    &data->fb_primary);
> > +	igt_plane_set_fb(primary_plane_get(&data->display, pipe),
> > +			 &data->fb_primary);
> > =20
> > -	ret =3D igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> > -	igt_skip_on(ret !=3D 0);
> > +	pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> > +				    INTEL_PIPE_CRC_SOURCE_AUTO);
> > =20
> > -	pipe_crc =3D igt_pipe_crc_new(data->drm_fd, pipe,
> > INTEL_PIPE_CRC_SOURCE_AUTO);
> > -	igt_pipe_crc_start(pipe_crc);
> > -	igt_pipe_crc_get_single(pipe_crc, &crc_hires1);
> > +	/* yellow sprite plane in lower left corner */
> > +	for_each_plane_on_pipe(&data->display, pipe, plane) {
> > +		igt_crc_t crc_hires1, crc_hires2;
> > +		int r;
> > =20
> > -	igt_assert_plane_visible(data->drm_fd, pipe, true);
> > +		if (!setup_plane(data, plane, mode, modifier))
> > +			continue;
> > =20
> > -	/* switch to lower resolution */
> > -	igt_output_override_mode(output, &mode_lowres);
> > -	igt_output_set_pipe(output, pipe);
> > +		r =3D igt_display_try_commit2(&data->display,
> > COMMIT_ATOMIC);
> > +		if (r) {
> > +			igt_debug("Commit failed %i", r);
> > +			continue;
> > +		}
> > =20
> > -	mode2 =3D igt_output_get_mode(output);
> > +		igt_pipe_crc_start(pipe_crc);
> > +		igt_pipe_crc_get_single(pipe_crc, &crc_hires1);
> > =20
> > -	check_mode(&mode_lowres, mode2);
> > +		igt_assert_plane_visible(data->drm_fd, pipe, plane-
> > > index,
> > +					 true);
> > =20
> > -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> > -	igt_pipe_crc_get_current(data->display.drm_fd, pipe_crc,
> > &crc_lowres);
> > +		/* switch to lower resolution */
> > +		igt_output_override_mode(output, &mode_lowres);
> > +		igt_output_set_pipe(output, pipe);
> > +		check_mode(&mode_lowres, igt_output_get_mode(output));
> > =20
> > -	igt_assert_plane_visible(data->drm_fd, pipe, false);
> > +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> > =20
> > -	/* switch back to higher resolution */
> > -	igt_output_override_mode(output, NULL);
> > -	igt_output_set_pipe(output, pipe);
> > +		igt_assert_plane_visible(data->drm_fd, pipe, plane-
> > > index,
> > +					 false);
> > =20
> > -	mode3 =3D igt_output_get_mode(output);
> > +		/* switch back to higher resolution */
> > +		igt_output_override_mode(output, NULL);
> > +		igt_output_set_pipe(output, pipe);
> > +		check_mode(mode, igt_output_get_mode(output));
> > =20
> > -	check_mode(mode1, mode3);
> > +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> > =20
> > -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> > +		igt_pipe_crc_get_current(data->drm_fd, pipe_crc,
> > &crc_hires2);
> > =20
> > -	igt_pipe_crc_get_current(data->display.drm_fd, pipe_crc,
> > &crc_hires2);
> > +		igt_assert_plane_visible(data->drm_fd, pipe, plane-
> > > index,
> > +					 true);
> > =20
> > -	igt_assert_plane_visible(data->drm_fd, pipe, true);
> > +		igt_assert_crc_equal(&crc_hires1, &crc_hires2);
> > =20
> > -	igt_assert_crc_equal(&crc_hires1, &crc_hires2);
> > +		igt_pipe_crc_stop(pipe_crc);
> > =20
> > -	igt_pipe_crc_stop(pipe_crc);
> > -	igt_pipe_crc_free(pipe_crc);
> > +		igt_plane_set_fb(plane, NULL);
> > +		igt_remove_fb(data->drm_fd, &data->fb_plane);
> > +		tested++;
> > +	}
> > =20
> > -	test_fini(data, output, pipe);
> > -}
> > +	igt_pipe_crc_free(pipe_crc);
> > =20
> > -static void
> > -test_plane_position(data_t *data, enum pipe pipe, uint64_t
> > modifier)
> > -{
> > -	igt_output_t *output;
> > +	igt_plane_set_fb(primary_plane_get(&data->display, pipe),
> > NULL);
> > +	igt_remove_fb(data->drm_fd, &data->fb_primary);
> > +	igt_output_set_pipe(output, PIPE_NONE);
> > =20
> > -	for_each_valid_output_on_pipe(&data->display, pipe, output)
> > -		test_plane_position_with_output(data, pipe, output,
> > modifier);
> > +	return tested;
> >  }
> > =20
> >  static void
> > -run_tests_for_pipe(data_t *data, enum pipe pipe)
> > +test_planes_on_pipe(data_t *data, enum pipe pipe, uint64_t
> > modifier)
> >  {
> > -	igt_fixture {
> > -		igt_skip_on(pipe >=3D data->display.n_pipes);
> > -
> > -		igt_display_require_output_on_pipe(&data->display,
> > pipe);
> > -	}
> > -
> > -	igt_subtest_f("pipe-%s-tiling-none",
> > -		      kmstest_pipe_name(pipe))
> > -		test_plane_position(data, pipe,
> > LOCAL_DRM_FORMAT_MOD_NONE);
> > +	igt_output_t *output;
> > +	unsigned tested =3D 0;
> > =20
> > -	igt_subtest_f("pipe-%s-tiling-x",
> > -		      kmstest_pipe_name(pipe))
> > -		test_plane_position(data, pipe,
> > LOCAL_I915_FORMAT_MOD_X_TILED);
> > +	igt_skip_on(pipe >=3D data->display.n_pipes);
> > +	igt_display_require_output_on_pipe(&data->display, pipe);
> > +	igt_skip_on(!igt_display_has_format_mod(&data->display,
> > +						DRM_FORMAT_XRGB8888,
> > modifier));
> > =20
> > -	igt_subtest_f("pipe-%s-tiling-y",
> > -		      kmstest_pipe_name(pipe))
> > -		test_plane_position(data, pipe,
> > LOCAL_I915_FORMAT_MOD_Y_TILED);
> > +	for_each_valid_output_on_pipe(&data->display, pipe, output)
> > +		tested +=3D test_planes_on_pipe_with_output(data, pipe,
> > output,
> > +							  modifier);
> > =20
> > -	igt_subtest_f("pipe-%s-tiling-yf",
> > -		      kmstest_pipe_name(pipe))
> > -		test_plane_position(data, pipe,
> > LOCAL_I915_FORMAT_MOD_Yf_TILED);
> > +	igt_assert(tested > 0);
> >  }
> > =20
> > -static data_t data;
> > -
> >  igt_main
> >  {
> > +	data_t data =3D {};
> >  	enum pipe pipe;
> > =20
> >  	igt_skip_on_simulation();
> > @@ -273,9 +241,23 @@ igt_main
> >  		igt_require(data.display.is_atomic);
> >  	}
> > =20
> > -	for_each_pipe_static(pipe)
> > -		igt_subtest_group
> > -			run_tests_for_pipe(&data, pipe);
> > +	for_each_pipe_static(pipe) {
> > +		igt_subtest_f("pipe-%s-tiling-none",
> > kmstest_pipe_name(pipe))
> > +			test_planes_on_pipe(&data, pipe,
> > +					    LOCAL_DRM_FORMAT_MOD_NONE);
> > +
> > +		igt_subtest_f("pipe-%s-tiling-x",
> > kmstest_pipe_name(pipe))
> > +			test_planes_on_pipe(&data, pipe,
> > +					    LOCAL_I915_FORMAT_MOD_X_TIL
> > ED);
> > +
> > +		igt_subtest_f("pipe-%s-tiling-y",
> > kmstest_pipe_name(pipe))
> > +			test_planes_on_pipe(&data, pipe,
> > +					    LOCAL_I915_FORMAT_MOD_Y_TIL
> > ED);
> > +
> > +		igt_subtest_f("pipe-%s-tiling-yf",
> > kmstest_pipe_name(pipe))
> > +			test_planes_on_pipe(&data, pipe,
> > +					    LOCAL_I915_FORMAT_MOD_Yf_TI
> > LED);
> > +	}
> > =20
> >  	igt_fixture {
> >  		igt_display_fini(&data.display);

--=-C9B4zoK7asmBkGOPnHdm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlyiarMACgkQVenbO/mO
Wkl2hwf/XesVAjU68hpDVWhKZVIvfCgDfWj3mNflMLy3v4o2h7mYWR88GIYzaxDa
EkN3fQaBXt6qCwT/TX4deby27OpwcXDyN455rMtNDbKc+gTTe+AII7joj2z3Fyba
yvH2qS1bupm0J/nrUlwc92j6KpLJE1iQ/74Czi8obeg9bjgSnjn1NGCpjbELcszw
09FLjtZ6pVzFaLvnEFPl/HCZGtnYGSnPAeXjDkgtNLAzVCU2phBm44qtIBYLTUoB
xrRyc4jzC+OM5DCdfsx76cXTPurpRmKi1tqK+RqhCs/NIlMttCLck68xD+mqW9tQ
IRoQpT3lGB2A8ab95xiVFmBTIEVZgw==
=3nSR
-----END PGP SIGNATURE-----

--=-C9B4zoK7asmBkGOPnHdm--

--===============0476268197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0476268197==--
