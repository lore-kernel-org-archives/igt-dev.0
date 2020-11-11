Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7358789E52
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2020 07:52:19 +0000 (UTC)
Date: Wed, 11 Nov 2020 09:52:10 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201111075210.GA7444@platvala-desk.ger.corp.intel.com>
References: <20201109151658.387207-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201109151658.387207-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Handle chamelium failures
 gracefully
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 09, 2020 at 03:16:58PM +0000, Chris Wilson wrote:
> Don't cause CI to abort a run if an _unrelated_ fixture checks for a
> display and chamelium is dead.

If there's a chamelium configured and it's dead, we do want to abort
though.

What's an unrelated fixture in this context?


-- 
Petri Latvala



> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  lib/igt_kms.c | 54 +++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 37 insertions(+), 17 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e5d8e82c9..65b36c338 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1922,6 +1922,40 @@ __get_crtc_mask_for_pipe(drmModeRes *resources, igt_pipe_t *pipe)
>  	return (1 << offset);
>  }
>  
> +static bool chamelium_ok(int drm_fd)
> +{
> +	bool ok = true;
> +#ifdef HAVE_CHAMELIUM
> +	struct chamelium *chamelium;
> +
> +	chamelium = chamelium_init_rpc_only();
> +	if (chamelium) {
> +		ok = false;
> +
> +		if (!chamelium_wait_reachable(chamelium, 20)) {
> +			igt_debug("cannot reach the configured chamelium!\n");
> +			goto out;
> +		}
> +
> +		if (!chamelium_plug_all(chamelium)) {
> +			igt_debug("failed to plug all the chamelium ports!\n");
> +			goto out;
> +		}
> +
> +		if (!chamelium_wait_all_configured_ports_connected(chamelium, drm_fd)) {
> +			igt_debug("not all configured chamelium ports are connected!\n");
> +			goto out;
> +		}
> +
> +		ok = true;
> +out:
> +		chamelium_deinit_rpc_only(chamelium);
> +	}
> +#endif
> +
> +	return ok;
> +}
> +
>  /**
>   * igt_display_require:
>   * @display: a pointer to an #igt_display_t structure
> @@ -1944,6 +1978,9 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  
>  	LOG_INDENT(display, "init");
>  
> +	if (!chamelium_ok(drm_fd))
> +		goto out;
> +
>  	display->drm_fd = drm_fd;
>  	is_i915_dev = is_i915_device(drm_fd);
>  
> @@ -1953,23 +1990,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  	if (!resources)
>  		goto out;
>  
> -#ifdef HAVE_CHAMELIUM
> -	{
> -		struct chamelium *chamelium;
> -
> -		chamelium = chamelium_init_rpc_only();
> -		if (chamelium) {
> -			igt_abort_on_f(!chamelium_wait_reachable(chamelium, 20),
> -				       "cannot reach the configured chamelium!\n");
> -			igt_abort_on_f(!chamelium_plug_all(chamelium),
> -				       "failed to plug all the chamelium ports!\n");
> -			igt_abort_on_f(!chamelium_wait_all_configured_ports_connected(chamelium, drm_fd),
> -				       "not all configured chamelium ports are connected!\n");
> -			chamelium_deinit_rpc_only(chamelium);
> -		}
> -	}
> -#endif
> -
>  	/*
>  	 * With non-contiguous pipes display, crtc mapping is not always same
>  	 * as pipe mapping, In i915 pipe is enum id of i915's crtc object.
> -- 
> 2.29.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
