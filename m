Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716616E266
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2020 23:22:49 +0000 (UTC)
Date: Mon, 10 Feb 2020 15:22:48 -0800
From: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20200210232248.GT232048@mdroper-desk1.amr.corp.intel.com>
References: <20200207191524.19362-1-imre.deak@intel.com>
 <20200207191524.19362-7-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207191524.19362-7-imre.deak@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 7/8] lib/igt_draw: Fix
 igt_draw_fill_fb() on platforms w/o aperture
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 09:15:23PM +0200, Imre Deak wrote:
> Draw through a CPU mapping on platforms w/o a GTT aperture.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  lib/igt_draw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index d227a53a..c720a4c2 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -731,6 +731,6 @@ void igt_draw_rect_fb(int fd, drm_intel_bufmgr *bufmgr,
>   */
>  void igt_draw_fill_fb(int fd, struct igt_fb *fb, uint32_t color)
>  {
> -	igt_draw_rect_fb(fd, NULL, NULL, fb, IGT_DRAW_MMAP_GTT,
> +	igt_draw_rect_fb(fd, NULL, NULL, fb, IGT_DRAW_MMAP_CPU,
>  			 0, 0, fb->width, fb->height, color);
>  }
> -- 
> 2.23.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
