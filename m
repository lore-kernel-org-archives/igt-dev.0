Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB4B10E22E
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Nov 2022 10:45:31 +0000 (UTC)
Date: Fri, 18 Nov 2022 11:45:26 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y3diRurGtb79zJnJ@kamilkon-desk1>
References: <20221117194639.481656-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221117194639.481656-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH] Cv3 Workaround: Skip Plug all at init.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, khaled.almahallawy@intel.com, vsuley@google.com,
 markyacoub@google.com, kalin@google.com, seanpaul@chromium.org, ihf@google.com,
 matthewtlam@google.com, petri.latvala@intel.com, amstan@chromium.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mark,

On 2022-11-17 at 14:46:39 -0500, Mark Yacoub wrote:

Few nits for subject line:
[PATCH] Cv3 Workaround: Skip Plug all at init.
----------- ^ --------- ^ -- ^ ------------- ^
Generally do not use upper case in subject (with exceptions to
some propoer names like GPU, CPU etc) and do not end it with
dot, so better:

[PATCH] Cv3 workaround: skip plug all at init

> [Why]
> Currently, Cv3 doesn't allow all ports to be plugged in at the same time
> so chamelium_plug_all() always fails.
> 
> [How]
> Check for the first Port ID as it's unique between V2 and V3, and skip
> the plugging if it's V3.
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  lib/igt_chamelium.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 68864bb8..6c52ac3b 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -3015,10 +3015,19 @@ bool chamelium_plug_all(struct chamelium *chamelium)
>  	int port_ids[CHAMELIUM_MAX_PORTS];
>  	xmlrpc_value *v;
>  
> +	igt_debug("CHAMELIUM PLUG ALL\n");
------------------ ^
Don't use upper-case, so
s/CHAMELIUM PLUG ALL/Chamelium plug all/

> +
>  	port_count = chamelium_get_video_ports(chamelium, port_ids);
> +	igt_debug("CHAMELIUM PLUG ALL: %zu ports\n", port_count);
------------------ ^
Same here.

>  	if (port_count <= 0)
>  		return false;
>  
> +	/* A temporary workaround for Chamelium V3: Currently, Cv3 doesn't allow
> +	 * all ports to be plugged in at the same time. Cv3 first port has an ID
> +	 * of 0 while Cv2 has first port ID as 1. */
> +	if (port_ids[0] == 0)

If you put debugs elsewhere, maybe also put it here ?
This looks like you will not test any plugged port on Cv3 ?
Do you have separate test iterate on ports ?
Do you want to test anything here for Cv3 if port_count == 1 ?

Regards,
Kamil

> +		return true;
> +
>  	for (int i = 0; i < port_count; ++i) {
>  		v = __chamelium_rpc(chamelium, NULL, "Plug", "(i)", port_ids[i]);
>  
> @@ -3053,6 +3062,7 @@ bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium,
>  	for (int i = 0; group_list[i] != NULL; i++) {
>  		char *map_name;
>  		group = group_list[i];
> +		igt_debug("Checking group %s", group);
>  
>  		if (!strstr(group, "Chamelium:"))
>  			continue;
> @@ -3060,6 +3070,7 @@ bool chamelium_wait_all_configured_ports_connected(struct chamelium *chamelium,
>  		igt_assert(chamelium->port_count <= CHAMELIUM_MAX_PORTS);
>  
>  		map_name = group + (sizeof("Chamelium:") - 1);
> +		igt_debug("Checking map %s", map_name);
>  
>  		for (int j = 0;
>  		     j < res->count_connectors;
> -- 
> 2.38.1.584.g0f3c55d4c2-goog
> 
