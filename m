Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6248710E09C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 05:52:36 +0000 (UTC)
Date: Mon, 19 Jun 2023 07:52:31 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Message-ID: <20230619055231.ggkmac4ygtu5m6py@zkempczy-mobl2>
References: <20230616110519.3903-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616110519.3903-1-krishnaiah.bommu@intel.com>
Subject: Re: [igt-dev] [PATCH] tests/ xe_exec_compute_mode: Increase fence
 timeout for simulation env
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

On Fri, Jun 16, 2023 at 04:35:19PM +0530, Bommu Krishnaiah wrote:
> Increase fence timeout to 100 seconds for simulation env.
> Value is determined based on experiments.
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> ---
>  tests/xe/xe_exec_compute_mode.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
> index 68519399..aba35c19 100644
> --- a/tests/xe/xe_exec_compute_mode.c
> +++ b/tests/xe/xe_exec_compute_mode.c
> @@ -113,6 +113,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	} *data;
>  	int i, j, b;
>  	int map_fd = -1;
> +	int64_t fence_timeout;
>  
>  	igt_assert(n_engines <= MAX_N_ENGINES);
>  
> @@ -184,7 +185,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  					 to_user_pointer(data), addr,
>  					 bo_size, sync, 1);
>  #define ONE_SEC	1000
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
> +#define HUNDRED_SEC	100000

Be aware we're going to switch to nanoseconds as a timeout, more info here:

https://patchwork.freedesktop.org/series/118670/

--
Zbigniew

> +
> +	fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
> +
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
> +		       fence_timeout);
>  	data[0].vm_sync = 0;
>  
>  	for (i = 0; i < n_execs; i++) {
> @@ -210,7 +216,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  		if (flags & REBIND && i + 1 != n_execs) {
>  			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> -				       NULL, ONE_SEC);
> +				       NULL, fence_timeout);
>  			xe_vm_unbind_async(fd, vm, bind_engines[e], 0,
>  					   addr, bo_size, NULL, 0);
>  
> @@ -226,7 +232,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  							 addr, bo_size, sync,
>  							 1);
>  			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -				       NULL, ONE_SEC);
> +				       NULL, fence_timeout);
>  			data[0].vm_sync = 0;
>  		}
>  
> @@ -239,7 +245,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				 * an invalidate.
>  				 */
>  				xe_wait_ufence(fd, &data[i].exec_sync,
> -					       USER_FENCE_VALUE, NULL, ONE_SEC);
> +					       USER_FENCE_VALUE, NULL,
> +					       fence_timeout);
>  				igt_assert_eq(data[i].data, 0xc0ffee);
>  			} else if (i * 2 != n_execs) {
>  				/*
> @@ -269,7 +276,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	j = flags & INVALIDATE ? n_execs - 1 : 0;
>  	for (i = j; i < n_execs; i++)
>  		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, NULL,
> -			       ONE_SEC);
> +			       fence_timeout);
>  
>  	/* Wait for all execs to complete */
>  	if (flags & INVALIDATE)
> @@ -278,7 +285,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	sync[0].addr = to_user_pointer(&data[0].vm_sync);
>  	xe_vm_unbind_async(fd, vm, bind_engines[0], 0, addr, bo_size,
>  			   sync, 1);
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
> +		       fence_timeout);
>  
>  	for (i = j; i < n_execs; i++)
>  		igt_assert_eq(data[i].data, 0xc0ffee);
> -- 
> 2.25.1
> 
