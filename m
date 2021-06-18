Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67E26E996
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jun 2021 08:55:56 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Fri, 18 Jun 2021 08:55:52 +0000
Message-ID: <57e8ff1dec8444f195eff08709e0992a@intel.com>
References: <20210615160022.31610-1-juhapekka.heikkila@gmail.com>
 <20210615160022.31610-4-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210615160022.31610-4-juhapekka.heikkila@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] tests/kms_flip_scaled_crc:
 parameterize test sizes and fix test to try other connectors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Juha-
> Pekka Heikkila
> Sent: Tuesday, June 15, 2021 7:00 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t 4/4] tests/kms_flip_scaled_crc: parameterize
> test sizes and fix test to try other connectors
> 
> here parameterized first/second fb sizes making it possible to easily add
> down/upscaled fb tests for both first and second fb. While at it fixed test to
> try other available connectors for pipe if wanted mode is not found on
> connector and test fails on cdcdlk.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Reviewed-by: Mika Kahola <mika.kahola@intel.com>

> ---
>  tests/kms_flip_scaled_crc.c | 114 +++++++++++++++++++++++++++---------
>  1 file changed, 86 insertions(+), 28 deletions(-)
> 
> diff --git a/tests/kms_flip_scaled_crc.c b/tests/kms_flip_scaled_crc.c index
> d81ad352d..19c879fe1 100644
> --- a/tests/kms_flip_scaled_crc.c
> +++ b/tests/kms_flip_scaled_crc.c
> @@ -46,51 +46,69 @@ const struct {
>  	const uint32_t firstformat;
>  	const uint64_t secondmodifier;
>  	const uint32_t secondformat;
> +	const double firstmultiplier;
> +	const double secondmultiplier;
>  } flip_scenario_test[] = {
>  	{
>  		"flip-32bpp-ytile-to-64bpp-ytile",
>  		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to
> stress CD clock programming",
>  		LOCAL_I915_FORMAT_MOD_Y_TILED,
> DRM_FORMAT_XRGB8888,
> -		LOCAL_I915_FORMAT_MOD_Y_TILED,
> DRM_FORMAT_XRGB16161616F
> +		LOCAL_I915_FORMAT_MOD_Y_TILED,
> DRM_FORMAT_XRGB16161616F,
> +		1.0,
> +		2.0,
>  	},
>  	{
>  		"flip-64bpp-ytile-to-32bpp-ytile",
>  		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to
> stress CD clock programming",
>  		LOCAL_I915_FORMAT_MOD_Y_TILED,
> DRM_FORMAT_XRGB16161616F,
> -		LOCAL_I915_FORMAT_MOD_Y_TILED,
> DRM_FORMAT_XRGB8888
> +		LOCAL_I915_FORMAT_MOD_Y_TILED,
> DRM_FORMAT_XRGB8888,
> +		1.0,
> +		2.0,
>  	},
>  	{
>  		"flip-64bpp-ytile-to-16bpp-ytile",
>  		"Flip from 64bpp non scaled fb to 16bpp downscaled fb to
> stress CD clock programming",
>  		LOCAL_I915_FORMAT_MOD_Y_TILED,
> DRM_FORMAT_XRGB16161616F,
> -		LOCAL_I915_FORMAT_MOD_Y_TILED,
> DRM_FORMAT_RGB565
> +		LOCAL_I915_FORMAT_MOD_Y_TILED,
> DRM_FORMAT_RGB565,
> +		1.0,
> +		2.0,
>  	},
>  	{
>  		"flip-32bpp-ytileccs-to-64bpp-ytile",
>  		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to
> stress CD clock programming",
>  		LOCAL_I915_FORMAT_MOD_Y_TILED_CCS,
> DRM_FORMAT_XRGB8888,
> -		LOCAL_I915_FORMAT_MOD_Y_TILED,
> DRM_FORMAT_XRGB16161616F
> +		LOCAL_I915_FORMAT_MOD_Y_TILED,
> DRM_FORMAT_XRGB16161616F,
> +		1.0,
> +		2.0,
>  	},
>  	{
>  		"flip-32bpp-ytile-to-32bpp-ytilegen12rcccs",
>  		"Flip from 32bpp non scaled fb to 32bpp downscaled fb to
> stress CD clock programming",
>  		LOCAL_I915_FORMAT_MOD_Y_TILED,
> DRM_FORMAT_XRGB8888,
> -		LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
> DRM_FORMAT_XRGB8888
> +		LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
> DRM_FORMAT_XRGB8888,
> +		1.0,
> +		2.0,
>  	},
>  	{
>  		"flip-32bpp-ytile-to-32bpp-ytileccs",
>  		"Flip from 32bpp non scaled fb to 32bpp downscaled fb to
> stress CD clock programming",
>  		LOCAL_I915_FORMAT_MOD_Y_TILED,
> DRM_FORMAT_XRGB8888,
> -		LOCAL_I915_FORMAT_MOD_Y_TILED_CCS,
> DRM_FORMAT_XRGB8888
> +		LOCAL_I915_FORMAT_MOD_Y_TILED_CCS,
> DRM_FORMAT_XRGB8888,
> +		1.0,
> +		2.0,
>  	},
>  	{
>  		"flip-64bpp-ytile-to-32bpp-ytilercccs",
>  		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to
> stress CD clock programming",
>  		LOCAL_I915_FORMAT_MOD_Y_TILED,
> DRM_FORMAT_XRGB16161616F,
> -		LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
> DRM_FORMAT_XRGB8888
> +		LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
> DRM_FORMAT_XRGB8888,
> +		1.0,
> +		2.0,
>  	},
>  };
> 
> +enum subrval {CONNECTORFAIL, CONNECTORSUCCESS, TESTSKIP,
> +NOREQUESTEDFORMATONPIPE};
> +
>  static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
>  		     uint32_t height, uint64_t format, uint64_t modifier)  { @@
> -146,8 +164,8 @@ static void clear_lut(data_t *data, enum pipe pipe)
>  	igt_pipe_obj_set_prop_value(pipe_obj, IGT_CRTC_GAMMA_LUT, 0);
> }
> 
> -static void test_flip_to_scaled(data_t *data, uint32_t index, enum pipe pipe,
> -				igt_output_t *output)
> +static enum subrval test_flip_to_scaled(data_t *data, uint32_t index,
> +					enum pipe pipe, igt_output_t
> *output)
>  {
>  	igt_plane_t *primary;
>  	igt_crc_t small_crc, big_crc;
> @@ -163,14 +181,14 @@ static void test_flip_to_scaled(data_t *data,
> uint32_t index, enum pipe pipe,
> 
>  	if (data->big_fb.fb_id == 0) {
>  		setup_fb(data, &data->small_fb,
> -				data->attemptmodewidth,
> -				data->attemptmodeheight,
> +				data->attemptmodewidth *
> flip_scenario_test[index].firstmultiplier,
> +				data->attemptmodeheight *
> +flip_scenario_test[index].firstmultiplier,
>  				flip_scenario_test[index].firstformat,
>  				flip_scenario_test[index].firstmodifier);
> 
>  		setup_fb(data, &data->big_fb,
> -				data->attemptmodewidth * 2,
> -				data->attemptmodeheight * 2,
> +				data->attemptmodewidth *
> flip_scenario_test[index].secondmultiplier,
> +				data->attemptmodeheight *
> +flip_scenario_test[index].secondmultiplier,
>  				flip_scenario_test[index].secondformat,
>  				flip_scenario_test[index].secondmodifier);
> 
> @@ -187,7 +205,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t
> index, enum pipe pipe,
>  				      data->small_fb.modifier) ||
>  	    !igt_plane_has_format_mod(primary, data->big_fb.drm_format,
>  				      data->big_fb.modifier))
> -		return;
> +		return NOREQUESTEDFORMATONPIPE;
> 
>  	set_lut(data, pipe);
>  	igt_display_commit_atomic(&data->display,
> DRM_MODE_ATOMIC_ALLOW_MODESET, @@ -211,31 +229,55 @@ static
> void test_flip_to_scaled(data_t *data, uint32_t index, enum pipe pipe,
>  	}
> 
>  	if (!modetoset)
> -		igt_debug("%dp mode was not found from connector, will
> continue with default. This may cause cdclk to fail this test.\n",
> +		igt_debug("%dp mode was not found from connector, will try
> with
> +default. This may cause cdclk to fail this test on this connector.\n",
>  			  data->attemptmodeheight);
>  	else
>  		igt_output_override_mode(output, modetoset);
> 
>  	igt_plane_set_position(primary, 0, 0);
>  	igt_plane_set_fb(primary, &data->small_fb);
> -	igt_display_commit_atomic(&data->display,
> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_plane_set_size(primary, data->attemptmodewidth,
> +			   data->attemptmodeheight);
> +	ret = igt_display_try_commit_atomic(&data->display,
> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	switch (ret) {
> +	case -ERANGE:
> +		igt_debug("Platform scaling limits exceeded, skipping.\n");
> +		return TESTSKIP;
> +	case -EINVAL:
> +		if (!modetoset) {
> +			igt_debug("No %dp and default mode too big, cdclk
> limits exceeded. Check next connector\n",
> +				  data->attemptmodeheight);
> +			return CONNECTORFAIL;
> +		}
> +		/* fallthrough */
> +	default:
> +		igt_assert_eq(ret, 0);
> +	}
> 
>  	igt_pipe_crc_start(data->pipe_crc);
>  	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &small_crc);
> 
>  	igt_plane_set_fb(primary, &data->big_fb);
> -	igt_plane_set_size(primary, data->small_fb.width,
> -			   data->small_fb.height);
> +	igt_plane_set_size(primary, data->attemptmodewidth,
> +			   data->attemptmodeheight);
>  	ret = igt_display_try_commit_atomic(&data->display,
> 
> DRM_MODE_ATOMIC_ALLOW_MODESET  |
>  					    DRM_MODE_PAGE_FLIP_EVENT,
> NULL);
> 
> -	igt_require_f(ret != -ERANGE,
> -		      "Platform scaling limits exceeded, skipping.\n");
> -	igt_require_f(!(ret == -EINVAL && !modetoset),
> -		      "No %dp and default mode too big, cdclk limits exceeded.
> Skipping.\n",
> -		      data->attemptmodeheight);
> -	igt_assert_eq(ret, 0);
> +	switch (ret) {
> +	case -ERANGE:
> +		igt_debug("Platform scaling limits exceeded, skipping.\n");
> +		return TESTSKIP;
> +	case -EINVAL:
> +		if (!modetoset) {
> +			igt_debug("No %dp and default mode too big, cdclk
> limits exceeded. Check next connector\n",
> +				  data->attemptmodeheight);
> +			return CONNECTORFAIL;
> +		}
> +		/* fallthrough */
> +	default:
> +		igt_assert_eq(ret, 0);
> +	}
> 
>  	igt_assert(read(data->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
> 
> @@ -251,6 +293,8 @@ static void test_flip_to_scaled(data_t *data, uint32_t
> index, enum pipe pipe,
>  	igt_output_set_pipe(output, PIPE_NONE);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	return CONNECTORSUCCESS;
>  }
> 
>  igt_main
> @@ -280,11 +324,25 @@ igt_main
>  	for (int index = 0; index < ARRAY_SIZE(flip_scenario_test); index++) {
>  		igt_describe(flip_scenario_test[index].describe);
>  		igt_subtest(flip_scenario_test[index].name) {
> +			int validtests = 0;
>  			free_fbs(&data);
> -			for_each_pipe_with_single_output(&data.display,
> pipe,
> -							 output)
> -				test_flip_to_scaled(&data, index, pipe,
> output);
> -
> +			for_each_pipe_static(pipe) {
> +				enum subrval rval = CONNECTORSUCCESS;
> +
> 	for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +					rval = test_flip_to_scaled(&data,
> index, pipe, output);
> +
> +					igt_require(rval != TESTSKIP);
> +
> +					// break out to test next pipe
> +					if (rval == CONNECTORSUCCESS) {
> +						validtests++;
> +						break;
> +					}
> +				}
> +				if (rval == NOREQUESTEDFORMATONPIPE)
> +					igt_debug("No requested
> format/modifier on pipe %s\n", kmstest_pipe_name(pipe));
> +			}
> +			igt_require_f(validtests > 0, "No valid
> pipe/connector/format/mod
> +combination found");
>  		}
>  	}
>  	igt_fixture {
> --
> 2.28.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
