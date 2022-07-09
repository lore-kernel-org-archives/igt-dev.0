Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F217D11B953
 for <igt-dev@lists.freedesktop.org>; Sat,  9 Jul 2022 21:02:04 +0000 (UTC)
Date: Sat, 9 Jul 2022 14:01:45 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Message-ID: <20220709210145.GF14039@nvishwa1-DESK>
References: <20220701230546.8348-1-niranjana.vishwanathapura@intel.com>
 <20220701230546.8348-4-niranjana.vishwanathapura@intel.com>
 <YsMaNUO3db/8KKn+@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YsMaNUO3db/8KKn+@kamilkon-desk1>
Subject: Re: [igt-dev] [RFC i-g-t 3/5] tests/i915/vm_bind: Add vm_bind
 sanity test
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

On Mon, Jul 04, 2022 at 06:49:57PM +0200, Kamil Konieczny wrote:
>Hi Niranjana,
>
>On 2022-07-01 at 16:05:44 -0700, Niranjana Vishwanathapura wrote:
>> Add sanity test to exercise vm_bind uapi.
>> Test for various cases with vm_bind and vm_unbind ioctls.
>>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  lib/intel_chipset.h              |   2 +
>>  lib/ioctl_wrappers.c             |  39 ++++-
>>  lib/ioctl_wrappers.h             |   1 +
>>  tests/i915/i915_vm_bind_sanity.c | 247 +++++++++++++++++++++++++++++++
>>  tests/meson.build                |   1 +
>>  tests/prime_mmap.c               |  26 +---
>>  6 files changed, 288 insertions(+), 28 deletions(-)
>>  create mode 100644 tests/i915/i915_vm_bind_sanity.c
>>
>> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
>> index 06f7321102..48fabb3d91 100644
>> --- a/lib/intel_chipset.h
>> +++ b/lib/intel_chipset.h
>> @@ -221,4 +221,6 @@ void intel_check_pch(void);
>>
>>  #define HAS_FLATCCS(devid)	(intel_get_device_info(devid)->has_flatccs)
>>
>> +#define HAS_64K_PAGES(devid)	(IS_DG2(devid))
>> +
>
>imho lib changes (this and the other) should go into separate
>patch.

Thanks Kamil for the feedback.
Ok, We have apatch in this series for lib changes. We can move it there.

