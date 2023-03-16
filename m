Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C32310EC9D
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 10:37:46 +0000 (UTC)
Date: Thu, 16 Mar 2023 12:37:38 +0200
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Message-ID: <ZBLxcjfx7RBYImws@intel.com>
References: <20220830135400.12642-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830135400.12642-1-mohammed.thasleem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_cdclk: Fixed mode
 selection for MST modeset
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

On Tue, Aug 30, 2022 at 07:24:00PM +0530, Mohammed Thasleem wrote:
> Added check on ENOSPC and EINVAL, when two monitors connected
> through MST. This will find the connector mode combo that
> fits into the bandwidth when more than one monitor is connected.
> 
> Example:
>   When two monitors connected through MST, the second monitor
>   also tries to use the same mode. So two such modes may not
>   fit into the link bandwidth. So, iterate through connected
>   outputs & modes and find a combination of modes those fit
>   into the link BW.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/i915/kms_cdclk.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
> index 991a7c507..04f39bea5 100644
> --- a/tests/i915/kms_cdclk.c
> +++ b/tests/i915/kms_cdclk.c
> @@ -313,7 +313,16 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>  		j++;
>  	}
>  
> +	/* In case of DP-MST find suitable mode(s) to fit into the link BW. */
> +	if ((igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL) != 0) &&
> +	    (errno == EINVAL || errno == ENOSPC)) {
> +		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
> +
> +		igt_require_f(found, "No valid mode combo found for MST modeset.\n");
> +	}
> +
>  	igt_display_commit2(display, COMMIT_ATOMIC);
> +

New line added on purpose?

Otherwise,
Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

>  	cdclk_new = get_current_cdclk_freq(debugfs_fd);
>  	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
>  
> -- 
> 2.25.1
> 
