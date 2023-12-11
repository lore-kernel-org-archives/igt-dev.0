Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0863610E371
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Dec 2023 09:16:35 +0000 (UTC)
Date: Mon, 11 Dec 2023 10:16:30 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: Re: [PATCH i-g-t v4 4/6] lib/intel_blt: Update caching mode and
 pat_index
Message-ID: <20231211091630.3uk6q545j27q2xr2@zkempczy-mobl2>
References: <cover.1701951594.git.akshata.jahagirdar@intel.com>
 <94a074ff51568bea158bc9dad6aa12e1882ae92a.1701951594.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <94a074ff51568bea158bc9dad6aa12e1882ae92a.1701951594.git.akshata.jahagirdar@intel.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ayaz.siddiqui@intel.com,
 matthew.auld@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 04:42:39AM -0800, Akshata Jahagirdar wrote:
> The pat-index and caching mode for compression need to change to uc_comp in case
> of compression, else they just take the default value of pat_index.
> 
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> ---
>  lib/intel_blt.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index a2e64586b..d54b19340 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1796,7 +1796,8 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
>  	uint64_t size = width * height * bpp / 8;
>  	uint32_t stride = tiling == T_LINEAR ? width * 4 : width;
>  	uint32_t handle;
> -
> +	uint8_t pat_index = (AT_LEAST_GEN(intel_get_drm_devid(blt->fd), 20) && compression) ? intel_get_pat_idx_uc_comp(blt->fd) : DEFAULT_PAT_INDEX;

Too long line - please refactor. AT_LEAST_GEN() is already protected by ()
and there's no need to add it here. With this fixed:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
>  	igt_assert_f(blt->driver, "Driver isn't set, have you called blt_copy_init()?\n");
>  
>  	obj = calloc(1, sizeof(*obj));
> @@ -1810,13 +1811,13 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
>  			flags |= DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>  
>  		size = ALIGN(size, xe_get_default_alignment(blt->fd));
> -		handle = xe_bo_create_flags(blt->fd, 0, size, region);
> +		handle = xe_bo_create_caching(blt->fd, 0, size, region, flags, cpu_caching);
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
> -- 
> 2.34.1
> 
