Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4334510E0A9
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 05:15:29 +0000 (UTC)
Message-ID: <a59a6dc0-254d-293a-3019-6d51a31409fe@intel.com>
Date: Fri, 8 Sep 2023 10:44:30 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230807093201.70650-1-mohammed.thasleem@intel.com>
 <20230907192236.76147-1-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230907192236.76147-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_kms: Add helper to turn on and
 off the displays
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

Hi Thasleem,

This patch is not applying cleanly, please rebase & float again.

On Fri-08-09-2023 12:52 am, Mohammed Thasleem wrote:
> This helper will turn on and off the displays with the help of
> IGT_CRTC_ACTIVE properties set to ON and OFF.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> 
> v2: Use IGT_CRTC_ACTIVE for displays On/Off.
> v3: -Update commit message and helper names.
>      -Update display on and off helpers.
> ---
>   lib/igt_kms.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  3 +++
>   2 files changed, 53 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e0959ccff..f72a21a03 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6039,3 +6039,53 @@ bool i915_pipe_output_combo_valid(igt_display_t *display)
>   	 */
>   	return igt_check_bigjoiner_support(display);
>   }
> +

Documentation is missing.

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
> +}
> +

Documentation is missing.

> +void igt_turn_off_display(int drm_fd)
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
> +
> +	for_each_connected_output(&display, output)
> +		igt_output_set_pipe(output, PIPE_NONE);
----------------^

> +
> +	for_each_pipe(&display, pipe)
> +		igt_pipe_set_prop_value(&display, pipe, IGT_CRTC_ACTIVE, 0);
----------------^

Looks, these calls are redundant. igt_display_reset() itself is doing 
the same.

Please check:
  * igt_display_reset() --> igt_pipe_reset() --> 
igt_pipe_obj_set_prop_value(IGT_CRTC_ACTIVE, 0)
  * igt_display_reset() --> igt_output_reset() --> "output->pending_pipe 
= PIPE_NONE"

- Bhanu

> +
> +	igt_display_commit2(&display, COMMIT_ATOMIC);
> +
> +	igt_display_fini(&display);
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 91355c910..3939f2714 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1014,4 +1014,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display);
>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>   bool i915_pipe_output_combo_valid(igt_display_t *display);
>   
> +void igt_turn_on_display(int drm_fd);
> +void igt_turn_off_display(int drm_fd);
> +
>   #endif /* __IGT_KMS_H__ */
