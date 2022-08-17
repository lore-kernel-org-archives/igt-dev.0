Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D77D8D16F
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Aug 2022 11:31:41 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 p12-20020a7bcc8c000000b003a5360f218fso841157wma.3
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Aug 2022 04:31:41 -0700 (PDT)
Message-ID: <aa9968d2-b819-92d8-9dd4-125ad72b1203@gmail.com>
Date: Wed, 17 Aug 2022 14:31:32 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
References: <20220817041757.30267-1-karthik.b.s@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220817041757.30267-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915/kms_big_fb: First async
 flip discarded on i915
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: arun.r.murthy@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Look ok to me. There was some new failures on ci run but they don't seem 
to relate to this patch.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 17.8.2022 7.17, Karthik B S wrote:
> Display 13 onwards, i915 uses the first async flip to update the
> watermarks as per the watermark optimization. Hence the actual
> async flip will happen from the subsequent flips.
> 
> To handle this, a dummy async flip has to be done in the async flip
> subtests to allow the KMD to perform the watermark related updates
> before writing to the surface base address.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/i915/kms_big_fb.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
> index d50fde45..0c4cd95e 100644
> --- a/tests/i915/kms_big_fb.c
> +++ b/tests/i915/kms_big_fb.c
> @@ -518,6 +518,16 @@ max_hw_stride_async_flip_test(data_t *data)
>   		igt_display_commit_atomic(&data->display,
>   					  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   
> +		/* First async flip on Gen13+ will be treated as a sync flip*/
> +		if (intel_display_ver(data->devid) >= 13) {
> +			do {
> +				ret = drmModePageFlip(data->drm_fd, data->output->config.crtc->crtc_id,
> +						      data->big_fb.fb_id,
> +						      DRM_MODE_PAGE_FLIP_ASYNC, NULL);
> +			} while (ret == -EBUSY);
> +			igt_assert(ret == 0);
> +		}
> +
>   		igt_wait_for_vblank(data->drm_fd, data->display.pipes[primary->pipe->pipe].crtc_offset);
>   		startframe = kmstest_get_vblank(data->drm_fd, data->pipe, 0) + 1;
>   
