Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3216E122
 for <igt-dev@lists.freedesktop.org>; Wed,  5 May 2021 11:04:30 +0000 (UTC)
References: <20210504004313.28804-1-bhanuprakash.modem@intel.com>
 <20210504004313.28804-2-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <b18f786c-b81c-ee6e-e497-c9b9ad319a96@intel.com>
Date: Wed, 5 May 2021 16:34:15 +0530
MIME-Version: 1.0
In-Reply-To: <20210504004313.28804-2-bhanuprakash.modem@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [v4 i-g-t 01/14] lib/igt_kms: helper to override the
 mode on all connectors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On 5/4/2021 6:13 AM, Bhanuprakash Modem wrote:
> This helper will iterate through all connectors those have a
> pending_pipe != PIPE_NONE set by the test upto the point of
> calling this helper. And find the combination by using
> ATOMIC_TEST_ONLY then return to the test.
>
> This helper would override the mode on all connectors that will
> be modeset by the next igt_display_commit() call in the test.
>
> V2:
> * Remove MST specific logic (Daniel)
> V3:
> * Sort connector modes in descending order
> V4:
> * Fine tune the logic to reduce #of interations (Ankit)
> * Update the documentation (Ankit)
>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   lib/igt_kms.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 73 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 47b829b0c..d604c1b38 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -4048,6 +4048,78 @@ void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
>   	}
>   }
>   
> +#define for_each_connector_mode(output)		\
> +	for (int i__ = 0;  i__ < output->config.connector->count_modes; i__++)
> +
> +static int sort_drm_modes(const void *a, const void *b)
> +{
> +	const drmModeModeInfo *mode1 = a, *mode2 = b;
> +
> +	return (mode1->clock < mode2->clock) - (mode2->clock < mode1->clock);
> +}
> +
> +static
> +bool __override_all_active_output_modes_to_fit_link_bw(igt_display_t *display,
> +							igt_output_t *outputs[IGT_MAX_PIPES],
> +							const int n_outputs,
> +							int base)
> +{
> +	igt_output_t *output = NULL;
> +
> +	if (base >= n_outputs)
> +		return false;
> +
> +	output = outputs[base];
> +
> +	for_each_connector_mode(output) {
> +		igt_output_override_mode(output, &output->config.connector->modes[i__]);
> +
> +		if (__override_all_active_output_modes_to_fit_link_bw(display, outputs, n_outputs, base + 1))
> +			return true;
> +
> +		if (igt_display_try_commit_atomic(display,
> +				DRM_MODE_ATOMIC_TEST_ONLY |
> +				DRM_MODE_ATOMIC_ALLOW_MODESET,
> +				NULL) == 0)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +/**
> + * igt_override_all_active_output_modes_to_fit_link_bw:
> + * @display: a pointer to an #igt_display_t structure
> + *
> + * Override the mode on all active outputs (i.e. pending_pipe != PIPE_NONE)
> + * on basis of bandwidth.
> + *
> + * Returns: true if a valid connector mode combo found, else false
> + */
> +bool igt_override_all_active_output_modes_to_fit_link_bw(igt_display_t *display)
> +{
> +	int i, n_outputs = 0;
> +	igt_output_t *outputs[IGT_MAX_PIPES];
> +
> +	for (i = 0 ; i < display->n_outputs; i++) {
> +		igt_output_t *output = &display->outputs[i];
> +
> +		if (output->pending_pipe == PIPE_NONE)
> +			continue;
> +
> +		/* Sort the modes in descending order by clock freq. */
> +		qsort(output->config.connector->modes,
> +		      output->config.connector->count_modes,
> +		      sizeof(drmModeModeInfo),
> +		      sort_drm_modes);
> +
> +		outputs[n_outputs++] = output;
> +	}
> +	igt_require_f(n_outputs, "No active outputs found.\n");
> +
> +	return __override_all_active_output_modes_to_fit_link_bw(display, outputs, n_outputs, 0);
> +}
> +
>   /*
>    * igt_pipe_refresh:
>    * @display: a pointer to an #igt_display_t structure
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 85f0769c9..95463b1c5 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -915,5 +915,6 @@ void igt_require_pipe(igt_display_t *display,
>   
>   void igt_dump_connectors_fd(int drmfd);
>   void igt_dump_crtcs_fd(int drmfd);
> +bool igt_override_all_active_output_modes_to_fit_link_bw(igt_display_t *display);
>   
>   #endif /* __IGT_KMS_H__ */
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
