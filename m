Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED5B210E2BA
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Dec 2023 19:45:50 +0000 (UTC)
Date: Mon, 18 Dec 2023 14:45:42 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Subject: Re: [PATCH] tests/xe_waitfence: removed invalid_engine subtest
Message-ID: <ZYChZnDIYErL18bK@intel.com>
References: <20231218084134.296548-1-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231218084134.296548-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Bommu@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Dec 18, 2023 at 02:11:34PM +0530, Bommu Krishnaiah wrote:
> From: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>
> 
> Removed unsupported invalid_engine subtest as per kernel implantation
> (remove the num_engines/instances members from drm_xe_wait_user_fence structure
> and add a exec_queue_id member) and removed unwanted code
> 
> Kernel commit:
> drm/xe/uapi: add exec_queue_id member to drm_xe_wait_user_fence structure
> 
> Signed-off-by: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  lib/xe/xe_ioctl.c          | 35 ------------------------
>  lib/xe/xe_ioctl.h          |  2 --
>  tests/intel/xe_waitfence.c | 56 +++++++++++---------------------------
>  3 files changed, 16 insertions(+), 77 deletions(-)
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
> index 7ba20764c..5c7bb2baf 100644
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

none of the code above is mentioned in the commit message... probably some
git left over included with commit -a?

>  		igt_debug("wait type: ENGINE ABSTIME - timeout: %" PRId64
> @@ -151,9 +165,6 @@ waitfence(int fd, enum waittype wt)
>   * SUBTEST: invalid-ops
>   * Description: Check query with invalid ops returns expected error code
>   *
> - * SUBTEST: invalid-engine
> - * Description: Check query with invalid engine info returns expected error code
> - *
>   * SUBTEST: exec_queue-reset-wait
>   * Description: Don’t wait till timeout on user fence when exec_queue reset is detected and return return proper error
>   */
> @@ -206,30 +217,6 @@ invalid_ops(int fd)
>  	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EINVAL);
>  }
>  
> -static void
> -invalid_engine(int fd)
> -{
> -	uint32_t bo;
> -
> -	struct drm_xe_wait_user_fence wait = {
> -		.addr = to_user_pointer(&wait_fence),
> -		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
> -		.flags = 0,
> -		.value = 1,
> -		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
> -		.timeout = -1,
> -		.exec_queue_id = 0,

well, exec_queue_id = 0 should be invalid, no?! why you want to remove it?

> -	};
> -
> -	uint32_t vm = xe_vm_create(fd, 0, 0);
> -
> -	bo = xe_bo_create(fd, vm, 0x40000, vram_if_possible(fd, 0), 0);
> -
> -	do_bind(fd, vm, bo, 0, 0x200000, 0x40000, 1);
> -
> -	do_ioctl_err(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait, EFAULT);
> -}
> -
>  static void
>  exec_queue_reset_wait(int fd)
>  {
> @@ -248,16 +235,8 @@ exec_queue_reset_wait(int fd)
>  		uint32_t data;
>  	} *data;
>  
> -#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
> -	struct drm_xe_sync sync[1] = {
> -		{ .flags = DRM_XE_SYNC_TYPE_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
> -			.timeline_value = USER_FENCE_VALUE },
> -	};
> -
>  	struct drm_xe_exec exec = {
>  		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> -		.syncs = to_user_pointer(sync),
>  	};
>  
>  	uint32_t vm = xe_vm_create(fd, 0, 0);
> @@ -329,9 +308,6 @@ igt_main
>  	igt_subtest("invalid-ops")
>  		invalid_ops(fd);
>  
> -	igt_subtest("invalid-engine")
> -		invalid_engine(fd);
> -
>  	igt_subtest("exec_queue-reset-wait")
>  		exec_queue_reset_wait(fd);
>  
> -- 
> 2.25.1
> 
