Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07076E0EB
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2020 08:48:07 +0000 (UTC)
Date: Thu, 28 May 2020 11:48:05 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200528084805.GR9497@platvala-desk.ger.corp.intel.com>
References: <20200511113348.15105-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200511113348.15105-1-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t,
 v4] tests/kms_color: Change in commit style from legacy to atomic
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

On Mon, May 11, 2020 at 05:03:48PM +0530, Swati Sharma wrote:
> Existing kms_color i-g-t, commit style by default is legacy for
> all the ctm/gamma/degamma subtests.
> 
> In this patch, legacy commit is changed to atomic (since i915
> no longer supports legacy commit)
> 
> v1: As per Daniel's comments switching over to atomic.
> v2: As per Maarten's comments did COMMIT_ATOMIC, and added
>     igt_require(display.is_atomic)
> v3: Fixed mistake, now test cases are not getting skipped
> v4: Rebase
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Quoting danvet from earlier:

"Imo just switch over to atomic. There's no upstream driver supporting
color management props that doesn't support atomic."

There was some back-and-forth confused discussion happening on this
patch in its various revisions but I have completely lost track of the
concerns. If those arise again, feel free to raise a new discussion on
the list.


Acked-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/kms_color.c | 39 ++++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 7f2fbd4a..d27f1973 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -76,12 +76,12 @@ static void test_pipe_degamma(data_t *data,
>  		disable_ctm(primary->pipe);
>  		disable_degamma(primary->pipe);
>  		set_gamma(data, primary->pipe, gamma_linear);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  
>  		/* Draw solid colors with no degamma transformation. */
>  		paint_rectangles(data, mode, red_green_blue, &fb);
>  		igt_plane_set_fb(primary, &fb);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>  		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
>  
> @@ -91,7 +91,7 @@ static void test_pipe_degamma(data_t *data,
>  		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
>  		igt_plane_set_fb(primary, &fb);
>  		set_degamma(data, primary->pipe, degamma_full);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>  		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
>  
> @@ -158,12 +158,12 @@ static void test_pipe_gamma(data_t *data,
>  		disable_ctm(primary->pipe);
>  		disable_degamma(primary->pipe);
>  		set_gamma(data, primary->pipe, gamma_full);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  
>  		/* Draw solid colors with no gamma transformation. */
>  		paint_rectangles(data, mode, red_green_blue, &fb);
>  		igt_plane_set_fb(primary, &fb);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>  		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
>  
> @@ -172,7 +172,7 @@ static void test_pipe_gamma(data_t *data,
>  		 */
>  		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
>  		igt_plane_set_fb(primary, &fb);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>  		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
>  
> @@ -244,12 +244,12 @@ static void test_pipe_legacy_gamma(data_t *data,
>  		disable_degamma(primary->pipe);
>  		disable_gamma(primary->pipe);
>  		disable_ctm(primary->pipe);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  
>  		/* Draw solid colors with no gamma transformation. */
>  		paint_rectangles(data, mode, red_green_blue, &fb);
>  		igt_plane_set_fb(primary, &fb);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>  		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
>  
> @@ -264,7 +264,7 @@ static void test_pipe_legacy_gamma(data_t *data,
>  			red_lut[i] = green_lut[i] = blue_lut[i] = 0xffff;
>  		igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
>  						  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>  		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
>  
> @@ -279,7 +279,7 @@ static void test_pipe_legacy_gamma(data_t *data,
>  
>  		igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
>  						  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  
>  		igt_plane_set_fb(primary, NULL);
>  		igt_output_set_pipe(output, PIPE_NONE);
> @@ -323,7 +323,7 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
>  		disable_degamma(primary->pipe);
>  		disable_ctm(primary->pipe);
>  		disable_gamma(primary->pipe);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  
>  		/* Set a degama & gamma LUT and a CTM using the
>  		 * properties and verify the content of the
> @@ -333,7 +333,7 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
>  		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM))
>  			set_ctm(primary->pipe, ctm_identity);
>  		set_gamma(data, primary->pipe, gamma_zero);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  
>  		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT)) {
>  			blob = get_blob(data, primary->pipe, IGT_CRTC_DEGAMMA_LUT);
> @@ -380,7 +380,7 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
>  						  legacy_lut_size,
>  						  red_lut, green_lut, blue_lut),
>  			      0);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  
>  		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT))
>  			igt_assert(get_blob(data, primary->pipe,
> @@ -474,12 +474,12 @@ static bool test_pipe_ctm(data_t *data,
>  		}
>  
>  		disable_ctm(primary->pipe);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  
>  		paint_rectangles(data, mode, after, &fb);
>  		igt_plane_set_fb(primary, &fb);
>  		set_ctm(primary->pipe, ctm_identity);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>  		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
>  
> @@ -487,7 +487,7 @@ static bool test_pipe_ctm(data_t *data,
>  		paint_rectangles(data, mode, before, &fb);
>  		igt_plane_set_fb(primary, &fb);
>  		set_ctm(primary->pipe, ctm_matrix);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>  		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
>  
> @@ -582,7 +582,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
>  		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_FULL);
>  		paint_rectangles(data, mode, red_green_blue_limited, &fb);
>  		igt_plane_set_fb(primary, &fb);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>  		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_full);
>  
> @@ -590,7 +590,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
>  		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_16_235);
>  		paint_rectangles(data, mode, red_green_blue_full, &fb);
>  		igt_plane_set_fb(primary, &fb);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  		igt_wait_for_vblank(data->drm_fd, primary->pipe->pipe);
>  		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_limited);
>  
> @@ -819,7 +819,7 @@ run_tests_for_pipe(data_t *data, enum pipe p)
>  		disable_degamma(primary->pipe);
>  		disable_gamma(primary->pipe);
>  		disable_ctm(primary->pipe);
> -		igt_display_commit(&data->display);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  
>  		igt_pipe_crc_free(data->pipe_crc);
>  		data->pipe_crc = NULL;
> @@ -838,6 +838,7 @@ igt_main
>  		kmstest_set_vt_graphics_mode();
>  
>  		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
>  	}
>  
>  	for_each_pipe_static(pipe)
> -- 
> 2.25.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
