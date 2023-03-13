Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6BF10E5D3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Mar 2023 17:35:43 +0000 (UTC)
Date: Mon, 13 Mar 2023 18:35:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230313173535.h3ipe2fyeddwi43x@kamilkon-desk1>
References: <20230224200941.9867-1-pallavi.mishra@intel.com>
 <20230224200941.9867-2-pallavi.mishra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230224200941.9867-2-pallavi.mishra@intel.com>
Subject: Re: [igt-dev] [PATCH 2/2] [PATCH i-g-t]
 i915/sysfs_timeslice_duration: Update test to work with GuC submission
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

On 2023-02-24 at 20:09:41 +0000, pallavi.mishra@intel.com wrote:
> From: Pallavi Mishra <pallavi.mishra@intel.com>
> 
> Increase reset timeout as resets can take a bit longer with GuC
> submission because an error capture is done and with a large GuC log (16
> MB) these take a while.

Please split this patch into two, one with a subject and
description above, second with change below.

> 
> Don't run 'off' section as with GuC submission we don't handle
> dynamically changing the timeslice duration from 'off' to 'on' on a
> currently running context. This is not bug in GuC submission rather an
> architectural decision to not implement this as there is no user aside
> from IGTs.
> 
> Co-authored-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>  tests/i915/sysfs_timeslice_duration.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/sysfs_timeslice_duration.c b/tests/i915/sysfs_timeslice_duration.c
> index 95dc3777..e4bf3ca7 100644
> --- a/tests/i915/sysfs_timeslice_duration.c
> +++ b/tests/i915/sysfs_timeslice_duration.c
> @@ -29,6 +29,7 @@
>  #include <sys/types.h>
>  #include <unistd.h>
>  
> +#include "igt.h"
>  #include "igt_params.h"
>  #include "drmtest.h"
>  #include "i915/gem.h"
> @@ -44,7 +45,7 @@
>  #include "sw_sync.h"
>  
>  #define ATTR "timeslice_duration_ms"
> -#define RESET_TIMEOUT 50 /* milliseconds, at least one jiffie for kworker */
> +#define RESET_TIMEOUT 1000 /* milliseconds, at long enough for a error capture */
>  
>  #define MI_SEMAPHORE_WAIT		(0x1c << 23)
>  #define   MI_SEMAPHORE_POLL             (1 << 15)
> @@ -484,6 +485,9 @@ static void test_off(int i915, int engine)
>  	gem_quiescent_gpu(i915);
>  	igt_require(enable_hangcheck(i915, false));
>  
> +	/* Not a supported behavior for GuC enabled platforms */
---------- ^
Here write a little longer description (you can take part from
commit message).

Regards,
Kamil

> +	igt_require(!gem_using_guc_submission(i915));
> +
>  	igt_assert(igt_sysfs_scanf(engine, "class", "%u", &class) == 1);
>  	igt_assert(igt_sysfs_scanf(engine, "instance", "%u", &inst) == 1);
>  
> -- 
> 2.34.1
> 
