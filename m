Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8993C6FA34
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2020 11:57:47 +0000 (UTC)
Date: Thu, 6 Feb 2020 13:57:39 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200206115739.GO13686@intel.com>
References: <20200206020944.338033-1-jose.souza@intel.com>
 <20200206020944.338033-2-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200206020944.338033-2-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] tests/kms_frontbuffer_tracking:
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

On Wed, Feb 05, 2020 at 06:09:42PM -0800, Jos=E9 Roberto de Souza wrote:
> Lets add some more tiling tests, if tiling is supported by FBC draw
> some rectangles and compare the CRC against benchmark if not
> supported run the test to guarantee that FBC is disabled.
> =

> This is a preparation for when kernel will allow FBC to be enabled
> without fences, so we can better test linear and Y tiled
> frontbuffers.
> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  tests/kms_frontbuffer_tracking.c | 50 +++++++++++++++++++++++++-------
>  1 file changed, 39 insertions(+), 11 deletions(-)
> =

> diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tra=
cking.c
> index 63b5d12d..d5a64a4d 100644
> --- a/tests/kms_frontbuffer_tracking.c
> +++ b/tests/kms_frontbuffer_tracking.c
> @@ -2159,6 +2159,23 @@ static void format_draw_subtest(const struct test_=
mode *t)
>  		badformat_subtest(t);
>  }
>  =

> +static bool tiling_is_valid(int feature_flags, enum tile_type tile)
> +{
> +	if (!(feature_flags & FEATURE_FBC))
> +		return true;
> +
> +	switch (tile) {
> +	case TILE_LINEAR:
> +		return false;
> +	case TILE_X:
> +	case TILE_Y:
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
> @@ -2954,22 +2971,22 @@ static void stridechange_subtest(const struct tes=
t_mode *t)
>  }
>  =

>  /**
> - * tilingchange - alternate between tiled and untiled in multiple ways
> + * tiling_disable_fbc_subtest - Check that tiling causes FBC to be disab=
led

Check that *unsupported* tiling ... ?

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
>  	struct igt_fb new_fb, *old_fb;
>  	struct modeset_params *params =3D pick_params(t);
> @@ -2980,13 +2997,13 @@ static void tilingchange_subtest(const struct tes=
t_mode *t)
>  	old_fb =3D params->primary.fb;
>  =

>  	create_fb(t->format, params->primary.fb->width, params->primary.fb->hei=
ght,
> -		  LOCAL_DRM_FORMAT_MOD_NONE, t->plane, &new_fb);
> +		  t->tile, t->plane, &new_fb);

Do we really want to change this to X tiled (I think that's what you set
as default)?

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
> @@ -3486,8 +3503,19 @@ igt_main_args("", long_options, help_str, opt_hand=
ler, NULL)
>  			igt_subtest_f("%s-stridechange", feature_str(t.feature))
>  				stridechange_subtest(&t);
>  =

> -			igt_subtest_f("%s-tilingchange", feature_str(t.feature))
> -				tilingchange_subtest(&t);
> +			for (t.tile =3D TILE_LINEAR; t.tile < TILE_COUNT;
> +			     t.tile++) {
> +				igt_subtest_f("%s-tiling-%s",
> +					      feature_str(t.feature),
> +					      tile_str(t.tile)) {
> +
> +					if (tiling_is_valid(t.feature, t.tile))
> +						draw_subtest(&t);
> +					else
> +						tiling_disable_fbc_subtest(&t);
> +				}
> +			}
> +			t.tile =3D opt.tiling;
>  		}
>  =

>  		if ((t.feature & FEATURE_PSR) || (t.feature & FEATURE_DRRS))
> -- =

> 2.25.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
