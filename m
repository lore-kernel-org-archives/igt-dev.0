Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <b3935ec4-c239-0db0-33b4-9de43bbf7965@intel.com>
Date: Tue, 5 Jul 2022 14:57:25 +0530
Content-Language: en-US
To: Arun R Murthy <arun.r.murthy@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220628110409.768308-1-arun.r.murthy@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220628110409.768308-1-arun.r.murthy@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_big_fb: trigger async
 flip with a dummy flip
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Juha-Pekka_Heikkil=c3=a4?= <juha-pekka.heikkila@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 6/28/2022 4:34 PM, Arun R Murthy wrote:
> In oder to trigger the async flip, a dummy flip is required after sync
> flip so as to update the watermarks for async in KMD which happens as
> part of this dummy flip. Thereafter async memory update will act as a
> trigger register.
> Capturing the CRC is done after the async flip as async flip at some
> times can consume fairly a vblank period time.
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>   tests/i915/kms_big_fb.c | 29 +++++++++++++++++++----------
>   1 file changed, 19 insertions(+), 10 deletions(-)
>
> diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
> index d50fde45..6caf3c31 100644
> --- a/tests/i915/kms_big_fb.c
> +++ b/tests/i915/kms_big_fb.c
> @@ -465,7 +465,7 @@ static bool test_pipe(data_t *data)
>   static bool
>   max_hw_stride_async_flip_test(data_t *data)
>   {
> -	uint32_t ret, startframe;
> +	uint32_t ret, frame;
>   	const uint32_t w = data->output->config.default_mode.hdisplay,
>   		       h = data->output->config.default_mode.vdisplay;
>   	igt_plane_t *primary;
> @@ -519,7 +519,19 @@ max_hw_stride_async_flip_test(data_t *data)
>   					  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   
>   		igt_wait_for_vblank(data->drm_fd, data->display.pipes[primary->pipe->pipe].crtc_offset);
> -		startframe = kmstest_get_vblank(data->drm_fd, data->pipe, 0) + 1;
> +		/*
> +		 * In older platforms (<= Gen10), async address update bit is double buffered.
> +		 * So flip timestamp can be verified only from the second flip.
> +		 * The first async flip just enables the async address update.
> +		 * In platforms greater than DISPLAY13 the first async flip will be discarded
> +		 * in order to change the watermark levels as per the optimization. Hence the
> +		 * subsequent async flips will actually do the asynchronous flips.
> +		 */
> +		ret = drmModePageFlip(data->drm_fd, data->output->config.crtc->crtc_id,
> +						      data->big_fb_flip[i].fb_id,
> +						      DRM_MODE_PAGE_FLIP_ASYNC, NULL);
> +		igt_wait_for_vblank(data->drm_fd, data->display.pipes[primary->pipe->pipe].crtc_offset);
> +		frame = kmstest_get_vblank(data->drm_fd, data->pipe, 0) + 1;

Hi,

Should this be added inside a gen check similar to kms_async_flips?

>   
>   		for (int j = 0; j < 2; j++) {
>   			do {
> @@ -528,23 +540,20 @@ max_hw_stride_async_flip_test(data_t *data)
>   						      DRM_MODE_PAGE_FLIP_ASYNC, NULL);
>   			} while (ret == -EBUSY);
>   			igt_assert(ret == 0);
> +			igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc,
> +					   frame, &compare_crc);
>   
> +			frame = kmstest_get_vblank(data->drm_fd, data->pipe, 0) + 1;
>   			do {
>   				ret = drmModePageFlip(data->drm_fd, data->output->config.crtc->crtc_id,
>   						      data->big_fb.fb_id,
>   						      DRM_MODE_PAGE_FLIP_ASYNC, NULL);
>   			} while (ret == -EBUSY);
>   			igt_assert(ret == 0);
> +			igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc,
> +					   frame, &async_crc);

We should be moving this IMHO. By waiting for vblank after each async 
flip to capture CRC, what is the intended result? Seems to be completely 
changing the existing test logic.

Also, seems like we are overwriting the CRC captured for j = 0, as 
comparison is done outside this loop. Is this done on purpose?

Thanks,
Karthik.B.S
>   		}
>   
> -		igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc,
> -					   startframe, &compare_crc);
> -		igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc,
> -					   startframe + 1, &async_crc);
> -
> -		igt_assert_f(kmstest_get_vblank(data->drm_fd, data->pipe, 0) -
> -			     startframe == 1, "lost frames\n");
> -
>   		igt_assert_f(igt_check_crc_equal(&compare_crc, &async_crc)^(i^1),
>   			     "CRC failure with async flip, crc %s match for checked round\n",
>   			     i?"should":"shouldn't");

