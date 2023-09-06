Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBBC10E704
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 19:08:05 +0000 (UTC)
Message-ID: <84e76a07-22d4-680e-b856-9c1186d04025@intel.com>
Date: Thu, 7 Sep 2023 00:37:34 +0530
Content-Language: en-US
To: Sean Paul <sean@poorly.run>, <igt-dev@lists.freedesktop.org>
References: <20230825183934.1271156-1-sean@poorly.run>
 <20230825183934.1271156-2-sean@poorly.run>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230825183934.1271156-2-sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 1/6] tests/kms_vrr: Move fb0 and fb1 to an
 array
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On Sat-26-08-2023 12:06 am, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> A bit of cleanup, no functional changes.

Please write about the cleanup done by this patch.

With that change, this patch is
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu
> 
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>   tests/kms_vrr.c | 19 +++++++++----------
>   1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index d7ede6513..83a91b543 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -105,8 +105,7 @@ typedef struct data {
>   	igt_display_t display;
>   	int drm_fd;
>   	igt_plane_t *primary;
> -	igt_fb_t fb0;
> -	igt_fb_t fb1;
> +	igt_fb_t fb[2];
>   	range_t range;
>   } data_t;
>   
> @@ -273,13 +272,13 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
>   	/* Prepare resources */
>   	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
>   			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> -			    0.50, 0.50, 0.50, &data->fb0);
> +			    0.50, 0.50, 0.50, &data->fb[0]);
>   
>   	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
>   			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> -			    0.50, 0.50, 0.50, &data->fb1);
> +			    0.50, 0.50, 0.50, &data->fb[1]);
>   
> -	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb0);
> +	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[0]);
>   
>   	igt_paint_color(cr, 0, 0, mode.hdisplay / 10, mode.vdisplay / 10,
>   			1.00, 0.00, 0.00);
> @@ -288,7 +287,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
>   
>   	/* Take care of any required modesetting before the test begins. */
>   	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	igt_plane_set_fb(data->primary, &data->fb0);
> +	igt_plane_set_fb(data->primary, &data->fb[0]);
>   
>   	/* Clear vrr_enabled state before enabling it, because
>   	 * it might be left enabled if the previous test fails.
> @@ -338,7 +337,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
>   	vtest_ns_t vtest_ns = get_test_rate_ns(data->range);
>   
>   	/* Align with the flip completion event to speed up convergence. */
> -	do_flip(data, &data->fb0);
> +	do_flip(data, &data->fb[0]);
>   	start_ns = last_event_ns = target_ns = get_kernel_event_ns(data,
>   							DRM_EVENT_FLIP_COMPLETE);
>   
> @@ -347,7 +346,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
>   		int64_t diff_ns;
>   
>   		front = !front;
> -		do_flip(data, front ? &data->fb1 : &data->fb0);
> +		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
>   
>   		/* We need to cpture flip event instead of vblank event,
>   		 * because vblank is triggered after each frame, but depending
> @@ -497,8 +496,8 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   	igt_output_override_mode(output, NULL);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
> -	igt_remove_fb(data->drm_fd, &data->fb1);
> -	igt_remove_fb(data->drm_fd, &data->fb0);
> +	igt_remove_fb(data->drm_fd, &data->fb[1]);
> +	igt_remove_fb(data->drm_fd, &data->fb[0]);
>   }
>   
>   /* Runs tests on outputs that are VRR capable. */
