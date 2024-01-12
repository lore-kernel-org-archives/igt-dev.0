Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA0010E998
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 01:01:04 +0000 (UTC)
Date: Fri, 12 Jan 2024 00:59:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Pallavi Mishra <pallavi.mishra@intel.com>
Subject: Re: [igt-dev] [PATCH] tests/intel/xe_exec_thread: Increase ufence
 timeout
Message-ID: <ZaCO+XbdMRI8OIVb@DUT025-TGLU.fm.intel.com>
References: <20240112003450.1691892-1-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240112003450.1691892-1-pallavi.mishra@intel.com>
MIME-Version: 1.0
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

On Fri, Jan 12, 2024 at 06:04:50AM +0530, Pallavi Mishra wrote:
> For invalidate scenario, the ufence occasionally times
> out. Increase timeout for invalidate case.
> 
> Fixes: xe_exec_threads@threads-mixed-userptr-invalidate
> and xe_exec_threads@threads-bal-mixed-userptr-invalidate
> 
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>  tests/intel/xe_exec_threads.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index 17ee57a49..04c0e2196 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -327,6 +327,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  					 bo_size, sync, 1);
>  #define THREE_SEC	MS_TO_NS(3000)
>  #define THIRTY_SEC	MS_TO_NS(30000)
> +#define FIVE_SEC	MS_TO_NS(5000)
>  
>  	fence_timeout = igt_run_in_simulation() ? THIRTY_SEC : THREE_SEC;

The correct fix would be:
fence_timeout = igt_run_in_simulation() ? THIRTY_SEC : FIVE_SEC;

I also suspect of this change as 3 seconds is already a very long time.

Matt

>  
> @@ -389,7 +390,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  					xe_wait_ufence(fd, &data[j].exec_sync,
>  						       USER_FENCE_VALUE,
>  						       exec_queues[e],
> -						       fence_timeout);
> +						       FIVE_SEC);
>  				igt_assert_eq(data[i].data, 0xc0ffee);
>  			} else if (i * 2 != n_execs) {
>  				/*
> @@ -422,7 +423,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		(flags & RACE ? n_execs / 2 + 1 : n_execs - 1) : 0;
>  	for (i = j; i < n_execs; i++)
>  		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> -			       exec_queues[i % n_exec_queues], fence_timeout);
> +			       exec_queues[i % n_exec_queues], FIVE_SEC);
>  
>  	/* Wait for all execs to complete */
>  	if (flags & INVALIDATE)
> -- 
> 2.25.1
> 
