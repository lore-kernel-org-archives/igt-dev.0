Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7CF10E1DB
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Mar 2023 06:36:05 +0000 (UTC)
Date: Mon, 20 Mar 2023 07:36:00 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230320063600.wosbem32jmnoaitn@zkempczy-mobl2>
References: <cover.1679055766.git.karolina.stolarek@intel.com>
 <f33395c3b788c934de5b9910ca5cf3c07426a6e8.1679055766.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f33395c3b788c934de5b9910ca5cf3c07426a6e8.1679055766.git.karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 4/9] tests/i915/gem_blits: Use new
 copy instruction
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Arjun Melkaveri <arjun.melkaveri@intel.com>,
 Fei Yang <fei.yang@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 01:37:06PM +0100, Karolina Stolarek wrote:
> From: Arjun Melkaveri <arjun.melkaveri@intel.com>
> 
> The test uses legacy command which is not supported on
> newer GPU generations. Use XY_FAST_COPY_BLT on newer GPU generations.
> 

Forgot to add in review:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> Co-developed-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> ---
>  lib/intel_batchbuffer.c | 10 ++---
>  lib/intel_batchbuffer.h |  6 +++
>  tests/i915/gem_blits.c  | 90 ++++++++++++++++++++++++++---------------
>  3 files changed, 68 insertions(+), 38 deletions(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 7bb24c8f..a2bf5d2e 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -92,8 +92,8 @@ static uint32_t fast_copy_pitch(unsigned int stride, unsigned int tiling)
>  		return stride;
>  }
>  
> -static uint32_t fast_copy_dword0(unsigned int src_tiling,
> -				 unsigned int dst_tiling)
> +uint32_t fast_copy_dword0(unsigned int src_tiling,
> +			  unsigned int dst_tiling)
>  {
>  	uint32_t dword0 = 0;
>  
> @@ -136,9 +136,9 @@ static uint32_t fast_copy_dword0(unsigned int src_tiling,
>  	return dword0;
>  }
>  
> -static uint32_t fast_copy_dword1(unsigned int src_tiling,
> -				 unsigned int dst_tiling,
> -				 int bpp)
> +uint32_t fast_copy_dword1(unsigned int src_tiling,
> +			  unsigned int dst_tiling,
> +			  int bpp)
>  {
>  	uint32_t dword1 = 0;
>  
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index 37db0ffa..81830d77 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -31,6 +31,12 @@ enum i915_compression {
>  	I915_COMPRESSION_MEDIA,
>  };
>  
> +uint32_t fast_copy_dword0(unsigned int src_tiling,
> +			  unsigned int dst_tiling);
> +uint32_t fast_copy_dword1(unsigned int src_tiling,
> +			  unsigned int dst_tiling,
> +			  int bpp);
> +
>  void igt_blitter_src_copy(int fd,
>  			  uint64_t ahnd,
>  			  uint32_t ctx,
> diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
> index 9ea3925c..1414826c 100644
> --- a/tests/i915/gem_blits.c
> +++ b/tests/i915/gem_blits.c
> @@ -22,10 +22,12 @@
>   *
>   */
>  
> +#include "intel_batchbuffer.h"
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
>  #include "igt_x86.h"
> +#include "i915/i915_blt.h"
>  
>  #define BCS_SWCTRL 0x22200
>  #define BCS_SRC_Y (1 << 0)
> @@ -145,8 +147,7 @@ static void buffer_set_tiling(const struct device *device,
>  	struct drm_i915_gem_relocation_entry reloc[2];
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	const bool has_64b_reloc = device->gen >= 8;
> -	uint32_t stride, size, pitch;
> -	uint32_t *batch;
> +	uint32_t stride, size, pitch, *batch, dword1;
>  	int i;
>  
>  	if (buffer->tiling == tiling)
> @@ -207,19 +208,28 @@ static void buffer_set_tiling(const struct device *device,
>  		batch[i++] = mask;
>  	}
>  
> -	batch[i] = (XY_SRC_COPY_BLT_CMD |
> -		    XY_SRC_COPY_BLT_WRITE_ALPHA |
> -		    XY_SRC_COPY_BLT_WRITE_RGB);
> -	if (device->gen >= 4 && buffer->tiling)
> -		batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
> -	if (device->gen >= 4 && tiling)
> -		batch[i] |= XY_SRC_COPY_BLT_DST_TILED;
> -	batch[i++] |= 6 + 2 * has_64b_reloc;
> -
>  	pitch = stride;
>  	if (device->gen >= 4 && tiling)
>  		pitch /= 4;
> -	batch[i++] = 3 << 24 | 0xcc << 16 | pitch;
> +
> +	if (blt_has_xy_src_copy(device->fd)) {
> +		batch[i] = (XY_SRC_COPY_BLT_CMD |
> +			    XY_SRC_COPY_BLT_WRITE_ALPHA |
> +			    XY_SRC_COPY_BLT_WRITE_RGB);
> +		if (device->gen >= 4 && buffer->tiling)
> +			batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
> +		if (device->gen >= 4 && tiling)
> +			batch[i] |= XY_SRC_COPY_BLT_DST_TILED;
> +		batch[i++] |= 6 + 2 * has_64b_reloc;
> +		batch[i++] = 3 << 24 | 0xcc << 16 | pitch;
> +	} else if (blt_has_fast_copy(device->fd)) {
> +		batch[i++] = fast_copy_dword0(buffer->tiling, tiling);
> +		dword1 = fast_copy_dword1(buffer->tiling, tiling, 32);
> +		batch[i++] = dword1 | pitch;
> +	} else {
> +		igt_assert_f(0, "No supported blit command found\n");
> +	}
> +
>  	batch[i++] = 0;
>  	batch[i++] = buffer->height << 16 | buffer->width;
>  	reloc[0].target_handle = obj[0].handle;
> @@ -296,8 +306,7 @@ static bool blit_to_linear(const struct device *device,
>  	struct drm_i915_gem_relocation_entry reloc[2];
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	const bool has_64b_reloc = device->gen >= 8;
> -	uint32_t *batch;
> -	uint32_t pitch;
> +	uint32_t *batch, pitch, dword1;
>  	int i = 0;
>  
>  	igt_assert(buffer->tiling);
> @@ -352,14 +361,22 @@ static bool blit_to_linear(const struct device *device,
>  		batch[i++] = mask;
>  	}
>  
> -	batch[i] = (XY_SRC_COPY_BLT_CMD |
> -		    XY_SRC_COPY_BLT_WRITE_ALPHA |
> -		    XY_SRC_COPY_BLT_WRITE_RGB);
> -	if (device->gen >= 4 && buffer->tiling)
> -		batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
> -	batch[i++] |= 6 + 2 * has_64b_reloc;
> +	if (blt_has_xy_src_copy(device->fd)) {
> +		batch[i] = (XY_SRC_COPY_BLT_CMD |
> +			    XY_SRC_COPY_BLT_WRITE_ALPHA |
> +			    XY_SRC_COPY_BLT_WRITE_RGB);
> +		if (device->gen >= 4 && buffer->tiling)
> +			batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
> +		batch[i++] |= 6 + 2 * has_64b_reloc;
> +		batch[i++] = 3 << 24 | 0xcc << 16 | buffer->stride;
> +	} else if (blt_has_fast_copy(device->fd)) {
> +		batch[i++] = fast_copy_dword0(buffer->tiling, I915_TILING_NONE);
> +		dword1 = fast_copy_dword1(buffer->tiling, I915_TILING_NONE, 32);
> +		batch[i++] = dword1 | buffer->stride;
> +	} else {
> +		igt_assert_f(0, "No supported blit command found\n");
> +	}
>  
> -	batch[i++] = 3 << 24 | 0xcc << 16 | buffer->stride;
>  	batch[i++] = 0;
>  	batch[i++] = buffer->height << 16 | buffer->width;
>  	reloc[0].target_handle = obj[0].handle;
> @@ -598,8 +615,7 @@ blit(const struct device *device,
>  	struct drm_i915_gem_relocation_entry reloc[2];
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	const bool has_64b_reloc = device->gen >= 8;
> -	uint32_t *batch;
> -	uint32_t pitch;
> +	uint32_t *batch, dword1, pitch;
>  	int i = 0;
>  
>  	if (src_x < 0) {
> @@ -687,19 +703,27 @@ blit(const struct device *device,
>  		batch[i++] = mask;
>  	}
>  
> -	batch[i] = (XY_SRC_COPY_BLT_CMD |
> -		    XY_SRC_COPY_BLT_WRITE_ALPHA |
> -		    XY_SRC_COPY_BLT_WRITE_RGB);
> -	if (device->gen >= 4 && src->tiling)
> -		batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
> -	if (device->gen >= 4 && dst->tiling)
> -		batch[i] |= XY_SRC_COPY_BLT_DST_TILED;
> -	batch[i++] |= 6 + 2 * has_64b_reloc;
> -
>  	pitch = dst->stride;
>  	if (device->gen >= 4 && dst->tiling)
>  		pitch /= 4;
> -	batch[i++] = 3 << 24 | 0xcc << 16 | pitch;
> +
> +	if (blt_has_xy_src_copy(device->fd)) {
> +		batch[i] = (XY_SRC_COPY_BLT_CMD |
> +			    XY_SRC_COPY_BLT_WRITE_ALPHA |
> +			    XY_SRC_COPY_BLT_WRITE_RGB);
> +		if (device->gen >= 4 && src->tiling)
> +			batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
> +		if (device->gen >= 4 && dst->tiling)
> +			batch[i] |= XY_SRC_COPY_BLT_DST_TILED;
> +		batch[i++] |= 6 + 2 * has_64b_reloc;
> +		batch[i++] = 3 << 24 | 0xcc << 16 | pitch;
> +	} else if (blt_has_fast_copy(device->fd)) {
> +		batch[i++] = fast_copy_dword0(src->tiling, dst->tiling);
> +		dword1 = fast_copy_dword1(src->tiling, dst->tiling, 32);
> +		batch[i++] = dword1 | pitch;
> +	} else {
> +		igt_assert_f(0, "No supported blit command found\n");
> +	}
>  
>  	batch[i++] = dst_y << 16 | dst_x;
>  	batch[i++] = (height + dst_y) << 16 | (width + dst_x);
> -- 
> 2.25.1
> 
