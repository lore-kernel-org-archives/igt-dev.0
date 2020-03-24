Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994CF6E105
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2020 09:12:41 +0000 (UTC)
Date: Tue, 24 Mar 2020 11:12:38 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200324091238.GY9497@platvala-desk.ger.corp.intel.com>
References: <20200324083848.1023708-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200324083848.1023708-1-arkadiusz.hiler@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] chamelium: Retry XMLRPC call when
 chamelond fails talking with a receiver
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
Cc: igt-dev@lists.freedesktop.org, Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 10:38:48AM +0200, Arkadiusz Hiler wrote:
> All the I2C errors we get from chameleond happen when it is talking the
> receiver and seem to have nothing to do with the HDMI/DisplayPort
> upstream.
> 
> Let's try reaching the receiver 3 times before we give up and settle on
> an error.
> 
> Fixes: https://gitlab.freedesktop.org/drm/intel/issues/217
> Issue: https://bugs.chromium.org/p/chromium/issues/detail?id=993738
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>


Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  lib/igt_chamelium.c | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index f98f6746..7d8f057d 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -280,12 +280,6 @@ static xmlrpc_value *__chamelium_rpc_va(struct chamelium *chamelium,
>  	struct fsm_monitor_args monitor_args;
>  	pthread_t fsm_thread_id;
>  
> -	/* Cleanup the last error, if any */
> -	if (chamelium->env.fault_occurred) {
> -		xmlrpc_env_clean(&chamelium->env);
> -		xmlrpc_env_init(&chamelium->env);
> -	}
> -
>  	/* Unfortunately xmlrpc_client's event loop helpers are rather useless
>  	 * for implementing any sort of event loop, since they provide no way
>  	 * to poll for events other then the RPC response. This means in order
> @@ -300,9 +294,25 @@ static xmlrpc_value *__chamelium_rpc_va(struct chamelium *chamelium,
>  			       &monitor_args);
>  	}
>  
> -	xmlrpc_client_call2f_va(&chamelium->env, chamelium->client,
> -				chamelium->url, method_name, format_str, &res,
> -				va_args);
> +	for (int retries = 3; retries > 0; retries--) {
> +		/* Cleanup the last error, if any */
> +		if (chamelium->env.fault_occurred) {
> +			xmlrpc_env_clean(&chamelium->env);
> +			xmlrpc_env_init(&chamelium->env);
> +		}
> +
> +		xmlrpc_client_call2f_va(&chamelium->env, chamelium->client,
> +					chamelium->url, method_name, format_str, &res,
> +					va_args);
> +
> +		if (!chamelium->env.fault_occurred)
> +			break;
> +
> +		if (NULL == strstr(chamelium->env.fault_string, "I2C"))
> +			break;
> +
> +		/* i2c error, let's try to retry */
> +	}
>  
>  	if (fsm_port) {
>  		pthread_cancel(fsm_thread_id);
> -- 
> 2.24.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
