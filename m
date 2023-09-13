Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1582810E4A7
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Sep 2023 11:02:52 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-401b3ea0656so70363025e9.0
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Sep 2023 04:02:51 -0700 (PDT)
Message-ID: <5e7831da-46f6-25dd-411c-2e63dd020c8b@gmail.com>
Date: Wed, 13 Sep 2023 14:02:44 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230907192236.76147-1-mohammed.thasleem@intel.com>
 <20230912081129.6809-1-mohammed.thasleem@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230912081129.6809-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_kms: Add helper to turn on and
 off the displays
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 12.9.2023 11.11, Mohammed Thasleem wrote:
> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> This helper will turn on and off the displays with the help of
> IGT_CRTC_ACTIVE properties set to ON and OFF.
> 
> v2: Use IGT_CRTC_ACTIVE for displays On/Off.
> v3: -Update commit message and helper names.
>      -Update display on and off helpers.
> v4: Remove redundant code. (Bhanu)
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   lib/igt_kms.c | 54 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  3 +++
>   2 files changed, 57 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index c2f3728a6..b9cb6aa85 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6083,3 +6083,57 @@ int igt_get_dp_mst_connector_id(igt_output_t *output)
>   
>   	return connector_id;
>   }
> +
> +/*
> + * igt_turn_on_display:
> + * @fd: A drm file descriptor
> + *
> + * It will Enable the all connected display.
> + */
> +void igt_turn_on_display(int drm_fd)
> +{
> +	igt_display_t display;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +
> +	if (!drmModeGetResources(drm_fd))
> +		return;
> +
> +	igt_display_require(&display, drm_fd);
> +	igt_display_reset(&display);

Why display reset? igt_display_require above already called 
igt_display_reset..probably multiple times.

> +
> +	for_each_pipe(&display, pipe) {
> +		for_each_valid_output_on_pipe(&display, pipe, output) {
> +			if (output->pending_pipe != PIPE_NONE)
> +				continue;
> +
> +			igt_output_set_pipe(output, pipe);
> +			break;
> +		}
> +	}
> +
> +	igt_display_commit2(&display, COMMIT_ATOMIC);
> +
> +	igt_display_fini(&display);

What's the use case for such function? If this is used in any test that 
does igt_display_require(..) this function will cause test to go on 
random state by doing require->reset->fini. This would leave other 
display structure changed property settings not matching to anything.

Also this function doesn't just turn on displays, it will cause modesets 
on them by setting rendering pipes active.

If you just want displays to be lit why not use dpms?

> +}
> +
> +/*
> + * igt_turn_off_display:
> + * @fd: A drm file descriptor
> + *
> + * It will disable  the all connected display.
> + */
> +void igt_turn_off_display(int drm_fd)
> +{
> +	igt_display_t display;
> +
> +	if (!drmModeGetResources(drm_fd))
> +		return;
> +
> +	igt_display_require(&display, drm_fd);
> +	igt_display_reset(&display);
> +
> +	igt_display_commit2(&display, COMMIT_ATOMIC);
> +
> +	igt_display_fini(&display);

this is same as above, this will mess up any kms test.

> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index f2c3741fc..526477e4d 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1016,4 +1016,7 @@ bool i915_pipe_output_combo_valid(igt_display_t *display);
>   bool igt_check_output_is_dp_mst(igt_output_t *output);
>   int igt_get_dp_mst_connector_id(igt_output_t *output);
>   
> +void igt_turn_on_display(int drm_fd);
> +void igt_turn_off_display(int drm_fd);
> +
>   #endif /* __IGT_KMS_H__ */
