Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 19 Mar 2021 17:01:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YFS8vuuArWJtH9Mb@intel.com>
References: <20210318222124.970997-1-lyude@redhat.com>
 <20210318222124.970997-2-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210318222124.970997-2-lyude@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/kms_cursor_crc: Probe
 kernel for cursor size support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org, Martin Peres <martin.peres@free.fr>, Ben Skeggs <bskeggs@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 06:21:23PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> =

> Currently we just assume that every cursor size up to data->cursor_max_w/=
h will
> be supported by the driver, and check for support of nonsquare cursors by
> checking if we're running on u815 and if so, which variant of intel hardw=
are
> we're running on. This isn't really ideal as we're about to enable 32x32 =
cursor
> size tests for nouveau, and Intel hardware doesn't support cursor sizes t=
hat
> small.
> =

> So, fix this by removing has_nonsquare_cursors() and replacing it with a =
more
> generic require_cursor_size() function which checks whether or not the dr=
iver
> we're using supports a given cursor size by attempting a test-only atomic
> commit.
> =

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Jeremy Cline <jcline@redhat.com>
> ---
>  tests/kms_cursor_crc.c | 131 ++++++++++++++++++++++++-----------------
>  1 file changed, 76 insertions(+), 55 deletions(-)
> =

> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 3541ea06..b9c05472 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -523,26 +523,43 @@ static void create_cursor_fb(data_t *data, int cur_=
w, int cur_h)
>  	igt_put_cairo_ctx(cr);
>  }
>  =

> -static bool has_nonsquare_cursors(data_t *data)
> +static void require_cursor_size(data_t *data, int w, int h)
>  {
> -	uint32_t devid;
> +	igt_fb_t primary_fb;
> +	drmModeModeInfo *mode;
> +	igt_display_t *display =3D &data->display;
> +	igt_output_t *output =3D data->output;
> +	igt_plane_t *primary, *cursor;
> +	int ret;
>  =

> -	if (!is_i915_device(data->drm_fd))
> -		return false;
> +	igt_output_set_pipe(output, data->pipe);
>  =

> -	devid =3D intel_get_drm_devid(data->drm_fd);
> +	mode =3D igt_output_get_mode(output);
> +	primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	cursor =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_CURSOR);
>  =

> -	/*
> -	 * Test non-square cursors a bit on the platforms
> -	 * that support such things.
> -	 */
> -	if (devid =3D=3D PCI_CHIP_845_G || devid =3D=3D PCI_CHIP_I865_G)
> -		return true;
> +	/* Create temporary primary fb for testing */
> +	igt_assert(igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, =
DRM_FORMAT_XRGB8888,
> +				 LOCAL_DRM_FORMAT_MOD_NONE, &primary_fb));
>  =

> -	if (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid))
> -		return false;
> +	igt_plane_set_fb(primary, &primary_fb);
> +	igt_plane_set_fb(cursor, &data->fb);
> +	igt_plane_set_size(cursor, w, h);
> +	igt_fb_set_size(&data->fb, cursor, w, h);
> +
> +	/* Test if the kernel supports the given cursor size or not */
> +	ret =3D igt_display_try_commit_atomic(display,
> +					    DRM_MODE_ATOMIC_TEST_ONLY |
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					    NULL);

Would be better to not depend on atomic. We have platforms
that don't expose it yet.

> +
> +	igt_plane_set_fb(primary, NULL);
> +	igt_plane_set_fb(cursor, NULL);
> +
> +	igt_remove_fb(data->drm_fd, &primary_fb);
> +	igt_output_set_pipe(output, PIPE_NONE);
>  =

> -	return intel_gen(devid) >=3D 7;
> +	igt_skip_on_f(ret, "Cursor size %dx%d not supported by driver\n", w, h);
>  }
>  =

>  static void test_cursor_size(data_t *data)
> @@ -697,27 +714,33 @@ static void run_tests_on_pipe(data_t *data, enum pi=
pe pipe)
>  			create_cursor_fb(data, w, h);
>  		}
>  =

