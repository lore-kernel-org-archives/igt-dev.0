Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C35B6EA9C
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2020 16:45:27 +0000 (UTC)
Date: Wed, 8 Apr 2020 19:41:45 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Message-ID: <20200408164145.GA27910@intel.com>
References: <20200401065423.29345-1-mika.kahola@intel.com>
 <20200401065423.29345-3-mika.kahola@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401065423.29345-3-mika.kahola@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2] tests/kms_concurrent: Use
 maximum number of planes that display/platform combination supports
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org, juhapekka.heikkila@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 01, 2020 at 09:54:23AM +0300, Mika Kahola wrote:
> There was an error in
> 
> commit 0ab05a51a059 ("tests/kms_concurrent: Test for maximum number of planes")
> 
> that calculates the maximum number of supported planes. The patch proposes to
> test first if an atomic commit is successful with the selected number of planes.
> In case of a failure, the number of planes is reduced by one assuming that the
> failure was caused by bandwidth limit. The test loops at least as many iterations
> as there are planes defined by the platform.
> 
> v2: Fix CI build failure (CI)
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>  tests/kms_concurrent.c | 51 ++++++++++--------------------------------
>  1 file changed, 12 insertions(+), 39 deletions(-)
> 
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index c212f6ec..89016563 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -204,19 +204,23 @@ test_plane_position_with_output(data_t *data, enum pipe pipe, int max_planes,
>  				igt_output_t *output)
>  {
>  	int i;
> -	int iterations = opt.iterations < 1 ? 1 : opt.iterations;
> +	int iterations = opt.iterations < 1 ? max_planes : opt.iterations;
>  	bool loop_forever = opt.iterations == LOOP_FOREVER ? true : false;
> +	int ret;
>  
>  	igt_pipe_refresh(&data->display, pipe, true);
>  
>  	i = 0;
>  	while (i < iterations || loop_forever) {
>  		prepare_planes(data, pipe, max_planes, output);
> -		igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>  
>  		for (int c = 0; c < max_planes; c++)
>  			igt_remove_fb(data->drm_fd, &data->fb[c]);
>  
> +		if (ret != 0)
> +			max_planes > 1 ? max_planes-- : 1;

That one looks a bit strange, but I guess it does it's job :)

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> +
>  		i++;
>  	}
>  }
> @@ -249,44 +253,17 @@ get_lowres_mode(data_t *data, const drmModeModeInfo *mode_default,
>  	return mode;
>  }
>  
> -static int
> -test_resolution_with_output(data_t *data, enum pipe pipe, igt_output_t *output)
> +static void
> +test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_output_t *output)
>  {
>  	const drmModeModeInfo *mode_hi, *mode_lo;
> -	int iterations = opt.iterations < 1 ? 1 : opt.iterations;
> +	int iterations = opt.iterations < 1 ? max_planes : opt.iterations;
>  	bool loop_forever = opt.iterations == LOOP_FOREVER ? true : false;
> -	int i, c, ret;
> -	int max_planes = data->display.pipes[pipe].n_planes;
> -	igt_plane_t *primary;
> -	drmModeModeInfo *mode;
> +	int i;
>  
>  	i = 0;
>  	while (i < iterations || loop_forever) {
>  		igt_output_set_pipe(output, pipe);
> -		for (c = 0; c < max_planes; c++) {
> -			igt_plane_t *plane = igt_output_get_plane(output, c);
> -
> -			if (plane->type != DRM_PLANE_TYPE_PRIMARY)
> -				continue;
> -			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -			data->plane[primary->index] = primary;
> -			mode = igt_output_get_mode(output);
> -			igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> -						DRM_FORMAT_XRGB8888,
> -						LOCAL_I915_FORMAT_MOD_X_TILED,
> -						0.0f, 0.0f, 1.0f,
> -						&data->fb[primary->index]);
> -			igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);
> -			ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> -			if (ret) {
> -				igt_plane_set_fb(data->plane[i], NULL);
> -				igt_remove_fb(data->drm_fd, &data->fb[i]);
> -				data->plane[i] = NULL;
> -				break;
> -			}
> -		}
> -		max_planes = c;
> -		igt_assert_lt(0, max_planes);
>  
>  		mode_hi = igt_output_get_mode(output);
>  		mode_lo = get_lowres_mode(data, mode_hi, output);
> @@ -301,8 +278,6 @@ test_resolution_with_output(data_t *data, enum pipe pipe, igt_output_t *output)
>  
>  		i++;
>  	}
> -
> -	return max_planes;
>  }
>  
>  static void
> @@ -310,7 +285,6 @@ run_test(data_t *data, enum pipe pipe, igt_output_t *output)
>  {
>  	int connected_outs;
>  	int n_planes = data->display.pipes[pipe].n_planes;
> -	int max_planes = n_planes;
>  
>  	if (!opt.user_seed)
>  		opt.seed = time(NULL);
> @@ -321,13 +295,12 @@ run_test(data_t *data, enum pipe pipe, igt_output_t *output)
>  			 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
>  
>  		test_init(data, pipe, n_planes, output);
> -		max_planes = test_resolution_with_output(data, pipe, output);
>  
>  		igt_fork(child, 1) {
> -			test_plane_position_with_output(data, pipe, max_planes, output);
> +			test_plane_position_with_output(data, pipe, n_planes, output);
>  		}
>  
> -		test_resolution_with_output(data, pipe, output);
> +		test_resolution_with_output(data, pipe, n_planes, output);
>  
>  		igt_waitchildren();
>  
> -- 
> 2.20.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
