Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA7E9FCD5
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 09:51:00 +0000 (UTC)
Date: Mon, 15 Aug 2022 12:49:52 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <YvoWwFdTQMmzoBSk@platvala-desk.ger.corp.intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
 <20220814180908.2553394-2-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220814180908.2553394-2-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 01/51] lib/igt_kms: Add a helper for igt test
 constraint
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

On Sun, Aug 14, 2022 at 11:38:18PM +0530, Bhanuprakash Modem wrote:
> This patch will create a helper with super set of all test constraints.
> 
> Example:
> * Pipe-D can't support mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free.
> * MSO is supported only on PIPE_A/PIPE_B.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.c | 22 ++++++++++++++++++++++
>  lib/igt_kms.h |  1 +
>  2 files changed, 23 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 1ba3bd2a..e1a65244 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5803,3 +5803,25 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode)
>  
>  	return true;
>  }
> +
> +/*
> + * igt_test_constraint:
> + * @display: a pointer to an #igt_display_t structure
> + *
> + * Get all active pipes from connected outputs (i.e. pending_pipe != PIPE_NONE)
> + * and check those pipes supports the selected mode(s).
> + *
> + * This is a super set of all test constraints.
> + *
> + * Example:
> + *  * Pipe-D can't support mode > 5K
> + *  * To use 8K mode on a pipe then consecutive pipe must be free.
> + *  * MSO is supported only on PIPE_A/PIPE_B.
> + *
> + * Returns: true if a valid crtc/connector mode combo found, else false

"all test constraints" sounds very broad, with very implied
specifics. Please write the specifics so potential users can easily
see if they need to call this function or not. Is this meant to be for
all kms testing, or just for bigjoiner-related hardware limitations?

Speaking of hardware limitations, this sounds very intel-specific but
the documentation (or the code) doesn't specify. Same comment goes for
the function igt_check_bigjoiner_support, even though that's already
merged.


-- 
Petri Latvala



> + */
> +bool igt_test_constraint(igt_display_t *display)
> +{
> +	/* TODO: Add all possible test constraints here. */
> +	return igt_check_bigjoiner_support(display);
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index a2cf0937..82186cfe 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -975,5 +975,6 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
>  		igt_output_t *output, int bpc);
>  bool igt_check_bigjoiner_support(igt_display_t *display);
>  bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
> +bool igt_test_constraint(igt_display_t *display);
>  
>  #endif /* __IGT_KMS_H__ */
> -- 
> 2.35.1
> 