> -		/* Using created cursor FBs to test cursor support */
> -		igt_describe("Check if a given-size cursor is well-positioned inside t=
he screen.");
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe)=
, w, h)
> -			run_test(data, test_crc_onscreen, w, h);
> -
> -		igt_describe("Check if a given-size cursor is well-positioned outside =
the screen.");
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pipe=
), w, h)
> -			run_test(data, test_crc_offscreen, w, h);
> -
> -		igt_describe("Check the smooth and pixel-by-pixel given-size cursor mo=
vements on"
> -		             "horizontal, vertical and diagonal.");
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe),=
 w, h)
> -			run_test(data, test_crc_sliding, w, h);
> -
> -		igt_describe("Check random placement of a cursor with given size.");
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe), =
w, h)
> -			run_test(data, test_crc_random, w, h);
> -
> -		igt_describe("Check the rapid update of given-size cursor movements.");
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-rapid-movement", kmstest_pipe_name=
(pipe), w, h) {
> -			run_test(data, test_rapid_movement, w, h);
> +		igt_subtest_group {
> +			igt_fixture
> +				require_cursor_size(data, w, h);
> +
> +			/* Using created cursor FBs to test cursor support */
> +			igt_describe("Check if a given-size cursor is well-positioned inside =
the "
> +				     "screen.");
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe=
), w, h)
> +				run_test(data, test_crc_onscreen, w, h);
> +
> +			igt_describe("Check if a given-size cursor is well-positioned outside=
 the "
> +				     "screen.");
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pip=
e), w, h)
> +				run_test(data, test_crc_offscreen, w, h);
> +
> +			igt_describe("Check the smooth and pixel-by-pixel given-size cursor "
> +				     "movements on horizontal, vertical and diagonal.");
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe)=
, w, h)
> +				run_test(data, test_crc_sliding, w, h);
> +
> +			igt_describe("Check random placement of a cursor with given size.");
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe),=
 w, h)
> +				run_test(data, test_crc_random, w, h);
> +
> +			igt_describe("Check the rapid update of given-size cursor movements."=
);
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-rapid-movement", kmstest_pipe_nam=
e(pipe), w, h)
> +				run_test(data, test_rapid_movement, w, h);
>  		}
>  =

>  		igt_fixture
> @@ -730,27 +753,25 @@ static void run_tests_on_pipe(data_t *data, enum pi=
pe pipe)
>  		 */
>  		h /=3D 3;
>  =

> -		igt_fixture {
> -			if (has_nonsquare_cursors(data))
> -				create_cursor_fb(data, w, h);
> -		}
> +		igt_fixture
> +			create_cursor_fb(data, w, h);
>  =

> -		/* Using created cursor FBs to test cursor support */
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe)=
, w, h) {
> -			igt_require(has_nonsquare_cursors(data));
> -			run_test(data, test_crc_onscreen, w, h);
> -		}
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pipe=
), w, h) {
> -			igt_require(has_nonsquare_cursors(data));
> -			run_test(data, test_crc_offscreen, w, h);
> -		}
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe),=
 w, h) {
> -			igt_require(has_nonsquare_cursors(data));
> -			run_test(data, test_crc_sliding, w, h);
> -		}
> -		igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe), =
w, h) {
> -			igt_require(has_nonsquare_cursors(data));
> -			run_test(data, test_crc_random, w, h);
> +		igt_subtest_group {
> +			igt_fixture
> +				require_cursor_size(data, w, h);
> +
> +			/* Using created cursor FBs to test cursor support */
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe=
), w, h)
> +				run_test(data, test_crc_onscreen, w, h);
> +
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pip=
e), w, h)
> +				run_test(data, test_crc_offscreen, w, h);
> +
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe)=
, w, h)
> +				run_test(data, test_crc_sliding, w, h);
> +
> +			igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe),=
 w, h)
> +				run_test(data, test_crc_random, w, h);
>  		}
>  =

>  		igt_fixture
> -- =

> 2.29.2
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
