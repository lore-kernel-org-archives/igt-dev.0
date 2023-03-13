Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D951710E0AB
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Mar 2023 17:49:42 +0000 (UTC)
Date: Mon, 13 Mar 2023 18:49:24 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230313174924.7gkzzeyfjrpicvyw@kamilkon-desk1>
References: <20230224200941.9867-1-pallavi.mishra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230224200941.9867-1-pallavi.mishra@intel.com>
Subject: Re: [igt-dev] [PATCH 1/2] [PATCH i-g-t]
 i915/sysfs_heartbeat_interval: Update test to work with GuC submission
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Pallavi,

On 2023-02-24 at 20:09:40 +0000, pallavi.mishra@intel.com wrote:
> From: Pallavi Mishra <pallavi.mishra@intel.com>
> 
> Increase reset timeout as resets can take a bit longer with GuC
> submission because an error capture is done and with a large GuC log (16
> MB) these take a while.
> 
> Co-authored-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>  tests/i915/sysfs_heartbeat_interval.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/i915/sysfs_heartbeat_interval.c
> index 8cebf627..63e56cbf 100644
> --- a/tests/i915/sysfs_heartbeat_interval.c
> +++ b/tests/i915/sysfs_heartbeat_interval.c
> @@ -43,7 +43,7 @@
>  #include "sw_sync.h"
>  
>  #define ATTR "heartbeat_interval_ms"
> -#define RESET_TIMEOUT 50 /* milliseconds, at least one jiffie for kworker */
> +#define RESET_TIMEOUT 1000 /* milliseconds, long enough for an error capture */

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

>  
>  static bool __enable_hangcheck(int dir, bool state)
>  {
> -- 
> 2.34.1
> 
