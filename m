Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9ED89385
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2020 08:27:21 +0000 (UTC)
Date: Tue, 24 Mar 2020 10:27:19 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200324082719.GV9497@platvala-desk.ger.corp.intel.com>
References: <20200323204621.173722-1-jose.souza@intel.com>
 <20200323204621.173722-2-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200323204621.173722-2-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 2/7] tests/kms_frontbuffer_tracking:
 Improve tiling test coverage
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
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 23, 2020 at 01:46:16PM -0700, Jos=E9 Roberto de Souza wrote:
> Lets add some more tiling tests, if tiling is supported by FBC draw
> some rectangles and compare the CRC against benchmark if not
> supported run the test to guarantee that FBC is disabled.
> =

> This is a preparation for when kernel will allow FBC to be enabled
> without fences, so we can better test linear and Y tiled
> frontbuffers.
> =

> v2:
> - renamed tile to tiling (Ville)
> - removed *-tiling-x test (Ville)
> - improved tiling_disable_fbc_subtest documentation (Ville)
> =

> v3:
> - added new tests description
> - fixed failure in prepare_subtest()
> =

> v5:
> - not adding tiling Y tests to GENs older than 9 because it is not
> supported
> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  tests/kms_frontbuffer_tracking.c | 79 +++++++++++++++++++++++++-------
>  1 file changed, 62 insertions(+), 17 deletions(-)
> =

> diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tra=
cking.c
> index c4deb72b..267aa631 100644
> --- a/tests/kms_frontbuffer_tracking.c
> +++ b/tests/kms_frontbuffer_tracking.c
> @@ -2170,6 +2170,23 @@ static void format_draw_subtest(const struct test_=
mode *t)
>  		badformat_subtest(t);
>  }
>  =

> +static bool tiling_is_valid(int feature_flags, enum tiling_type tiling)
> +{
> +	if (!(feature_flags & FEATURE_FBC))
> +		return true;
> +
> +	switch (tiling) {
> +	case TILING_LINEAR:
> +		return false;
> +	case TILING_X:
> +	case TILING_Y:
> +		return true;
> +	default:
> +		igt_assert(false);
> +		return false;
> +	}
> +}
> +
>  /*
>   * slow_draw - sleep a little bit between drawing operations
>   *
> @@ -2975,45 +2992,47 @@ static void stridechange_subtest(const struct tes=
t_mode *t)
>  }
>  =

>  /**
> - * tilingchange - alternate between tiled and untiled in multiple ways
> + * tiling_disable_fbc_subtest - Check if tiling is unsupported by FBC
>   *
>   * METHOD
> - *   This test alternates between tiled and untiled frontbuffers of the =
same
> - *   size and format through multiple different APIs: the page flip IOCT=
L,
> - *   normal modesets and the plane APIs.
> + *   This test alternates between a FBC supported and non-supported tiled
> + *   frontbuffers of the same size and format through multiple different
> + *   APIs: the page flip IOCTL, normal modesets and the plane APIs.
>   *
>   * EXPECTED RESULTS
> - *   FBC gets properly disabled for the untiled FB and reenabled for the
> - *   tiled FB.
> + *   FBC gets properly disabled for the non-supported tiling and reenabl=
ed for
> + *   the supported tiling.
>   *
>   * FAILURES
>   *   Bad Kernels may somehow leave FBC enabled, which can cause FIFO und=
erruns
>   *   that lead to CRC assertion failures.
>   */
> -static void tilingchange_subtest(const struct test_mode *t)
> +static void tiling_disable_fbc_subtest(const struct test_mode *t)
>  {
> -	struct igt_fb new_fb, *old_fb;
> +	struct igt_fb new_fb, *supported_fb;
>  	struct modeset_params *params =3D pick_params(t);
>  	enum flip_type flip_type;
> +	struct test_mode supported_mode;
>  =

> -	prepare_subtest(t, NULL);
> +	memcpy(&supported_mode, t, sizeof(*t));
> +	supported_mode.tiling =3D TILING_X;
> +	prepare_subtest(&supported_mode, NULL);
> +	supported_fb =3D params->primary.fb;
>  =

> -	old_fb =3D params->primary.fb;
> -
> -	create_fb(t->format, params->primary.fb->width, params->primary.fb->hei=
ght,
> -		  LOCAL_DRM_FORMAT_MOD_NONE, t->plane, &new_fb);
> +	create_fb(t->format, params->primary.fb->width,
> +		  params->primary.fb->height, t->tiling, t->plane, &new_fb);
>  	fill_fb(&new_fb, COLOR_PRIM_BG);
>  =

>  	for (flip_type =3D 0; flip_type < FLIP_COUNT; flip_type++) {
>  		igt_debug("Flip type: %d\n", flip_type);
>  =

> -		/* Set a buffer with no tiling. */
> +		/* Set a buffer with new tiling. */
>  		params->primary.fb =3D &new_fb;
>  		page_flip_for_params(params, flip_type);
>  		do_assertions(ASSERT_FBC_DISABLED);
>  =

>  		/* Put FBC back in a working state. */
> -		params->primary.fb =3D old_fb;
> +		params->primary.fb =3D supported_fb;
>  		page_flip_for_params(params, flip_type);
>  		do_assertions(0);
>  	}
> @@ -3513,8 +3532,34 @@ igt_main_args("", long_options, help_str, opt_hand=
ler, NULL)
>  			igt_subtest_f("%s-stridechange", feature_str(t.feature))
>  				stridechange_subtest(&t);
>  =

> -			igt_subtest_f("%s-tilingchange", feature_str(t.feature))
> -				tilingchange_subtest(&t);
> +			for (t.tiling =3D TILING_LINEAR; t.tiling < TILING_COUNT;
> +			     t.tiling++) {
> +				int devid =3D intel_get_drm_devid(drm.fd);

You can't access device information without being inside a fixture or a sub=
test.

> +
> +				if (t.tiling =3D=3D TILING_X)
> +					continue;
> +
> +				/* Tiling Y is only supported on GEN9+ */
> +				if (!AT_LEAST_GEN(devid, 9) &&
> +				    t.tiling =3D=3D TILING_Y)
> +					continue;

Don't attempt to do this. All subtests need to be statically
enumerated regardless of what devices are available and what they're
capable of.

You can check those conditions in an igt_fixture with a subtest group
to skip only the subtest(s) for that tiling mode:


igt_subtest_group {
igt_fixture {
int devid =3D intel_get_drm_devid(drm.fd);
igt_skip_on_f(t.tiling =3D=3D TILING_X, "Can't use X tiling because of reas=
ons\n");
igt_skip_on_f(!AT_LEAST_GEN(devid, 9) && t.tiling =3D=3D TILING_Y, "Can't u=
se Y tiling before gen9\n");
}

igt_describe(...);
igt_subtest_f(....);

...
}



-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
