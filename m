Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F9910E819
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 19:32:11 +0000 (UTC)
Date: Wed, 18 Jan 2023 20:32:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230118193206.rp7rrlx6u3adgei3@kamilkon-desk1>
References: <20230118160631.737700-1-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230118160631.737700-1-jonathan.cavitt@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_kmod: Allow some leeway in
 igt_kmod_unload_r
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: sandeep.kumar.parupalli@intel.com, jonathan.cavitt@intel.com,
 chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jonathan,

On 2023-01-18 at 08:06:31 -0800, Jonathan Cavitt wrote:
> kmod_module_remove_module occasionally returns EAGAIN for mei_gsc
> in the setup of some gem_lmem_swapping subtests.  Just because
> EAGAIN is returned doesn't mean the module is lost and unable to
> be unloaded.  Try again some number of times (currently 20) before
> giving up.
> 
> Retries will occur for -EBUSY and -EAGAIN, as these imply the
> system is waiting for the target module can simply be waited for.
> All other errors exit immediately, but as the context for each
> error informs their relative severity, no warnings will be issued.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Stuart Summers <stuart.summers@intel.com>
> CC: Sandeep Kumar Parupalli <sandeep.kumar.parupalli@intel.com>
> CC: Chris Wilson <chris.p.wilson@linux.intel.com>
> Reviewed-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> ---
>  lib/igt_kmod.c | 35 ++++++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 17090110c..4aa5320d0 100644
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
>  		igt_debug("%s still initializing\n", mod_name);
>  		err = igt_wait(!igt_kmod_is_loading(kmod), 10000, 100);
>  		if (err < 0) {
> @@ -279,7 +281,34 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
>  		}
>  	}
>  
> -	return kmod_module_remove_module(kmod, flags);
> +	for (tries = 0; tries < MAX_TRIES; tries++) {
> +		err = kmod_module_remove_module(kmod, flags);
> +
> +		/* Only loop in the following cases */
> +		if (err != -EBUSY && err != -EAGAIN)
> +			break;
> +
> +		igt_debug("Module %s failed to unload with err: %d on attempt: %i\n",
> +			  mod_name, err, tries + 1);
> +
> +		if (MAX_TRIES - tries - 1)
------------------ ^
This should be tries < MAX_TRIES - 1

> +			usleep(SLEEP_DURATION);
> +	}
> +
> +	if (err == -ENOENT)
> +		igt_debug("Module %s could not be found or does not exist. err: %d\n",
> +			  mod_name, err);
> +	else if (err == -ENOTSUP)
> +		igt_debug("Module %s cannot be unloaded. err: %d\n",
> +			  mod_name, err);
> +	else if (err)
> +		igt_debug("Module %s failed to unload with err: %d after ~%.1fms\n",
> +			  mod_name, err, SLEEP_DURATION*tries/1000.);
> +	else if (tries)
> +		igt_debug("Module %s unload took ~%.1fms over %i attempts\n",
> +			  mod_name, SLEEP_DURATION*tries/1000., tries + 1);

What about one final else with igt_debug about success at first try ?

Regards,
Kamil

> +
> +	return err;
>  }
>  
>  /**
> -- 
> 2.25.1
> 
