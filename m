Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 26 Sep 2023 15:46:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926224649.GR2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-12-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-12-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-xe] [PATCH i-g-t 11/14] lib/igt_fb: Add Xe2
 mocs to XY_FAST_COLOR_BLT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 06:23:43AM -0700, Lucas De Marchi wrote:
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  lib/igt_fb.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 722996779..d353b439f 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2754,6 +2754,7 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
>  	struct blt_copy_object *blt;
>  	enum blt_tiling_type blt_tile;
>  	uint64_t stride;
> +	uint32_t devid = intel_get_drm_devid(fb->fd);
>  
>  	blt = malloc(sizeof(*blt));
>  	igt_assert(blt);
> @@ -2763,7 +2764,11 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
>  
>  	blt_tile = fb_tile_to_blt_tile(fb->modifier);
>  	stride = blt_tile == T_LINEAR ? fb->strides[plane] : fb->strides[plane] / 4;
> -	mocs = intel_get_uc_mocs_index(fb->fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
> +
> +	if (intel_graphics_ver(devid) >= IP_VER(20, 0))
> +		mocs = intel_get_uc_mocs_index(fb->fd) << XE2_XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
> +	else
> +		mocs = intel_get_uc_mocs_index(fb->fd) << XY_FAST_COLOR_BLT_MOCS_INDEX_SHIFT;
>  
>  	blt_set_object(blt, handle, fb->size, memregion,
>  		       mocs,
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
