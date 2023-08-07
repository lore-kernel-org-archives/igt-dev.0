Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E3310E310
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 17:04:39 +0000 (UTC)
Message-ID: <49c3e53b-c110-bfd5-7f18-a4c80773c0fd@intel.com>
Date: Mon, 7 Aug 2023 22:34:05 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230718110852.2965553-2-anshuman.gupta@intel.com>
 <20230807093201.70650-1-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230807093201.70650-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 3/3] lib/igt_kms: Add helper with DPMS to
 turn on and off the displays
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

On Mon-07-08-2023 03:02 pm, Mohammed Thasleem wrote:
> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> This helper will turn on and off the displays with the help of DPMS
> properties set to ON and OFF.
> 
> v2: Use IGT_CRTC_ACTIVE for displays On/Off.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> ---
>   lib/igt_kms.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  3 +++
>   2 files changed, 53 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index f2b0eed57..97283d55e 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6029,3 +6029,53 @@ bool i915_pipe_output_combo_valid(igt_display_t *display)
>   	 */
>   	return igt_check_bigjoiner_support(display);
>   }
> +
> +void igt_dpms_turn_on_display(int drm_fd)

As per the commit message, looks there is no involvement of DPMS. Please 
fix the helper names accordingly.

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
> +	for_each_connected_output(&display, output) {
> +		for_each_pipe(&display, pipe) {
> +			igt_display_reset(&display);

There are 2 problems here:

1) This reset call will disable the previous the pipe. Please check:
igt_display_reset()-->igt_pipe_reset()

2) With this combination of loops, multiple pipes will try to use the 
same output which is not allowed again.

> +			igt_output_set_pipe(output, pipe);
> +			igt_pipe_set_prop_value(&display, pipe, IGT_CRTC_ACTIVE, 1);
> +		}
> +	}
> +
> +	igt_display_commit2(&display, COMMIT_ATOMIC);
> +
> +	igt_display_fini(&display);
> +}
> +
> +void igt_dpms_turn_off_display(int drm_fd)
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
> +	for_each_connected_output(&display, output) {
> +		for_each_pipe(&display, pipe) {
> +			igt_display_reset(&display);
> +			igt_output_set_pipe(output, pipe);
> +			igt_pipe_set_prop_value(&display, pipe, IGT_CRTC_ACTIVE, 0);
> +		}
> +	}
> +
> +	igt_display_commit2(&display, COMMIT_ATOMIC);
> +
> +	igt_display_fini(&display);
> +}

As there is a code duplication in these functions, we can re-write as:

void igt_display_toggle(int drm_fd, bool on_off) {
     <...>
     igt_pipe_set_prop_value(&display, pipe, IGT_CRTC_ACTIVE, on_off);
     <...>
}

#define igt_display_on(drm_fd) igt_display_toggle(drm_fd, true)
#define igt_display_off(drm_fd) igt_display_toggle(drm_fd, false)

- Bhanu

> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 1b6988c17..32d20d683 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1005,4 +1005,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display);
>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>   bool i915_pipe_output_combo_valid(igt_display_t *display);
>   
> +void igt_dpms_turn_on_display(int drm_fd);
> +void igt_dpms_turn_off_display(int drm_fd);
> +
>   #endif /* __IGT_KMS_H__ */
