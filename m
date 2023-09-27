Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C98410E45F
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 03:32:40 +0000 (UTC)
Message-ID: <f7d6e347-9ec3-4f9e-e8be-99f6b635f79f@intel.com>
Date: Wed, 27 Sep 2023 09:02:27 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230918075411.247122-1-swati2.sharma@intel.com>
 <20230918075411.247122-4-swati2.sharma@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230918075411.247122-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/6] tests/kms_atomic: test cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 9/18/2023 1:24 PM, Swati Sharma wrote:
> Use atomic_clear() for all subtests.

Hi,

Overall the patch looks good to me. But as we're doing a little more 
than only using atomic_clear() in all subtests, could you could split 
the patch into two? Or if you see that the other changes are too trivial 
for a separate patch, please update the commit message mentioning that 
few checks are moved around in the functions. I'm fine with either approach.

Thanks,
Karthik.B.S
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_atomic.c | 49 ++++++++++++++++++++++++++--------------------
>   1 file changed, 28 insertions(+), 21 deletions(-)
>
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index f984d34f0..c55cb5b2f 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -393,27 +393,23 @@ plane_primary_overlay_mutable_zpos(igt_pipe_t *pipe, igt_output_t *output,
>    */
>   static void
>   plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
> -		     igt_output_t *output)
> +		     igt_output_t *output, igt_plane_t *primary, int n_planes)
>   {
>   	cairo_t *cr;
>   	struct igt_fb fb_ref;
> -	igt_plane_t *primary;
>   	drmModeModeInfo *mode;
>   	igt_pipe_crc_t *pipe_crc;
>   	igt_crc_t ref_crc, new_crc;
>   	int fb_id_lower, fb_id_upper;
> -	int n_planes = pipe->n_planes;
>   	igt_plane_t *plane_ptr[n_planes];
>   	struct igt_fb fb_lower, fb_upper;
>   	uint32_t w_lower, h_lower, w_upper, h_upper;
>   
>   	memset(plane_ptr, 0, n_planes * sizeof(igt_plane_t *));
>   
> -	igt_require(n_planes >= 2);
>   	igt_require_pipe_crc(display->drm_fd);
>   
>   	mode = igt_output_get_mode(output);
> -	primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>   
>   	/* for lower plane */
>   	w_lower = mode->hdisplay;
> @@ -643,17 +639,13 @@ static void plane_primary(igt_pipe_t *pipe, igt_plane_t *plane, struct igt_fb *f
>    * Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches the
>    * free-standing state objects and nothing else.
>    */
> -static void test_only(igt_pipe_t *pipe_obj,
> -		      igt_plane_t *primary,
> -		      igt_output_t *output)
> +static void test_only(igt_pipe_t *pipe_obj, igt_plane_t *primary,
> +		      igt_output_t *output, uint32_t format)
>   {
>   	drmModeModeInfo *mode = igt_output_get_mode(output);
> -	uint32_t format = plane_get_igt_format(primary);
>   	struct igt_fb fb;
>   	uint64_t old_plane_values[IGT_NUM_PLANE_PROPS], old_crtc_values[IGT_NUM_CRTC_PROPS];
>   
> -	igt_require(format != 0);
> -
>   	plane_get_current_state(primary, old_plane_values);
>   	crtc_get_current_state(pipe_obj, old_crtc_values);
>   
> @@ -1388,7 +1380,8 @@ static void atomic_setup(igt_display_t *display, enum pipe pipe, igt_output_t *o
>   	crtc_commit(primary->pipe, primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
>   }
>   
> -static void atomic_clear(igt_display_t *display, enum pipe pipe, igt_plane_t *primary, igt_output_t *output)
> +static void atomic_clear(igt_display_t *display, enum pipe pipe, igt_plane_t *primary,
> +			 igt_output_t *output, struct igt_fb *fb)
>   {
>   	igt_plane_t *plane;
>   
> @@ -1399,6 +1392,7 @@ static void atomic_clear(igt_display_t *display, enum pipe pipe, igt_plane_t *pr
>   
>   	igt_output_set_pipe(output, PIPE_NONE);
>   	crtc_commit(primary->pipe, primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
> +	igt_remove_fb(display->drm_fd, fb);
>   }
>   
>   igt_main
> @@ -1450,6 +1444,7 @@ igt_main
>   
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		plane_overlay(pipe_obj, output, overlay);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Test for KMS atomic modesetting on primary plane and ensure coherency between "
> @@ -1457,6 +1452,7 @@ igt_main
>   	igt_subtest("plane-primary-legacy") {
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		plane_primary(pipe_obj, primary, &fb);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Verify that the overlay plane can cover the primary one (and "\
> @@ -1464,14 +1460,14 @@ igt_main
>   	igt_subtest("plane-primary-overlay-mutable-zpos") {
>   		uint32_t format_primary = DRM_FORMAT_ARGB8888;
>   		uint32_t format_overlay = DRM_FORMAT_ARGB1555;
> -		igt_plane_t *overlay;
> +		igt_plane_t *overlay =
> +			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
> +		igt_require(overlay);
>   
>   		igt_info("Using (pipe %s + %s) to run the subtest.\n",
>   			 kmstest_pipe_name(pipe), igt_output_name(output));
>   
>   		igt_display_reset(&display);
> -		overlay = igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
> -		igt_require(overlay);
>   
>   		igt_require(igt_plane_has_prop(primary, IGT_PLANE_ZPOS));
>   		igt_require(igt_plane_has_prop(overlay, IGT_PLANE_ZPOS));
> @@ -1482,28 +1478,35 @@ igt_main
>   		igt_output_set_pipe(output, pipe);
>   		plane_primary_overlay_mutable_zpos(pipe_obj, output, primary, overlay,
>   						   format_primary, format_overlay);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Verify the reported zpos property of planes by making sure "\
>   		     "only higher zpos planes cover the lower zpos ones.");
>   	igt_subtest("plane-immutable-zpos") {
> +		int n_planes = pipe_obj->n_planes;
> +		igt_require(n_planes >= 2);
> +
>   		igt_info("Using (pipe %s + %s) to run the subtest.\n",
>   			 kmstest_pipe_name(pipe), igt_output_name(output));
>   
>   		igt_display_reset(&display);
>   		igt_output_set_pipe(output, pipe);
> -		plane_immutable_zpos(&display, pipe_obj, output);
> +		plane_immutable_zpos(&display, pipe_obj, output, primary, n_planes);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches "
>   		     "the free-standing state objects and nothing else.");
>   	igt_subtest("test-only") {
> -		atomic_clear(&display, pipe, primary, output);
> +		uint32_t format = plane_get_igt_format(primary);
> +		igt_require(format != 0);
>   
>   		igt_info("Using (pipe %s + %s) to run the subtest.\n",
>   			 kmstest_pipe_name(pipe), igt_output_name(output));
>   
> -		test_only(pipe_obj, primary, output);
> +		atomic_clear(&display, pipe, primary, output, &fb);
> +		test_only(pipe_obj, primary, output, format);
>   	}
>   
>   	igt_describe("Test for KMS atomic modesetting on cursor plane and ensure coherency between "
> @@ -1515,30 +1518,35 @@ igt_main
>   
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		plane_cursor(pipe_obj, output, cursor);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Test error handling when invalid plane parameters are passed");
>   	igt_subtest("plane-invalid-params") {
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		plane_invalid_params(pipe_obj, output, primary, &fb);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Test error handling when invalid plane fence parameters are passed");
>   	igt_subtest("plane-invalid-params-fence") {
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		plane_invalid_params_fence(pipe_obj, output, primary);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Test error handling when invalid crtc parameters are passed");
>   	igt_subtest("crtc-invalid-params") {
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		crtc_invalid_params(pipe_obj, output, primary, &fb);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Test error handling when invalid crtc fence parameters are passed");
>   	igt_subtest("crtc-invalid-params-fence") {
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		crtc_invalid_params_fence(pipe_obj, output, primary, &fb);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Test abuse the atomic ioctl directly in order to test "
> @@ -1547,6 +1555,7 @@ igt_main
>   	igt_subtest("atomic-invalid-params") {
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		atomic_invalid_params(pipe_obj, primary, output, &fb);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_describe("Simple test cases to use FB_DAMAGE_CLIPS plane property");
> @@ -1555,12 +1564,10 @@ igt_main
>   
>   		atomic_setup(&display, pipe, output, primary, &fb);
>   		atomic_plane_damage(pipe_obj, primary, &fb);
> +		atomic_clear(&display, pipe, primary, output, &fb);
>   	}
>   
>   	igt_fixture {
> -		atomic_clear(&display, pipe, primary, output);
> -		igt_remove_fb(display.drm_fd, &fb);
> -
>   		igt_display_fini(&display);
>   		drm_close_driver(display.drm_fd);
>   	}