>
>>  #endif /* _INTEL_CHIPSET_H */
>> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
>> index f026473f87..0fac7296c3 100644
>> --- a/lib/ioctl_wrappers.c
>> +++ b/lib/ioctl_wrappers.c
>> @@ -1154,28 +1154,55 @@ void gem_require_mocs_registers(int fd)
>>  /* prime */
>>
>>  /**
>> - * prime_handle_to_fd:
>> + * prime_handle_to_fd_no_assert:
>>   * @fd: open i915 drm file descriptor
>>   * @handle: file-private gem buffer object handle
>> + * @flags: DRM_IOCTL_PRIME_HANDLE_TO_FD ioctl flags
>> + * @fd_out: place holder for output file handle
>>   *
>>   * This wraps the PRIME_HANDLE_TO_FD ioctl, which is used to export a gem buffer
>>   * object into a global (i.e. potentially cross-device) dma-buf file-descriptor
>>   * handle.
>>   *
>> - * Returns: The created dma-buf fd handle.
>> + * Returns: 0 on sucess, error otherwise. Upon success, it returns
>> + *          the created dma-buf fd handle in fd_out.
>>   */
>> -int prime_handle_to_fd(int fd, uint32_t handle)
>> +int prime_handle_to_fd_no_assert(int fd, uint32_t handle, int flags, int *fd_out)
>>  {
>>  	struct drm_prime_handle args;
>> +	int ret;
>>
>>  	memset(&args, 0, sizeof(args));
>>  	args.handle = handle;
>> -	args.flags = DRM_CLOEXEC;
>> +	args.flags = flags;
>>  	args.fd = -1;
>>
>> -	do_ioctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &args);
>> +	ret = drmIoctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &args);
>> +	if (ret)
>> +		ret = -errno;
>> +	*fd_out = args.fd;
>>
>> -	return args.fd;
>> +	return ret;
>> +}
>> +
>> +/**
>> + * prime_handle_to_fd:
>> + * @fd: open i915 drm file descriptor
>> + * @handle: file-private gem buffer object handle
>> + *
>> + * This wraps the PRIME_HANDLE_TO_FD ioctl, which is used to export a gem buffer
>> + * object into a global (i.e. potentially cross-device) dma-buf file-descriptor
>> + * handle. It asserts that ioctl succeeds.
>> + *
>> + * Returns: The created dma-buf fd handle.
>> + */
>> +int prime_handle_to_fd(int fd, uint32_t handle)
>> +{
>> +	int dmabuf;
>> +
>> +	igt_assert_eq(prime_handle_to_fd_no_assert(fd, handle, DRM_CLOEXEC, &dmabuf), 0);
>> +
>> +	return dmabuf;
>>  }
>>
>>  /**
>> diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
>> index 223cd9160c..9f50a24153 100644
>> --- a/lib/ioctl_wrappers.h
>> +++ b/lib/ioctl_wrappers.h
>> @@ -143,6 +143,7 @@ struct local_dma_buf_sync {
>>  #define LOCAL_DMA_BUF_BASE 'b'
>>  #define LOCAL_DMA_BUF_IOCTL_SYNC _IOW(LOCAL_DMA_BUF_BASE, 0, struct local_dma_buf_sync)
>>
>> +int prime_handle_to_fd_no_assert(int fd, uint32_t handle, int flags, int *fd_out);
>>  int prime_handle_to_fd(int fd, uint32_t handle);
>>  #ifndef DRM_RDWR
>>  #define DRM_RDWR O_RDWR
>> diff --git a/tests/i915/i915_vm_bind_sanity.c b/tests/i915/i915_vm_bind_sanity.c
>> new file mode 100644
>> index 0000000000..371ceda2a6
>> --- /dev/null
>> +++ b/tests/i915/i915_vm_bind_sanity.c
>> @@ -0,0 +1,247 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2022 Intel Corporation
>> + */
>> +
>> +/** @file i915_vm_bind_sanity.c
>> + *
>> + * This is the sanity test for VM_BIND UAPI.
>> + *
>> + * The goal is to test the UAPI interface.
>> + */
>
>Please add global description to test with igt_describe().

Sounds good.

