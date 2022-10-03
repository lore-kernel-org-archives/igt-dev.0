Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B5210E1F3
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Oct 2022 04:31:43 +0000 (UTC)
Message-ID: <63d82d08-acd9-7fd0-0057-5c445d051c86@intel.com>
Date: Mon, 3 Oct 2022 10:01:31 +0530
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220929134017.5274-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220929134017.5274-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_big_fb: fix max stride
 async flip tests
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

On 9/29/2022 7:10 PM, Juha-Pekka Heikkila wrote:
> Change handling of inner loop so test will not fail on unrelated issues.
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/i915/kms_big_fb.c | 25 ++++++++-----------------
>   1 file changed, 8 insertions(+), 17 deletions(-)
>
> diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
> index 0c4cd95e7..0b5e955de 100644
> --- a/tests/i915/kms_big_fb.c
> +++ b/tests/i915/kms_big_fb.c
> @@ -465,7 +465,7 @@ static bool test_pipe(data_t *data)
>   static bool
>   max_hw_stride_async_flip_test(data_t *data)
>   {
> -	uint32_t ret, startframe;
> +	uint32_t ret;
>   	const uint32_t w = data->output->config.default_mode.hdisplay,
>   		       h = data->output->config.default_mode.vdisplay;
>   	igt_plane_t *primary;
> @@ -510,14 +510,14 @@ max_hw_stride_async_flip_test(data_t *data)
>   					  INTEL_PIPE_CRC_SOURCE_AUTO);
>   	igt_pipe_crc_start(data->pipe_crc);
>   
> +	igt_plane_set_fb(primary, &data->big_fb);
> +	igt_fb_set_size(&data->big_fb, primary, w, h);
> +	igt_plane_set_size(primary, w, h);
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &compare_crc);
> +
>   	igt_set_timeout(5, "Async pageflipping loop got stuck!\n");
>   	for (int i = 0; i < 2; i++) {
> -		igt_plane_set_fb(primary, &data->big_fb);
> -		igt_fb_set_size(&data->big_fb, primary, w, h);
> -		igt_plane_set_size(primary, w, h);
> -		igt_display_commit_atomic(&data->display,
> -					  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -
>   		/* First async flip on Gen13+ will be treated as a sync flip*/
>   		if (intel_display_ver(data->devid) >= 13) {
>   			do {
> @@ -528,9 +528,6 @@ max_hw_stride_async_flip_test(data_t *data)
>   			igt_assert(ret == 0);
>   		}
>   
> -		igt_wait_for_vblank(data->drm_fd, data->display.pipes[primary->pipe->pipe].crtc_offset);
> -		startframe = kmstest_get_vblank(data->drm_fd, data->pipe, 0) + 1;
> -
>   		for (int j = 0; j < 2; j++) {
>   			do {
>   				ret = drmModePageFlip(data->drm_fd, data->output->config.crtc->crtc_id,
> @@ -547,13 +544,7 @@ max_hw_stride_async_flip_test(data_t *data)
>   			igt_assert(ret == 0);
>   		}
>   
> -		igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc,
> -					   startframe, &compare_crc);
> -		igt_pipe_crc_get_for_frame(data->drm_fd, data->pipe_crc,
> -					   startframe + 1, &async_crc);
> -
> -		igt_assert_f(kmstest_get_vblank(data->drm_fd, data->pipe, 0) -
> -			     startframe == 1, "lost frames\n");
> +		igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &async_crc);
>   
>   		igt_assert_f(igt_check_crc_equal(&compare_crc, &async_crc)^(i^1),
>   			     "CRC failure with async flip, crc %s match for checked round\n",

