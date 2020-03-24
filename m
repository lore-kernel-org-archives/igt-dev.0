Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496406E105
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2020 09:03:56 +0000 (UTC)
Date: Tue, 24 Mar 2020 11:03:53 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200324090353.GX9497@platvala-desk.ger.corp.intel.com>
References: <20200317071906.28879-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200317071906.28879-1-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/kms_atomic: add test to
 validate immutable zpos
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
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 12:49:06PM +0530, Swati Sharma wrote:
> i915 implements immutable zpos property whereas the existing test
> case is written to validate mutable zpos.
> 
> Added a new sub-test to validate immutable zpos. Test validates
> the reported zpos property of plane by making sure only higher
> zpos plane covers the lower zpos one (lower plane covers full screen,
> upper plane covers half screen).
> 
> Only two planes at a time are tested in increasing fashion to avoid
> combinatorial explosion. By transitive property,
> if (p1, z1) < (p2, z2) and (p2, z2) < (p3, z3) then (p1, z1) < (p3, z3)
> 
> where p and z denotes planes and zpos
> 
> v2: -Removed intel only checks [Martin]
>     -Used XRGB8888 pixel format as used in other IGTs
>     -Added documentation [Martin]
>     -Removed skip, instead continue if plane doesn't support zpos [Martin]
>     -Sorted planes in increasing order of zpos [Martin]
> v3: -Fix description [Martin]
>     -Avoid sorting [Ankit]
> v4: -Change in commit message [Ankit]
>     -Few minor changes [Ankit]
> 
> Issue: https://gitlab.freedesktop.org/drm/intel/issues/404
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Reviewed-by: Martin Peres <martin.peres@linux.intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  tests/kms_atomic.c | 160 ++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 150 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index 8462d128..4cb34d6d 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -121,7 +121,7 @@ static void plane_check_current_state(igt_plane_t *plane, const uint64_t *values
>  }
>  
>  static void plane_commit(igt_plane_t *plane, enum igt_commit_style s,
> -                                enum kms_atomic_check_relax relax)
> +                         enum kms_atomic_check_relax relax)
>  {
>  	igt_display_commit2(plane->pipe->display, s);
>  	plane_check_current_state(plane, plane->values, relax);
> @@ -277,9 +277,9 @@ static uint32_t plane_get_igt_format(igt_plane_t *plane)
>  }
>  
>  static void
> -plane_primary_overlay_zpos(igt_pipe_t *pipe, igt_output_t *output,
> -			   igt_plane_t *primary, igt_plane_t *overlay,
> -			   uint32_t format_primary, uint32_t format_overlay)
> +plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
> +			           igt_plane_t *primary, igt_plane_t *overlay,
> +			           uint32_t format_primary, uint32_t format_overlay)
>  {
>  	struct igt_fb fb_primary, fb_overlay;
>  	drmModeModeInfo *mode = igt_output_get_mode(output);
> @@ -320,7 +320,7 @@ plane_primary_overlay_zpos(igt_pipe_t *pipe, igt_output_t *output,
>  	igt_plane_set_prop_value(overlay, IGT_PLANE_ZPOS, 1);
>  
>  	igt_info("Committing with overlay on top, it has a hole "\
> -		  "through which the primary should be seen\n");
> +		 "through which the primary should be seen\n");
>  	plane_commit(primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
>  
>  	igt_assert_eq_u64(igt_plane_get_prop(primary, IGT_PLANE_ZPOS), 0);
> @@ -346,7 +346,7 @@ plane_primary_overlay_zpos(igt_pipe_t *pipe, igt_output_t *output,
>  	igt_put_cairo_ctx(pipe->display->drm_fd, &fb_primary, cr);
>  
>  	igt_info("Committing with a hole in the primary through "\
> -		  "which the underlay should be seen\n");
> +		 "which the underlay should be seen\n");
>  	plane_commit(primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
>  
>  	/* reset it back to initial state */
> @@ -358,6 +358,136 @@ plane_primary_overlay_zpos(igt_pipe_t *pipe, igt_output_t *output,
>  	igt_assert_eq_u64(igt_plane_get_prop(overlay, IGT_PLANE_ZPOS), 1);
>  }
>  
> +static void
> +plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
> +		     igt_output_t *output)
> +{
> +	cairo_t *cr;
> +	struct igt_fb fb_ref;
> +	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +	igt_pipe_crc_t *pipe_crc;
> +	igt_crc_t ref_crc, new_crc;
> +	int n_planes = pipe->n_planes;
> +	igt_plane_t *plane_ptr[n_planes];
> +	uint32_t w_lower, h_lower, w_upper, h_upper;
> +
> +	igt_require(n_planes >= 2);
> +
> +	mode = igt_output_get_mode(output);
> +	primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +
> +	/* for lower plane */
> +	w_lower = mode->hdisplay;
> +	h_lower = mode->vdisplay;
> +
> +	/* for upper plane */
> +	w_upper = mode->hdisplay / 2;
> +	h_upper = mode->vdisplay / 2;
> +
> +	igt_create_color_fb(display->drm_fd,
> +			    w_lower, h_lower,
> +			    DRM_FORMAT_XRGB8888,
> +			    I915_TILING_NONE,
> +			    0.0, 0.0, 0.0, &fb_ref);
> +
> +	/* create reference image */
> +	cr = igt_get_cairo_ctx(display->drm_fd, &fb_ref);
> +	igt_assert(cairo_status(cr) == 0);
> +	igt_paint_color(cr, 0, 0, w_lower, h_lower, 0.0, 0.0, 1.0);
> +	igt_paint_color(cr, w_upper / 2, h_upper / 2, w_upper, h_upper, 1.0, 1.0, 0.0);
> +	igt_put_cairo_ctx(display->drm_fd, &fb_ref, cr);
> +	igt_plane_set_fb(primary, &fb_ref);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	/* create the pipe_crc object for this pipe */
> +	pipe_crc = igt_pipe_crc_new(pipe->display->drm_fd, pipe->pipe,
> +				    INTEL_PIPE_CRC_SOURCE_AUTO);
> +
> +	/* get reference crc */
> +	igt_pipe_crc_start(pipe_crc);
> +	igt_pipe_crc_get_current(display->drm_fd, pipe_crc, &ref_crc);
> +
> +	igt_plane_set_fb(primary, NULL);
> +
> +	for (int k = 0; k < n_planes; k++) {
> +		int zpos;
> +		igt_plane_t *temp;
> +
> +		temp = &display->pipes[pipe->pipe].planes[k];
> +
> +		if (!igt_plane_has_prop(temp, IGT_PLANE_ZPOS))
> +			continue;
> +
> +		assert(zpos < n_planes);
> +
> +		zpos = igt_plane_get_prop(temp, IGT_PLANE_ZPOS);

Do not use plain assert in tests. Use igt_assert() and its
brothers. igt_assert_lt(zpos, n_planes) prints the values compared
when it fails.

You have a test failure (lucky that it happened) because you check
zpos before you set it to a value...


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
