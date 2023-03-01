Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1844210E23E
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Mar 2023 19:58:56 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id u9so9158079edd.2
 for <igt-dev@lists.freedesktop.org>; Wed, 01 Mar 2023 11:58:56 -0800 (PST)
Message-ID: <fd01e3dc-2f60-b729-3ec5-2b5db9794c50@gmail.com>
Date: Wed, 1 Mar 2023 21:58:48 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230301114220.15941-1-swati2.sharma@intel.com>
 <20230301114220.15941-4-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230301114220.15941-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v6 3/4] tests/kms_plane_scaling: Add
 test to validate max source size
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

On 1.3.2023 13.42, Swati Sharma wrote:
> i915 specific test is added to validate max source size. This
> test is expected to return -EINVAL for platforms where we have
> max source width 4096 whereas it will pass on platforms having
> max source width 5120. We have created fb of size 5120x4320
> (=size of source) and downscaled to 3840x2160(=size of dest).
> 
> On MTL(disp_ver=14), in dmesg we can see
> 
> [drm:skl_update_scaler [i915]] scaler_user index 0.0: src
> 5120x4320 dst 3840x2160 size is out of scaler range.
> 
> since max source width supported is 4096 whereas same test
> will pass on ADLP(display_ver=13) since max source width
> supported is 5120.
> 
> v2: -updated comment (JP)
>      -not declare list of tests (JP)
>      -fixed indentation (JP)
>      -added i915_max_source_size_test() inside
>       igt_subtest_group() (JP)
> v3: -added restriction to run this test only when HDISPLAY=3840
> v4: -remove inner loop (JP)
>      -test for HDISPLAY >= 3840 (JP)
> v5: -override mode with lowest vrefresh to avoid cdclk lim (JP)
> v6: -add VDISPLAY check (JP)
>      -add description for find_mode() (JP)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_plane_scaling.c | 123 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 123 insertions(+)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index c384a0316..ddff1a0e5 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -26,6 +26,9 @@
>   #include "igt_vec.h"
>   #include <math.h>
>   
> +#define HDISPLAY_4K	3840
> +#define VDISPLAY_4K	2160
> +
>   IGT_TEST_DESCRIPTION("Test display plane scaling");
>   
>   enum scaler_combo_test_type {
> @@ -964,6 +967,123 @@ static void invalid_parameter_tests(data_t *d)
>   	}
>   }
>   
> +static drmModeModeInfo *find_mode(data_t *data, igt_output_t *output, const uint32_t planesize[])
> +{
> +	drmModeModeInfo *mode = NULL;
> +
> +	for (int i = 0; i < output->config.connector->count_modes; i++) {
> +		if (output->config.connector->modes[i].hdisplay == planesize[0] &&
> +		    output->config.connector->modes[i].vdisplay == planesize[1] ) {
> +			if (mode &&
> +			    mode->vrefresh < output->config.connector->modes[i].vrefresh)
> +				continue;
> +
> +			mode = &output->config.connector->modes[i];
> +		}
> +	}
> +
> +	return mode;
> +}
> +
> +/*
> + *	Max source/destination width/height for i915 driver.
> + *	These numbers are coming from
> + *	drivers/gpu/drm/i915/display/skl_scaler.c in kernel sources.
> + *
> + *	DISPLAY_VER < 11
> + *		max_src_w = 4096
> + *		max_src_h = 4096
> + *		max_dst_w = 4096
> + *		max_dst_h = 4096
> + *
> + *	DISPLAY_VER = 11
> + *		max_src_w = 5120
> + *		max_src_h = 4096
> + *		max_dst_w = 5120
> + *		max_dst_h = 4096
> + *
> + *	DISPLAY_VER = 12-13
> + *		max_src_w = 5120
> + *		max_src_h = 8192
> + *		max_dst_w = 8192
> + *		max_dst_h = 8192
> + *
> + *	DISPLAY_VER = 14
> + *		max_src_w = 4096
> + *		max_src_h = 8192
> + *		max_dst_w = 8192
> + *		max_dst_h = 8192
> + */
> +
> +static void i915_max_source_size_test(data_t *d)
> +{
> +	enum pipe pipe = PIPE_A;
> +	drmModeModeInfo *mode = NULL;
> +	igt_output_t *output;
> +	igt_fb_t fb;
> +	igt_plane_t *plane;
> +	int rval;
> +
> +	static const struct invalid_paramtests paramtests[] = {
> +		{
> +			.testname = "max-src-size",
> +			.planesize = {3840, 2160},
> +		},
> +	};
> +
> +	igt_fixture {
> +		igt_require_intel(d->drm_fd);
> +
> +		output = igt_get_single_output_for_pipe(&d->display, pipe);
> +		igt_require(output);
> +
> +		mode = igt_output_get_mode(output);
> +		igt_require(mode->hdisplay >= HDISPLAY_4K && mode->vdisplay >= VDISPLAY_4K);
> +
> +		igt_output_set_pipe(output, pipe);
> +		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +		igt_create_fb(d->drm_fd, 5120, 4320,
> +			      DRM_FORMAT_XRGB8888,
> +			      DRM_FORMAT_MOD_NONE,
> +			      &fb);
> +	}
> +
> +	igt_describe("test for validating max source size.");
> +	igt_subtest_with_dynamic("i915-max-source-size") {
> +		for (uint32_t i = 0; i < ARRAY_SIZE(paramtests); i++) {
> +			/*
> +			 * Need to find mode with lowest vrefresh else
> +			 * we can exceed cdclk limits.
> +			 */
> +			mode = find_mode(d, output, paramtests[i].planesize);
> +			if (mode) {
> +				igt_output_override_mode(output, mode);
> +				igt_output_set_pipe(output, pipe);

As discussed earlier, pipe does not need to be set twice for output in 
same commit. With this fixed entire series is

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

> +				igt_dynamic(paramtests[i].testname) {
> +					igt_plane_set_position(plane, 0, 0);
> +					igt_plane_set_fb(plane, &fb);
> +					igt_plane_set_size(plane,
> +							   paramtests[i].planesize[0],
> +							   paramtests[i].planesize[1]);
> +
> +				rval = igt_display_try_commit2(&d->display, COMMIT_ATOMIC);
> +
> +				if (intel_display_ver(d->devid) < 11 || intel_display_ver(d->devid) >= 14)
> +					igt_assert_eq(rval, -EINVAL);
> +				else
> +					igt_assert_eq(rval, 0);
> +				}
> +			}
> +		}
> +	}
> +
> +	igt_fixture {
> +		igt_remove_fb(d->drm_fd, &fb);
> +		igt_output_set_pipe(output, PIPE_NONE);
> +	}
> +}
> +
>   static int opt_handler(int opt, int opt_index, void *_data)
>   {
>   	data_t *data = _data;
> @@ -1126,6 +1246,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	igt_subtest_group
>   		invalid_parameter_tests(&data);
>   
> +	igt_subtest_group
> +		i915_max_source_size_test(&data);
> +
>   	igt_describe("Tests scaling with multi-pipe.");
>   	igt_subtest_f("2x-scaler-multi-pipe")
>   		test_scaler_with_multi_pipe_plane(&data);
