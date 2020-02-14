Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC586E5B2
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2020 12:17:56 +0000 (UTC)
Date: Fri, 14 Feb 2020 14:17:53 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200214121753.GB25209@platvala-desk.ger.corp.intel.com>
References: <20200212132123.108506-1-arkadiusz.hiler@intel.com>
 <20200212132254.108770-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212132254.108770-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 6/9] lib/chamelium: Clear error after
 checking if chamelium is reachable
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Feb 12, 2020 at 03:22:54PM +0200, Arkadiusz Hiler wrote:
> Otherwise this may get us stuck in perpetual failure mode.
> 
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/igt_chamelium.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index aaf17d51..b347682d 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -361,11 +361,17 @@ static bool __chamelium_is_reachable(struct chamelium *chamelium)
>  	if (res != NULL)
>  		xmlrpc_DECREF(res);
>  
> -	if (chamelium->env.fault_occurred)
> +	if (chamelium->env.fault_occurred) {
>  		igt_debug("Chamelium RPC call failed: %s\n",
>  			  chamelium->env.fault_string);
>  
> -	return !chamelium->env.fault_occurred;
> +		xmlrpc_env_clean(&chamelium->env);
> +		xmlrpc_env_init(&chamelium->env);
> +
> +		return false;
> +	}
> +
> +	return true;
>  }
>  
>  void chamelium_wait_reachable(struct chamelium *chamelium, int timeout)
> -- 
> 2.24.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
