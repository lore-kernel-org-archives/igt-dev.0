Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D470210E32B
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Sep 2022 08:55:41 +0000 (UTC)
Date: Mon, 12 Sep 2022 11:54:57 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <Yx7z4RVPAyRzniI6@platvala-desk.ger.corp.intel.com>
References: <20220909140331.1041095-1-bhanuprakash.modem@intel.com>
 <20220909140331.1041095-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909140331.1041095-2-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t V3 01/52] lib/igt_kms: Add a helper for valid
 pipe/output constraint
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 09, 2022 at 07:32:40PM +0530, Bhanuprakash Modem wrote:
> Add an IGT helper to check the given pipe/output combo is valid to decide
> whether to run/skip the subtest.
> 
> Example:
> * Pipe-D can't support mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free.
> * MSO is supported only on PIPE_A/PIPE_B.
> 
> This helper is supposed to be a superset of all constraints of pipe/output
> combo. But as of now, this helper supports only Bigjoiner.
> 
> V2:
> - Rename the helper
> - Add is_i915 constraint
> - Add pre-condition check (igt_output_set_pipe called)
> - Update documentaion
> - Minor cleanup in Bigjoiner helper
> 
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/igt_kms.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
>  lib/igt_kms.h |  1 +
>  2 files changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 7d4916a7..724ef11b 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5743,6 +5743,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>  {
>  	uint8_t i, total_pipes = 0, pipes_in_use = 0;
>  	enum pipe p;
> +	igt_output_t *output;
>  	struct {
>  		enum pipe idx;
>  		drmModeModeInfo *mode;
> @@ -5756,9 +5757,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>  	 * Get list of pipes in use those were set by igt_output_set_pipe()
>  	 * just before calling this function.
>  	 */
> -	for (i = 0 ; i < display->n_outputs; i++) {
> -		igt_output_t *output = &display->outputs[i];
> -
> +	for_each_connected_output(display, output) {
>  		if (output->pending_pipe == PIPE_NONE)
>  			continue;
> 
> @@ -5824,3 +5823,47 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
> 
>  	return true;
>  }
> +
> +/*
> + * i915_pipe_output_combo_valid:
> + * @display: a pointer to an #igt_display_t structure
> + *
> + * Every individual test must use igt_output_set_pipe() before calling this
> + * helper, so that this function will get all active pipes from connected
> + * outputs (i.e. pending_pipe != PIPE_NONE) and check the selected combo is
> + * valid or not.
> + *
> + * This helper is supposed to be a superset of all constraints of pipe/output
> + * combo.
> + *
> + * Example:
> + *  * Pipe-D can't support mode > 5K
> + *  * To use 8K mode on a pipe then consecutive pipe must be free.
> + *  * MSO is supported only on PIPE_A/PIPE_B.
> + *
> + * Returns: true if a valid pipe/output mode combo found, else false
> + */
> +bool i915_pipe_output_combo_valid(igt_display_t *display)
> +{
> +	int combo = 0;
> +	igt_output_t *output;
> +
> +	if (!is_i915_device(display->drm_fd))
> +		return true;
> +
> +	for_each_connected_output(display, output) {
> +		if (output->pending_pipe == PIPE_NONE)
> +			continue;
> +
> +		combo++;
> +	}
> +
> +	igt_assert_f(combo, "At least one pipe/output combo needed.\n");
> +
> +	/*
> +	 * Check the given pipe/output combo is valid for Bigjoiner.
> +	 *
> +	 * TODO: Update this helper to support other features like MSO.
> +	 */
> +	return igt_check_bigjoiner_support(display);
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index a2cf0937..4db33979 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -975,5 +975,6 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>  		igt_output_t *output, int bpc);
>  bool igt_check_bigjoiner_support(igt_display_t *display);
>  bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
> +bool i915_pipe_output_combo_valid(igt_display_t *display);
> 
>  #endif /* __IGT_KMS_H__ */
> --
> 2.35.1
> 
