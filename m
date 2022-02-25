Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A88E10E212
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 08:37:01 +0000 (UTC)
Date: Fri, 25 Feb 2022 10:37:04 +0200
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Jeevan B <jeevan.b@intel.com>
Message-ID: <20220225083704.GA29898@intel.com>
References: <20220225050853.8349-1-jeevan.b@intel.com>
 <20220225050853.8349-4-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225050853.8349-4-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 03/10] igt/lib: Add tile 4(F-tile)
 format support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com,
 petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 25, 2022 at 10:38:46AM +0530, Jeevan B wrote:
> Introduce support for the new Tile4 format, which is
> 4K column-major tiles consisting of 64B row-major subtiles,
> with same base structure as Y Tile(16B OWords * 4)
> 
> v2: place I915_TILING_4 correctly.
> 
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> ---
>  lib/gpu_cmds.c          | 4 ++--
>  lib/igt_draw.c          | 7 ++++++-
>  lib/igt_fb.c            | 7 +++++++
>  lib/intel_batchbuffer.c | 8 ++++++--
>  lib/intel_batchbuffer.h | 7 ++++---
>  5 files changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index a45a9048..c31b51f7 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -156,7 +156,7 @@ gen8_fill_surface_state(struct intel_bb *ibb,
>  
>  	if (buf->tiling == I915_TILING_X)
>  		ss->ss0.tiled_mode = 2;
> -	else if (buf->tiling == I915_TILING_Y)
> +	else if (buf->tiling == I915_TILING_Y || buf->tiling == I915_TILING_4)
>  		ss->ss0.tiled_mode = 3;
>  
>  	address = intel_bb_offset_reloc(ibb, buf->handle,
> @@ -211,7 +211,7 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>  
>  	if (buf->tiling == I915_TILING_X)
>  		ss->ss0.tiled_mode = 2;
> -	else if (buf->tiling == I915_TILING_Y)
> +	else if (buf->tiling == I915_TILING_Y || buf->tiling == I915_TILING_4)
>  		ss->ss0.tiled_mode = 3;
>  	else
>  		ss->ss0.tiled_mode = 0;
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 2af27b11..0ca43deb 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -271,7 +271,7 @@ static void switch_blt_tiling(struct intel_bb *ibb, uint32_t tiling, bool on)
>  	uint32_t bcs_swctrl;
>  
>  	/* Default is X-tile */
> -	if (tiling != I915_TILING_Y)
> +	if (tiling != I915_TILING_Y && tiling != I915_TILING_4)
>  		return;
>  
>  	igt_require(ibb->gen >= 6);
> @@ -318,6 +318,7 @@ static void draw_rect_ptr_tiled(void *ptr, uint32_t stride, uint32_t tiling,
>  							       swizzle, bpp);
>  				break;
>  			case I915_TILING_Y:
> +			case I915_TILING_4:
>  				pos = linear_x_y_to_ytiled_pos(x, y, stride,
>  							       swizzle, bpp);
>  				break;
> @@ -350,6 +351,7 @@ static void draw_rect_mmap_cpu(int fd, struct buf_data *buf, struct rect *rect,
>  		break;
>  	case I915_TILING_X:
>  	case I915_TILING_Y:
> +	case I915_TILING_4:
>  		draw_rect_ptr_tiled(ptr, buf->stride, tiling, swizzle, rect,
>  				    color, buf->bpp);
>  		break;
> @@ -409,6 +411,7 @@ static void draw_rect_mmap_wc(int fd, struct buf_data *buf, struct rect *rect,
>  		break;
>  	case I915_TILING_X:
>  	case I915_TILING_Y:
> +	case I915_TILING_4:
>  		draw_rect_ptr_tiled(ptr, buf->stride, tiling, swizzle, rect,
>  				    color, buf->bpp);
>  		break;
> @@ -467,6 +470,7 @@ static void draw_rect_pwrite_tiled(int fd, struct buf_data *buf,
>  						 swizzle, buf->bpp, &x, &y);
>  			break;
>  		case I915_TILING_Y:
> +		case I915_TILING_4:
>  			ytiled_pos_to_x_y_linear(tiled_pos, buf->stride,
>  						 swizzle, buf->bpp, &x, &y);
>  			break;
> @@ -507,6 +511,7 @@ static void draw_rect_pwrite(int fd, struct buf_data *buf,
>  		break;
>  	case I915_TILING_X:
>  	case I915_TILING_Y:
> +	case I915_TILING_4:
>  		draw_rect_pwrite_tiled(fd, buf, tiling, rect, color, swizzle);
>  		break;
>  	default:
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 1530b960..74ca5eec 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -456,6 +456,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
>  	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS:
>  	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
>  	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
> +	case I915_FORMAT_MOD_4_TILED:
>  		igt_require_intel(fd);
>  		if (intel_display_ver(intel_get_drm_devid(fd)) == 2) {
>  			*width_ret = 128;
> @@ -964,6 +965,8 @@ uint64_t igt_fb_mod_to_tiling(uint64_t modifier)
>  	case I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
>  	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
>  		return I915_TILING_Y;
> +	case I915_FORMAT_MOD_4_TILED:
> +		return I915_TILING_4;
>  	case I915_FORMAT_MOD_Yf_TILED:
>  	case I915_FORMAT_MOD_Yf_TILED_CCS:
>  		return I915_TILING_Yf;
> @@ -991,6 +994,8 @@ uint64_t igt_fb_tiling_to_mod(uint64_t tiling)
>  		return I915_FORMAT_MOD_X_TILED;
>  	case I915_TILING_Y:
>  		return I915_FORMAT_MOD_Y_TILED;
> +	case I915_TILING_4:
> +		return I915_FORMAT_MOD_4_TILED;
>  	case I915_TILING_Yf:
>  		return I915_FORMAT_MOD_Yf_TILED;
>  	default:
> @@ -4398,6 +4403,8 @@ const char *igt_fb_modifier_name(uint64_t modifier)
>  		return "Y-RC_CCS-CC";
>  	case I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
>  		return "Y-MC_CCS";
> +	case I915_FORMAT_MOD_4_TILED:
> +		return "4";
>  	default:
>  		return "?";
>  	}
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index e5666cd4..b4761e44 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -617,6 +617,7 @@ static uint32_t fast_copy_dword0(unsigned int src_tiling,
>  		dword0 |= XY_FAST_COPY_SRC_TILING_X;
>  		break;
>  	case I915_TILING_Y:
> +	case I915_TILING_4:
>  	case I915_TILING_Yf:
>  		dword0 |= XY_FAST_COPY_SRC_TILING_Yb_Yf;
>  		break;
> @@ -633,6 +634,7 @@ static uint32_t fast_copy_dword0(unsigned int src_tiling,
>  		dword0 |= XY_FAST_COPY_DST_TILING_X;
>  		break;
>  	case I915_TILING_Y:
> +	case I915_TILING_4:
>  	case I915_TILING_Yf:
>  		dword0 |= XY_FAST_COPY_DST_TILING_Yb_Yf;
>  		break;
> @@ -653,9 +655,11 @@ static uint32_t fast_copy_dword1(unsigned int src_tiling,
>  {
>  	uint32_t dword1 = 0;
>  
> -	if (src_tiling == I915_TILING_Yf)
> +	if (src_tiling == I915_TILING_Yf || src_tiling == I915_TILING_4)
> +		/* Repurposed as Tile-4 on DG2 */
>  		dword1 |= XY_FAST_COPY_SRC_TILING_Yf;
> -	if (dst_tiling == I915_TILING_Yf)
> +	if (dst_tiling == I915_TILING_Yf || src_tiling == I915_TILING_4)
> +		/* Repurposed as Tile-4 on DG2 */
>  		dword1 |= XY_FAST_COPY_DST_TILING_Yf;
>  
>  	switch (bpp) {
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index a488f9cf..75d41ea3 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -202,7 +202,7 @@ void intel_copy_bo(struct intel_batchbuffer *batch,
>  		   long int size);
>  
>  /*
> - * Yf/Ys tiling
> + * Yf/Ys/4 tiling
>   *
>   * Tiling mode in the I915_TILING_... namespace for new tiling modes which are
>   * defined in the kernel. (They are not fenceable so the kernel does not need
> @@ -210,8 +210,9 @@ void intel_copy_bo(struct intel_batchbuffer *batch,
>   *
>   * They are to be used the the blitting routines below.
>   */
> -#define I915_TILING_Yf	3
> -#define I915_TILING_Ys	4
> +#define I915_TILING_4	(I915_TILING_LAST + 1)
> +#define I915_TILING_Yf	(I915_TILING_LAST + 2)
> +#define I915_TILING_Ys	(I915_TILING_LAST + 3)
>  
>  enum i915_compression {
>  	I915_COMPRESSION_NONE,
> -- 
> 2.17.1
> 
