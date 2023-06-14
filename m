Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A4D10E430
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 09:30:53 +0000 (UTC)
Date: Wed, 14 Jun 2023 11:30:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230614093049.nayv5mktfkd5dmel@kamilkon-desk1>
References: <20230602162011.90097-1-zbigniew.kempczynski@intel.com>
 <20230602162011.90097-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230602162011.90097-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/4] lib/xe_ioctl: Add
 xe_wait_ufence_abstime() helper
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

Hi Zbigniew,
On 2023-06-02 at 18:20:08 +0200, Zbigniew Kempczyński wrote:
> Xe user fences supports passing timeout in relative or absolute form.
> Add helper for absolute one.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
> v2: Add documentation and change subject (Kamil).
> ---
>  lib/xe/xe_ioctl.c | 35 +++++++++++++++++++++++++++++++++++
>  lib/xe/xe_ioctl.h |  3 +++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 66a8393fe9..3331046b46 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -36,6 +36,7 @@
>  #define major(__v__) (((__v__) >> 8) & 0xff)
>  #define minor(__v__) ((__v__) & 0xff)
>  #endif
> +#include <time.h>
>  
>  #include "config.h"
>  #include "drmtest.h"
> @@ -418,6 +419,40 @@ void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
>  }
>  
> +/**
> + * xe_wait_ufence_abstime:
> + * @fd: xe device fd
> + * @addr: address of value to compare
> + * @value: expected value (equal) in @address
> + * @eci: engine class instance
> + * @timeout: absolute time when wait expire
> + *
> + * Function compares @value with memory pointed by @addr until they are equal.
> + *
> + * Returns elapsed time in nanoseconds if user fence was signalled.
> + */
> +long xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
> +			    struct drm_xe_engine_class_instance *eci,
> +			    int64_t timeout)
> +{
> +	struct drm_xe_wait_user_fence wait = {
> +		.addr = to_user_pointer(addr),
> +		.op = DRM_XE_UFENCE_WAIT_EQ,
> +		.flags = !eci ? DRM_XE_UFENCE_WAIT_SOFT_OP | DRM_XE_UFENCE_WAIT_ABSTIME : 0,
> +		.value = value,
> +		.mask = DRM_XE_UFENCE_WAIT_U64,
> +		.timeout = timeout,
> +		.num_engines = eci ? 1 : 0,
> +		.instances = eci ? to_user_pointer(eci) : 0,
> +	};
> +	struct timespec ts;
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
> +	igt_assert_eq(clock_gettime(CLOCK_MONOTONIC, &ts), 0);
> +
> +	return ts.tv_sec * 1e9 + ts.tv_nsec;
> +}
> +
>  void xe_force_gt_reset(int fd, int gt)
>  {
>  	char reset_string[128];
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 049cd183d6..9b44892fe9 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -82,6 +82,9 @@ void xe_exec_wait(int fd, uint32_t engine, uint64_t addr);
>  void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		    struct drm_xe_engine_class_instance *eci,
>  		    int64_t timeout);
> +long xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
> +			    struct drm_xe_engine_class_instance *eci,
> +			    int64_t timeout);
>  void xe_force_gt_reset(int fd, int gt);
>  void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t size,
>  		   uint32_t property, uint32_t value);
> -- 
> 2.34.1
> 
