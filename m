Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8379610E73C
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jan 2022 23:13:31 +0000 (UTC)
Message-ID: <5fcb2b0c-6a61-721f-764b-2d3272734bf3@quicinc.com>
Date: Thu, 27 Jan 2022 15:13:29 -0800
MIME-Version: 1.0
From: Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20220126115846.25920-1-petri.latvala@intel.com>
Content-Language: en-US
In-Reply-To: <20220126115846.25920-1-petri.latvala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] kms_plane_scaling: Add more scale
 factor tests to cover more drivers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri,

On 1/26/2022 3:58 AM, Petri Latvala wrote:
> Not all drivers support all scale factors. Introduce more scale
> factors rather than only testing scaling from a 20x20 fb.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   tests/kms_plane_scaling.c | 81 +++++++++++++++++++++++++++++++--------
>   1 file changed, 65 insertions(+), 16 deletions(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 85db11ee..47ef4a12 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -120,12 +120,14 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
>   
>   static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   					 uint32_t pixel_format,
> -					 uint64_t modifier, enum pipe pipe,
> +					 uint64_t modifier,
> +					 int width, int height,
> +					 enum pipe pipe,
>   					 igt_output_t *output,
>   					 igt_rotation_t rot)
>   {
>   	igt_display_t *display = &d->display;
> -	int width, height;
> +	int commit_ret;
>   	drmModeModeInfo *mode;
>   
>   	cleanup_crtc(d);
> @@ -133,22 +135,24 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   	igt_output_set_pipe(output, pipe);
>   	mode = igt_output_get_mode(output);
>   
> -	/* create buffer in the range of  min and max source side limit.*/
> -	width = height = 20;
>   	igt_create_color_fb(display->drm_fd, width, height,
>   		       pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
>   	igt_plane_set_fb(plane, &d->fb[0]);
>   
> -	/* Check min to full resolution upscaling */
>   	igt_fb_set_position(&d->fb[0], plane, 0, 0);
>   	igt_fb_set_size(&d->fb[0], plane, width, height);
>   	igt_plane_set_position(plane, 0, 0);
>   	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>   	igt_plane_set_rotation(plane, rot);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> +	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
>   
>   	igt_plane_set_fb(plane, NULL);
>   	igt_plane_set_position(plane, 0, 0);
> +
> +	igt_skip_on_f(commit_ret == -ERANGE,
> +		      "Unsupported scaling factor with fb size %dx%d\n",
> +		      width, height);
> +	igt_assert_eq(commit_ret, 0);
>   }
>   
>   static const igt_rotation_t rotations[] = {
> @@ -243,6 +247,7 @@ static bool test_pipe_iteration(data_t *data, enum pipe pipe, int iteration)
>   }
>   
>   static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
> +					   int width, int height,

The ordering of the params should be consistent with that of 
test_scaler_with_pixel_format_pipe and check_scaling_pipe_plane_rot.

>   					   igt_output_t *output)
>   {
>   	igt_display_t *display = &d->display;
> @@ -271,9 +276,11 @@ static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
>   				    igt_plane_has_rotation(plane, rot) &&
>   				    can_rotate(d, format, modifier, rot) &&
>   				    can_scale(d, format))
> -					check_scaling_pipe_plane_rot(d, plane, format,
> -								     modifier, pipe,
> -								     output, rot);
> +					check_scaling_pipe_plane_rot(d, plane,
> +								     format, modifier,
> +								     width, height,
> +								     pipe, output,
> +								     rot);
>   			}
>   
>   			igt_vec_fini(&tested_formats);
> @@ -288,7 +295,8 @@ static const uint64_t modifiers[] = {
>   	I915_FORMAT_MOD_Yf_TILED
>   };
>   
> -static void test_scaler_with_pixel_format_pipe(data_t *d, enum pipe pipe, igt_output_t *output)
> +static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height,
> +					       enum pipe pipe, igt_output_t *output)
>   {
>   	igt_display_t *display = &d->display;
>   	igt_plane_t *plane;
> @@ -315,6 +323,7 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, enum pipe pipe, igt_ou
>   				    can_scale(d, format))
>   					check_scaling_pipe_plane_rot(d, plane,
>   								     format, modifier,
> +								     width, height,
>   								     pipe, output, IGT_ROTATION_0);
>   			}
>   
> @@ -726,18 +735,58 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   					test_plane_scaling_on_pipe(&data, pipe, output);
>   		}
>   
> -		igt_describe("Tests scaling with pixel formats.");
> -		igt_subtest_with_dynamic("scaler-with-pixel-format") {
> +		igt_describe("Tests scaling with pixel formats, from 20x20 fb.");
> +		igt_subtest_with_dynamic("scaler-with-pixel-format-20x20") {
> +			for_each_pipe_with_single_output(&data.display, pipe, output)
> +				igt_dynamic_f("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe))
> +					test_scaler_with_pixel_format_pipe(&data, 20, 20, pipe, output);
> +		}
> +
> +		igt_describe("Tests scaling with pixel formats, scaling factor 4.");
> +		igt_subtest_with_dynamic("scaler-with-pixel-format-factor-4") {
> +			drmModeModeInfo *mode;
> +
> +			mode = igt_output_get_mode(output);

Should move this inside of the for each loop since the compatible 
outputs are populated within for_each_pipe_with_single_output. Getting 
the mode before then will return incorrect values and cause an invalid 
argument error for create_fb.

> +			for_each_pipe_with_single_output(&data.display, pipe, output)
> +				igt_dynamic_f("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe))
> +					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay / 4, mode->vdisplay / 4, pipe, output);

This could hit an edge case where the resolution being passed in isn't 
32-bit aligned. Should add a check for this (maybe within 
check_scaling_pipe_plane_rot) and possibly correct to an appropriate fb 
size.

Thanks,
Jessica Zhang

> +		}
> +
> +		igt_describe("Tests scaling with pixel formats, unity scaling.");
> +		igt_subtest_with_dynamic("scaler-with-pixel-format-unity-scaling") {
> +			drmModeModeInfo *mode;
> +
> +			mode = igt_output_get_mode(output);
>   			for_each_pipe_with_single_output(&data.display, pipe, output)
>   				igt_dynamic_f("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe))
> -					test_scaler_with_pixel_format_pipe(&data, pipe, output);
> +					test_scaler_with_pixel_format_pipe(&data, mode->hdisplay, mode->vdisplay, pipe, output);
> +		}
> +
> +		igt_describe("Tests scaling with tiling rotation, from 20x20 fb.");
> +		igt_subtest_with_dynamic("scaler-with-rotation-20x20") {
> +			for_each_pipe_with_single_output(&data.display, pipe, output)
> +				igt_dynamic_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
> +					test_scaler_with_rotation_pipe(&data, 20, 20, pipe, output); >   		}
>   
> -		igt_describe("Tests scaling with tiling rotation.");
> -		igt_subtest_with_dynamic("scaler-with-rotation") {
> +		igt_describe("Tests scaling with tiling rotation, scaling factor 4.");
> +		igt_subtest_with_dynamic("scaler-with-rotation-factor-4") {
> +			drmModeModeInfo *mode;
> +
> +			mode = igt_output_get_mode(output);
> +			for_each_pipe_with_single_output(&data.display, pipe, output)
> +				igt_dynamic_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
> +					test_scaler_with_rotation_pipe(&data, mode->hdisplay / 4, mode->vdisplay / 4, pipe, output);
> +		}
> +
> +		igt_describe("Tests scaling with tiling rotation, unity scaling.");
> +		igt_subtest_with_dynamic("scaler-with-rotation-unity-scaling") {
> +			drmModeModeInfo *mode;
> +
> +			mode = igt_output_get_mode(output);
>   			for_each_pipe_with_single_output(&data.display, pipe, output)
>   				igt_dynamic_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
> -					test_scaler_with_rotation_pipe(&data, pipe, output);
> +					test_scaler_with_rotation_pipe(&data, mode->hdisplay, mode->vdisplay, pipe, output);
>   		}
>   
>   		igt_describe("Tests scaling with clipping and clamping.");
> -- 
> 2.30.2
> 
