Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38B88953E
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Mar 2023 15:21:33 +0000 (UTC)
Date: Mon, 13 Mar 2023 17:21:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Message-ID: <ZA8/dMfas+KsKgf3@intel.com>
References: <20230313045601.1914192-1-bhanuprakash.modem@intel.com>
 <ZA7lE062foxRKzqO@intel.com>
 <3349cbcf-ca52-7630-9b68-ab9d137e9d03@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3349cbcf-ca52-7630-9b68-ab9d137e9d03@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms: Cleanup to use linear
 modifier
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

On Mon, Mar 13, 2023 at 08:46:11PM +0530, Modem, Bhanuprakash wrote:
> Hi Ville,
> 
> On Mon-13-03-2023 02:25 pm, Ville Syrjälä wrote:
> > On Mon, Mar 13, 2023 at 10:26:00AM +0530, Bhanuprakash Modem wrote:
> >> While creating the framebuffer use the default modifier as
> >> DRM_FORMAT_MOD_LINEAR instead of using deprecated modifiers,
> >> magic numbers, no_tiling modifier etc..
> >>
> >> V2: - New patch for cairo fix (Ville)
> >>      - Update commit message
> >>
> >> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> >> ---
> >>   tests/i915/kms_ccs.c              |  4 +---
> >>   tests/i915/kms_cdclk.c            |  4 ++--
> >>   tests/i915/kms_pipe_b_c_ivb.c     |  2 +-
> >>   tests/i915/kms_psr_stress_test.c  |  2 +-
> >>   tests/kms_addfb_basic.c           | 22 +++++++++----------
> >>   tests/kms_atomic.c                | 24 ++++++++++-----------
> >>   tests/kms_atomic_transition.c     |  4 ++--
> >>   tests/kms_bw.c                    |  2 +-
> >>   tests/kms_cursor_legacy.c         | 36 ++++++++++++++++++++-----------
> >>   tests/kms_display_modes.c         |  7 +++---
> >>   tests/kms_force_connector_basic.c |  4 ++--
> >>   tests/kms_getfb.c                 |  8 +++----
> >>   tests/kms_hdr.c                   |  9 +++++---
> >>   tests/kms_plane_cursor.c          | 12 +++++------
> >>   tests/kms_plane_scaling.c         | 20 ++++++++---------
> >>   tests/kms_prime.c                 |  2 +-
> >>   tests/kms_scaling_modes.c         |  4 ++--
> >>   tests/kms_universal_plane.c       |  4 ++--
> >>   18 files changed, 91 insertions(+), 79 deletions(-)
> >>
> >> diff --git a/tests/i915/kms_ccs.c b/tests/i915/kms_ccs.c
> >> index 9be3fa252..18d48fb80 100644
> >> --- a/tests/i915/kms_ccs.c
> >> +++ b/tests/i915/kms_ccs.c
> >> @@ -393,10 +393,8 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
> >>   	 */
> >>   	if (fb_flags & FB_COMPRESSED)
> >>   		modifier = data->ccs_modifier;
> >> -	else if (!(fb_flags & FB_HAS_PLANE))
> >> -		modifier = DRM_FORMAT_MOD_LINEAR;
> > 
> > Explanation for this is still missing. Better make it a separate patch
> > as well.
> 
> Explanation is already there, please check
> https://cgit.freedesktop.org/drm/igt-gpu-tools/tree/tests/i915/kms_ccs.c#n389

That is trying to explain something about what the original code
was doing. What is missing is the explanation for the change in this
patch.

