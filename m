Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B45610E5D8
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Mar 2023 13:07:36 +0000 (UTC)
Date: Wed, 8 Mar 2023 14:07:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: pallavi.mishra@intel.com
Message-ID: <20230308130710.mxfq4kdqwgy2o5wj@kamilkon-desk1>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Pallavi,

please subscribe to igt-dev ML on a freedesktop.org page

Regards,
Kamil

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
>  
>  static bool __enable_hangcheck(int dir, bool state)
>  {
> -- 
> 2.34.1
> 
