Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8157788D18
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Nov 2022 08:19:12 +0000 (UTC)
Date: Tue, 22 Nov 2022 09:18:51 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y3yF61JmDxBS7OQi@kamilkon-desk1>
References: <20221117194639.481656-1-markyacoub@chromium.org>
 <20221118163545.671778-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221118163545.671778-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH v2] Cv3 workaround: skip plug all at init
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-11-18 at 11:35:45 -0500, Mark Yacoub wrote:
> [Why]
> Currently, Cv3 doesn't allow all ports to be plugged in at the same time
> so chamelium_plug_all() always fails.
> 
> [How]
> Check for the first Port ID as it's unique between V2 and V3, and skip
> the plugging if it's V3.
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_chamelium.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 68864bb8..79920de1 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -3019,6 +3019,17 @@ bool chamelium_plug_all(struct chamelium *chamelium)
>  	if (port_count <= 0)
>  		return false;
>  
> +	/*
> +	 * A temporary workaround for Chamelium V3: Currently, Cv3 doesn't allow
> +	 * all ports to be plugged in at the same time. Cv3 first port has an ID
> +	 * of 0 while Cv2 has first port ID as 1.
> +	 * TODO(markyacoub): Remove this workaround when V3 is fixed.
> +	 */
> +	if (port_ids[0] == 0) {
> +		igt_debug("This should be Cv3. Skipping plugging all ports\n");
> +		return true;
> +	}
> +
>  	for (int i = 0; i < port_count; ++i) {
>  		v = __chamelium_rpc(chamelium, NULL, "Plug", "(i)", port_ids[i]);
>  
> -- 
> 2.38.1.584.g0f3c55d4c2-goog
> 