> 
> Sure, I'll float a new patch for this change.
> 
> - Bhanu
> 
> > 
> >>   	else
> >> -		modifier = 0;
> >> +		modifier = DRM_FORMAT_MOD_LINEAR;
> >>   
> >>   	create_fb_prepare_add(data->drm_fd, width, height,
> >>   			      data->format, modifier,
> >> diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
> >> index 991a7c507..f3046c95a 100644
> >> --- a/tests/i915/kms_cdclk.c
> >> +++ b/tests/i915/kms_cdclk.c
> >> @@ -158,7 +158,7 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
> >>   		igt_create_color_pattern_fb(display->drm_fd,
> >>   					    mode->hdisplay, mode->vdisplay,
> >>   					    DRM_FORMAT_XRGB8888,
> >> -					    I915_TILING_NONE,
> >> +					    DRM_FORMAT_MOD_LINEAR,
> >>   					    0.0, 0.0, 0.0, &fb);
> >>   		igt_plane_set_fb(primary, &fb);
> >>   
> >> @@ -212,7 +212,7 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
> >>   	igt_create_color_pattern_fb(display->drm_fd,
> >>   				    mode->hdisplay, mode->vdisplay,
> >>   				    DRM_FORMAT_XRGB8888,
> >> -				    I915_TILING_NONE,
> >> +				    DRM_FORMAT_MOD_LINEAR,
> >>   				    0.0, 0.0, 0.0, &fb);
> >>   
> >>   	/* switch to lower resolution */
> >> diff --git a/tests/i915/kms_pipe_b_c_ivb.c b/tests/i915/kms_pipe_b_c_ivb.c
> >> index 05ac87702..af11e3262 100644
> >> --- a/tests/i915/kms_pipe_b_c_ivb.c
> >> +++ b/tests/i915/kms_pipe_b_c_ivb.c
> >> @@ -92,7 +92,7 @@ set_mode_on_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
> >>   
> >>   	fb_id = igt_create_color_fb(data->drm_fd,
> >>   				    mode->hdisplay, mode->vdisplay,
> >> -				    DRM_FORMAT_XRGB8888, I915_TILING_NONE,
> >> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> >>   				    1.0, 1.0, 1.0, &fb);
> >>   	igt_assert_lte(0, fb_id);
> >>   
> >> diff --git a/tests/i915/kms_psr_stress_test.c b/tests/i915/kms_psr_stress_test.c
> >> index daac41d44..9b7ddda84 100644
> >> --- a/tests/i915/kms_psr_stress_test.c
> >> +++ b/tests/i915/kms_psr_stress_test.c
> >> @@ -374,4 +374,4 @@ igt_main
> >>   		close(data.debugfs_fd);
> >>   		close(data.drm_fd);
> >>   	}
> >> -}
> >> \ No newline at end of file
> >> +}
> >> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> >> index c58783d54..b4526eee6 100644
> >> --- a/tests/kms_addfb_basic.c
> >> +++ b/tests/kms_addfb_basic.c
> >> @@ -68,10 +68,10 @@ static void invalid_tests(int fd)
> >>   
> >>   	igt_fixture {
> >>   		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
> >> -			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> >> +			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
> >>   		igt_assert(gem_bo);
> >>   		gem_bo_small = igt_create_bo_with_dimensions(fd, 1024, 1023,
> >> -			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> >> +			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
> >>   		igt_assert(gem_bo_small);
> >>   
> >>   		f.handles[0] = gem_bo;
> >> @@ -276,7 +276,7 @@ static void pitch_tests(int fd)
> >>   
> >>   	igt_fixture {
> >>   		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
> >> -			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> >> +			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
> >>   		igt_assert(gem_bo);
> >>   	}
> >>   
> >> @@ -417,10 +417,10 @@ static void size_tests(int fd)
> >>   		igt_display_require(&display, fd);
> >>   
> >>   		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
> >> -			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> >> +			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
> >>   		igt_assert(gem_bo);
> >>   		gem_bo_small = igt_create_bo_with_dimensions(fd, 1024, 1023,
> >> -			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> >> +			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
> >>   		igt_assert(gem_bo_small);
> >>   	}
> >>   
> >> @@ -513,7 +513,7 @@ static void addfb25_tests(int fd)
> >>   
> >>   	igt_fixture {
> >>   		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
> >> -			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> >> +			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
> >>   		igt_assert(gem_bo);
> >>   
> >>   		memset(&f, 0, sizeof(f));
> >> @@ -597,10 +597,10 @@ static void addfb25_ytile(int fd)
> >>   		igt_display_require(&display, fd);
> >>   
> >>   		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
> >> -			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> >> +			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
> >>   		igt_assert(gem_bo);
> >>   		gem_bo_small = igt_create_bo_with_dimensions(fd, 1024, 1023,
> >> -			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> >> +			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
> >>   		igt_assert(gem_bo_small);
> >>   
> >>   		memset(&f, 0, sizeof(f));
> >> @@ -670,7 +670,7 @@ static void addfb25_4tile(int fd)
> >>   		igt_display_require(&display, fd);
> >>   
> >>   		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
> >> -				DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> >> +				DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
> >>   		igt_assert(gem_bo);
> >>   
> >>   		memset(&f, 0, sizeof(f));
> >> @@ -719,7 +719,7 @@ static void prop_tests(int fd)
> >>   
> >>   	igt_fixture {
> >>   		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
> >> -			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> >> +			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
> >>   		igt_assert(gem_bo);
> >>   
> >>   		f.handles[0] = gem_bo;
> >> @@ -780,7 +780,7 @@ static void master_tests(int fd)
> >>   
> >>   	igt_fixture {
> >>   		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
> >> -			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> >> +			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
> >>   		igt_assert(gem_bo);
> >>   
> >>   		f.handles[0] = gem_bo;
> >> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> >> index 2a3fb74be..e7d1cbd75 100644
> >> --- a/tests/kms_atomic.c
> >> +++ b/tests/kms_atomic.c
> >> @@ -305,12 +305,12 @@ plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
> >>   	uint32_t h_overlay = mode->vdisplay / 2;
> >>   
> >>   	igt_create_color_pattern_fb(pipe->display->drm_fd,
> >> -				    w, h, format_primary, I915_TILING_NONE,
> >> +				    w, h, format_primary, DRM_FORMAT_MOD_LINEAR,
> >>   				    0.2, 0.2, 0.2, &fb_primary);
> >>   
> >>   	igt_create_color_pattern_fb(pipe->display->drm_fd,
> >>   				    w_overlay, h_overlay,
> >> -				    format_overlay, I915_TILING_NONE,
> >> +				    format_overlay, DRM_FORMAT_MOD_LINEAR,
> >>   				    0.2, 0.2, 0.2, &fb_overlay);
> >>   
> >>   	/* Draw a hole in the overlay */
> >> @@ -404,7 +404,7 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
> >>   	igt_create_color_fb(display->drm_fd,
> >>   			    w_lower, h_lower,
> >>   			    DRM_FORMAT_XRGB8888,
> >> -			    I915_TILING_NONE,
> >> +			    DRM_FORMAT_MOD_LINEAR,
> >>   			    0.0, 0.0, 0.0, &fb_ref);
> >>   
> >>   	/* create reference image */
> >> @@ -444,14 +444,14 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
> >>   	fb_id_lower = igt_create_color_fb(display->drm_fd,
> >>   					  w_lower, h_lower,
> >>   					  DRM_FORMAT_XRGB8888,
> >> -					  I915_TILING_NONE,
> >> +					  DRM_FORMAT_MOD_LINEAR,
> >>   					  0.0, 0.0, 1.0, &fb_lower);
> >>   	igt_assert(fb_id_lower);
> >>   
> >>   	fb_id_upper = igt_create_color_fb(display->drm_fd,
> >>   					  w_upper, h_upper,
> >>   					  DRM_FORMAT_XRGB8888,
> >> -					  I915_TILING_NONE,
> >> +					  DRM_FORMAT_MOD_LINEAR,
> >>   					  1.0, 1.0, 0.0, &fb_upper);
> >>   	igt_assert(fb_id_upper);
> >>   
> >> @@ -516,7 +516,7 @@ static void plane_overlay(igt_pipe_t *pipe, igt_output_t *output, igt_plane_t *p
> >>   	igt_require(format != 0);
> >>   
> >>   	igt_create_pattern_fb(pipe->display->drm_fd, w, h,
> >> -			      format, I915_TILING_NONE, &fb);
> >> +			      format, DRM_FORMAT_MOD_LINEAR, &fb);
> >>   
> >>   	igt_plane_set_fb(plane, &fb);
> >>   	igt_plane_set_position(plane, w/2, h/2);
> >> @@ -551,7 +551,7 @@ static void plane_primary(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *f
> >>   
> >>   	igt_create_color_pattern_fb(pipe->display->drm_fd,
> >>   				    fb->width, fb->height,
> >> -				    fb->drm_format, I915_TILING_NONE,
> >> +				    fb->drm_format, DRM_FORMAT_MOD_LINEAR,
> >>   				    0.2, 0.2, 0.2, &fb2);
> >>   
> >>   	/* Flip the primary plane using the atomic API, and double-check
> >> @@ -600,7 +600,7 @@ static void test_only(igt_pipe_t *pipe_obj,
> >>   
> >>   	igt_create_pattern_fb(pipe_obj->display->drm_fd,
> >>   			     mode->hdisplay, mode->vdisplay,
> >> -			     format, I915_TILING_NONE, &fb);
> >> +			     format, DRM_FORMAT_MOD_LINEAR, &fb);
> >>   	igt_plane_set_fb(primary, &fb);
> >>   	igt_output_set_pipe(output, pipe_obj->pipe);
> >>   
> >> @@ -737,7 +737,7 @@ static void plane_invalid_params(igt_pipe_t *pipe,
> >>   	/* Create a framebuffer too small for the plane configuration. */
> >>   	igt_create_pattern_fb(pipe->display->drm_fd,
> >>   			      fb->width - 1, fb->height - 1,
> >> -			      fb->drm_format, I915_TILING_NONE, &fb2);
> >> +			      fb->drm_format, DRM_FORMAT_MOD_LINEAR, &fb2);
> >>   
> >>   	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, fb2.fb_id);
> >>   	plane_commit_atomic_err(plane, ATOMIC_RELAX_NONE, ENOSPC);
> >> @@ -1072,7 +1072,7 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
> >>   
> >>   	/* Color fb with white rect at center */
> >>   	igt_create_color_fb(pipe->display->drm_fd, fb->width, fb->height,
> >> -			    fb->drm_format, I915_TILING_NONE, 0.2, 0.2, 0.2,
> >> +			    fb->drm_format, DRM_FORMAT_MOD_LINEAR, 0.2, 0.2, 0.2,
> >>   			    &fb_1);
> >>   	cr_1 = igt_get_cairo_ctx(pipe->display->drm_fd, &fb_1);
> >>   	igt_paint_color(cr_1, fb->width/4, fb->height/4, fb->width/2,
> >> @@ -1111,7 +1111,7 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
> >>   	 * issue plane update with damage and verify the state.
> >>   	 */
> >>   	igt_create_color_fb(pipe->display->drm_fd, fb->width, fb->height,
> >> -			    fb->drm_format, I915_TILING_NONE, 0.2, 0.2, 0.2,
> >> +			    fb->drm_format, DRM_FORMAT_MOD_LINEAR, 0.2, 0.2, 0.2,
> >>   			    &fb_2);
> >>   
> >>   	damage[0].x1 = fb->width/2;
> >> @@ -1141,7 +1141,7 @@ static void atomic_plane_damage(igt_pipe_t *pipe, igt_plane_t *plane, struct igt
> >>   	/* Reszie fb_1 to be bigger than plane */
> >>   	igt_remove_fb(pipe->display->drm_fd, &fb_1);
> >>   	igt_create_color_fb(pipe->display->drm_fd, fb->width * 2, fb->height,
> >> -			    fb->drm_format, I915_TILING_NONE, 0.2, 0.2, 0.2,
> >> +			    fb->drm_format, DRM_FORMAT_MOD_LINEAR, 0.2, 0.2, 0.2,
> >>   			    &fb_1);
> >>   
> >>   	damage[0].x1 = fb->width;
> >> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> >> index 64e7e7091..d32be0952 100644
> >> --- a/tests/kms_atomic_transition.c
> >> +++ b/tests/kms_atomic_transition.c
> >> @@ -824,9 +824,9 @@ retry:
> >>   	}
> >>   
> >>   	igt_create_pattern_fb(data->drm_fd, width, height,
> >> -				   DRM_FORMAT_XRGB8888, 0, &data->fbs[0]);
> >> +				   DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fbs[0]);
> >>   	igt_create_color_pattern_fb(data->drm_fd, width, height,
> >> -				    DRM_FORMAT_XRGB8888, 0, .5, .5, .5, &data->fbs[1]);
> >> +				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, .5, .5, .5, &data->fbs[1]);
> >>   
> >>   	for_each_pipe(&data->display, i) {
> >>   		igt_pipe_t *pipe = &data->display.pipes[i];
> >> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> >> index b1dfadd69..b66473e60 100644
> >> --- a/tests/kms_bw.c
> >> +++ b/tests/kms_bw.c
> >> @@ -169,7 +169,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
> >>   
> >>   		igt_create_color_fb(display->drm_fd, mode->hdisplay,
> >>   				    mode->vdisplay, DRM_FORMAT_XRGB8888,
> >> -				    DRM_FORMAT_MOD_NONE, 1.f, 0.f, 0.f,
> >> +				    DRM_FORMAT_MOD_LINEAR, 1.f, 0.f, 0.f,
> >>   				    &buffer[i]);
> >>   
> >>   		igt_output_set_pipe(output, i);
> >> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> >> index feea1ac83..a8862bdfb 100644
> >> --- a/tests/kms_cursor_legacy.c
> >> +++ b/tests/kms_cursor_legacy.c
> >> @@ -193,7 +193,7 @@ static igt_output_t *set_fb_on_crtc(igt_display_t *display, enum pipe pipe, stru
> >>   
> >>   		igt_create_pattern_fb(display->drm_fd,
> >>   			      mode->hdisplay, mode->vdisplay,
> >> -			      DRM_FORMAT_XRGB8888, I915_TILING_NONE, fb_info);
> >> +			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb_info);
> >>   
> >>   		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> >>   		igt_plane_set_fb(primary, fb_info);
> >> @@ -386,7 +386,7 @@ static void prepare_flip_test(igt_display_t *display,
> >>   
> >>   		igt_skip_on(width <= 64 && height <= 64);
> >>   		igt_create_color_fb(display->drm_fd, width, height,
> >> -				    DRM_FORMAT_ARGB8888, 0, 1., 0., .7, cursor_fb2);
> >> +				    DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, 1., 0., .7, cursor_fb2);
> >>   
> >>   		arg[0].flags = arg[1].flags = DRM_MODE_CURSOR_BO;
> >>   		arg[1].handle = cursor_fb2->gem_handle;
> >> @@ -412,7 +412,7 @@ static void prepare_flip_test(igt_display_t *display,
> >>   		            display->pipes[flip_pipe].planes[1].type != DRM_PLANE_TYPE_CURSOR);
> >>   
> >>   		igt_create_color_pattern_fb(display->drm_fd, prim_fb->width, prim_fb->height,
> >> -					    DRM_FORMAT_ARGB8888, 0, .1, .1, .1, argb_fb);
> >> +					    DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, .1, .1, .1, argb_fb);
> >>   	}
> >>   }
> >>   
> >> @@ -458,9 +458,11 @@ static void flip(igt_display_t *display,
> >>   		}
> >>   	}
> >>   
> >> -	igt_create_color_fb(display->drm_fd, fb_info.width, fb_info.height, DRM_FORMAT_ARGB8888, 0, .5, .5, .5, &cursor_fb);
> >> +	igt_create_color_fb(display->drm_fd, fb_info.width, fb_info.height,
> >> +			    DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, .5, .5, .5, &cursor_fb);
> >>   
> >> -	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
> >> +	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> >> +			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> >>   	cursor = set_cursor_on_pipe(display, cursor_pipe, &cursor_fb);
> >>   	populate_cursor_args(display, cursor_pipe, arg, &cursor_fb);
> >>   
> >> @@ -564,7 +566,8 @@ static void basic_flip_cursor(igt_display_t *display,
> >>   
> >>   	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
> >>   
> >> -	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
> >> +	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> >> +			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> >>   	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
> >>   	populate_cursor_args(display, pipe, arg, &cursor_fb);
> >>   
> >> @@ -728,7 +731,8 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
> >>   
> >>   	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
> >>   
> >> -	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
> >> +	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> >> +			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> >>   	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
> >>   	populate_cursor_args(display, pipe, arg, &cursor_fb);
> >>   
> >> @@ -852,7 +856,8 @@ static void nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
> >>   	igt_require(display->is_atomic);
> >>   	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
> >>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> >> -	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
> >> +	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> >> +			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> >>   	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
> >>   	populate_cursor_args(display, pipe, arg, &cursor_fb);
> >>   	arg[0].flags |= DRM_MODE_CURSOR_BO;
> >> @@ -972,7 +977,8 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
> >>   		igt_require((output2 = set_fb_on_crtc(display, pipe2, &fb2_info)));
> >>   	}
> >>   
> >> -	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
> >> +	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> >> +			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> >>   	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
> >>   	populate_cursor_args(display, pipe, arg1, &cursor_fb);
> >>   
> >> @@ -1137,7 +1143,8 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
> >>   	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
> >>   	vrefresh = igt_output_get_mode(output)->vrefresh;
> >>   
> >> -	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
> >> +	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> >> +			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> >>   	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
> >>   	populate_cursor_args(display, pipe, arg, &cursor_fb);
> >>   
> >> @@ -1249,7 +1256,8 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
> >>   		igt_require((outputs[1] = set_fb_on_crtc(display, pipe[1], &fb_info[1])));
> >>   	}
> >>   
> >> -	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
> >> +	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> >> +			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> >>   
> >>   	cursors[0] = set_cursor_on_pipe(display, pipe[0], &cursor_fb);
> >>   	populate_cursor_args(display, pipe[0], arg[0], &cursor_fb);
> >> @@ -1357,7 +1365,8 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
> >>   
> >>   	igt_require((output = set_fb_on_crtc(display, pipe, &fb_info)));
> >>   
> >> -	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
> >> +	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> >> +			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> >>   	populate_cursor_args(display, pipe, arg, &cursor_fb);
> >>   
> >>   	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> >> @@ -1430,7 +1439,8 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
> >>   	igt_create_color_pattern_fb(display->drm_fd, fb_info[0].width, fb_info[0].height,
> >>   				    DRM_FORMAT_XRGB8888, I915_FORMAT_MOD_X_TILED, .1, .1, .1, &fb_info[1]);
> >>   
> >> -	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888, 0, 1., 1., 1., &cursor_fb);
> >> +	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
> >> +			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
> >>   	populate_cursor_args(display, pipe, arg, &cursor_fb);
> >>   
> >>   	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> >> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> >> index e4191811e..c2e98c3c6 100644
> >> --- a/tests/kms_display_modes.c
> >> +++ b/tests/kms_display_modes.c
> >> @@ -64,9 +64,9 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
> >>   	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, IGT_PIPE_CRC_SOURCE_AUTO);
> >>   
> >>   	igt_create_color_fb(data->drm_fd, mode[0]->hdisplay, mode[0]->vdisplay,
> >> -			     DRM_FORMAT_XRGB8888, 0, 1, 0, 0, &fbs[0]);
> >> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 1, 0, 0, &fbs[0]);
> >>   	igt_create_color_fb(data->drm_fd, mode[1]->hdisplay, mode[1]->vdisplay,
> >> -			     DRM_FORMAT_XRGB8888, 0, 0, 0, 1, &fbs[1]);
> >> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, 0, 1, &fbs[1]);
> >>   
> >>   	plane[0] = igt_pipe_get_plane_type(&display->pipes[pipe1], DRM_PLANE_TYPE_PRIMARY);
> >>   	plane[1] = igt_pipe_get_plane_type(&display->pipes[pipe2], DRM_PLANE_TYPE_PRIMARY);
> >> @@ -88,7 +88,8 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
> >>   	width = mode[0]->hdisplay + mode[1]->hdisplay;
> >>   	height = max(mode[0]->vdisplay, mode[1]->vdisplay);
> >>   
> >> -	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888, 0, &fb);
> >> +	igt_create_fb(data->drm_fd, width, height,
> >> +		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
> >>   	cr = igt_get_cairo_ctx(data->drm_fd, &fb);
> >>   	igt_paint_color(cr, 0, 0, mode[0]->hdisplay, mode[0]->vdisplay, 1, 0, 0);
> >>   	igt_paint_color(cr, mode[0]->hdisplay, 0, mode[1]->hdisplay, mode[1]->vdisplay, 0, 0, 1);
> >> diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
> >> index cde47e925..4ff1efe3b 100644
> >> --- a/tests/kms_force_connector_basic.c
> >> +++ b/tests/kms_force_connector_basic.c
> >> @@ -68,8 +68,8 @@ static void force_load_detect(int drm_fd, drmModeConnectorPtr connector, drmMode
> >>   	/* No load detect on HDMI. */
> >>   	igt_require(connector->connector_type == DRM_MODE_CONNECTOR_VGA);
> >>   
> >> -	igt_create_fb(drm_fd, w, h, DRM_FORMAT_XRGB8888, 0, &xrgb_fb);
> >> -	igt_create_fb(drm_fd, w, h, DRM_FORMAT_ARGB8888, 0, &argb_fb);
> >> +	igt_create_fb(drm_fd, w, h, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &xrgb_fb);
> >> +	igt_create_fb(drm_fd, w, h, DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, &argb_fb);
> >>   	igt_assert(drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1) == 0);
> >>   
> >>   	/*
> >> diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
> >> index 2e4552a0c..813417e77 100644
> >> --- a/tests/kms_getfb.c
> >> +++ b/tests/kms_getfb.c
> >> @@ -174,7 +174,7 @@ static void test_handle_input(int fd)
> >>   		add.pixel_format = DRM_FORMAT_XRGB8888;
> >>   		add.pitches[0] = 1024*4;
> >>   		add.handles[0] = igt_create_bo_with_dimensions(fd, 1024, 1024,
> >> -			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> >> +			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
> >>   		igt_require(add.handles[0] != 0);
> >>   		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &add);
> >>   	}
> >> @@ -229,7 +229,7 @@ static void test_duplicate_handles(int fd)
> >>   		add.pixel_format = DRM_FORMAT_XRGB8888;
> >>   		add.pitches[0] = 1024*4;
> >>   		add.handles[0] = igt_create_bo_with_dimensions(fd, 1024, 1024,
> >> -			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> >> +			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
> >>   		igt_assert(add.handles[0]);
> >>   		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &add);
> >>   	}
> >> @@ -296,7 +296,7 @@ static void test_getfb2(int fd)
> >>   		add_basic.pixel_format = DRM_FORMAT_XRGB8888;
> >>   		add_basic.pitches[0] = 1024*4;
> >>   		add_basic.handles[0] = igt_create_bo_with_dimensions(fd, 1024, 1024,
> >> -			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> >> +			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
> >>   		igt_assert(add_basic.handles[0]);
> >>   		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &add_basic);
> >>   
> >> @@ -403,7 +403,7 @@ static void test_handle_protection(void) {
> >>   		non_master_add.pixel_format = DRM_FORMAT_XRGB8888;
> >>   		non_master_add.pitches[0] = 1024*4;
> >>   		non_master_add.handles[0] = igt_create_bo_with_dimensions(non_master_fd, 1024, 1024,
> >> -			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> >> +			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, NULL, NULL, NULL);
> >>   		igt_require(non_master_add.handles[0] != 0);
> >>   		do_ioctl(non_master_fd, DRM_IOCTL_MODE_ADDFB2, &non_master_add);
> >>   	}
> >> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> >> index 36669ce81..23f12c14a 100644
> >> --- a/tests/kms_hdr.c
> >> +++ b/tests/kms_hdr.c
> >> @@ -148,7 +148,8 @@ static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
> >>   	int afb_id, ret;
> >>   
> >>   	/* 10-bit formats are slow, so limit the size. */
> >> -	afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
> >> +	afb_id = igt_create_fb(data->fd, 512, 512,
> >> +			       DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR, &afb);
> >>   	igt_assert(afb_id);
> >>   
> >>   	draw_hdr_pattern(&afb);
> >> @@ -396,7 +397,8 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
> >>   	int afb_id;
> >>   
> >>   	/* 10-bit formats are slow, so limit the size. */
> >> -	afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
> >> +	afb_id = igt_create_fb(data->fd, 512, 512,
> >> +			       DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR, &afb);
> >>   	igt_assert(afb_id);
> >>   
> >>   	draw_hdr_pattern(&afb);
> >> @@ -478,7 +480,8 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
> >>   	struct hdr_output_metadata hdr;
> >>   
> >>   	/* 10-bit formats are slow, so limit the size. */
> >> -	afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
> >> +	afb_id = igt_create_fb(data->fd, 512, 512,
> >> +			       DRM_FORMAT_XRGB2101010, DRM_FORMAT_MOD_LINEAR, &afb);
> >>   	igt_assert(afb_id);
> >>   
> >>   	draw_hdr_pattern(&afb);
> >> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> >> index 9b27586c1..7a677ebbe 100644
> >> --- a/tests/kms_plane_cursor.c
> >> +++ b/tests/kms_plane_cursor.c
> >> @@ -236,19 +236,19 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
> >>   
> >>   	test_cleanup(data);
> >>   
> >> -	igt_create_color_fb(data->drm_fd, sw, sh, DRM_FORMAT_XRGB8888, 0,
> >> -			    1.0, 1.0, 1.0, &data->pfb);
> >> +	igt_create_color_fb(data->drm_fd, sw, sh, DRM_FORMAT_XRGB8888,
> >> +			    DRM_FORMAT_MOD_LINEAR, 1.0, 1.0, 1.0, &data->pfb);
> >>   
> >>   	if (flags & TEST_OVERLAY) {
> >>   		int width = (flags & TEST_VIEWPORT) ? data->or.w + pad : data->or.w;
> >>   		int height = (flags & TEST_VIEWPORT) ? data->or.h + pad : data->or.h;
> >>   
> >> -		igt_create_color_fb(data->drm_fd, width, height,
> >> -				    DRM_FORMAT_XRGB8888, 0, 0.5, 0.5, 0.5, &data->ofb);
> >> +		igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
> >> +				    DRM_FORMAT_MOD_LINEAR, 0.5, 0.5, 0.5, &data->ofb);
> >>   	}
> >>   
> >> -	igt_create_color_fb(data->drm_fd, size, size, DRM_FORMAT_ARGB8888, 0,
> >> -			    1.0, 0.0, 1.0, &data->cfb);
> >> +	igt_create_color_fb(data->drm_fd, size, size, DRM_FORMAT_ARGB8888,
> >> +			    DRM_FORMAT_MOD_LINEAR, 1.0, 0.0, 1.0, &data->cfb);
> >>   
> >>   	igt_plane_set_fb(data->primary, &data->pfb);
> >>   	igt_output_set_pipe(data->output, data->pipe_id);
> >> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> >> index c6c6f3ec6..9e45af947 100644
> >> --- a/tests/kms_plane_scaling.c
> >> +++ b/tests/kms_plane_scaling.c
> >> @@ -702,7 +702,7 @@ static void setup_fb(int fd, int width, int height,
> >>   {
> >>   	igt_create_color_pattern_fb(fd, width, height,
> >>   				    DRM_FORMAT_XRGB8888,
> >> -				    I915_TILING_NONE,
> >> +				    DRM_FORMAT_MOD_LINEAR,
> >>   				    r, g, b, fb);
> >>   }
> >>   
> >> @@ -787,17 +787,17 @@ test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
> >>   	igt_create_color_pattern_fb(display->drm_fd,
> >>                                       width, height,
> >>                                       DRM_FORMAT_XRGB8888,
> >> -                                    I915_TILING_NONE,
> >> +                                    DRM_FORMAT_MOD_LINEAR,
> >>                                       1.0, 0.0, 0.0, &d->fb[0]);
> >>   	igt_create_color_pattern_fb(display->drm_fd,
> >>                                       width, height,
> >>                                       DRM_FORMAT_XRGB8888,
> >> -                                    I915_TILING_NONE,
> >> +                                    DRM_FORMAT_MOD_LINEAR,
> >>                                       0.0, 1.0, 0.0, &d->fb[1]);
> >>   	igt_create_color_pattern_fb(display->drm_fd,
> >>                                       width, height,
> >>                                       DRM_FORMAT_XRGB8888,
> >> -                                    I915_TILING_NONE,
> >> +                                    DRM_FORMAT_MOD_LINEAR,
> >>                                       0.0, 0.0, 1.0, &d->fb[2]);
> >>   
> >>   	igt_plane_set_fb(plane[0], &d->fb[0]);
> >> @@ -854,16 +854,16 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
> >>   
> >>   	igt_create_pattern_fb(d->drm_fd, 600, 600,
> >>   			      DRM_FORMAT_XRGB8888,
> >> -			      I915_TILING_NONE, &d->fb[0]);
> >> +			      DRM_FORMAT_MOD_LINEAR, &d->fb[0]);
> >>   	igt_create_pattern_fb(d->drm_fd, 500, 500,
> >>   			      DRM_FORMAT_XRGB8888,
> >> -			      I915_TILING_NONE, &d->fb[1]);
> >> +			      DRM_FORMAT_MOD_LINEAR, &d->fb[1]);
> >>   	igt_create_pattern_fb(d->drm_fd, 700, 700,
> >>   			      DRM_FORMAT_XRGB8888,
> >> -			      I915_TILING_NONE, &d->fb[2]);
> >> +			      DRM_FORMAT_MOD_LINEAR, &d->fb[2]);
> >>   	igt_create_pattern_fb(d->drm_fd, 400, 400,
> >>   			      DRM_FORMAT_XRGB8888,
> >> -			      I915_TILING_NONE, &d->fb[3]);
> >> +			      DRM_FORMAT_MOD_LINEAR, &d->fb[3]);
> >>   
> >>   	igt_plane_set_fb(plane[0], &d->fb[0]);
> >>   	igt_plane_set_fb(plane[1], &d->fb[1]);
> >> @@ -935,7 +935,7 @@ static void invalid_parameter_tests(data_t *d)
> >>   
> >>   		igt_create_fb(d->drm_fd, 256, 256,
> >>   			      DRM_FORMAT_XRGB8888,
> >> -			      DRM_FORMAT_MOD_NONE,
> >> +			      DRM_FORMAT_MOD_LINEAR,
> >>   			      &fb);
> >>   	}
> >>   
> >> @@ -1045,7 +1045,7 @@ static void i915_max_source_size_test(data_t *d)
> >>   
> >>   		igt_create_fb(d->drm_fd, 5120, 4320,
> >>   			      DRM_FORMAT_XRGB8888,
> >> -			      DRM_FORMAT_MOD_NONE,
> >> +			      DRM_FORMAT_MOD_LINEAR,
> >>   			      &fb);
> >>   	}
> >>   
> >> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> >> index ad199915b..d2a6503e5 100644
> >> --- a/tests/kms_prime.c
> >> +++ b/tests/kms_prime.c
> >> @@ -119,7 +119,7 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
> >>   					      scratch->size, PROT_WRITE);
> >>   	} else {
> >>   		igt_calc_fb_size(exporter_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> >> -				 DRM_FORMAT_MOD_NONE, &scratch->size, &scratch->pitch);
> >> +				 DRM_FORMAT_MOD_LINEAR, &scratch->size, &scratch->pitch);
> >>   		if (gem_has_lmem(exporter_fd))
> >>   			scratch->handle = gem_create_in_memory_regions(exporter_fd, scratch->size,
> >>   								       REGION_LMEM(0), REGION_SMEM);
> >> diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
> >> index 039e4a8d9..b17d00230 100644
> >> --- a/tests/kms_scaling_modes.c
> >> +++ b/tests/kms_scaling_modes.c
> >> @@ -49,11 +49,11 @@ static void test_scaling_mode_on_output(igt_display_t *display, const enum pipe
> >>   	sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
> >>   
> >>   	igt_create_color_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
> >> -			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
> >> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> >>   			    0.f, 0.f, 1.f, &blue);
> >>   
> >>   	igt_create_color_fb(display->drm_fd, 640, 480,
> >> -			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
> >> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> >>   			    1.f, 0.f, 0.f, &red);
> >>   
> >>   	igt_plane_set_fb(primary, &blue);
> >> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> >> index dd8fa1937..d38886f39 100644
> >> --- a/tests/kms_universal_plane.c
> >> +++ b/tests/kms_universal_plane.c
> >> @@ -613,7 +613,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
> >>   	/* Black background FB */
> >>   	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> >>   			    DRM_FORMAT_XRGB8888,
> >> -			    false,
> >> +			    DRM_FORMAT_MOD_LINEAR,
> >>   			    0.0, 0.0, 0.0,
> >>   			    &background_fb);
> >>   
> >> @@ -624,7 +624,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
> >>   		b = rand() % 0xFF;
> >>   		igt_create_color_fb(data->drm_fd, 64, 64,
> >>   				    DRM_FORMAT_ARGB8888,
> >> -				    false,
> >> +				    DRM_FORMAT_MOD_LINEAR,
> >>   				    (double)r / 0xFF,
> >>   				    (double)g / 0xFF,
> >>   				    (double)b / 0xFF,
> >> -- 
> >> 2.39.1
> > 

-- 
Ville Syrjälä
Intel
