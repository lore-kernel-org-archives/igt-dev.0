Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D5F10E1DB
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Mar 2023 06:40:43 +0000 (UTC)
Date: Mon, 20 Mar 2023 07:40:39 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Message-ID: <20230320064039.q6lxjb4mk3nagukc@zkempczy-mobl2>
References: <cover.1679055766.git.karolina.stolarek@intel.com>
 <33332fb94164e9b461e46cf396e56720c68c9bf6.1679055766.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33332fb94164e9b461e46cf396e56720c68c9bf6.1679055766.git.karolina.stolarek@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 8/9] lib/intel_batchbuffer: Handle no
 support for Tile Y
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

On Fri, Mar 17, 2023 at 01:37:10PM +0100, Karolina Stolarek wrote:
> Newer generations stopped supporting legacy Tile Y format.
> In order to do a Y-Major blit, the command has to use Tile4
> format, which requires setting specific blits in the first
> bit group of the XY_FAST_COPY_BLT command.
> 
> Rewrite fast_copy_dword1 function to always set them when
> a platform doesn't support the legacy format. Update calls
> to the function to include file descriptor parameter.
> 
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/intel_batchbuffer.c | 26 +++++++++++++++++---------
>  lib/intel_batchbuffer.h |  2 +-
>  tests/i915/gem_blits.c  |  9 ++++++---
>  3 files changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 1b999ca5..24728d4a 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -32,7 +32,6 @@
>  #include "intel_batchbuffer.h"
>  #include "intel_bufops.h"
>  #include "intel_chipset.h"
> -#include "rendercopy.h"
>  #include "media_fill.h"
>  #include "media_spin.h"
>  #include "i915/gem_mman.h"
> @@ -40,6 +39,7 @@
>  #include "sw_sync.h"
>  #include "gpgpu_fill.h"
>  #include "huc_copy.h"
> +#include "i915/i915_blt.h"
>  
>  #define BCS_SWCTRL 0x22200
>  #define BCS_SRC_Y (1 << 0)
> @@ -122,18 +122,26 @@ uint32_t fast_copy_dword0(unsigned int src_tiling,
>  	return dword0;
>  }
>  
> +static bool new_tile_y_format(unsigned int tiling)
> +{
> +	return tiling == T_YFMAJOR || tiling == T_TILE4;
> +}
> +
>  uint32_t fast_copy_dword1(unsigned int src_tiling,
>  			  unsigned int dst_tiling,
> -			  int bpp)
> +			  int bpp, int fd)

Use fd as first argument, other api also uses it as first arg;
then:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  {
>  	uint32_t dword1 = 0;
>  
> -	if (src_tiling == I915_TILING_Yf || src_tiling == I915_TILING_4)
> -		/* Repurposed as Tile-4 on DG2 */
> -		dword1 |= XY_FAST_COPY_SRC_TILING_Yf;
> -	if (dst_tiling == I915_TILING_Yf || dst_tiling == I915_TILING_4)
> -		/* Repurposed as Tile-4 on DG2 */
> -		dword1 |= XY_FAST_COPY_DST_TILING_Yf;
> +	if (blt_fast_copy_supports_tiling(fd, T_YMAJOR)) {
> +		dword1 |= new_tile_y_format(src_tiling)
> +				? XY_FAST_COPY_SRC_TILING_Yf : 0;
> +		dword1 |= new_tile_y_format(dst_tiling)
> +				? XY_FAST_COPY_DST_TILING_Yf : 0;
> +	} else {
> +		/* Always set bits for platforms that don't support legacy TileY */
> +		dword1 |= XY_FAST_COPY_SRC_TILING_Yf | XY_FAST_COPY_DST_TILING_Yf;
> +	}
>  
>  	switch (bpp) {
>  	case 8:
> @@ -582,7 +590,7 @@ void igt_blitter_fast_copy__raw(int fd,
>  	src_pitch = fast_copy_pitch(src_stride, src_tiling);
>  	dst_pitch = fast_copy_pitch(dst_stride, dst_tiling);
>  	dword0 = fast_copy_dword0(src_tiling, dst_tiling);
> -	dword1 = fast_copy_dword1(src_tiling, dst_tiling, bpp);
> +	dword1 = fast_copy_dword1(src_tiling, dst_tiling, bpp, fd);
>  
>  	CHECK_RANGE(src_x); CHECK_RANGE(src_y);
>  	CHECK_RANGE(dst_x); CHECK_RANGE(dst_y);
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index aed1d575..fb244c2b 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -35,7 +35,7 @@ uint32_t fast_copy_dword0(unsigned int src_tiling,
>  			  unsigned int dst_tiling);
>  uint32_t fast_copy_dword1(unsigned int src_tiling,
>  			  unsigned int dst_tiling,
> -			  int bpp);
> +			  int bpp, int fd);
>  void igt_blitter_copy(int fd,
>  		      uint64_t ahnd,
>  		      uint32_t ctx,
> diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
> index 1414826c..0d4655f8 100644
> --- a/tests/i915/gem_blits.c
> +++ b/tests/i915/gem_blits.c
> @@ -224,7 +224,8 @@ static void buffer_set_tiling(const struct device *device,
>  		batch[i++] = 3 << 24 | 0xcc << 16 | pitch;
>  	} else if (blt_has_fast_copy(device->fd)) {
>  		batch[i++] = fast_copy_dword0(buffer->tiling, tiling);
> -		dword1 = fast_copy_dword1(buffer->tiling, tiling, 32);
> +		dword1 = fast_copy_dword1(buffer->tiling, tiling,
> +					  32, device->fd);
>  		batch[i++] = dword1 | pitch;
>  	} else {
>  		igt_assert_f(0, "No supported blit command found\n");
> @@ -371,7 +372,8 @@ static bool blit_to_linear(const struct device *device,
>  		batch[i++] = 3 << 24 | 0xcc << 16 | buffer->stride;
>  	} else if (blt_has_fast_copy(device->fd)) {
>  		batch[i++] = fast_copy_dword0(buffer->tiling, I915_TILING_NONE);
> -		dword1 = fast_copy_dword1(buffer->tiling, I915_TILING_NONE, 32);
> +		dword1 = fast_copy_dword1(buffer->tiling, I915_TILING_NONE,
> +					  32, device->fd);
>  		batch[i++] = dword1 | buffer->stride;
>  	} else {
>  		igt_assert_f(0, "No supported blit command found\n");
> @@ -719,7 +721,8 @@ blit(const struct device *device,
>  		batch[i++] = 3 << 24 | 0xcc << 16 | pitch;
>  	} else if (blt_has_fast_copy(device->fd)) {
>  		batch[i++] = fast_copy_dword0(src->tiling, dst->tiling);
> -		dword1 = fast_copy_dword1(src->tiling, dst->tiling, 32);
> +		dword1 = fast_copy_dword1(src->tiling, dst->tiling,
> +					  32, device->fd);
>  		batch[i++] = dword1 | pitch;
>  	} else {
>  		igt_assert_f(0, "No supported blit command found\n");
> -- 
> 2.25.1
> 
