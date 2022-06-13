Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963AD10E08D
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jun 2022 09:02:07 +0000 (UTC)
Message-ID: <7a60eeeb-3847-b05f-d1bb-003798449269@intel.com>
Date: Mon, 13 Jun 2022 14:31:53 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220608072158.4049142-1-bhanuprakash.modem@intel.com>
 <20220610100847.4097244-1-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220610100847.4097244-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V3] lib/igt_kms: Add a helper function to check
 Bigjoiner support
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

On 6/10/2022 3:38 PM, Bhanuprakash Modem wrote:
> Create a helper function to check that the system supports the
> given crtc/connector mode(s).
>
> Example:
> * Pipe-D won't support Bigjoiner, hence we can't use the connector
>    modes greater than 5K on Pipe-D
> * To use 8K mode on a pipe, then the consecutive pipe must be free.
>
> The Kernel is expected to reject the invalid combo (which must be
> validated as a scenario separately). So, this helper function checks
> the validity of the combo to avoid failures.
>
> To use this helper, each individual subtest needs to set the @pipe
> to a specific @output by igt_output_set_pipe() and call this helper
> to check the validity of the combo.
>
> V2:
> * Rebase
> * Add support to handle fused pipes
> V3:
> * Reject the bigjoiner if the consecutive pipe is not available
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   lib/igt_kms.c | 73 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  3 +++
>   2 files changed, 76 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 36dfcfcb..bd606548 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5636,3 +5636,76 @@ bool igt_check_output_bpc_equal(int drmfd, enum pipe pipe,
>   
>   	return (current == bpc);
>   }
> +
> +/*
> + * igt_check_bigjoiner_support:
> + * @display: a pointer to an #igt_display_t structure
> + *
> + * Get all active pipes from connected outputs (i.e. pending_pipe != PIPE_NONE)
> + * and check those pipes supports the selected mode(s).
> + *
> + * Example:
> + *  * Pipe-D can't support mode > 5K
> + *  * To use 8K mode on a pipe then consecutive pipe must be free.
> + *
> + * Returns: true if a valid crtc/connector mode combo found, else false
> + */
> +bool igt_check_bigjoiner_support(igt_display_t *display)
> +{
> +	uint8_t i, total_pipes = 0, pipes_in_use = 0;
> +	enum pipe p;
> +	struct {
> +		enum pipe idx;
> +		drmModeModeInfo *mode;
> +	} pipes[IGT_MAX_PIPES];
> +
> +	/* Get total enabled pipes. */
> +	for_each_pipe(display, p)
> +		total_pipes++;
> +
> +	/*
> +	 * Get list of pipes in use those were set by igt_output_set_pipe()
> +	 * just before calling this function.
> +	 */
> +	for (i = 0 ; i < display->n_outputs; i++) {
> +		igt_output_t *output = &display->outputs[i];
> +
> +		if (output->pending_pipe == PIPE_NONE)
> +			continue;
> +
> +		pipes[pipes_in_use].idx = output->pending_pipe;
> +		pipes[pipes_in_use].mode = igt_output_get_mode(output);
> +		pipes_in_use++;
> +	}
> +
> +	if (!pipes_in_use) {
> +		igt_debug("We must set at least one output to pipe.\n");
> +		return true;
> +	}
> +
> +	/*
> +	 * if mode.hdisplay > 5120, then ignore
> +	 *  - if the consecutive pipe is not available
> +	 *  - last crtc in single/multi-connector config
> +	 *  - consecutive crtcs in multi-connector config
> +	 *
> +	 * in multi-connector config ignore if
> +	 *  - previous crtc mode.hdisplay > 5120 and
> +	 *  - current & previous crtcs are consecutive
> +	 */
> +	for (i = 0; i < pipes_in_use; i++) {
> +		if (((pipes[i].mode->hdisplay > MAX_HDISPLAY_PER_PIPE) &&
> +		     ((pipes[i].idx >= (total_pipes - 1)) ||
> +		      (!display->pipes[pipes[i].idx + 1].enabled) ||
> +		      ((i < (pipes_in_use - 1)) && (abs(pipes[i + 1].idx - pipes[i].idx) <= 1)))) ||
> +		    ((i > 0) && (pipes[i - 1].mode->hdisplay > MAX_HDISPLAY_PER_PIPE) &&
> +		     ((!display->pipes[pipes[i - 1].idx + 1].enabled) ||
> +		      (abs(pipes[i].idx - pipes[i - 1].idx) <= 1)))) {
> +			igt_debug("Pipe/Output combo is not possible with selected mode(s).\n");
> +
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 0f12d825..3e674e74 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -109,6 +109,7 @@ const char *kmstest_connector_status_str(int status);
>   const char *kmstest_connector_type_str(int type);
>   
>   void kmstest_dump_mode(drmModeModeInfo *mode);
> +#define MAX_HDISPLAY_PER_PIPE 5120
>   
>   int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id);
>   void kmstest_set_vt_graphics_mode(void);
> @@ -967,4 +968,6 @@ int sort_drm_modes_by_res_asc(const void *a, const void *b);
>   void igt_sort_connector_modes(drmModeConnector *connector,
>   		int (*comparator)(const void *, const void*));
>   
> +bool igt_check_bigjoiner_support(igt_display_t *display);
> +
>   #endif /* __IGT_KMS_H__ */

