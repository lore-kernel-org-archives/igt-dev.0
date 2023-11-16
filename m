Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2537610E60D
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 15:08:43 +0000 (UTC)
Date: Thu, 16 Nov 2023 16:08:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231116150836.7ptu675bk73t42cy@kamilkon-desk.igk.intel.com>
References: <cover.1700146980.git.akshata.jahagirdar@intel.com>
 <33441818be37e0c7aacf23c3247e3fd269facbf5.1700146980.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <33441818be37e0c7aacf23c3247e3fd269facbf5.1700146980.git.akshata.jahagirdar@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/5] lib/intel_blt: Update calculation
 of ccs_size and size_of_ctrl_copy
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: matthew.auld@intel.com, ayaz.siddiqui@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Akshata,
On 2023-11-16 at 07:38:31 -0800, Akshata Jahagirdar wrote:

your patch do not apply, please first make sure it will merge
with upstream igt repo, then send new version. Also add version
number like:

[PATCH i-g-t v3 2/5] lib/intel_blt: Update calculation of ...

> The Main-to-CCS Ratio for XE2 has been changed to 512:1.
> Update the CCS_RATIO macro to select relevant ratio based on platform.
> Since the PAGE_SIZE of sysmem is 4K, update the size of ctrl_copy to reflect this change.
> The pat-index and caching mode for compression need to change to xe2_uc_comp and WC in case
> of compression, else they just take the default value of pat_index and WB.

Could you split this patch into two, first with calculations and
next one with pat index?

> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>  lib/intel_blt.c | 23 +++++++++++++++--------
>  lib/intel_blt.h |  2 +-
>  2 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index c0593930c..764b27213 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -948,15 +948,16 @@ int blt_block_copy(int fd,
>  	return ret;
>  }
>  
> -static uint16_t __ccs_size(const struct blt_ctrl_surf_copy_data *surf)
> +static uint16_t __ccs_size(int fd, const struct blt_ctrl_surf_copy_data *surf)
>  {
>  	uint32_t src_size, dst_size;
> +	uint16_t ccsratio = CCS_RATIO(fd);
>  
>  	src_size = surf->src.access_type == DIRECT_ACCESS ?
> -				surf->src.size : surf->src.size / CCS_RATIO;
> +				surf->src.size : surf->src.size / ccsratio;
>  
>  	dst_size = surf->dst.access_type == DIRECT_ACCESS ?
> -				surf->dst.size : surf->dst.size / CCS_RATIO;
> +				surf->dst.size : surf->dst.size / ccsratio;
>  
>  	igt_assert_f(src_size <= dst_size, "dst size must be >= src size for CCS copy\n");
>  
> @@ -1118,6 +1119,7 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
>  	uint64_t dst_offset, src_offset, bb_offset, alignment;
>  	uint32_t bbe = MI_BATCH_BUFFER_END;
>  	uint32_t *bb;
> +	uint16_t num_ccs_blocks = xe_get_default_alignment(fd) / (CCS_RATIO(fd));
>  
>  	igt_assert_f(ahnd, "ctrl-surf-copy supports softpin only\n");
>  	igt_assert_f(surf, "ctrl-surf-copy requires data to do ctrl-surf-copy blit\n");
> @@ -1136,7 +1138,7 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
>  		data.xe2.dw00.dst_access_type = surf->dst.access_type;
>  
>  		/* Ensure dst has size capable to keep src ccs aux */
> -		data.xe2.dw00.size_of_ctrl_copy = __ccs_size(surf) / CCS_RATIO - 1;
> +		data.xe2.dw00.size_of_ctrl_copy = __ccs_size(fd, surf) / num_ccs_blocks - 1;
>  		data.xe2.dw00.length = 0x3;
>  
>  		data.xe2.dw01.src_address_lo = src_offset;
> @@ -1155,7 +1157,7 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
>  		data.gen12.dw00.dst_access_type = surf->dst.access_type;
>  
>  		/* Ensure dst has size capable to keep src ccs aux */
> -		data.gen12.dw00.size_of_ctrl_copy = __ccs_size(surf) / CCS_RATIO - 1;
> +		data.gen12.dw00.size_of_ctrl_copy = __ccs_size(fd,surf) / num_ccs_blocks - 1;
>  		data.gen12.dw00.length = 0x3;
>  
>  		data.gen12.dw01.src_address_lo = src_offset;
> @@ -1794,7 +1796,8 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
>  	uint64_t size = width * height * bpp / 8;
>  	uint32_t stride = tiling == T_LINEAR ? width * 4 : width;
>  	uint32_t handle;
> -
> +	uint8_t pat_index = intel_get_pat_idx_uc(blt->fd);
> +	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WB;
>  	igt_assert_f(blt->driver, "Driver isn't set, have you called blt_copy_init()?\n");
>  
>  	obj = calloc(1, sizeof(*obj));
> @@ -1804,17 +1807,21 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,

This hunk do not apply.

Regards,
Kamil

>  	if (blt->driver == INTEL_DRIVER_XE) {
>  		uint64_t flags = region;
>  
> +		if(AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && mid->compression){
> +			pat_index = xe2_get_pat_idx_uc_comp(blt->fd);
> +			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
> +		}
>  		if (create_mapping && region != system_memory(blt->fd))
>  			flags |= XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>  
>  		size = ALIGN(size, xe_get_default_alignment(blt->fd));
> -		handle = xe_bo_create_flags(blt->fd, 0, size, flags);
> +		handle = xe_bo_create_caching(blt->fd, 0, size, region, cpu_caching);
>  	} else {
>  		igt_assert(__gem_create_in_memory_regions(blt->fd, &handle,
>  							  &size, region) == 0);
>  	}
>  
> -	blt_set_object(obj, handle, size, region, mocs_index, DEFAULT_PAT_INDEX, tiling,
> +	blt_set_object(obj, handle, size, region, mocs_index, pat_index, tiling,
>  		       compression, compression_type);
>  	blt_set_geom(obj, stride, 0, 0, width, height, 0, 0);
>  
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 5934ccd67..a7aeab595 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -52,7 +52,7 @@
>  #include "igt.h"
>  #include "intel_cmds_info.h"
>  
> -#define CCS_RATIO 256
> +#define CCS_RATIO(xe) AT_LEAST_GEN(intel_get_drm_devid(xe), 20) ? 512 : 256
>  
>  enum blt_color_depth {
>  	CD_8bit,
> -- 
> 2.34.1
> 
