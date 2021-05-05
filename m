Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1CF89E50
 for <igt-dev@lists.freedesktop.org>; Wed,  5 May 2021 08:18:15 +0000 (UTC)
Date: Wed, 5 May 2021 11:19:31 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YJJVE5S1Y1kEMCD+@platvala-desk.ger.corp.intel.com>
References: <20210504070415.5057-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210504070415.5057-1-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_chamelium: Retry DP FSM on
 Failure
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 04, 2021 at 07:04:15AM +0000, Kunal Joshi wrote:
> We have a thread called chamelium_fsm_mon which monitors HPD events
> triggered by chamelium, Unfortunately not always the HPD event arrives
> in a fixed interval (mostly does), Quick fix to this is to retry.
> 
> v2: Remove redundant assert (Bhanu)
> 
> Fixes :- https://gitlab.freedesktop.org/drm/intel/-/issues/262
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Modem Bhanuprakash <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_chamelium.c | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 7085122a7..c385534c6 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -522,12 +522,32 @@ static xmlrpc_value *chamelium_rpc(struct chamelium *chamelium,
>  {
>  	xmlrpc_value *res;
>  	va_list va_args;
> +	int fsm_trials_left = 5;
>  
> -	va_start(va_args, format_str);
> -	res = __chamelium_rpc_va(chamelium, fsm_port, method_name,
> -				 format_str, va_args);
> -	va_end(va_args);
> +	if (strcmp(method_name, "CaptureVideo") == 0) {
> +
> +		while (fsm_trials_left) {
> +

Remove this extra empty line.

> +			va_start(va_args, format_str);
> +			res = __chamelium_rpc_va(chamelium, fsm_port,
> +						 method_name, format_str,
> +						 va_args);
> +			va_end(va_args);
>  
> +			if (!chamelium->env.fault_occurred)
> +				break;

Ok, I was wondering if you need to clear chamelium->env here but
__chamelium_rpc_va does that. Ok.

> +
> +			igt_debug("DP FSM failed retrying, tries left %d\n", fsm_trials_left);
> +			--fsm_trials_left;
> +		}
> +	} else {
> +

Another extra empty line.

With the extra empty lines removed this is

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


Is CaptureVideo really the only method that needs this retrying?
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
