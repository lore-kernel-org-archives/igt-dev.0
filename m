Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB6D89A5E
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Mar 2023 13:58:40 +0000 (UTC)
Message-ID: <0e2a5abf-8a77-0e28-9260-bd02b8854854@intel.com>
Date: Mon, 27 Mar 2023 15:58:43 +0200
Content-Language: en-US
To: Vikas Srivastava <vikas.srivastava@intel.com>
References: <20230324133346.2284000-1-vikas.srivastava@intel.com>
 <20230324133346.2284000-4-vikas.srivastava@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230324133346.2284000-4-vikas.srivastava@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] tests/i915/gem_userptr_blits:
 Enable XY_FAST_COPY_BLT Command for gen12+
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

On 24.03.2023 14:33, Vikas Srivastava wrote:
> Test case uses legacy command XY_SRC_COPY_BLT_CMD which is
> not supported on newer platforms. Modified test
> to use XY_FAST_COPY_BLT.
> 
> Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
> ---
>   tests/i915/gem_userptr_blits.c | 82 +++++++++++++++++++++-------------
>   1 file changed, 52 insertions(+), 30 deletions(-)
> 
> diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
> index 07a453229a..dba11efb88 100644
> --- a/tests/i915/gem_userptr_blits.c
> +++ b/tests/i915/gem_userptr_blits.c
> @@ -66,6 +66,7 @@
>   #include "sw_sync.h"
>   
>   #include "eviction_common.c"
> +#include "i915/i915_blt.h"
>   
>   #ifndef PAGE_SIZE
>   #define PAGE_SIZE 4096
> @@ -99,6 +100,7 @@ static int copy(int fd, uint32_t dst, uint32_t src)
>   	struct drm_i915_gem_relocation_entry reloc[2];
>   	struct drm_i915_gem_exec_object2 obj[3];
>   	struct drm_i915_gem_execbuffer2 exec;
> +	static uint32_t devid;
>   	uint32_t handle;
>   	int ret, i=0;
>   	uint64_t dst_offset, src_offset, bb_offset;
> @@ -108,29 +110,48 @@ static int copy(int fd, uint32_t dst, uint32_t src)
>   	dst_offset = bb_offset + 4096;
>   	src_offset = dst_offset + WIDTH * HEIGHT * sizeof(uint32_t) * (src != dst);
>   
> -	batch[i++] = XY_SRC_COPY_BLT_CMD |
> -		  XY_SRC_COPY_BLT_WRITE_ALPHA |
> -		  XY_SRC_COPY_BLT_WRITE_RGB;
> -	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> -		batch[i - 1] |= 8;
> -	else
> -		batch[i - 1] |= 6;
> -
> -	batch[i++] = (3 << 24) | /* 32 bits */
> -		  (0xcc << 16) | /* copy ROP */
> -		  WIDTH*4;
> -	batch[i++] = 0; /* dst x1,y1 */
> -	batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
> -	batch[i++] = dst_offset; /* dst reloc */
> -	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> -		batch[i++] = dst_offset >> 32;
> -	batch[i++] = 0; /* src x1,y1 */
> -	batch[i++] = WIDTH*4;
> -	batch[i++] = src_offset; /* src reloc */
> -	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> -		batch[i++] = src_offset >> 32;
> -	batch[i++] = MI_BATCH_BUFFER_END;
> -	batch[i++] = MI_NOOP;
> +	devid = intel_get_drm_devid(fd);
> +
> +	if (blt_has_fast_copy(fd)) {

Apart from two small comments, the patch looks good, but please could 
you check if you have to re-order the checks here as well? We still 
don't have full run results, so you can either wait for the results or 
test it locally on SKL or KBL.

> +		batch[i++] = XY_FAST_COPY_BLT;
> +		batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH * 4;
> +		batch[i++] = 0;/* dst x1,y1 */
> +		batch[i++] = (HEIGHT << 16) | WIDTH;/* dst x2,y2 */
> +		batch[i++] = lower_32_bits(dst_offset); /* dst address */
> +		batch[i++] = upper_32_bits(CANONICAL(dst_offset));
> +		batch[i++] = 0;/* src x1,y1 */
> +		batch[i++] = WIDTH * 4;/* src pitch */
> +		batch[i++] = lower_32_bits(src_offset); /* src address */
> +		batch[i++] = upper_32_bits(CANONICAL(src_offset));
> +		batch[i++] = MI_BATCH_BUFFER_END;
> +		batch[i++] = MI_NOOP;
> +	} else if (blt_has_xy_src_copy(fd)) {
> +		batch[i++] = XY_SRC_COPY_BLT_CMD |
> +			     XY_SRC_COPY_BLT_WRITE_ALPHA |
> +			     XY_SRC_COPY_BLT_WRITE_RGB;
> +
> +		if (intel_gen(devid) >= 8)
> +			batch[i - 1] |= 8;
> +		else
> +			batch[i - 1] |= 6;
> +
> +		batch[i++] = (3 << 24) | /* 32 bits */
> +			  (0xcc << 16) | /* copy ROP */
> +			  WIDTH * 4;
> +		batch[i++] = 0; /* dst x1,y1 */
> +		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
> +		batch[i++] = lower_32_bits(dst_offset); /*dst reloc*/

nit: Add spaces to "dst reloc", as it seems like it was how it was 
defined before.

> +		if (intel_gen(devid) >= 8)
> +			batch[i++] = upper_32_bits(CANONICAL(dst_offset));
> +		batch[i++] = 0; /* src x1,y1 */
> +		batch[i++] = WIDTH * 4;
> +		batch[i++] = lower_32_bits(src_offset); /* src reloc */
> +		if (intel_gen(devid) >= 8)
> +			batch[i++] = upper_32_bits(CANONICAL(src_offset));
> +		batch[i++] = MI_BATCH_BUFFER_END;
> +		batch[i++] = MI_NOOP;
> +	} else
> +		igt_assert_f(0, "No supported blit command found\n");

