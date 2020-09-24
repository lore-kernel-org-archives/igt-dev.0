Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D207C6E1E9
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2020 13:25:28 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c18so3784467wrm.9
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2020 06:25:28 -0700 (PDT)
References: <20200924123625.31755-1-petri.latvala@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <81475469-c5de-7c55-cee5-f33a96ba00ef@gmail.com>
Date: Thu, 24 Sep 2020 16:25:17 +0300
MIME-Version: 1.0
In-Reply-To: <20200924123625.31755-1-petri.latvala@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t RFC] lib/igt_chamelium: Use curl timeout
 for xmlrpc calls
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

I guess CI isn't going to run this code anywhere for now? The change 
look ok to me. Assuming the results will be all green,

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>


On 24.9.2020 15.36, Petri Latvala wrote:
> Use of timeouts everywhere is meaningless if xmlrpc calls are allowed
> to be blocking forever.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/igt_chamelium.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index d9fab902..eac893a6 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -2427,11 +2427,21 @@ void chamelium_deinit_rpc_only(struct chamelium *chamelium)
>   struct chamelium *chamelium_init_rpc_only(void)
>   {
>   	struct chamelium *chamelium = malloc(sizeof(struct chamelium));
> +	struct xmlrpc_clientparms clientparms;
> +	struct xmlrpc_curl_xportparms curlparms;
>   
>   	if (!chamelium)
>   		return NULL;
>   
>   	memset(chamelium, 0, sizeof(*chamelium));
> +	memset(&clientparms, 0, sizeof(clientparms));
> +	memset(&curlparms, 0, sizeof(curlparms));
> +
> +	curlparms.timeout = _RECEIVER_RESPONSIVE_AFTER_RESET_SECONDS;
> +
> +	clientparms.transport = "curl";
> +	clientparms.transportparmsP = &curlparms;
> +	clientparms.transportparm_size = XMLRPC_CXPSIZE(timeout);
>   
>   	chamelium->drm_fd = -1;
>   
> @@ -2439,7 +2449,7 @@ struct chamelium *chamelium_init_rpc_only(void)
>   	xmlrpc_env_init(&chamelium->env);
>   	xmlrpc_client_setup_global_const(&chamelium->env);
>   	xmlrpc_client_create(&chamelium->env, XMLRPC_CLIENT_NO_FLAGS, PACKAGE,
> -			     PACKAGE_VERSION, NULL, 0, &chamelium->client);
> +			     PACKAGE_VERSION, &clientparms, 0, &chamelium->client);
>   	if (chamelium->env.fault_occurred) {
>   		igt_debug("Failed to init xmlrpc: %s\n",
>   			  chamelium->env.fault_string);
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
