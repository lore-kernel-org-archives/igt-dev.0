Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6383E10E92D
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 14:55:01 +0000 (UTC)
Date: Thu, 11 Jan 2024 09:54:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: Re: [PATCH v3 3/3] tests/xe_waitfence: Removed duplicate code in
 waitfence
Message-ID: <ZaABIAHrGJoRvYVQ@intel.com>
References: <20240111062518.393544-1-krishnaiah.bommu@intel.com>
 <20240111062518.393544-4-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240111062518.393544-4-krishnaiah.bommu@intel.com>
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

On Thu, Jan 11, 2024 at 11:55:18AM +0530, Bommu Krishnaiah wrote:
> Removed duplicate cod in xe_waitfence@waitfence

Good catch, but why to do this instead of the other way around?

> 
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  lib/xe/xe_ioctl.c          | 35 -----------------------------------
>  lib/xe/xe_ioctl.h          |  2 --
>  tests/intel/xe_waitfence.c | 18 ++++++++++++++++--
>  3 files changed, 16 insertions(+), 39 deletions(-)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index 39605a019..49c5d359e 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -523,41 +523,6 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  	return timeout;
>  }
>  
> -/**
> - * xe_wait_ufence_abstime:
> - * @fd: xe device fd
> - * @addr: address of value to compare
> - * @value: expected value (equal) in @address
> - * @exec_queue: exec_queue id
> - * @timeout: absolute time when wait expire
> - * @flag: wait flag
> - *
> - * Function compares @value with memory pointed by @addr until they are equal.
> - * Asserts that ioctl returned without error.
> - *
> - * Returns elapsed time in nanoseconds if user fence was signalled.
> - */
> -int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
> -			       uint32_t exec_queue, int64_t timeout,
> -			       uint16_t flag)
> -{
> -	struct drm_xe_wait_user_fence wait = {
> -		.addr = to_user_pointer(addr),
> -		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
> -		.flags = flag,
> -		.value = value,
> -		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
> -		.timeout = timeout,
> -		.exec_queue_id = exec_queue,
> -	};
> -	struct timespec ts;
> -
> -	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
> -	igt_assert_eq(clock_gettime(CLOCK_MONOTONIC, &ts), 0);
> -
> -	return ts.tv_sec * 1e9 + ts.tv_nsec;
> -}
> -
>  void xe_force_gt_reset(int fd, int gt)
>  {
>  	char reset_string[128];
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 8a92073b0..03932561d 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -90,8 +90,6 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		     uint32_t exec_queue, int64_t *timeout);
>  int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		       uint32_t exec_queue, int64_t timeout);
> -int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value, uint32_t
> -			       exec_queue, int64_t timeout, uint16_t flag);
>  void xe_force_gt_reset(int fd, int gt);
>  
>  #endif /* XE_IOCTL_H */
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
> index 2f0f00cf4..f4592bfb3 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -36,7 +36,21 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
>  	xe_vm_bind_async(fd, vm, 0, bo, offset, addr, size, sync, 1);
>  }
>  
> -static int64_t wait_with_eci_abstime(int fd, uint64_t *addr, uint64_t value,
> +/**
> + * xe_wait_ufence_abstime:
> + * @fd: xe device fd
> + * @addr: address of value to compare
> + * @value: expected value (equal) in @address
> + * @exec_queue: exec_queue id
> + * @timeout: absolute time when wait expire
> + * @flag: wait flag
> + *
> + * Function compares @value with memory pointed by @addr until they are equal.
> + * Asserts that ioctl returned without error.
> + *
> + * Returns elapsed time in nanoseconds if user fence was signalled.
> + */

if you stay with this option, then you don't need to add the doc here since
this is a local static function.

> +static int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
>  				     uint32_t exec_queue, int64_t timeout,
>  				     uint16_t flag)
>  {
> @@ -117,7 +131,7 @@ waitfence(int fd, enum waittype wt)
>  		clock_gettime(CLOCK_MONOTONIC, &ts);
>  		current = ts.tv_sec * 1e9 + ts.tv_nsec;
>  		timeout = current + MS_TO_NS(10);
> -		signalled = wait_with_eci_abstime(fd, &wait_fence, 7,
> +		signalled = xe_wait_ufence_abstime(fd, &wait_fence, 7,
>  						  exec_queue, timeout,
>  						  DRM_XE_UFENCE_WAIT_FLAG_ABSTIME);
>  		igt_debug("wait type: ENGINE ABSTIME - timeout: %" PRId64
> -- 
> 2.25.1
> 
