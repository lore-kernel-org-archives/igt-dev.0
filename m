Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDFB10F16C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 May 2022 12:38:40 +0000 (UTC)
Date: Mon, 23 May 2022 15:36:20 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Message-ID: <Yot/xA5+JWNv01da@platvala-desk.ger.corp.intel.com>
References: <20220517013712.135-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517013712.135-1-quic_jesszhan@quicinc.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4] lib/igt_kms: Set pipe->plane_primary
 to driver-assigned primary plane when there are multiple possible primary
 planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com,
 robdclark@chromium.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 16, 2022 at 06:37:12PM -0700, Jessica Zhang wrote:
> Currently, IGT populates pipe->planes using possible_crtcs and assumes
> that the first primary plane it encounters is the one being actively
> used by the pipe.
> 
> This is not always true in cases where there are multiple possible
> primary planes. This will cause problems whenever IGT calls
> drmModePageFlip since drmModePageFlip will use the primary plane
> assigned to the pipe by the driver to perform the page flip [1]. So a
> mismatch between the primary plane used by IGT and the driver can cause
> the page flip to fail.
> 
> To fix this, let's implement a helper method to get the primary plane
> that's being assigned to the pipe by the driver. We can then call it
> during igt_display_require() and, if there's a mismatch between
> pipe->plane_primary and the assigned primary plane's index, we can swap
> the unused primary plane with the driver-assigned primary plane
> 
> [1]
> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/drm_plane.c#L1234
> 
> Changes since v1:
> - Instead of swapping the pointers of the planes within the array, we
>   can just change the value of pipe->plane_primary.
> 
> Changes since v2:
> - Reverted `if (type == DRM_PLANE_TYPE_PRIMARY)` conditional then added
>   a nested if statement to increment num_primary_planes if plane type is
>   primary.
> 
> Changes since v3:
> - Created helper method igt_pipe_has_valid_output and added a check for
>   if pipe has valid output before getting the output of a pipe to get
>   the assigned primary plane
> - Reverted back to using igt_swap to swap the order of the primary
>   planes within the pipe->planes array. Some kms_* tests use
>   igt_output_get_plane(output, 0) to get the primary plane, so this will
>   avoid regressions in those tests.
> - Updated the plane->index of the primary planes that are being swapped.
> 
> Suggested-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  lib/igt_kms.c | 110 ++++++++++++++++++++++++++++++++++++++++++++++----
>  lib/igt_kms.h |   1 +
>  2 files changed, 103 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 7838ff283b62..a97e0b72d6cf 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -751,6 +751,52 @@ igt_fill_pipe_props(igt_display_t *display, igt_pipe_t *pipe,
>  	drmModeFreeObjectProperties(props);
>  }
>  
> +static igt_plane_t *igt_get_assigned_primary(igt_output_t *output, igt_pipe_t *pipe)
> +{
> +	int drm_fd = output->display->drm_fd;
> +	drmModeModeInfo *mode;
> +	struct igt_fb fb;
> +	igt_plane_t *plane = NULL;
> +	uint32_t crtc_id;
> +	int i;
> +
> +	mode = igt_output_get_mode(output);
> +
> +	igt_create_color_fb(drm_fd, mode->hdisplay, mode->vdisplay,
> +						DRM_FORMAT_XRGB8888,
> +						DRM_FORMAT_MOD_LINEAR,
> +						1.0, 1.0, 1.0, &fb);
> +
> +	crtc_id = pipe->crtc_id;
> +
> +	/*
> +	 * Do a legacy SETCRTC to start things off, so that we know that
> +	 * the kernel will pick the correct primary plane and attach it
> +	 * to the CRTC. This lets us handle the case that there are
> +	 * multiple primary planes (one per CRTC), but which can *also*
> +	 * be attached to other CRTCs
> +	 */
> +	igt_assert(drmModeSetCrtc(output->display->drm_fd, crtc_id, fb.fb_id,
> +							  0, 0, &output->id, 1, mode) == 0);
> +
> +	for(i = 0; i < pipe->n_planes; i++) {
> +		if (pipe->planes[i].type != DRM_PLANE_TYPE_PRIMARY)
> +			continue;
> +
> +		if (igt_plane_get_prop(&pipe->planes[i], IGT_PLANE_CRTC_ID) != crtc_id)
> +			continue;
> +
> +		plane = &pipe->planes[i];
> +		break;
> +	}
> +
> +	/* Removing the FB will also shut down the display for us: */
> +	igt_remove_fb(drm_fd, &fb);
> +	igt_assert_f(plane, "Valid assigned primary plane for CRTC_ID %d not found.\n", crtc_id);
> +
> +	return plane;
> +}
> +
>  /**
>   * kmstest_pipe_name:
>   * @pipe: display pipe
> @@ -2150,6 +2196,18 @@ __get_crtc_mask_for_pipe(drmModeRes *resources, igt_pipe_t *pipe)
>  	return (1 << offset);
>  }
>  
> +static bool igt_pipe_has_valid_output(igt_display_t *display, enum pipe pipe)
> +{
> +	igt_output_t *output;
> +
> +	igt_require_pipe(display, pipe);
> +
> +	for_each_valid_output_on_pipe(display, pipe, output)
> +		return true;
> +
> +	return false;
> +}
> +
>  /**
>   * igt_display_require:
>   * @display: a pointer to an #igt_display_t structure
> @@ -2272,6 +2330,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  		pipe->plane_cursor = -1;
>  		pipe->plane_primary = -1;
>  		pipe->planes = NULL;
> +		pipe->num_primary_planes = 0;
>  
>  		igt_fill_pipe_props(display, pipe, IGT_NUM_CRTC_PROPS, igt_crtc_prop_names);
>  
> @@ -2306,12 +2365,20 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  				plane = &pipe->planes[0];
>  				plane->index = 0;
>  				pipe->plane_primary = 0;
> +				pipe->num_primary_planes++;
>  			} else if (type == DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor == -1) {
>  				plane = &pipe->planes[last_plane];
>  				plane->index = last_plane;
>  				pipe->plane_cursor = last_plane;
>  				display->has_cursor_plane = true;
>  			} else {
> +				/*
> +				 * Increment num_primary_planes for any extra
> +				 * primary plane found.
> +				 */
> +				if (type == DRM_PLANE_TYPE_PRIMARY)
> +					pipe->num_primary_planes++;
> +
>  				plane = &pipe->planes[p];
>  				plane->index = p++;
>  			}
> @@ -2392,6 +2459,39 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  out:
>  	LOG_UNINDENT(display);
>  
> +	for_each_pipe(display, i) {
> +		igt_pipe_t *pipe = &display->pipes[i];
> +
> +		if (!igt_pipe_has_valid_output(display, i))
> +			continue;
> +
> +		igt_output_t *output = igt_get_single_output_for_pipe(display, i);
> +
> +		if (pipe->num_primary_planes > 1) {
> +			igt_plane_t *primary = &pipe->planes[pipe->plane_primary];
> +			igt_plane_t *assigned_primary = igt_get_assigned_primary(output, pipe);
> +			int assigned_primary_index = assigned_primary->index;
> +
> +			/*
> +			 * If the driver-assigned primary plane isn't at the
> +			 * pipe->plane_primary index, swap it with the plane
> +			 * that's currently at the plane_primary index and
> +			 * update plane->index accordingly.
> +			 *
> +			 * This way, we can preserve pipe->plane_primary as 0
> +			 * so that tests that assume pipe->plane_primary is always 0
> +			 * won't break.
> +			 */
> +			if (assigned_primary_index != pipe->plane_primary) {
> +				assigned_primary->index = pipe->plane_primary;
> +				primary->index = assigned_primary_index;
> +
> +				igt_swap(pipe->planes[assigned_primary_index],
> +						pipe->planes[pipe->plane_primary]);
> +			}
> +		}
> +	}
> +
>  	if (display->n_pipes && display->n_outputs)
>  		igt_enable_connectors(drm_fd);
>  	else
> @@ -2438,14 +2538,8 @@ void igt_display_require_output(igt_display_t *display)
>   */
>  void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe)
>  {
> -	igt_output_t *output;
> -
> -	igt_require_pipe(display, pipe);
> -
> -	for_each_valid_output_on_pipe(display, pipe, output)
> -		return;
> -
> -	igt_skip("No valid connector found on pipe %s\n", kmstest_pipe_name(pipe));
> +	if (!igt_pipe_has_valid_output(display, pipe))
> +		igt_skip("No valid connector found on pipe %s\n", kmstest_pipe_name(pipe));
>  }
>  
>  /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index e9ecd21e9824..4949b7b39e18 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -383,6 +383,7 @@ struct igt_pipe {
>  	bool enabled;
>  
>  	int n_planes;
> +	int num_primary_planes;
>  	int plane_cursor;
>  	int plane_primary;
>  	igt_plane_t *planes;
> -- 
> 2.31.0
> 


The setcrtc dance is now only done when multiple primary planes are
detected, good.

Acked-by: Petri Latvala <petri.latvala@intel.com>