Similar comment to the one I gave earlier -- it would be good to balance 
the brackets in this section.

Many thanks,
Karolina
>   
>   	handle = gem_create(fd, 4096);
>   	gem_write(fd, handle, 0, batch, sizeof(batch));
> @@ -254,20 +275,20 @@ blit(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
>   	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
>   	reloc[1].write_domain = 0;
>   
> -	if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
> +	if (blt_has_fast_copy(fd)) {
>   		batch[i++] = XY_FAST_COPY_BLT;
> -		batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH*4;
> +		batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH * 4;
>   		batch[i++] = 0; /* dst x1,y1 */
>   		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
>   		batch[i++] = lower_32_bits(dst_offset); /* dst address */
>   		batch[i++] = upper_32_bits(CANONICAL(dst_offset));
>   		batch[i++] = 0; /* src x1,y1 */
> -		batch[i++] = WIDTH*4; /* src pitch */
> +		batch[i++] = WIDTH * 4; /* src pitch */
>   		batch[i++] = lower_32_bits(src_offset); /* src address */
>   		batch[i++] = upper_32_bits(CANONICAL(src_offset));
>   		batch[i++] = MI_BATCH_BUFFER_END;
>   		batch[i++] = MI_NOOP;
> -	} else {
> +	} else if (blt_has_xy_src_copy(fd)) {
>   		batch[i++] = XY_SRC_COPY_BLT_CMD |
>   			     XY_SRC_COPY_BLT_WRITE_ALPHA |
>   			     XY_SRC_COPY_BLT_WRITE_RGB;
> @@ -277,20 +298,21 @@ blit(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
>   			batch[i - 1] |= 6;
>   		batch[i++] = (3 << 24) | /* 32 bits */
>   			     (0xcc << 16) | /* copy ROP */
> -			     WIDTH*4;
> +			     WIDTH * 4;
>   		batch[i++] = 0; /* dst x1,y1 */
>   		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
>   		batch[i++] = lower_32_bits(dst_offset);
>   		if (intel_gen(devid) >= 8)
>   			batch[i++] = upper_32_bits(CANONICAL(dst_offset));
>   		batch[i++] = 0; /* src x1,y1 */
> -		batch[i++] = WIDTH*4;
> +		batch[i++] = WIDTH * 4;
>   		batch[i++] = lower_32_bits(src_offset);
>   		if (intel_gen(devid) >= 8)
>   			batch[i++] = upper_32_bits(CANONICAL(src_offset));
>   		batch[i++] = MI_BATCH_BUFFER_END;
>   		batch[i++] = MI_NOOP;
> -	}
> +	} else
> +		igt_assert_f(0, "No supported blit command found\n");
>   
>   	gem_write(fd, handle, 0, batch, sizeof(batch));
>   