>
>> +
>> +#include <fcntl.h>
>> +#include <sys/ioctl.h>
>> +#include <sys/poll.h>
>> +
>> +#include "igt_syncobj.h"
>> +#include "i915/gem.h"
>> +#include "i915/gem_create.h"
>> +#include "igt.h"
>> +
>> +#include "i915/gem_vm.h"
>> +
>> +#define EOPNOTSUPP    95
>> +
>> +#define PAGE_SIZE   4096
>> +#define SZ_64K      (16 * PAGE_SIZE)
>> +
>> +#define VA 0xa0000000
>> +
>> +static uint64_t
>> +gettime_ns(void)
>> +{
>> +	struct timespec current;
>> +	clock_gettime(CLOCK_MONOTONIC, &current);
>> +	return (uint64_t)current.tv_sec * NSEC_PER_SEC + current.tv_nsec;
>> +}
>> +
>> +static bool syncobj_busy(int fd, uint32_t handle)
>> +{
>> +	bool result;
>> +	int sf;
>> +
>> +	sf = syncobj_handle_to_fd(fd, handle,
>> +				  DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE);
>> +	result = poll(&(struct pollfd){sf, POLLIN}, 1, 0) == 0;
>> +	close(sf);
>> +
>> +	return result;
>> +}
>> +
>> +static inline int
>> +__i915_vm_bind(int fd, uint32_t vm_id, uint32_t handle, uint64_t start,
>> +	       uint64_t offset, uint64_t length, uint64_t flags,
>> +	       struct drm_i915_gem_timeline_fence *fence)
>> +{
>> +	struct drm_i915_gem_vm_bind bind;
>> +
>> +	memset(&bind, 0, sizeof(bind));
>> +	bind.vm_id = vm_id;
>> +	bind.handle = handle;
>> +	bind.start = start;
>> +	bind.offset = offset;
>> +	bind.length = length;
>> +	bind.flags = flags;
>> +	if (fence)
>> +		bind.fence = *fence;
>> +
>> +	return __gem_vm_bind(fd, &bind);
>> +}
>> +
>> +static inline void
>> +i915_vm_bind(int fd, uint32_t vm_id, uint32_t handle, uint64_t start,
>> +	     uint64_t offset, uint64_t length, uint64_t flags,
>> +	     struct drm_i915_gem_timeline_fence *fence)
>> +{
>> +	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, start,
>> +				     offset, length, flags, fence), 0);
>> +	if (fence) {
>> +		igt_assert(syncobj_timeline_wait(fd, &fence->handle, (uint64_t *)&fence->value,
>> +						 1, gettime_ns() + (2 * NSEC_PER_SEC),
>> +						 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT, NULL));
>> +		igt_assert(!syncobj_busy(fd, fence->handle));
>> +	}
>> +}
>> +
>> +static inline int
>> +__i915_vm_unbind(int fd, uint32_t vm_id, uint64_t start, uint64_t length, uint64_t flags)
>> +{
>> +	struct drm_i915_gem_vm_unbind unbind;
>> +
>> +	memset(&unbind, 0, sizeof(unbind));
>> +	unbind.vm_id = vm_id;
>> +	unbind.start = start;
>> +	unbind.length = length;
>> +	unbind.flags = flags;
>> +
>> +	return __gem_vm_unbind(fd, &unbind);
>> +}
>> +
>> +static inline void
>> +i915_vm_unbind(int fd, uint32_t vm_id, uint64_t start, uint64_t length, uint64_t flags)
>> +{
>> +	igt_assert_eq(__i915_vm_unbind(fd, vm_id, start, length, flags), 0);
>> +}
>> +
>> +static void basic(int fd, bool test_lmem)
>> +{
>> +	uint32_t vm_id, vm_id2, vm_id_exec_mode, handle, pg_size, size;
>> +	unsigned int region = test_lmem ? REGION_LMEM(0) : REGION_SMEM;
>> +	struct drm_i915_gem_timeline_fence fence = {
>> +		.handle = syncobj_create(fd, 0),
>> +		.flags = I915_TIMELINE_FENCE_SIGNAL,
>> +		.value = 0,
>> +	};
>> +	struct drm_i915_gem_execbuffer2 execbuf;
>> +	struct drm_i915_gem_exec_object2 obj;
>> +	const intel_ctx_t *ctx;
>> +	int dmabuf;
>> +
>> +	pg_size = (test_lmem && HAS_64K_PAGES(intel_get_drm_devid(fd))) ? SZ_64K : PAGE_SIZE;
>> +	size = pg_size * 4;
>> +
>> +	vm_id = gem_vm_create_in_vm_bind_mode(fd);
>> +	handle = gem_create_in_memory_regions(fd, size, region);
>> +
>> +	/* Bind and unbind */
>> +	i915_vm_bind(fd, vm_id, handle, VA, 0, size, 0, NULL);
>> +	i915_vm_unbind(fd, vm_id, VA, size, 0);
>> +
>> +	/* Bind with out fence */
>> +	i915_vm_bind(fd, vm_id, handle, VA, 0, size, 0, &fence);
>> +	i915_vm_unbind(fd, vm_id, VA, size, 0);
>> +
>> +	/* Aliasing bind and unbind */
>> +	i915_vm_bind(fd, vm_id, handle, VA, 0, size, 0, NULL);
>> +	i915_vm_bind(fd, vm_id, handle, VA + size, 0, size, 0, NULL);
>> +	i915_vm_unbind(fd, vm_id, VA, size, 0);
>> +	i915_vm_unbind(fd, vm_id, VA + size, size, 0);
>> +
>> +	/* Invalid handle */
>> +	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle + 10, VA, 0, size, 0, NULL), -ENOENT);
>> +
>> +	/* Invalid mapping range */
>> +	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, 0, 0, 0, NULL), -EINVAL);
>> +	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, pg_size, size, 0, NULL), -EINVAL);
>> +
>> +	/* Unaligned binds */
>> +	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, pg_size / 2, pg_size, 0, NULL), -EINVAL);
>> +	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, 0, pg_size / 2, 0, NULL), -EINVAL);
>> +
>> +	/* range overflow binds */
>> +	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, pg_size, -pg_size, 0, NULL), -EINVAL);
>> +	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, pg_size * 2, -pg_size, 0, NULL), -EINVAL);
>> +
>> +	/* re-bind VA range without unbinding */
>> +	i915_vm_bind(fd, vm_id, handle, VA, 0, size, 0, NULL);
>> +	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, 0, size, 0, NULL), -EEXIST);
>> +	i915_vm_unbind(fd, vm_id, VA, size, 0);
>> +
>> +	/* unbind a non-existing mapping */
>> +	igt_assert_eq(__i915_vm_bind(fd, vm_id, 0, VA + VA, 0, size, 0, NULL), -ENOENT);
>> +
>> +	/* unbind with length mismatch */
>> +	i915_vm_bind(fd, vm_id, handle, VA, 0, size, 0, NULL);
>> +	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, 0, size * 2, 0, NULL), -EINVAL);
>> +	i915_vm_unbind(fd, vm_id, VA, size, 0);
>> +
>> +	/* validate exclusivity of vm_bind & exec modes of binding */
>> +	vm_id_exec_mode = gem_vm_create(fd);
>> +	igt_assert_eq(__i915_vm_bind(fd, vm_id_exec_mode, handle, VA, 0, size, 0, NULL), -EOPNOTSUPP);
>> +
>> +	ctx = intel_ctx_create_all_physical(fd);
>> +	gem_context_set_vm(fd, ctx->id, vm_id);
>> +	(void)gem_context_get_vm(fd, ctx->id);
>> +
>> +	memset(&obj, 0, sizeof(obj));
>> +	memset(&execbuf, 0, sizeof(execbuf));
>> +	execbuf.buffers_ptr = to_user_pointer(&obj);
>> +	execbuf.buffer_count = 1;
>> +	obj.handle = handle;
>> +	i915_execbuffer2_set_context_id(execbuf, ctx->id);
>> +	igt_assert_eq(__gem_execbuf(fd, &execbuf), -EOPNOTSUPP);
>> +
>> +	intel_ctx_destroy(fd, ctx);
>> +	gem_vm_destroy(fd, vm_id_exec_mode);
>> +	gem_close(fd, handle);
>> +
>> +	/* validate VM private objects */
>> +	vm_id2 = gem_vm_create_in_vm_bind_mode(fd);
>> +	handle = gem_create_vm_private_in_memory_regions(fd, size, vm_id2, region);
>> +
>> +	igt_assert_eq(prime_handle_to_fd_no_assert(fd, handle, DRM_CLOEXEC, &dmabuf), -EINVAL);
>> +	igt_assert_eq(__i915_vm_bind(fd, vm_id, handle, VA, 0, size, 0, NULL), -EINVAL);
>> +	i915_vm_bind(fd, vm_id2, handle, VA, 0, size, 0, NULL);
>> +	i915_vm_unbind(fd, vm_id2, VA, size, 0);
>> +
>> +	gem_close(fd, handle);
>> +	gem_vm_destroy(fd, vm_id2);
>> +	gem_vm_destroy(fd, vm_id);
>> +	syncobj_destroy(fd, fence.handle);
>> +}
>> +
>> +static int vm_bind_version(int fd)
>> +{
>> +	struct drm_i915_getparam gp;
>> +	int value = 0;
>> +
>> +	memset(&gp, 0, sizeof(gp));
>> +	gp.param = I915_PARAM_VM_BIND_VERSION;
>> +	gp.value = &value;
>> +
>> +	ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp, sizeof(gp));
>> +	errno = 0;
>> +
>> +	return value;
>> +}
>> +
>> +igt_main
>> +{
>> +	int fd;
>> +	bool has_lmem;
>> +
>> +	igt_fixture {
>> +		fd = drm_open_driver(DRIVER_INTEL);
>> +		igt_require_gem(fd);
>> +		igt_require(vm_bind_version(fd) == 1);
>> +		has_lmem = gem_has_lmem(fd);
>> +	}
>> +
>
>Please add description before each new subtest you add.

Sounds good.

>
>> +	igt_subtest_f("basic-smem") {
>> +		basic(fd, false);
>> +		if (has_lmem)
>> +			basic(fd, true);
>
>This looks a little redundand, you will be testing this below.

Ah, the second argument here should have been 'false' instead
of 'true'. Need to fix.

>
>> +	}
>> +
>> +	if (has_lmem) {
>> +		igt_subtest_f("basic-lmem")
>> +			basic(fd, true);
>> +	}
>> +
>> +	igt_fixture {
>> +		close(fd);
>> +	}
>> +
>> +	igt_exit();
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index b548dc3b44..56abc7e0a9 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -249,6 +249,7 @@ i915_progs = [
>>  	'sysfs_heartbeat_interval',
>>  	'sysfs_preempt_timeout',
>>  	'sysfs_timeslice_duration',
>> +	'i915_vm_bind_sanity',
>>  ]
>>
>>  msm_progs = [
>> diff --git a/tests/prime_mmap.c b/tests/prime_mmap.c
>> index d53185ff10..4c76564907 100644
>> --- a/tests/prime_mmap.c
>> +++ b/tests/prime_mmap.c
>> @@ -298,24 +298,6 @@ test_dup(uint32_t region, int size)
>>  	close (dma_buf_fd);
>>  }
>>
>> -/* Used for error case testing to avoid wrapper */
>> -static int prime_handle_to_fd_no_assert(uint32_t handle, int flags, int *fd_out)
>> -{
>> -	struct drm_prime_handle args;
>> -	int ret;
>> -
>> -	args.handle = handle;
>> -	args.flags = flags;
>> -	args.fd = -1;
>> -
>> -	ret = drmIoctl(fd, DRM_IOCTL_PRIME_HANDLE_TO_FD, &args);
>> -	if (ret)
>> -		ret = errno;
>> -	*fd_out = args.fd;
>> -
>> -	return ret;
>> -}
>> -
>
>This should go with the lib patches.

Sounds good.

Niranjana

>
>Regards,
>Kamil
>
>>  static bool has_userptr(void)
>>  {
>>  	uint32_t handle = 0;
>> @@ -346,9 +328,9 @@ test_userptr(uint32_t region, int size)
>>  	gem_userptr(fd, (uint32_t *)ptr, size, 0, 0, &handle);
>>
>>  	/* export userptr */
>> -	ret = prime_handle_to_fd_no_assert(handle, DRM_CLOEXEC, &dma_buf_fd);
>> +	ret = prime_handle_to_fd_no_assert(fd, handle, DRM_CLOEXEC, &dma_buf_fd);
>>  	if (ret) {
>> -		igt_assert(ret == EINVAL || ret == ENODEV);
>> +		igt_assert(ret == -EINVAL || ret == -ENODEV);
>>  		goto free_userptr;
>>  	} else {
>>  		igt_assert_eq(ret, 0);
>> @@ -376,7 +358,7 @@ test_errors(uint32_t region, int size)
>>  	/* Test for invalid flags */
>>  	handle = gem_create_in_memory_regions(fd, size, region);
>>  	for (i = 0; i < ARRAY_SIZE(invalid_flags); i++) {
>> -		prime_handle_to_fd_no_assert(handle, invalid_flags[i], &dma_buf_fd);
>> +		prime_handle_to_fd_no_assert(fd, handle, invalid_flags[i], &dma_buf_fd);
>>  		igt_assert_eq(errno, EINVAL);
>>  		errno = 0;
>>  	}
>> @@ -386,7 +368,7 @@ test_errors(uint32_t region, int size)
>>  	handle = gem_create_in_memory_regions(fd, size, region);
>>  	fill_bo(handle, size);
>>  	gem_close(fd, handle);
>> -	prime_handle_to_fd_no_assert(handle, DRM_CLOEXEC, &dma_buf_fd);
>> +	prime_handle_to_fd_no_assert(fd, handle, DRM_CLOEXEC, &dma_buf_fd);
>>  	igt_assert(dma_buf_fd == -1 && errno == ENOENT);
>>  	errno = 0;
>>
>> --
>> 2.21.0.rc0.32.g243a4c7e27
>>
