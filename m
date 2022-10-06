Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A22710E087
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Oct 2022 10:45:48 +0000 (UTC)
Date: Thu, 6 Oct 2022 13:45:22 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jake Freeland <jake@technologyfriends.net>
Message-ID: <Yz6xwoPWTfteNdLf@platvala-desk.ger.corp.intel.com>
References: <20221006000201.38707-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006000201.38707-1-jfree@freebsd.org>
Subject: Re: [igt-dev] [PATCH i-g-t] Replaced instances of mmap64() with
 drm_mmap()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 05, 2022 at 07:02:01PM -0500, Jake Freeland wrote:
> The mmap64() function exists to point 32-bit architectures to an mmap
> interface with the capability to address a 64-bit memory address space.
> This patch replaces all instances of mmap64() with drm_mmap() to
> ensure that the correct mmap interface is used on varying architectures
> and operating systems.
> 
> Signed-off-by: Jake Freeland <jfree@freebsd.org>
> ---
>  include/drm-uapi/libdrm.h    | 89 ++++++++++++++++++++++++++++++++++++
>  lib/i915/gem_mman.c          |  5 +-
>  lib/igt_vgem.c               |  3 +-
>  tests/i915/gem_mmap_gtt.c    | 23 +++++-----
>  tests/i915/gem_mmap_offset.c | 13 +++---
>  5 files changed, 113 insertions(+), 20 deletions(-)
>  create mode 100644 include/drm-uapi/libdrm.h

Ah yeah, that's one snag with just using drm_mmap. The function is
private.

We can't copy it to include/drm-uapi/, as it is not kernel uapi. And
definitely not with a misleading name.

Let's go with the original patch that changes mmap64 to mmap. If bug
reports arise that someone's distro doesn't default to
_FILE_OFFSET_BITS=64 on 32bit platforms, we can tune the build system
then.


-- 
Petri Latvala


