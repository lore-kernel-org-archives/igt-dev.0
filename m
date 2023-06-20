Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F28410E2B8
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 10:58:36 +0000 (UTC)
Date: Tue, 20 Jun 2023 12:58:28 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Message-ID: <20230620105828.7pzkhofpyehxmsqk@zkempczy-mobl2>
References: <20230620103412.31591-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230620103412.31591-1-krishnaiah.bommu@intel.com>
Subject: Re: [igt-dev] [PATCH] tests/xe_exec_compute_mode: Increase fence
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

On Tue, Jun 20, 2023 at 04:04:12PM +0530, Bommu Krishnaiah wrote:
> Increase fence timeout to 100 seconds for simulation env.
> Value is determined based on experiments.
> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> ---
>  tests/xe/xe_exec_compute_mode.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
> index 2d950fdc..e2c9d0f3 100644
> --- a/tests/xe/xe_exec_compute_mode.c
> +++ b/tests/xe/xe_exec_compute_mode.c
> @@ -110,6 +110,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	} *data;
>  	int i, j, b;
>  	int map_fd = -1;
> +	int64_t fence_timeout;
>  
>  	igt_assert(n_engines <= MAX_N_ENGINES);
>  
> @@ -181,7 +182,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  					 to_user_pointer(data), addr,
>  					 bo_size, sync, 1);
>  #define ONE_SEC	1000
> -	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
> +#define HUNDRED_SEC	100000
> +
> +	fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
> +
> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
> +		       fence_timeout);
>  	data[0].vm_sync = 0;
>  
>  	for (i = 0; i < n_execs; i++) {
> @@ -207,7 +213,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  
>  		if (flags & REBIND && i + 1 != n_execs) {
>  			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> -				       NULL, ONE_SEC);
> +				       NULL, fence_timeout);
>  			xe_vm_unbind_async(fd, vm, bind_engines[e], 0,
>  					   addr, bo_size, NULL, 0);
>  
> @@ -223,7 +229,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  							 addr, bo_size, sync,
>  							 1);
>  			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
> -				       NULL, ONE_SEC);
> +				       NULL, fence_timeout);
>  			data[0].vm_sync = 0;
>  		}
>  
> @@ -236,7 +242,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  				 * an invalidate.
>  				 */
>  				xe_wait_ufence(fd, &data[i].exec_sync,
> -					       USER_FENCE_VALUE, NULL, ONE_SEC);
> +					       USER_FENCE_VALUE, NULL,
> +					       fence_timeout);
>  				igt_assert_eq(data[i].data, 0xc0ffee);
>  			} else if (i * 2 != n_execs) {
>  				/*
> @@ -266,7 +273,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	j = flags & INVALIDATE ? n_execs - 1 : 0;
>  	for (i = j; i < n_execs; i++)
>  		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, NULL,
> -			       ONE_SEC);
> +			       fence_timeout);
>  
>  	/* Wait for all execs to complete */
>  	if (flags & INVALIDATE)
> @@ -275,7 +282,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
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

There's ack from me for this change, we'll back to it soon
to alter definitions after uapi change.

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
