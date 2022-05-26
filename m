Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CAB10E20C
 for <igt-dev@lists.freedesktop.org>; Thu, 26 May 2022 10:13:14 +0000 (UTC)
Date: Thu, 26 May 2022 12:13:08 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <Yo9StLIJ2uEEJtSl@zkempczy-mobl2>
References: <20220525150041.29238-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220525150041.29238-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/i915/gem_close_race: Adopt to
 use softpin
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, May 25, 2022 at 05:00:41PM +0200, Kamil Konieczny wrote:
> For newer gens there will be no relocations, so adopt test to
> run using soft-pinned addresses. Refactor code to run on
> discrete DG2, where there are no pwrite ioctl. Use calculated
> offsets for older gens so it will avoid applying relocations by
> i915 kernel driver.
> 
> v2: refactor to run on DG2 and older gens (Zbigniew review)
> v3: use calculated offsets for older gens (Chris comments)
> v4: move setting NO_RELOC flag out of if-block (Zbigniew)
>     update commit message about DG2 refactoring
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>

LGTM.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  tests/i915/gem_close_race.c | 56 +++++++++++++++++++++++++++----------
>  1 file changed, 42 insertions(+), 14 deletions(-)
> 
> diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
> index ab444945..93ae07ed 100644
> --- a/tests/i915/gem_close_race.c
> +++ b/tests/i915/gem_close_race.c
> @@ -28,6 +28,7 @@
>  #include <pthread.h>
>  #include <unistd.h>
>  #include <signal.h>
> +#include <stdbool.h>
>  #include <stdlib.h>
>  #include <stdint.h>
>  #include <stdio.h>
> @@ -43,6 +44,7 @@
>  #include "drm.h"
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
> +#include "i915/gem_mman.h"
>  #include "igt.h"
>  
>  #define OBJECT_SIZE (256 * 1024)
> @@ -53,6 +55,9 @@
>  
>  static uint32_t devid;
>  static bool has_64bit_relocations;
> +static bool has_softpin;
> +static uint64_t exec_addr;
> +static uint64_t data_addr;
>  
>  #define sigev_notify_thread_id _sigev_un._tid
>  
> @@ -61,9 +66,9 @@ static void selfcopy(int fd, uint32_t ctx, uint32_t handle, int loops)
>  	struct drm_i915_gem_relocation_entry reloc[2];
>  	struct drm_i915_gem_exec_object2 gem_exec[2];
>  	struct drm_i915_gem_execbuffer2 execbuf;
> -	struct drm_i915_gem_pwrite gem_pwrite;
>  	struct drm_i915_gem_create create;
>  	uint32_t buf[16], *b = buf;
> +	int err;
>  
>  	memset(reloc, 0, sizeof(reloc));
>  
> @@ -79,9 +84,10 @@ static void selfcopy(int fd, uint32_t ctx, uint32_t handle, int loops)
>  	reloc[0].target_handle = handle;
>  	reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
>  	reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
> -	*b++ = 0;
> +	reloc[0].presumed_offset = data_addr;
> +	*b++ = data_addr;
>  	if (has_64bit_relocations)
> -		*b++ = 0;
> +		*b++ = CANONICAL(data_addr) >> 32;
>  
>  	*b++ = 512 << 16;
>  	*b++ = 4*1024;
> @@ -90,9 +96,10 @@ static void selfcopy(int fd, uint32_t ctx, uint32_t handle, int loops)
>  	reloc[1].target_handle = handle;
>  	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
>  	reloc[1].write_domain = 0;
> -	*b++ = 0;
> +	reloc[1].presumed_offset = data_addr;
> +	*b++ = data_addr;
>  	if (has_64bit_relocations)
> -		*b++ = 0;
> +		*b++ = CANONICAL(data_addr) >> 32;
>  
>  	*b++ = MI_BATCH_BUFFER_END;
>  	*b++ = 0;
> @@ -105,10 +112,19 @@ static void selfcopy(int fd, uint32_t ctx, uint32_t handle, int loops)
>  	create.size = 4096;
>  	drmIoctl(fd, DRM_IOCTL_I915_GEM_CREATE, &create);
>  	gem_exec[1].handle = create.handle;
> -	gem_exec[1].relocation_count = 2;
> -	gem_exec[1].relocs_ptr = to_user_pointer(reloc);
> +	gem_exec[1].offset = CANONICAL(exec_addr);
> +	gem_exec[0].offset = CANONICAL(data_addr);
> +	if (has_softpin) {
> +		gem_exec[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> +		gem_exec[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
> +				     EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> +	} else {
> +		gem_exec[1].relocation_count = 2;
> +		gem_exec[1].relocs_ptr = to_user_pointer(reloc);
> +	}
>  
>  	memset(&execbuf, 0, sizeof(execbuf));
> +	execbuf.flags |= I915_EXEC_NO_RELOC;
>  	execbuf.buffers_ptr = to_user_pointer(gem_exec);
>  	execbuf.buffer_count = 2;
>  	execbuf.batch_len = (b - buf) * sizeof(*b);
> @@ -116,15 +132,22 @@ static void selfcopy(int fd, uint32_t ctx, uint32_t handle, int loops)
>  		execbuf.flags |= I915_EXEC_BLT;
>  	execbuf.rsvd1 = ctx;
>  
> -	memset(&gem_pwrite, 0, sizeof(gem_pwrite));
> -	gem_pwrite.handle = create.handle;
> -	gem_pwrite.offset = 0;
> -	gem_pwrite.size = sizeof(buf);
> -	gem_pwrite.data_ptr = to_user_pointer(buf);
> -	if (drmIoctl(fd, DRM_IOCTL_I915_GEM_PWRITE, &gem_pwrite) == 0) {
> +	err = __gem_write(fd, create.handle, 0, buf, sizeof(buf));
> +	if (err == -EOPNOTSUPP) {
> +		void *ptr;
> +
> +		ptr = __gem_mmap__device_coherent(fd, create.handle, 0, sizeof(buf), PROT_WRITE);
> +		if (!ptr) {
> +			err = errno;
> +		} else {
> +			memcpy(ptr, buf, sizeof(buf));
> +			gem_munmap(ptr, sizeof(buf));
> +		}
> +	}
> +
> +	if (!err)
>  		while (loops-- && __gem_execbuf(fd, &execbuf) == 0)
>  			;
> -	}
>  
>  	drmIoctl(fd, DRM_IOCTL_GEM_CLOSE, &create.handle);
>  }
> @@ -256,6 +279,11 @@ igt_main
>  
>  		devid = intel_get_drm_devid(fd);
>  		has_64bit_relocations = intel_gen(devid) >= 8;
> +		has_softpin = !gem_has_relocations(fd);
> +		exec_addr = gem_detect_safe_start_offset(fd);
> +		data_addr = gem_detect_safe_alignment(fd);
> +		exec_addr = max_t(exec_addr, exec_addr, data_addr);
> +		data_addr += exec_addr;
>  
>  		igt_fork_hang_detector(fd);
>  		close(fd);
> -- 
> 2.34.1
> 
