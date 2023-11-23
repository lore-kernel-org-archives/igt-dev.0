Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD83B10E6E9
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Nov 2023 08:51:14 +0000 (UTC)
Date: Thu, 23 Nov 2023 09:51:04 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231123085104.tz2wbxjuvdnfl5rz@kamilkon-desk.igk.intel.com>
References: <20231115155626.756378-1-daniel.t.mrzyglod@intel.com>
 <20231122164317.1469088-1-daniel.t.mrzyglod@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122164317.1469088-1-daniel.t.mrzyglod@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/intel/xe_waitfence: add
 subtest with provided engine class instance
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

Hi Daniel,
On 2023-11-22 at 17:43:17 +0100, Daniel Mrzyglod wrote:
> Postive test to check XE_WAIT_USER_FENCE ioctl where
> engine class instance is provided.
> 
> v2: Fix review comments (Kamil)
>     provide ABSTIME as proper time format.
> 
> v3: Fix review comments (Kamil)
>     rebase after recent uapi changes.
> 
> v4: Fix review comments (Kamil)
>     move assert to the function, fix subtest description
> 
> Signed-off-by: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>
> ---
>  tests/intel/xe_waitfence.c | 48 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 45 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> index b1cae0d9b..08d588add 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -37,9 +37,33 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
>  	xe_vm_bind_async(fd, vm, 0, bo, offset, addr, size, sync, 1);
>  }
>  
> +static int64_t wait_with_eci_abstime(int fd, uint64_t *addr, uint64_t value,
> +				     struct drm_xe_engine_class_instance *eci,
> +				     int64_t timeout)
> +{
> +	struct drm_xe_wait_user_fence wait = {
> +		.addr = to_user_pointer(addr),
> +		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
> +		.flags = !eci ? 0 : DRM_XE_UFENCE_WAIT_FLAG_ABSTIME,
> +		.value = value,
> +		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
> +		.timeout = timeout,
> +		.num_engines = eci ? 1 : 0,
> +		.instances = eci ? to_user_pointer(eci) : 0,
> +	};
> +	struct timespec ts;
> +
> +	igt_assert(eci);

I wanted this assert here to simplify assignemnts above to:

.flags = DRM_XE_UFENCE_WAIT_FLAG_ABSTIME,
.num_engines = 1,
.instances = to_user_pointer(eci),

With or without this,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
> +	igt_assert_eq(clock_gettime(CLOCK_MONOTONIC, &ts), 0);
> +
> +	return ts.tv_sec * 1e9 + ts.tv_nsec;
> +}
> +
>  enum waittype {
>  	RELTIME,
>  	ABSTIME,
> +	ENGINE,
>  };
>  
>  /**
> @@ -50,10 +74,18 @@ enum waittype {
>   * SUBTEST: abstime
>   * Description: Check basic waitfences functionality with timeout
>   *              passed as absolute time in nanoseconds
> + *
> + * SUBTEST: engine
> + * Description: Check basic waitfences functionality with timeout
> + *              passed as absolute time in nanoseconds and provide engine class
> + *              instance
>   */
>  static void
>  waitfence(int fd, enum waittype wt)
>  {
> +	struct drm_xe_engine_class_instance *eci = NULL;
> +	struct timespec ts;
> +	int64_t current, signalled;
>  	uint32_t bo_1;
>  	uint32_t bo_2;
>  	uint32_t bo_3;
> @@ -83,10 +115,17 @@ waitfence(int fd, enum waittype wt)
>  		timeout = xe_wait_ufence(fd, &wait_fence, 7, NULL, MS_TO_NS(10));
>  		igt_debug("wait type: RELTIME - timeout: %ld, timeout left: %ld\n",
>  			  MS_TO_NS(10), timeout);
> +	} else if (wt == ENGINE) {
> +		eci = xe_hw_engine(fd, 1);
> +		clock_gettime(CLOCK_MONOTONIC, &ts);
> +		current = ts.tv_sec * 1e9 + ts.tv_nsec;
> +		timeout = current + MS_TO_NS(10);
> +		signalled = wait_with_eci_abstime(fd, &wait_fence, 7, eci, timeout);
> +		igt_debug("wait type: ENGINE ABSTIME - timeout: %" PRId64
> +			  ", signalled: %" PRId64
> +			  ", elapsed: %" PRId64 "\n",
> +			  timeout, signalled, signalled - current);
>  	} else {
> -		struct timespec ts;
> -		int64_t current, signalled;
> -
>  		clock_gettime(CLOCK_MONOTONIC, &ts);
>  		current = ts.tv_sec * 1e9 + ts.tv_nsec;
>  		timeout = current + MS_TO_NS(10);
> @@ -205,6 +244,9 @@ igt_main
>  	igt_subtest("abstime")
>  		waitfence(fd, ABSTIME);
>  
> +	igt_subtest("engine")
> +		waitfence(fd, ENGINE);
> +
>  	igt_subtest("invalid-flag")
>  		invalid_flag(fd);
>  
> -- 
> 2.42.0
> 
