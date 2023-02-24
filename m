Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A1C10E8C3
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Feb 2023 12:46:54 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q16so3446284wrw.2
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Feb 2023 04:46:54 -0800 (PST)
Message-ID: <a0ceeb51-4974-6c6e-f090-b44a66ac4b9f@gmail.com>
Date: Fri, 24 Feb 2023 14:46:47 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230222091950.31758-1-swati2.sharma@intel.com>
 <20230222091950.31758-4-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230222091950.31758-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3 3/3] tests/kms_plane_scaling: Add
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

On 22.2.2023 11.19, Swati Sharma wrote:
> i915 specific test is added to validate max source size. This
> test is expected to return -EINVAL for platforms where we have
> max source width 4096 whereas it will pass on platforms having
> max source width 5120. We have created fb of size 5120x4320
> (=size of source) and downscaled to 3840x2400(=size of dest).
> 
> On MTL(disp_ver=14), in dmesg we can see
> 
> [drm:skl_update_scaler [i915]] scaler_user index 0.0: src
> 5120x4320 dst 3840x2400 size is out of scaler range.
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
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_plane_scaling.c | 107 ++++++++++++++++++++++++++++++++++++--
>   1 file changed, 104 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 795e3daa..dd2138a7 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -26,6 +26,8 @@
>   #include "igt_vec.h"
>   #include <math.h>
>   
> +#define HDISPLAY_4K	3840
> +
>   IGT_TEST_DESCRIPTION("Test display plane scaling");
>   
>   enum scaler_combo_test_type {
> @@ -964,6 +966,102 @@ static void invalid_parameter_tests(data_t *d)
>   	}
>   }
>   
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
> +	drmModeModeInfo *mode;
> +	igt_output_t *output;
> +	igt_fb_t fb;
> +	igt_plane_t *plane;
> +	int rval;
> +
> +	static const struct invalid_paramtests paramtests[] = {
> +		{
> +			.testname = "max-src-size",
> +			.planesize = {3840, 2400},
> +			.params = {{~0}}
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
> +		igt_require(mode->hdisplay == HDISPLAY_4K);

Would this be better with >= instead of == ?

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
> +			igt_dynamic(paramtests[i].testname) {
> +				igt_plane_set_position(plane, 0, 0);
> +				igt_plane_set_fb(plane, &fb);
> +				igt_plane_set_size(plane,
> +						   paramtests[i].planesize[0],
> +						   paramtests[i].planesize[1]);
> +
> +				for (uint32_t j = 0; paramtests[i].params[j].prop != ~0; j++)
> +					igt_plane_set_prop_value(plane,
> +								 paramtests[i].params[j].prop,
> +								 paramtests[i].params[j].value);

These params are not being used, are there plans on this or would it be 
better just to take this loop away along with .params from paramtests 
structure?

> +
> +				rval = igt_display_try_commit2(&d->display, COMMIT_ATOMIC);
> +
> +				if (intel_display_ver(d->devid) < 11 || intel_display_ver(d->devid) >= 14)
> +					igt_assert(rval == -EINVAL || rval == -ERANGE);
> +				else
> +					igt_assert_eq(rval, 0);
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
> @@ -1123,13 +1221,16 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   		}
>   	}
>   
> +	igt_subtest_group
> +		invalid_parameter_tests(&data);
> +
> +	igt_subtest_group
> +		i915_max_source_size_test(&data);
> +
>   	igt_describe("Tests scaling with multi-pipe.");
>   	igt_subtest_f("2x-scaler-multi-pipe")
>   		test_scaler_with_multi_pipe_plane(&data);
>   
> -	igt_subtest_group
> -		invalid_parameter_tests(&data);
> -
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		close(data.drm_fd);
