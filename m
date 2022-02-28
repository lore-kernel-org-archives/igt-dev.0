Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB7B10E35E
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Feb 2022 10:26:54 +0000 (UTC)
Date: Mon, 28 Feb 2022 12:26:08 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Message-ID: <YhyjQJMKpFA2YXGG@platvala-desk.ger.corp.intel.com>
References: <20220227163057.28703-1-swati2.sharma@intel.com>
 <20220227163057.28703-9-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220227163057.28703-9-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [v8 8/8] tests/kms_plane_scaling: Add negative test
 to check num of scalers
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

On Sun, Feb 27, 2022 at 10:00:57PM +0530, Swati Sharma wrote:
> To validate i915 supports max of 2 scalers, applied upscaling on
> 3 planes simultaneously. This is a negative test and commit is expected
> to fail.
> 
> v2: -add check for min 2 scalers
>     -add igt_require() for overlay planes, fixes CRASH on KBL
> v3: -rebase
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_plane_scaling.c | 70 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 243a692d..237030a5 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -503,6 +503,68 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>  	igt_remove_fb(display->drm_fd, &d->fb[2]);
>  }
>  
> +static void
> +test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
> +{
> +	igt_display_t *display = &d->display;
> +	igt_pipe_t *pipe_obj = &display->pipes[pipe];
> +	int width, height;
> +	igt_plane_t *plane[3];
> +	drmModeModeInfo *mode;
> +
> +	cleanup_crtc(d);
> +
> +	igt_output_set_pipe(output, pipe);
> +
> +	width = height = 20;
> +	mode = igt_output_get_mode(output);
> +
> +	plane[0] = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 0);
> +	igt_require(plane[0]);
> +	plane[1] = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 1);
> +	igt_require(plane[1]);
> +	plane[2] = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 2);
> +	igt_require(plane[2]);
> +
> +	igt_create_color_pattern_fb(display->drm_fd,
> +                                    width, height,
> +                                    DRM_FORMAT_XRGB8888,
> +                                    I915_TILING_NONE,
> +                                    1.0, 0.0, 0.0, &d->fb[0]);
> +	igt_create_color_pattern_fb(display->drm_fd,
> +                                    width, height,
> +                                    DRM_FORMAT_XRGB8888,
> +                                    I915_TILING_NONE,
> +                                    0.0, 1.0, 0.0, &d->fb[1]);
> +	igt_create_color_pattern_fb(display->drm_fd,
> +                                    width, height,
> +                                    DRM_FORMAT_XRGB8888,
> +                                    I915_TILING_NONE,
> +                                    0.0, 0.0, 1.0, &d->fb[2]);
> +
> +	igt_plane_set_fb(plane[0], &d->fb[0]);
> +	igt_plane_set_fb(plane[1], &d->fb[1]);
> +	igt_plane_set_fb(plane[2], &d->fb[2]);
> +
> +	igt_plane_set_size(plane[0], mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_size(plane[1], mode->hdisplay, mode->vdisplay);
> +	igt_plane_set_size(plane[2], mode->hdisplay, mode->vdisplay);
> +
> +	/* This commit is expected to fail. There is max 2 scalers/pipe.
> +	 * In dmesg we can find:
> +	 * 	Too many scaling requests 3 > 2
> +	 * */
> +	igt_assert_eq(igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL), -EINVAL);

For devices (non-i915, or possible future i915) that are able to
perform this amount of scaling:

ret = igt_display_try_commit_atomic(....);
igt_skip_on_f(ret == 0, "Cannot test handling of too many scaling ops, the device supports a large amount.\n");
igt_assert_eq(ret, -EINVAL);


-- 
Petri Latvala



> +
> +	/* cleanup */
> +	igt_plane_set_fb(plane[0], NULL);
> +	igt_plane_set_fb(plane[1], NULL);
> +	igt_plane_set_fb(plane[2], NULL);
> +	igt_remove_fb(display->drm_fd, &d->fb[0]);
> +	igt_remove_fb(display->drm_fd, &d->fb[1]);
> +	igt_remove_fb(display->drm_fd, &d->fb[2]);
> +}
> +
>  static void test_scaler_with_multi_pipe_plane(data_t *d)
>  {
>  	igt_display_t *display = &d->display;
> @@ -879,6 +941,14 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  				}
>  			}
>  		}
> +
> +		igt_describe("Negative test for number of scalers per pipe.");
> +		igt_subtest_with_dynamic("invalid-num-scalers") {
> +			for_each_pipe_with_valid_output(&data.display, pipe, output)
> +				igt_dynamic_f("pipe-%s-%s-invalid-num-scalers",
> +					       kmstest_pipe_name(pipe), igt_output_name(output))
> +					test_invalid_num_scalers(&data, pipe, output);
> +		}
>  	}
>  
>  	igt_describe("Tests scaling with multi-pipe scenario.");
> -- 
> 2.25.1
> 
