Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26C010E17C
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Mar 2023 11:32:18 +0000 (UTC)
Message-ID: <86d20e9d-cc16-ea16-4f17-ece109435777@intel.com>
Date: Tue, 28 Mar 2023 17:02:03 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>, <swati2.sharma@intel.com>,
 <karthik.b.s@intel.com>
References: <20230328105313.3727321-1-bhanuprakash.modem@intel.com>
 <20230328105313.3727321-2-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230328105313.3727321-2-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 1/4] lib/igt_kms: Fix Bigjoiner checks
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

Patch looks good to me.

Please find the comments inline:


On 3/28/2023 4:23 PM, Bhanuprakash Modem wrote:
> Bigjoiner will come in the picture when the resolution > 5K or
> clock > max dot-clock. Add a support to check the selected mode
> clock is greater than the max dot-clock.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   lib/igt_kms.c | 39 +++++++++++++++++++++++++++++++++++++--
>   lib/igt_kms.h |  1 +
>   2 files changed, 38 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index c12823d318e..3587dc7d7f6 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5780,6 +5780,36 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>   	return false;
>   }
>   
> +/*
> + * igt_get_max_dotclock:
> + * @fd: A drm file descriptor
> + *
> + * Get the Max pixel clock frequency from intel specific debugfs
> + * "i915_frequency_info".
> + *
> + * Returns: Max supported pixel clock frequency.
> + */
> +int igt_get_max_dotclock(int fd)
> +{
> +	char buf[4096];
> +	char *s;
> +	int max_dotclock = 0;
> +
> +	if (!is_i915_device(fd))
> +		return max_dotclock;
> +
> +	igt_debugfs_read(fd, "i915_frequency_info", buf);
> +	s = strstr(buf, "Max pixel clock frequency:");
> +	igt_assert(s);
> +	igt_assert_eq(sscanf(s, "Max pixel clock frequency: %d kHz", &max_dotclock), 1);
> +
> +	/* 100 Mhz to 5 GHz seem like reasonable values to expect */
> +	igt_assert_lt(max_dotclock, 5000000);
> +	igt_assert_lt(100000, max_dotclock);
> +
> +	return max_dotclock;
> +}
> +
>   /*
>    * igt_check_bigjoiner_support:
>    * @display: a pointer to an #igt_display_t structure
> @@ -5802,6 +5832,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   		enum pipe idx;
>   		drmModeModeInfo *mode;
>   	} pipes[IGT_MAX_PIPES];
> +	int max_dotclock;
>   
>   	/* Get total enabled pipes. */
>   	for_each_pipe(display, p)
> @@ -5825,6 +5856,8 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   		return true;
>   	}
>   
> +	max_dotclock = igt_get_max_dotclock(display->drm_fd);
> +
>   	/*
>   	 * if mode.hdisplay > 5120, then ignore
>   	 *  - if the consecutive pipe is not available

Lets update the comment too, about dotclock check.


> @@ -5836,11 +5869,13 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>   	 *  - current & previous crtcs are consecutive
>   	 */
>   	for (i = 0; i < pipes_in_use; i++) {
> -		if (((pipes[i].mode->hdisplay > MAX_HDISPLAY_PER_PIPE) &&
> +		if (((pipes[i].mode->hdisplay > MAX_HDISPLAY_PER_PIPE ||
> +		      pipes[i].mode->clock > max_dotclock) &&
>   		     ((pipes[i].idx >= (total_pipes - 1)) ||
>   		      (!display->pipes[pipes[i].idx + 1].enabled) ||
>   		      ((i < (pipes_in_use - 1)) && (abs(pipes[i + 1].idx - pipes[i].idx) <= 1)))) ||
> -		    ((i > 0) && (pipes[i - 1].mode->hdisplay > MAX_HDISPLAY_PER_PIPE) &&
> +		    ((i > 0) && (pipes[i - 1].mode->hdisplay > MAX_HDISPLAY_PER_PIPE ||
> +			         pipes[i - 1].mode->clock > max_dotclock) &&

We can add a helper for the above condition, as it is used in couple of 
places, in this and the next patch:

With above fixed, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

>   		     ((!display->pipes[pipes[i - 1].idx + 1].enabled) ||
>   		      (abs(pipes[i].idx - pipes[i - 1].idx) <= 1)))) {
>   			igt_debug("Pipe/Output combo is not possible with selected mode(s).\n");
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 2b917925158..20a4ced9ad9 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -990,6 +990,7 @@ void igt_sort_connector_modes(drmModeConnector *connector,
>   
>   bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>   		igt_output_t *output, int bpc);
> +int igt_get_max_dotclock(int fd);
>   bool igt_check_bigjoiner_support(igt_display_t *display);
>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>   bool i915_pipe_output_combo_valid(igt_display_t *display);
