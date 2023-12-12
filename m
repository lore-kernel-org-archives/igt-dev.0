Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627D010E17F
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 09:24:37 +0000 (UTC)
Message-ID: <34bbd5d9-2c0e-4941-a508-6cd8369e02b0@intel.com>
Date: Tue, 12 Dec 2023 09:24:32 +0000
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v5 4/6] lib/intel_blt: Update caching mode and
 pat_index
Content-Language: en-GB
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
References: <cover.1702402592.git.akshata.jahagirdar@intel.com>
 <d7f6b28bdb2d02cac0757d15e8382bd39ad56dcd.1702402592.git.akshata.jahagirdar@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <d7f6b28bdb2d02cac0757d15e8382bd39ad56dcd.1702402592.git.akshata.jahagirdar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ayaz.siddiqui@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 12/12/2023 17:39, Akshata Jahagirdar wrote:
> The pat-index and caching mode for compression need to change to uc_comp in case
> of compression, else they just take the default value of pat_index and caching.
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   lib/intel_blt.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 5399be20a..31b9f250e 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1797,7 +1797,8 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
>   	uint64_t size = width * height * bpp / 8;
>   	uint32_t stride = tiling == T_LINEAR ? width * 4 : width;
>   	uint32_t handle;
> -
> +	uint8_t pat_index = DEFAULT_PAT_INDEX;
> +	uint16_t cpu_caching;

Nit: newline here. Also maybe move cpu_caching into the xe specific path 
where it is used?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

>   	igt_assert_f(blt->driver, "Driver isn't set, have you called blt_copy_init()?\n");
>   
>   	obj = calloc(1, sizeof(*obj));
> @@ -1810,14 +1811,20 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
>   		if (create_mapping && region != system_memory(blt->fd))
>   			flags |= DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>   
> +		if (AT_LEAST_GEN(intel_get_drm_devid(blt->fd), 20) && compression) {
> +			pat_index = intel_get_pat_idx_uc_comp(blt->fd);
> +			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
> +		} else
> +			cpu_caching = __xe_default_cpu_caching(blt->fd, region, flags);
> +
>   		size = ALIGN(size, xe_get_default_alignment(blt->fd));
> -		handle = xe_bo_create_flags(blt->fd, 0, size, region);
> +		handle = xe_bo_create_caching(blt->fd, 0, size, region, flags, cpu_caching);
>   	} else {
>   		igt_assert(__gem_create_in_memory_regions(blt->fd, &handle,
>   							  &size, region) == 0);
>   	}
>   
> -	blt_set_object(obj, handle, size, region, mocs_index, DEFAULT_PAT_INDEX, tiling,
> +	blt_set_object(obj, handle, size, region, mocs_index, pat_index, tiling,
>   		       compression, compression_type);
>   	blt_set_geom(obj, stride, 0, 0, width, height, 0, 0);
>   
