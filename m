Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B2F113284
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 12:59:05 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u8so1758262wrm.13
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 05:59:04 -0700 (PDT)
Message-ID: <74265f0b-82e9-fb68-74ae-f01c0426b770@gmail.com>
Date: Thu, 16 Jun 2022 15:58:56 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20220615095906.23688-1-swati2.sharma@intel.com>
 <20220615095906.23688-2-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220615095906.23688-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/kms_flip_scaled_crc:
 Convert tests to dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 15.6.2022 12.59, Swati Sharma wrote:
> Covert the existing subtests to dynamic subtests at pipe/output level.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/i915/kms_flip_scaled_crc.c | 69 ++++++++------------------------
>   1 file changed, 16 insertions(+), 53 deletions(-)
> 
> diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
> index 9740715f..6cf3a64b 100644
> --- a/tests/i915/kms_flip_scaled_crc.c
> +++ b/tests/i915/kms_flip_scaled_crc.c
> @@ -163,8 +163,6 @@ const struct {
>   	},
>   };
>   
> -enum subrval {CONNECTORFAIL, CONNECTORSUCCESS, TESTSKIP, NOREQUESTEDFORMATONPIPE};
> -
>   static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
>   		     uint32_t height, uint64_t format, uint64_t modifier)
>   {
> @@ -220,8 +218,8 @@ static void clear_lut(data_t *data, enum pipe pipe)
>   	igt_pipe_obj_set_prop_value(pipe_obj, IGT_CRTC_GAMMA_LUT, 0);
>   }
>   
> -static enum subrval test_flip_to_scaled(data_t *data, uint32_t index,
> -					enum pipe pipe, igt_output_t *output)
> +static void test_flip_to_scaled(data_t *data, uint32_t index,
> +				enum pipe pipe, igt_output_t *output)
>   {
>   	igt_plane_t *primary;
>   	igt_crc_t small_crc, big_crc;
> @@ -257,11 +255,10 @@ static enum subrval test_flip_to_scaled(data_t *data, uint32_t index,
>   	igt_output_set_pipe(output, pipe);
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	if (!igt_plane_has_format_mod(primary, data->small_fb.drm_format,
> +	igt_skip_on_f (!igt_plane_has_format_mod(primary, data->small_fb.drm_format,
>   				      data->small_fb.modifier) ||
> -	    !igt_plane_has_format_mod(primary, data->big_fb.drm_format,
> -				      data->big_fb.modifier))
> -		return NOREQUESTEDFORMATONPIPE;
> +		       !igt_plane_has_format_mod(primary, data->big_fb.drm_format,
> +				      data->big_fb.modifier), "No requested format/modifier on pipe %s\n", kmstest_pipe_name(pipe));
>   
>   	set_lut(data, pipe);
>   	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET,
> @@ -295,20 +292,10 @@ static enum subrval test_flip_to_scaled(data_t *data, uint32_t index,
>   	igt_plane_set_size(primary, data->attemptmodewidth,
>   			   data->attemptmodeheight);
>   	ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -	switch (ret) {
> -	case -ERANGE:
> -		igt_debug("Platform scaling limits exceeded, skipping.\n");
> -		return TESTSKIP;
> -	case -EINVAL:
> -		if (!modetoset) {
> -			igt_debug("No %dp and default mode too big, cdclk limits exceeded. Check next connector\n",
> +	igt_skip_on_f(ret == -ERANGE, "Platform scaling limits exceeded, skipping.\n");
> +	igt_skip_on_f((ret == -EINVAL) && !modetoset, "No %dp and default mode too big, cdclk limits exceeded. Check next connector\n",
>   				  data->attemptmodeheight);
> -			return CONNECTORFAIL;
> -		}
> -		/* fallthrough */
> -	default:
> -		igt_assert_eq(ret, 0);
> -	}
> +	igt_assert_eq(ret, 0);
>   
>   	igt_pipe_crc_start(data->pipe_crc);
>   	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &small_crc);
> @@ -319,21 +306,10 @@ static enum subrval test_flip_to_scaled(data_t *data, uint32_t index,
>   	ret = igt_display_try_commit_atomic(&data->display,
>   					    DRM_MODE_ATOMIC_ALLOW_MODESET  |
>   					    DRM_MODE_PAGE_FLIP_EVENT, NULL);
> -
> -	switch (ret) {
> -	case -ERANGE:
> -		igt_debug("Platform scaling limits exceeded, skipping.\n");
> -		return TESTSKIP;
> -	case -EINVAL:
> -		if (!modetoset) {
> -			igt_debug("No %dp and default mode too big, cdclk limits exceeded. Check next connector\n",
> +	igt_skip_on_f(ret == -ERANGE, "Platform scaling limits exceeded, skipping.\n");
> +	igt_skip_on_f((ret == -EINVAL) && !modetoset, "No %dp and default mode too big, cdclk limits exceeded. Check next connector\n",
>   				  data->attemptmodeheight);
> -			return CONNECTORFAIL;
> -		}
> -		/* fallthrough */
> -	default:
> -		igt_assert_eq(ret, 0);
> -	}
> +	igt_assert_eq(ret, 0);
>   
>   	igt_assert(read(data->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
>   
> @@ -349,8 +325,6 @@ static enum subrval test_flip_to_scaled(data_t *data, uint32_t index,
>   	igt_output_set_pipe(output, PIPE_NONE);
>   	igt_plane_set_fb(primary, NULL);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -
> -	return CONNECTORSUCCESS;
>   }
>   
>   igt_main
> @@ -379,28 +353,17 @@ igt_main
>   
>   	for (int index = 0; index < ARRAY_SIZE(flip_scenario_test); index++) {
>   		igt_describe(flip_scenario_test[index].describe);
> -		igt_subtest(flip_scenario_test[index].name) {
> -			int validtests = 0;
> +		igt_subtest_with_dynamic(flip_scenario_test[index].name) {
>   			free_fbs(&data);
> -			for_each_pipe_static(pipe) {
> -				enum subrval rval = CONNECTORSUCCESS;
> +			for_each_pipe(&data.display, pipe) {
>   				for_each_valid_output_on_pipe(&data.display, pipe, output) {
> -					rval = test_flip_to_scaled(&data, index, pipe, output);
> -
> -					igt_require(rval != TESTSKIP);
> -
> -					// break out to test next pipe
> -					if (rval == CONNECTORSUCCESS) {
> -						validtests++;
> -						break;

This above part with CONNECTORSUCCESS make it so once test has been run 
successfully on chosen pipe this pipe will not be tested again as this 
test is testing pipe feature. I don't think this need to be run 
separately for each connector using all pipes.

> -					}
> +					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> +						test_flip_to_scaled(&data, index, pipe, output);
>   				}
> -				if (rval == NOREQUESTEDFORMATONPIPE)
> -					igt_debug("No requested format/modifier on pipe %s\n", kmstest_pipe_name(pipe));
>   			}
> -			igt_require_f(validtests > 0, "No valid pipe/connector/format/mod combination found\n");
>   		}
>   	}
> +
>   	igt_fixture {
>   		free_fbs(&data);
>   		if (data.pipe_crc) {
