Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D367B6E8B2
 for <igt-dev@lists.freedesktop.org>; Mon,  3 May 2021 13:31:34 +0000 (UTC)
References: <20210426182136.2815-1-bhanuprakash.modem@intel.com>
 <20210426182136.2815-2-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <64fc56cb-972f-f80d-5295-5bcb825ce212@intel.com>
Date: Mon, 3 May 2021 19:01:22 +0530
MIME-Version: 1.0
In-Reply-To: <20210426182136.2815-2-bhanuprakash.modem@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [v3 i-g-t 01/14] lib/igt_kms: helper to override the
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

Hi Bhanu,

I agree with overall approach. I have few comments given inline:

On 4/26/2021 11:51 PM, Bhanuprakash Modem wrote:
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
>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   lib/igt_kms.c | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 56 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 08d429a81..7aea8098c 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3841,6 +3841,61 @@ void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
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
> +bool __override_all_active_output_modes_to_fit_link_bw(igt_display_t *display, int base)
> +{

Just a suggestion:

This can be made efficient, if before calling this function we make an 
array of outputs with pipe set and then we can iterate over only 
required outputs.

Otherwise we would have lot of unnecessary comparisons.

If we have a scenario : say two outputs output[0] and output[1] are 
required out of say 6 outputs, with their mode[0] and say mode[3] 
respectively that would actually work.

After failure of the combo output[0]>mode[0] and output[1]>mode[0] we 
would again check for output[2] to output[5].

This will again be the case with other combos, till we reach 
output[0]>mode[0] and output[1]>mode[3].

The problem will be compounded if we try to use this for 3x or 4x.


> +	for ( ; base < display->n_outputs; base++) {
> +		igt_output_t *output = &display->outputs[base];
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
> +		for_each_connector_mode(output) {
> +			igt_output_override_mode(output, &output->config.connector->modes[i__]);
> +
> +			if (__override_all_active_output_modes_to_fit_link_bw(display, base + 1))
> +				return true;
> +
> +			if (igt_display_try_commit_atomic(display,
> +					DRM_MODE_ATOMIC_TEST_ONLY |
> +					DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					NULL) == 0)
> +				return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +/**
> + * override_all_active_output_modes_to_fit_link_bw:

Add prefix igt_ as per convention for all igt helper functions.

> + * @display: a pointer to an #igt_display_t structure
> + *
> + * Override the mode on all connectors those are sharing the link bw

This needs update as this is not only for connectors that share link b/w.

Also it would be good to mention that all active outputs means outputs 
whose pipe is set (i.e. 'pending_pipe' is not PIPE_NONE')


Regards,

Ankit

> + *
> + * Returns: true if a valid connector mode combo found, else false
> + */
> +bool override_all_active_output_modes_to_fit_link_bw(igt_display_t *display)
> +{
> +	return __override_all_active_output_modes_to_fit_link_bw(display, 0);
> +}
> +
>   /*
>    * igt_pipe_refresh:
>    * @display: a pointer to an #igt_display_t structure
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 09b10b3e0..518dfffba 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -892,5 +892,6 @@ void igt_require_pipe(igt_display_t *display,
>   
>   void igt_dump_connectors_fd(int drmfd);
>   void igt_dump_crtcs_fd(int drmfd);
> +bool override_all_active_output_modes_to_fit_link_bw(igt_display_t *display);
>   
>   #endif /* __IGT_KMS_H__ */
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
