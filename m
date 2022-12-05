Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE19110E0EE
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Dec 2022 14:59:54 +0000 (UTC)
Date: Mon, 5 Dec 2022 15:59:50 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y44HZrjTZFah77vt@kamilkon-desk1>
References: <20221125111602.266694-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221125111602.266694-1-vikas.srivastava@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915: Added XY_FAST_COPY_BLT
 support for gem_blits
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

Hi Vikas,

please change subject to
tests/i915/gem_blits: Added XY_FAST_COPY_BLT support for gen12+

and resend.

See also below, I have one question.

On 2022-11-25 at 16:46:02 +0530, Vikas Srivastava wrote:
> From: Arjun Melkaveri <arjun.melkaveri@intel.com>
> 
> Test case uses legacy command which is not supported starting from PVC.
> Modified test to use XY_FAST_COPY_BLT.
> 
> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
> Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  lib/intel_batchbuffer.c | 33 ++++++++++++---
>  lib/intel_batchbuffer.h |  6 +++
>  tests/i915/gem_blits.c  | 94 ++++++++++++++++++++++++++---------------
>  3 files changed, 94 insertions(+), 39 deletions(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 19a1fbe4d..6a61cbd2f 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -605,8 +605,19 @@ static uint32_t fast_copy_pitch(unsigned int stride, unsigned int tiling)
>  		return stride;
>  }
>  
> -static uint32_t fast_copy_dword0(unsigned int src_tiling,
> -				 unsigned int dst_tiling)
> +/**
> + * fast_copy_dword0:
> + * @src_tiling: The tile format supported by source
> + * @dst_tiling: The tile format supported by destination
> + *
> + * Set the source and destination tile format types bits for fast copy.
> + *
> + * Returns:
> + * The dwords that will conatin the set bit for source and destination tiling.
> + */
> +
> +uint32_t fast_copy_dword0(unsigned int src_tiling,
> +			  unsigned int dst_tiling)
>  {
>  	uint32_t dword0 = 0;
>  
> @@ -649,9 +660,21 @@ static uint32_t fast_copy_dword0(unsigned int src_tiling,
>  	return dword0;
>  }
>  
> -static uint32_t fast_copy_dword1(unsigned int src_tiling,
> -				 unsigned int dst_tiling,
> -				 int bpp)
> +/**
> + * fast_copy_dword1:
> + * @src_tiling: The tile format supported by source
> + * @dst_tiling: The tile format supported by destination
> + * @bpp: Fast copy color depth parameter
> +
> + * Set the source and destination tile format types and color depth bits for fast copy.
> + *
> + * Returns:
> + * The dword1 that will conatin the set bit for color depth and source ,destination tiling.
> + */
> +
> +uint32_t fast_copy_dword1(unsigned int src_tiling,
> +			  unsigned int dst_tiling,
> +			  int bpp)
>  {
>  	uint32_t dword1 = 0;
>  
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index 2c19c39b1..5ce719951 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -271,6 +271,12 @@ unsigned int igt_buf_intel_ccs_width(unsigned int gen,
>  unsigned int igt_buf_intel_ccs_height(unsigned int gen,
>  				      const struct igt_buf *buf);
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
> index 24e83b9f5..63dea350c 100644
> --- a/tests/i915/gem_blits.c
> +++ b/tests/i915/gem_blits.c
> @@ -22,6 +22,7 @@
>   *
>   */
>  
> +#include "intel_batchbuffer.h"
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> @@ -33,6 +34,8 @@
>  #define BCS_SRC_Y (1 << 0)
>  #define BCS_DST_Y (1 << 1)
>  
> +static uint32_t devid;
> +
>  struct device {
>  	int fd;
>  	int gen;
> @@ -147,8 +150,7 @@ static void buffer_set_tiling(const struct device *device,
>  	struct drm_i915_gem_relocation_entry reloc[2];
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	const bool has_64b_reloc = device->gen >= 8;
> -	uint32_t stride, size, pitch;
> -	uint32_t *batch;
> +	uint32_t stride, size, pitch, *batch, dword1;
>  	int i;
>  
>  	if (buffer->tiling == tiling)
> @@ -209,19 +211,28 @@ static void buffer_set_tiling(const struct device *device,
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
> +	if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
> +		batch[i++] = fast_copy_dword0(buffer->tiling, tiling);
> +		/* PVC requires tile4 bit to be set for YMAJOR mode */

There is comment here but I do not see any checks for PVC ?

> +		dword1 = fast_copy_dword1(
> +				(buffer->tiling) ? I915_TILING_Yf : I915_TILING_NONE,
> +				(tiling) ? I915_TILING_Yf : I915_TILING_NONE, 32);

Is it valid for other gen12+ platforms ?
Maybe lib function should get also devid so it will provide it
for user and above line should be put in lib.

Regards,
Kamil

> +		batch[i++] = dword1 | pitch;
> +	} else {
> +		batch[i] = (XY_SRC_COPY_BLT_CMD |
> +			    XY_SRC_COPY_BLT_WRITE_ALPHA |
> +			    XY_SRC_COPY_BLT_WRITE_RGB);
> +		if (device->gen >= 4 && buffer->tiling)
> +			batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
> +		if (device->gen >= 4 && tiling)
> +			batch[i] |= XY_SRC_COPY_BLT_DST_TILED;
> +		batch[i++] |= 6 + 2 * has_64b_reloc;
> +		batch[i++] = 3 << 24 | 0xcc << 16 | pitch;
> +	}
>  	batch[i++] = 0;
>  	batch[i++] = buffer->height << 16 | buffer->width;
>  	reloc[0].target_handle = obj[0].handle;
> @@ -298,8 +309,7 @@ static bool blit_to_linear(const struct device *device,
>  	struct drm_i915_gem_relocation_entry reloc[2];
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	const bool has_64b_reloc = device->gen >= 8;
> -	uint32_t *batch;
> -	uint32_t pitch;
> +	uint32_t *batch, pitch, dword1;
>  	int i = 0;
>  
>  	igt_assert(buffer->tiling);
> @@ -354,14 +364,22 @@ static bool blit_to_linear(const struct device *device,
>  		batch[i++] = mask;
>  	}
>  
> -	batch[i] = (XY_SRC_COPY_BLT_CMD |
> -		    XY_SRC_COPY_BLT_WRITE_ALPHA |
> -		    XY_SRC_COPY_BLT_WRITE_RGB);
> -	if (device->gen >= 4 && buffer->tiling)
> -		batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
> -	batch[i++] |= 6 + 2 * has_64b_reloc;
> -
> -	batch[i++] = 3 << 24 | 0xcc << 16 | buffer->stride;
> +	if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
> +		batch[i++] = fast_copy_dword0(buffer->tiling, 0);
> +		/* PVC requires tile4 bit to be set for YMAJOR mode */
> +		dword1 = fast_copy_dword1(
> +				(buffer->tiling) ? I915_TILING_Yf : I915_TILING_NONE,
> +				0, 32);
> +		batch[i++] = dword1 | buffer->stride;
> +	} else {
> +		batch[i] = (XY_SRC_COPY_BLT_CMD |
> +			    XY_SRC_COPY_BLT_WRITE_ALPHA |
> +			    XY_SRC_COPY_BLT_WRITE_RGB);
> +		if (device->gen >= 4 && buffer->tiling)
> +			batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
> +		batch[i++] |= 6 + 2 * has_64b_reloc;
> +		batch[i++] = 3 << 24 | 0xcc << 16 | buffer->stride;
> +	}
>  	batch[i++] = 0;
>  	batch[i++] = buffer->height << 16 | buffer->width;
>  	reloc[0].target_handle = obj[0].handle;
> @@ -600,8 +618,7 @@ blit(const struct device *device,
>  	struct drm_i915_gem_relocation_entry reloc[2];
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	const bool has_64b_reloc = device->gen >= 8;
> -	uint32_t *batch;
> -	uint32_t pitch;
> +	uint32_t *batch, dword1, pitch;
>  	int i = 0;
>  
>  	if (src_x < 0) {
> @@ -689,20 +706,29 @@ blit(const struct device *device,
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
>  
> +	if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
> +		batch[i++] = fast_copy_dword0(src->tiling, dst->tiling);
> +		/* PVC requires tile4 bit to be set for YMAJOR mode */
> +		dword1 = fast_copy_dword1(
> +				(src->tiling) ? I915_TILING_Yf : I915_TILING_NONE,
> +				(dst->tiling) ? I915_TILING_Yf : I915_TILING_NONE,
> +				32);
> +		batch[i++] = dword1 | pitch;
> +	} else {
> +		batch[i] = (XY_SRC_COPY_BLT_CMD |
> +			    XY_SRC_COPY_BLT_WRITE_ALPHA |
> +			    XY_SRC_COPY_BLT_WRITE_RGB);
> +		if (device->gen >= 4 && src->tiling)
> +			batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
> +		if (device->gen >= 4 && dst->tiling)
> +			batch[i] |= XY_SRC_COPY_BLT_DST_TILED;
> +		batch[i++] |= 6 + 2 * has_64b_reloc;
> +		batch[i++] = 3 << 24 | 0xcc << 16 | pitch;
> +	}
>  	batch[i++] = dst_y << 16 | dst_x;
>  	batch[i++] = (height + dst_y) << 16 | (width + dst_x);
>  	reloc[0].target_handle = obj[0].handle;
> -- 
> 2.25.1
> 
