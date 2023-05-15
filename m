Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E704310E1C7
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 12:45:55 +0000 (UTC)
Date: Mon, 15 May 2023 15:45:52 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Message-ID: <ZGIpgHJcvQE0oIWV@intel.com>
References: <20230515120334.220022-1-swati2.sharma@intel.com>
 <20230515120334.220022-2-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230515120334.220022-2-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/kms_pipe_crc_basic: Add NV12
 CRC sanitycheck tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 15, 2023 at 05:33:33PM +0530, Swati Sharma wrote:
> New CRC sanitycheck test cases are added with NV12 format (white
> and solid rgb).

Why?

> Existing test case(with format XRGB) is modified to validate CRC
> with solid rgb in addition to white color fb)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_pipe_crc_basic.c | 198 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 182 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 84c73fd7..a340d5b1 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -239,13 +239,15 @@ static void test_read_crc(data_t *data, enum pipe pipe,
>   * CRC-sanity test, to make sure there would be no CRC mismatches
>   *
>   * - Create two framebuffers (FB0 & FB1) with same color info
> + *   with different formats (RGB/NV12)
>   * - Flip FB0 with the Primary plane & collect the CRC as ref CRC.
>   * - Flip FB1 with the Primary plane, collect the CRC & compare with
>   *   the ref CRC.
>   *
>   *   No CRC mismatch should happen
>   */
> -static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
> +static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
> +			     uint32_t format, int color)
>  {
>  	igt_display_t *display = &data->display;
>  	igt_plane_t *primary;
> @@ -260,18 +262,60 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output)
>  	mode = igt_output_get_mode(output);
>  
>  	/* Create two framebuffers with the same color info. */
> -	igt_create_color_fb(data->drm_fd,
> -			mode->hdisplay, mode->vdisplay,
> -			DRM_FORMAT_XRGB8888,
> -			DRM_FORMAT_MOD_LINEAR,
> -			1.0, 1.0, 1.0,
> -			&fb0);
> -	igt_create_color_fb(data->drm_fd,
> -			mode->hdisplay, mode->vdisplay,
> -			DRM_FORMAT_XRGB8888,
> -			DRM_FORMAT_MOD_LINEAR,
> -			1.0, 1.0, 1.0,
> -			&fb1);
> +	switch (color) {
> +	case 1:
> +		igt_create_color_fb(data->drm_fd,
> +				mode->hdisplay, mode->vdisplay,
> +				format, DRM_FORMAT_MOD_LINEAR,
> +				1.0, 0.0, 0.0,
> +				&fb0);
> +
> +		igt_create_color_fb(data->drm_fd,
> +				mode->hdisplay, mode->vdisplay,
> +				format, DRM_FORMAT_MOD_LINEAR,
> +				1.0, 0.0, 0.0,
> +				&fb1);
> +		break;
> +	case 2:
> +		igt_create_color_fb(data->drm_fd,
> +				mode->hdisplay, mode->vdisplay,
> +				format, DRM_FORMAT_MOD_LINEAR,
> +				0.0, 1.0, 0.0,
> +				&fb0);
> +
> +		igt_create_color_fb(data->drm_fd,
> +				mode->hdisplay, mode->vdisplay,
> +				format, DRM_FORMAT_MOD_LINEAR,
> +				0.0, 1.0, 0.0,
> +				&fb1);
> +		break;
> +	case 3:
> +		igt_create_color_fb(data->drm_fd,
> +				mode->hdisplay, mode->vdisplay,
> +				format, DRM_FORMAT_MOD_LINEAR,
> +				0.0, 0.0, 1.0,
> +				&fb0);
> +
> +		igt_create_color_fb(data->drm_fd,
> +				mode->hdisplay, mode->vdisplay,
> +				format, DRM_FORMAT_MOD_LINEAR,
> +				0.0, 0.0, 1.0,
> +				&fb1);
> +		break;
> +	case 0:
> +	default:
> +		igt_create_color_fb(data->drm_fd,
> +				mode->hdisplay, mode->vdisplay,
> +				format, DRM_FORMAT_MOD_LINEAR,
> +				1.0, 1.0, 1.0,
> +				&fb0);
> +
> +		igt_create_color_fb(data->drm_fd,
> +				mode->hdisplay, mode->vdisplay,
> +				format, DRM_FORMAT_MOD_LINEAR,
> +				1.0, 1.0, 1.0,
> +				&fb1);
> +	}
>  
>  	/* Flip FB0 with the Primary plane & collect the CRC as ref CRC. */
>  	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> @@ -475,8 +519,77 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  		}
>  	}
>  
> -	igt_describe("Basic sanity check for CRC mismatches");
> -	igt_subtest_with_dynamic("compare-crc-sanitycheck") {
> +	igt_describe("Basic sanity check for CRC mismatches with XRGB format "
> +		     "and white color fb.");
> +	igt_subtest_with_dynamic("compare-crc-sanitycheck-xrgb") {
> +		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (simulation_constraint(pipe))
> +				continue;
> +
> +			if(!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
> +
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> +				test_compare_crc(&data, pipe, output, DRM_FORMAT_XRGB8888, 0);
> +
> +			break;
> +		}
> +	}
> +
> +	igt_describe("Basic sanity check for CRC mismatches with XRGB format "
> +		     "and red solid color fb.");
> +	igt_subtest_with_dynamic("compare-crc-sanitycheck-xrgb-red") {
> +			for_each_pipe_with_single_output(&data.display, pipe, output) {
> +				if (simulation_constraint(pipe))
> +					continue;
> +
> +				if(!pipe_output_combo_valid(&data.display, pipe, output))
> +					continue;
> +
> +				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> +					test_compare_crc(&data, pipe, output, DRM_FORMAT_XRGB8888, 1);
> +
> +			break;
> +		}
> +	}
> +
> +	igt_describe("Basic sanity check for CRC mismatches with XRGB format "
> +		     "and green solid color fb.");
> +	igt_subtest_with_dynamic("compare-crc-sanitycheck-xrgb-green") {
> +		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (simulation_constraint(pipe))
> +				continue;
> +
> +			if(!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
> +
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> +				test_compare_crc(&data, pipe, output, DRM_FORMAT_XRGB8888, 2);
> +
> +			break;
> +		}
> +	}
> +
> +	igt_describe("Basic sanity check for CRC mismatches with XRGB format "
> +		     "and blue solid color fb.");
> +	igt_subtest_with_dynamic("compare-crc-sanitycheck-xrgb-blue") {
> +		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (simulation_constraint(pipe))
> +				continue;
> +
> +			if(!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
> +
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> +				test_compare_crc(&data, pipe, output, DRM_FORMAT_XRGB8888, 3);
> +
> +			break;
> +		}
> +	}
> +
> +	igt_describe("Basic sanity check for CRC mismatches with NV12 format "
> +		     "and white color fb.");
> +	igt_subtest_with_dynamic("compare-crc-sanitycheck-nv12") {
>  		for_each_pipe_with_single_output(&data.display, pipe, output) {
>  			if (simulation_constraint(pipe))
>  				continue;
> @@ -485,7 +598,60 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  				continue;
>  
>  			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> -				test_compare_crc(&data, pipe, output);
> +				test_compare_crc(&data, pipe, output, DRM_FORMAT_NV12, 0);
> +
> +			break;
> +		}
> +	}
> +
> +	igt_describe("Basic sanity check for CRC mismatches with NV12 format "
> +		     "and red solid color fb.");
> +	igt_subtest_with_dynamic("compare-crc-sanitycheck-nv12-red") {
> +			for_each_pipe_with_single_output(&data.display, pipe, output) {
> +				if (simulation_constraint(pipe))
> +					continue;
> +
> +				if(!pipe_output_combo_valid(&data.display, pipe, output))
> +					continue;
> +
> +				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> +					test_compare_crc(&data, pipe, output, DRM_FORMAT_NV12, 1);
> +
> +			break;
> +		}
> +	}
> +
> +	igt_describe("Basic sanity check for CRC mismatches with NV12 format "
> +		     "and green solid color fb.");
> +	igt_subtest_with_dynamic("compare-crc-sanitycheck-nv12-green") {
> +		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (simulation_constraint(pipe))
> +				continue;
> +
> +			if(!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
> +
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> +				test_compare_crc(&data, pipe, output, DRM_FORMAT_NV12, 2);
> +
> +			break;
> +		}
> +	}
> +
> +	igt_describe("Basic sanity check for CRC mismatches with NV12 format "
> +		     "and blue solid color fb.");
> +	igt_subtest_with_dynamic("compare-crc-sanitycheck-nv12-blue") {
> +		for_each_pipe_with_single_output(&data.display, pipe, output) {
> +			if (simulation_constraint(pipe))
> +				continue;
> +
> +			if(!pipe_output_combo_valid(&data.display, pipe, output))
> +				continue;
> +
> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
> +				test_compare_crc(&data, pipe, output, DRM_FORMAT_NV12, 3);
> +
> +			break;
>  		}
>  	}
>  
> -- 
> 2.25.1

-- 
Ville Syrjälä
Intel