> 
> diff --git a/include/drm-uapi/libdrm.h b/include/drm-uapi/libdrm.h
> new file mode 100644
> index 00000000..acfada5c
> --- /dev/null
> +++ b/include/drm-uapi/libdrm.h
> @@ -0,0 +1,89 @@
> +/*
> + * Copyright © 2014 NVIDIA Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#ifndef LIBDRM_LIBDRM_H
> +#define LIBDRM_LIBDRM_H
> +
> +#if defined(HAVE_VISIBILITY)
> +#  define drm_private __attribute__((visibility("hidden")))
> +#  define drm_public __attribute__((visibility("default")))
> +#else
> +#  define drm_private
> +#  define drm_public
> +#endif
> +
> +
> +/**
> + * Static (compile-time) assertion.
> + * Basically, use COND to dimension an array.  If COND is false/zero the
> + * array size will be -1 and we'll get a compilation error.
> + */
> +#define STATIC_ASSERT(COND) \
> +   do { \
> +      (void) sizeof(char [1 - 2*!(COND)]); \
> +   } while (0)
> +
> +
> +#include <sys/mman.h>
> +
> +#if defined(ANDROID)
> +#include <errno.h> /* for EINVAL */
> +
> +extern void *__mmap2(void *, size_t, int, int, int, size_t);
> +
> +static inline void *drm_mmap(void *addr, size_t length, int prot, int flags,
> +                             int fd, loff_t offset)
> +{
> +   /* offset must be aligned to 4096 (not necessarily the page size) */
> +   if (offset & 4095) {
> +      errno = EINVAL;
> +      return MAP_FAILED;
> +   }
> +
> +   return __mmap2(addr, length, prot, flags, fd, (size_t) (offset >> 12));
> +}
> +
> +#  define drm_munmap(addr, length) \
> +              munmap(addr, length)
> +
> +
> +#else
> +
> +/* assume large file support exists */
> +#  define drm_mmap(addr, length, prot, flags, fd, offset) \
> +              mmap(addr, length, prot, flags, fd, offset)
> +
> +
> +static inline int drm_munmap(void *addr, size_t length)
> +{
> +   /* Copied from configure code generated by AC_SYS_LARGEFILE */
> +#define LARGE_OFF_T ((((off_t) 1 << 31) << 31) - 1 + \
> +                     (((off_t) 1 << 31) << 31))
> +   STATIC_ASSERT(LARGE_OFF_T % 2147483629 == 721 &&
> +                 LARGE_OFF_T % 2147483647 == 1);
> +#undef LARGE_OFF_T
> +
> +   return munmap(addr, length);
> +}
> +#endif
> +
> +#endif
> diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
> index aa9ac6f3..4734f2af 100644
> --- a/lib/i915/gem_mman.c
> +++ b/lib/i915/gem_mman.c
> @@ -31,6 +31,7 @@
>  #include "igt_device.h"
>  #include "ioctl_wrappers.h"
>  #include "intel_chipset.h"
> +#include "libdrm.h"
>  
>  #include "gem_create.h"
>  #include "gem_mman.h"
> @@ -118,7 +119,7 @@ void *__gem_mmap__gtt(int fd, uint32_t handle, uint64_t size, unsigned prot)
>  	if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg))
>  		return NULL;
>  
> -	ptr = mmap64(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
> +	ptr = drm_mmap(0, size, prot, MAP_SHARED, fd, mmap_arg.offset);
>  	if (ptr == MAP_FAILED)
>  		ptr = NULL;
>  	else
> @@ -331,7 +332,7 @@ void *__gem_mmap_offset(int fd, uint32_t handle, uint64_t offset, uint64_t size,
>  	if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_OFFSET, &arg))
>  		return NULL;
>  
> -	ptr = mmap64(0, size, prot, MAP_SHARED, fd, arg.offset + offset);
> +	ptr = drm_mmap(0, size, prot, MAP_SHARED, fd, arg.offset + offset);
>  
>  	if (ptr == MAP_FAILED)
>  		ptr = NULL;
> diff --git a/lib/igt_vgem.c b/lib/igt_vgem.c
> index 7f933b23..a35b3cd3 100644
> --- a/lib/igt_vgem.c
> +++ b/lib/igt_vgem.c
> @@ -29,6 +29,7 @@
>  #include "igt_vgem.h"
>  #include "igt_core.h"
>  #include "ioctl_wrappers.h"
> +#include "libdrm.h"
>  
>  /**
>   * SECTION:igt_vgem
> @@ -76,7 +77,7 @@ void *__vgem_mmap(int fd, struct vgem_bo *bo, unsigned prot)
>  	if (drmIoctl(fd, DRM_IOCTL_MODE_MAP_DUMB, &arg))
>  		return NULL;
>  
> -	ptr = mmap64(0, bo->size, prot, MAP_SHARED, fd, arg.offset);
> +	ptr = drm_mmap(0, bo->size, prot, MAP_SHARED, fd, arg.offset);
>  	if (ptr == MAP_FAILED)
>  		return NULL;
>  
> diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> index e39b9047..643f2f30 100644
> --- a/tests/i915/gem_mmap_gtt.c
> +++ b/tests/i915/gem_mmap_gtt.c
> @@ -46,6 +46,7 @@
>  #include "igt.h"
>  #include "igt_sysfs.h"
>  #include "igt_x86.h"
> +#include "libdrm.h"
>  #include "sw_sync.h"
>  
>  #ifndef PAGE_SIZE
> @@ -113,11 +114,11 @@ test_access(int fd)
>  	mmap_arg.handle = handle;
>  	do_ioctl(fd, DRM_IOCTL_I915_GEM_MMAP_GTT, &mmap_arg);
>  
> -	igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> +	igt_assert(drm_mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
>  			  MAP_SHARED, fd, mmap_arg.offset));
>  
>  	/* Check that the same offset on the other fd doesn't work. */
> -	igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> +	igt_assert(drm_mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
>  			  MAP_SHARED, fd2, mmap_arg.offset) == MAP_FAILED);
>  	igt_assert(errno == EACCES);
>  
> @@ -128,7 +129,7 @@ test_access(int fd)
>  
>  	/* Recheck that it works after flink. */
>  	/* Check that the same offset on the other fd doesn't work. */
> -	igt_assert(mmap64(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
> +	igt_assert(drm_mmap(0, OBJECT_SIZE, PROT_READ | PROT_WRITE,
>  			  MAP_SHARED, fd2, mmap_arg.offset));
>  }
>  
> @@ -159,11 +160,11 @@ test_short(int fd)
>  	for (pages = 1; pages <= OBJECT_SIZE / PAGE_SIZE; pages <<= 1) {
>  		uint8_t *r, *w;
>  
> -		w = mmap64(0, pages * PAGE_SIZE, PROT_READ | PROT_WRITE,
> +		w = drm_mmap(0, pages * PAGE_SIZE, PROT_READ | PROT_WRITE,
>  			   MAP_SHARED, fd, mmap_arg.offset);
>  		igt_assert(w != MAP_FAILED);
>  
> -		r = mmap64(0, pages * PAGE_SIZE, PROT_READ,
> +		r = drm_mmap(0, pages * PAGE_SIZE, PROT_READ,
>  			   MAP_SHARED, fd, mmap_arg.offset);
>  		igt_assert(r != MAP_FAILED);
>  
> @@ -384,13 +385,13 @@ test_isolation(int i915)
>  
>  	close(B);
>  
> -	ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> +	ptr = drm_mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
>  	igt_assert(ptr != MAP_FAILED);
>  	munmap(ptr, 4096);
>  
>  	close(A);
>  
> -	ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> +	ptr = drm_mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
>  	igt_assert(ptr == MAP_FAILED);
>  }
>  
> @@ -400,7 +401,7 @@ test_close_race(int i915)
>  	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
>  	_Atomic uint32_t *handles;
>  
> -	handles = mmap64(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> +	handles = drm_mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>  	igt_assert(handles != MAP_FAILED);
>  
>  	igt_fork(child, ncpus + 1) {
> @@ -418,7 +419,7 @@ test_close_race(int i915)
>  				  &mmap_arg) != -1) {
>  				void *ptr;
>  
> -				ptr = mmap64(0, 4096,
> +				ptr = drm_mmap(0, 4096,
>  					     PROT_WRITE, MAP_SHARED, i915,
>  					     mmap_arg.offset);
>  				if (ptr != MAP_FAILED) {
> @@ -444,7 +445,7 @@ test_flink_race(int i915)
>  	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
>  	_Atomic uint32_t *handles;
>  
> -	handles = mmap64(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> +	handles = drm_mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>  	igt_assert(handles != MAP_FAILED);
>  
>  	igt_fork(child, ncpus + 1) {
> @@ -469,7 +470,7 @@ test_flink_race(int i915)
>  				  &mmap_arg) != -1) {
>  				void *ptr;
>  
> -				ptr = mmap64(0, 4096,
> +				ptr = drm_mmap(0, 4096,
>  					     PROT_WRITE, MAP_SHARED, fd,
>  					     mmap_arg.offset);
>  				if (ptr != MAP_FAILED) {
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index 2b416edd..0a6d41aa 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -38,6 +38,7 @@
>  #include "i915/intel_memory_region.h"
>  #include "igt.h"
>  #include "igt_x86.h"
> +#include "libdrm.h"
>  
>  IGT_TEST_DESCRIPTION("Basic MMAP_OFFSET IOCTL tests for mem regions\n");
>  
> @@ -67,7 +68,7 @@ __mmap_offset(int i915, uint32_t handle, uint64_t offset, uint64_t size,
>  	if (mmap_offset_ioctl(i915, &arg))
>  		return NULL;
>  
> -	ptr = mmap64(0, size, prot, MAP_SHARED, i915, arg.offset + offset);
> +	ptr = drm_mmap(0, size, prot, MAP_SHARED, i915, arg.offset + offset);
>  	if (ptr == MAP_FAILED)
>  		ptr = NULL;
>  	else
> @@ -321,12 +322,12 @@ static void isolation(int i915)
>  				 t->name, B, b, offset_b);
>  
>  			errno = 0;
> -			ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915, offset_a);
> +			ptr = drm_mmap(0, 4096, PROT_READ, MAP_SHARED, i915, offset_a);
>  			igt_assert(ptr == MAP_FAILED);
>  			igt_assert_eq(errno, EACCES);
>  
>  			errno = 0;
> -			ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, i915, offset_b);
> +			ptr = drm_mmap(0, 4096, PROT_READ, MAP_SHARED, i915, offset_b);
>  			igt_assert(ptr == MAP_FAILED);
>  			igt_assert_eq(errno, EACCES);
>  
> @@ -344,13 +345,13 @@ static void isolation(int i915)
>  
>  			close(B);
>  
> -			ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> +			ptr = drm_mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
>  			igt_assert(ptr != MAP_FAILED);
>  			munmap(ptr, 4096);
>  
>  			close(A);
>  
> -			ptr = mmap64(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
> +			ptr = drm_mmap(0, 4096, PROT_READ, MAP_SHARED, A, offset_a);
>  			igt_assert(ptr == MAP_FAILED);
>  		}
>  	}
> @@ -553,7 +554,7 @@ static void close_race(int i915, int timeout)
>  	_Atomic uint32_t *handles;
>  	size_t len = ALIGN((ncpus + 1) * sizeof(uint32_t), 4096);
>  
> -	handles = mmap64(0, len, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
> +	handles = drm_mmap(0, len, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>  	igt_assert(handles != MAP_FAILED);
>  
>  	igt_fork(child, ncpus + 1) {
> -- 
> 2.37.0 (Apple Git-136)
> 
