Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3251A10EA71
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 09:46:38 +0000 (UTC)
Date: Wed, 29 Mar 2023 11:46:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230329094632.vxburez6pcvhxz5d@kamilkon-desk1>
References: <20230329052848.1076928-1-pallavi.mishra@intel.com>
 <20230329052848.1076928-3-pallavi.mishra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230329052848.1076928-3-pallavi.mishra@intel.com>
Subject: Re: [igt-dev] [PATCH 2/2] [PATCH i-g-t]
 i915/sysfs_timeslice_duration: skip off subtest for GuC submission
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

On 2023-03-29 at 10:58:48 +0530, pallavi.mishra@intel.com wrote:
> From: Pallavi Mishra <pallavi.mishra@intel.com>
> 
> Don't run 'off' section as with GuC submission we don't handle
> dynamically changing the timeslice duration from 'off' to 'on' on a
> currently running context. This is not bug in GuC submission rather an
> architectural decision to not implement this as there is no user aside
> from IGTs.
> 
> Co-authored-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>

LGTM,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

btw if you may please use my @linux address above for patches.

--
Kamil
> ---
>  tests/i915/sysfs_timeslice_duration.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/i915/sysfs_timeslice_duration.c b/tests/i915/sysfs_timeslice_duration.c
> index c23424c6..92c4c5ea 100644
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
> @@ -475,6 +476,13 @@ static void test_off(int i915, int engine)
>  	gem_quiescent_gpu(i915);
>  	igt_require(enable_hangcheck(i915, false));
>  
> +	/* GuC does not handle dynamic change in timeslice
> +	 * duration from 'off' to 'on' on a currently
> +	 * running context. Hence add below check.
> +	 */
> +
> +	igt_require(!gem_using_guc_submission(i915));
> +
>  	igt_assert(igt_sysfs_scanf(engine, "class", "%u", &class) == 1);
>  	igt_assert(igt_sysfs_scanf(engine, "instance", "%u", &inst) == 1);
>  
> -- 
> 2.25.1
> 
