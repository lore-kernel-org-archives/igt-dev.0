Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A973F10E65E
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 12:57:46 +0000 (UTC)
Message-ID: <4956d0b0-7962-8ef9-c300-6b924ccbe348@intel.com>
Date: Tue, 6 Sep 2022 18:27:34 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220905040618.302991-1-bhanuprakash.modem@intel.com>
 <20220905040618.302991-3-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220905040618.302991-3-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 2/2] tests/kms_atomic_transition: Test Cleanup
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

On 9/5/2022 9:36 AM, Bhanuprakash Modem wrote:
> Sanitize the system state before starting the subtest.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_atomic_transition.c | 85 +++++++++++++++++------------------
>   1 file changed, 42 insertions(+), 43 deletions(-)
>
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 3f0ceb3d..60328af7 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -47,9 +47,10 @@ struct plane_parms {
>   
>   typedef struct {
>   	int drm_fd;
> -	struct igt_fb fb, argb_fb, sprite_fb;
> +	struct igt_fb fbs[2], argb_fb, sprite_fb;
>   	igt_display_t display;
>   	bool extended;
> +	igt_pipe_crc_t *pipe_crcs[IGT_MAX_PIPES];
>   } data_t;
>   
>   /* globals for fence support */
> @@ -62,10 +63,11 @@ run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
>   {
>   	drmModeModeInfo *mode;
>   	igt_plane_t *primary;
> -	igt_fb_t fb;
> +	igt_fb_t *fb = &data->fbs[0];
>   	int i, ret;
>   	unsigned flags = DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET;
>   
> +	igt_display_reset(&data->display);
>   	igt_output_set_pipe(output, pipe);
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   
> @@ -76,9 +78,9 @@ run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
>   	igt_skip_on_f(ret == -EINVAL, "Primary plane cannot be disabled separately from output\n");
>   
>   	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> -		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
> +		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb);
>   
> -	igt_plane_set_fb(primary, &fb);
> +	igt_plane_set_fb(primary, fb);
>   
>   	for (i = 0; i < 4; i++) {
>   		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> @@ -87,20 +89,15 @@ run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
>   			igt_wait_for_vblank(data->drm_fd,
>   					data->display.pipes[pipe].crtc_offset);
>   
> -		igt_plane_set_fb(primary, (i & 1) ? &fb : NULL);
> +		igt_plane_set_fb(primary, (i & 1) ? fb : NULL);
>   		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
>   		if (i & 1)
>   			igt_wait_for_vblank(data->drm_fd,
>   					data->display.pipes[pipe].crtc_offset);
>   
> -		igt_plane_set_fb(primary, (i & 1) ? NULL : &fb);
> +		igt_plane_set_fb(primary, (i & 1) ? NULL : fb);
>   	}
> -
> -	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_NONE);
> -	igt_remove_fb(data->drm_fd, &fb);
> -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   }
>   
>   static void *fence_inc_thread(void *arg)
> @@ -507,7 +504,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
>   	override_mode.flags ^= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC;
>   
>   	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
> -		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb);
> +		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fbs[0]);
>   
>   	igt_output_set_pipe(output, pipe);
>   
> @@ -521,7 +518,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
>   		igt_output_set_pipe(output, pipe);
>   	}
>   
> -	setup_parms(data, pipe, mode, &data->fb, &data->argb_fb, &data->sprite_fb, parms, &iter_max);
> +	setup_parms(data, pipe, mode, &data->fbs[0], &data->argb_fb, &data->sprite_fb, parms, &iter_max);
>   
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
> @@ -663,7 +660,8 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output, boo
>   
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
> -	igt_remove_fb(data->drm_fd, &data->fb);
> +	igt_remove_fb(data->drm_fd, &data->fbs[0]);
> +	igt_remove_fb(data->drm_fd, &data->fbs[1]);
>   	igt_remove_fb(data->drm_fd, &data->argb_fb);
>   	igt_remove_fb(data->drm_fd, &data->sprite_fb);
>   }
> @@ -803,12 +801,11 @@ static void collect_crcs_mask(igt_pipe_crc_t **pipe_crcs, unsigned mask, igt_crc
>   
>   static void run_modeset_tests(data_t *data, int howmany, bool nonblocking, bool fencing)
>   {
> -	struct igt_fb fbs[2];
>   	int i, j;
>   	unsigned iter_max;
> -	igt_pipe_crc_t *pipe_crcs[IGT_MAX_PIPES] = { 0 };
>   	igt_output_t *output;
>   	uint16_t width = 0, height = 0;
> +	bool ret = true;
>   
>   	for (i = 0; i < data->display.n_outputs; i++)
>   		igt_output_set_pipe(&data->display.outputs[i], PIPE_NONE);
> @@ -823,9 +820,9 @@ retry:
>   	}
>   
>   	igt_create_pattern_fb(data->drm_fd, width, height,
> -				   DRM_FORMAT_XRGB8888, 0, &fbs[0]);
> +				   DRM_FORMAT_XRGB8888, 0, &data->fbs[0]);
>   	igt_create_color_pattern_fb(data->drm_fd, width, height,
> -				    DRM_FORMAT_XRGB8888, 0, .5, .5, .5, &fbs[1]);
> +				    DRM_FORMAT_XRGB8888, 0, .5, .5, .5, &data->fbs[1]);
>   
>   	for_each_pipe(&data->display, i) {
>   		igt_pipe_t *pipe = &data->display.pipes[i];
> @@ -836,7 +833,7 @@ retry:
>   		j += 1;
>   
>   		if (is_i915_device(data->drm_fd))
> -			pipe_crcs[i] = igt_pipe_crc_new(data->drm_fd, i, INTEL_PIPE_CRC_SOURCE_AUTO);
> +			data->pipe_crcs[i] = igt_pipe_crc_new(data->drm_fd, i, INTEL_PIPE_CRC_SOURCE_AUTO);
>   
>   		for_each_valid_output_on_pipe(&data->display, i, output) {
>   			if (output->pending_pipe != PIPE_NONE)
> @@ -848,8 +845,8 @@ retry:
>   		}
>   
>   		if (mode) {
> -			igt_plane_set_fb(plane, &fbs[1]);
> -			igt_fb_set_size(&fbs[1], plane, mode->hdisplay, mode->vdisplay);
> +			igt_plane_set_fb(plane, &data->fbs[1]);
> +			igt_fb_set_size(&data->fbs[1], plane, mode->hdisplay, mode->vdisplay);
>   			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>   
>   			if (fencing)
> @@ -883,13 +880,13 @@ retry:
>   		if (igt_hweight(i) > howmany)
>   			continue;
>   
> -		event_mask = set_combinations(data, i, &fbs[0]);
> +		event_mask = set_combinations(data, i, &data->fbs[0]);
>   		if (!event_mask && i)
>   			continue;
>   
>   		commit_display(data, event_mask, nonblocking);
>   
> -		collect_crcs_mask(pipe_crcs, i, crcs[0]);
> +		collect_crcs_mask(data->pipe_crcs, i, crcs[0]);
>   
>   		for (j = iter_max - 1; j > i + 1; j--) {
>   			if (igt_hweight(j) > howmany)
> @@ -898,54 +895,44 @@ retry:
>   			if (igt_hweight(i) < howmany && igt_hweight(j) < howmany)
>   				continue;
>   
> -			event_mask = set_combinations(data, j, &fbs[1]);
> +			event_mask = set_combinations(data, j, &data->fbs[1]);
>   			if (!event_mask)
>   				continue;
>   
>   			commit_display(data, event_mask, nonblocking);
>   
> -			collect_crcs_mask(pipe_crcs, j, crcs[1]);
> +			collect_crcs_mask(data->pipe_crcs, j, crcs[1]);
>   
>   			refresh_primaries(data, j);
>   			commit_display(data, j, nonblocking);
> -			collect_crcs_mask(pipe_crcs, j, crcs[2]);
> +			collect_crcs_mask(data->pipe_crcs, j, crcs[2]);
>   
> -			event_mask = set_combinations(data, i, &fbs[0]);
> +			event_mask = set_combinations(data, i, &data->fbs[0]);
>   			if (!event_mask)
>   				continue;
>   
>   			commit_display(data, event_mask, nonblocking);
> -			collect_crcs_mask(pipe_crcs, i, crcs[3]);
> +			collect_crcs_mask(data->pipe_crcs, i, crcs[3]);
>   
>   			refresh_primaries(data, i);
>   			commit_display(data, i, nonblocking);
> -			collect_crcs_mask(pipe_crcs, i, crcs[4]);
> +			collect_crcs_mask(data->pipe_crcs, i, crcs[4]);
>   
>   			if (!is_i915_device(data->drm_fd))
>   				continue;
>   
>   			for (int k = 0; k < IGT_MAX_PIPES; k++) {
>   				if (i & (1 << k)) {
> -					igt_assert_crc_equal(&crcs[0][k], &crcs[3][k]);
> -					igt_assert_crc_equal(&crcs[0][k], &crcs[4][k]);
> +					ret &= igt_check_crc_equal(&crcs[0][k], &crcs[3][k]);
> +					ret &= igt_check_crc_equal(&crcs[0][k], &crcs[4][k]);
>   				}
>   
>   				if (j & (1 << k))
> -					igt_assert_crc_equal(&crcs[1][k], &crcs[2][k]);
> +					ret &= igt_check_crc_equal(&crcs[1][k], &crcs[2][k]);

Hi,

Overall the patch LGTM.

Just one question here, now that the cleanup part is anyway moved 
outside the dynamic subtest, I think we could retain the original 
asserts so that we exit the subtest at the first failure?

Thanks,
Karthik.B.S

>   			}
>   		}
>   	}
> -
> -	set_combinations(data, 0, NULL);
> -	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -
> -	if (is_i915_device(data->drm_fd)) {
> -		for_each_pipe(&data->display, i)
> -			igt_pipe_crc_free(pipe_crcs[i]);
> -	}
> -
> -	igt_remove_fb(data->drm_fd, &fbs[1]);
> -	igt_remove_fb(data->drm_fd, &fbs[0]);
> +	igt_assert(ret || igt_skip_crc_compare);
>   }
>   
>   static void run_modeset_transition(data_t *data, int requested_outputs, bool nonblocking, bool fencing)
> @@ -980,6 +967,18 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
>   
>   	igt_dynamic_f("%ix-outputs", requested_outputs)
>   		run_modeset_tests(data, requested_outputs, nonblocking, fencing);
> +
> +	/* Cleanup */
> +	set_combinations(data, 0, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	if (is_i915_device(data->drm_fd)) {
> +		for_each_pipe(&data->display, pipe)
> +			igt_pipe_crc_free(data->pipe_crcs[pipe]);
> +	}
> +
> +	igt_remove_fb(data->drm_fd, &data->fbs[0]);
> +	igt_remove_fb(data->drm_fd, &data->fbs[1]);
>   }
>   
>   static int opt_handler(int opt, int opt_index, void *_data)

