Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AB910E469
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 18:02:06 +0000 (UTC)
Date: Wed, 14 Jun 2023 20:01:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230614180141.4ltvvspq5l4uygtw@kamilkon-desk1>
References: <20230609132019.508947-1-swati2.sharma@intel.com>
 <20230609132019.508947-5-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230609132019.508947-5-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] lib/i915: Add intel_display_ver()
 and use it in display tests/libs
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

Hi Swati,

On 2023-06-09 at 18:50:19 +0530, Swati Sharma wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 

Please change commit message, patch no longer adds function
intel_display_ver(), so instead of:

lib/i915: Add intel_display_ver() and use it in display tests/libs

better:

lib/igt_draw: Use intel_display_ver() for drawing with blits

Regards,
Kamil

> Display code should check the display version of the platform rather
> than the graphics version; on some platforms these versions won't be the
> same.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  lib/igt_draw.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index a5c0cbbf..011d5cad 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -674,7 +674,7 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
>  	struct intel_buf *dst;
>  	int blt_cmd_len, blt_cmd_tiling, blt_cmd_depth;
>  	uint32_t devid = intel_get_drm_devid(fd);
> -	int gen = intel_gen(devid);
> +	int ver = intel_display_ver(devid);
>  	int pitch;
>  
>  	if (tiling)
> @@ -751,9 +751,9 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
>  			igt_assert(false);
>  		}
>  
> -		blt_cmd_len = (gen >= 8) ?  0x5 : 0x4;
> +		blt_cmd_len = (ver >= 8) ?  0x5 : 0x4;
>  		blt_cmd_tiling = (tiling) ? XY_COLOR_BLT_TILED : 0;
> -		pitch = (gen >= 4 && tiling) ? buf->stride / 4 : buf->stride;
> +		pitch = (ver >= 4 && tiling) ? buf->stride / 4 : buf->stride;
>  
>  		switch_blt_tiling(ibb, tiling, true);
>  
> -- 
> 2.25.1
> 
