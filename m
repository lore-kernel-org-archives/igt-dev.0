Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19E410F92B
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Feb 2022 10:23:42 +0000 (UTC)
Date: Thu, 24 Feb 2022 12:22:48 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Message-ID: <YhdceGXWGQEiDf60@platvala-desk.ger.corp.intel.com>
References: <20220224101224.12319-1-swati2.sharma@intel.com>
 <20220224101224.12319-6-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220224101224.12319-6-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [v6 5/8] tests/kms_plane_scaling: Upscaling and
 downscaling scenario
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

On Thu, Feb 24, 2022 at 03:42:21PM +0530, Swati Sharma wrote:
> Upscaling on first plane and downscaling on second plane.
> 
> v2: -add check for min 2 scalers
>     -add igt_require() for overlay planes, fixes CRASH on KBL
> v3: -test modified for n planes (Ville)
> v4: -code optimization
> v5: -limiting while loop and few other changes based on prev. patches
> v6: -rebase
>     -modified tests after rebase for consistency and more coverage
>     (Petri)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_plane_scaling.c | 89 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 8ed75ab6..52f19f5d 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -32,6 +32,7 @@ IGT_TEST_DESCRIPTION("Test display plane scaling");
>  enum scaler_combo_test_type {
>  	TEST_PLANES_UPSCALE = 0,
>  	TEST_PLANES_DOWNSCALE,
> +	TEST_PLANES_UPSCALE_DOWNSCALE
>  };
>  
>  typedef struct {
> @@ -52,6 +53,66 @@ typedef struct {
>  	bool extended;
>  } data_t;
>  
> +const struct {
> +	const char * const describe;
> +	const char * const name;
> +	const int sf_plane1;
> +	const int sf_plane2;
> +} upscale_downscale_tests[] = {
> +		{
> +			"Tests upscaling (20x20) and downscaling (scaling factor 2) of 2 planes.",
> +			"planes-upscale-20x20-downscale-factor-2",
> +			0.0,
> +			2.0,
> +		},
> +		{
> +			"Tests upscaling (20x20) and downscaling (scaling factor 4) of 2 planes.",
> +			"planes-upscale-20x20-downscale-factor-4",
> +			0.0,
> +			4.0,
> +		},
> +		{
> +			"Tests upscaling (scaling factor 4) and downscaling (scaling factor 2) of 2 planes.",
> +			"planes-upscale-factor-4-downscale-factor-2",
> +			4.0,
> +			2.0,
> +		},
> +		{
> +			"Tests upscaling (scaling factor 4) and downscaling (scaling factor 4) of 2 planes.",
> +			"planes-upscale-factor-4-downscale-factor-4",
> +			4.0,
> +			4.0,
> +		},
> +		{
> +			"Tests scaling (unity) and downscaling (scaling factor 2) of 2 planes.",
> +			"planes-unity-scaling-downscale-factor-2",
> +			1.0,
> +			2.0,
> +		},
> +		{
> +			"Tests scaling (unity) and downscaling (scaling factor 4) of 2 planes.",
> +			"planes-unity-scaling-downscale-factor-4",
> +			1.0,
> +			4.0,
> +		},

The scale factors are ints in the struct, why are they given as doubles?


-- 
Petri Latvala



> +};
> +
> +static int get_width(drmModeModeInfo *mode, int scaling_factor)
> +{
> +	if (scaling_factor == 0)
> +		return 20;
> +	else
> +		return mode->hdisplay / scaling_factor;
> +}
> +
> +static int get_height(drmModeModeInfo *mode, int scaling_factor)
> +{
> +	if (scaling_factor == 0)
> +		return 20;
> +	else
> +		return mode->vdisplay / scaling_factor;
> +}
> +
>  static int get_num_scalers(data_t* d, enum pipe pipe)
>  {
>  	if (!is_i915_device(d->drm_fd))
> @@ -500,6 +561,12 @@ __test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>  		/* second plane downscaling */
>  		igt_plane_set_size(p2, w2, h2);
>  	}
> +	if (test_type == TEST_PLANES_UPSCALE_DOWNSCALE) {
> +		/* first plane upscaling */
> +		igt_plane_set_size(p1, mode->hdisplay, mode->vdisplay);
> +		/* second plane downscaling */
> +		igt_plane_set_size(p2, w2, h2);
> +	}
>  
>  	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>  
> @@ -541,6 +608,10 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>  		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 1.0, 0.0, 0.0, &d->fb[1]);
>  		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 0.0, 1.0, 0.0, &d->fb[2]);
>  	}
> +	if (test_type == TEST_PLANES_UPSCALE_DOWNSCALE) {
> +		setup_fb(display->drm_fd, w1, h1, 1.0, 0.0, 0.0, &d->fb[1]);
> +		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 0.0, 1.0, 0.0, &d->fb[2]);
> +	}
>  
>  	for (int k = 0; k < display->pipes[pipe].n_planes; k++) {
>  		igt_plane_t *p1, *p2;
> @@ -868,6 +939,24 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  				}
>  		}
>  
> +		for (int index = 0; index < ARRAY_SIZE(upscale_downscale_tests); index++) {
> +			igt_describe(upscale_downscale_tests[index].describe);
> +			igt_subtest_with_dynamic(upscale_downscale_tests[index].name) {
> +			for_each_pipe_with_single_output(&data.display, pipe, output)
> +				igt_dynamic_f("pipe-%s-%s-planes-upscale-downscale", kmstest_pipe_name(pipe), igt_output_name(output)) {
> +					drmModeModeInfo *mode;
> +
> +					mode = igt_output_get_mode(output);
> +
> +					test_planes_scaling_combo(&data,
> +							get_width(mode, upscale_downscale_tests[index].sf_plane1),
> +							get_height(mode, upscale_downscale_tests[index].sf_plane1),
> +							get_width(mode, upscale_downscale_tests[index].sf_plane2),
> +							get_height(mode,upscale_downscale_tests[index].sf_plane2),
> +							pipe, output, TEST_PLANES_UPSCALE_DOWNSCALE);
> +				}
> +			}
> +		}
>  	}
>  
>  	igt_describe("Tests scaling with multi-pipe scenario.");
> -- 
> 2.25.1
> 
