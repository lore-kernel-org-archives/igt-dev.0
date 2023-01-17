Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0643410E580
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 16:07:07 +0000 (UTC)
Date: Tue, 17 Jan 2023 17:06:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230117160630.rwfqgh2nclrjgwlf@kamilkon-desk1>
References: <20230109192536.3395428-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230109192536.3395428-1-jonathan.cavitt@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_kmod: Allow some leeway in
 igt_kmod_unload_r
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jonathan,

On 2023-01-09 at 11:25:36 -0800, Jonathan Cavitt wrote:
> kmod_module_remove_module occasionally returns EAGAIN for mei_gsc
> in the setup of some gem_lmem_swapping subtests.  Just because
> EAGAIN is returned doesn't mean the module is lost and unable to
> be unloaded.  Try again some number of times (currently 10) before
> giving up.
> 
> Retries will occur for -EBUSY and -EAGAIN, as these imply the
> system is waiting for the target module can simply be waited for.
> All other errors exit immediately, but as the context for each
> error informs their relative severity, no warnings will be issued.
> 
> References: VLK-30287, VLK-39629
- ^ --------- ^
Please remove any refs not reachable from internet.

> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Stuart Summers <stuart.summers@intel.com>
> CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
> CC: Chris Wilson <chris.p.wilson@linux.intel.com>
> Reviewed-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> ---
>  lib/igt_kmod.c | 41 ++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 17090110c..c840f9a17 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -253,8 +253,11 @@ out:
>  
>  static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
>  {
> +#define MAX_TRIES	20
> +#define SLEEP_DURATION	500000
>  	struct kmod_list *holders, *pos;
> -	int err = 0;
> +	int err, tries;
> +	const char *mod_name = kmod_module_get_name(kmod);
>  
>  	holders = kmod_module_get_holders(kmod);
>  	kmod_list_foreach(pos, holders) {
> @@ -269,7 +272,6 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
>  		return err;
>  
>  	if (igt_kmod_is_loading(kmod)) {
> -		const char *mod_name = kmod_module_get_name(kmod);

Please describe this change, it looks unrelated.

>  		igt_debug("%s still initializing\n", mod_name);
>  		err = igt_wait(!igt_kmod_is_loading(kmod), 10000, 100);
>  		if (err < 0) {
> @@ -279,7 +281,40 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
>  		}
>  	}
>  
> -	return kmod_module_remove_module(kmod, flags);
> +	for (tries = 0; tries < MAX_TRIES; tries++) {
> +		bool loop = false;
> +
> +		err = kmod_module_remove_module(kmod, flags);
> +
> +		/* Only loop in the following cases */
> +		switch (err) {
> +		case -EBUSY:
> +		case -EAGAIN:
> +			/* Waiting for module to be available */
> +			loop = true;
> +			break;
> +		default:
> +			break;
> +                }
> +		if (!loop)
> +			break;

May you turn switch into if() ? Now it looks convoluted.

> +
> +		igt_debug("Module %s failed to unload with err: %d on attempt: %i\n",
> +			  mod_name, err, tries + 1);
> +
> +		usleep(SLEEP_DURATION);
> +	}
> +
> +	if (err == -ENOENT)
> +		igt_debug("Module %s could not be found.  Skipping.\n", mod_name);
------------------------------------------------------- ^^^^^^^^^^
Please remove /  Skipping./, you print debugs and you will not
decide what caller will do.

One more error would be if driver is compiled in, so it
just can not be removed (will it be -ENOTSUP ?).

> +	else if (err)
> +		igt_info("Module %s failed to unload with err: %d after ~%.1fms\n",
--------------- ^
Please make them all into igt_info or igt_debug.

> +			 mod_name, err, SLEEP_DURATION*tries/1000.);
> +	else if (tries)
> +		igt_info("Module %s unload took ~%.1fms over %i attempts\n",
--------------- ^
Same here, please be consistent.

Regards,
Kamil

> +			 mod_name, SLEEP_DURATION*tries/1000., tries + 1);
> +
> +	return err;
>  }
>  
>  /**
> -- 
> 2.25.1
> 
