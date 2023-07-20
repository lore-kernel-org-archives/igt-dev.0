Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A412810E58F
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jul 2023 10:02:50 +0000 (UTC)
Date: Thu, 20 Jul 2023 12:02:45 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>
Message-ID: <20230720100245.2lref6sw6j7btr7k@zkempczy-mobl2>
References: <20230718121443.445343-1-kunal1.joshi@intel.com>
 <20230718121443.445343-3-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718121443.445343-3-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_fb: on xe driver switch
 from rendercopy to blitcopy
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

On Tue, Jul 18, 2023 at 05:44:43PM +0530, Kunal Joshi wrote:
> on xe driver use blitcopy for everything where otherwise would
> use rendercopy.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 6ce4b735a..f4bc800fe 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2529,7 +2529,7 @@ static bool use_enginecopy(const struct igt_fb *fb)
>  	if (!is_intel_device(fb->fd))
>  		return false;
>  
> -	if (!is_xe_device(fb->fd) && blitter_ok(fb))
> +	if (blitter_ok(fb))
>  		return false;

I stared to this and for me it looks we disable rendercopy at all
for i915 as well for xe even if rendercopy is same for i915 and xe
(intel-bb should handle this).

--
Zbigniew


>  
>  	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
> @@ -3035,9 +3035,7 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
>  		igt_nouveau_delete_bo(&linear->fb);
>  	} else if (is_xe_device(fd)) {
>  		gem_munmap(linear->map, linear->fb.size);
> -		copy_with_engine(blit, fb, &linear->fb);
> -
> -		syncobj_wait(fd, &blit->ibb->engine_syncobj, 1, INT64_MAX, 0, NULL);
> +		blitcopy(fb, &linear->fb);
>  		gem_close(fd, linear->fb.gem_handle);
>  	} else {
>  		gem_munmap(linear->map, linear->fb.size);
> @@ -3117,7 +3115,7 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
>  
>  		linear->map = igt_nouveau_mmap_bo(&linear->fb, PROT_READ | PROT_WRITE);
>  	} else if (is_xe_device(fd)) {
> -		copy_with_engine(blit, &linear->fb, fb);
> +		blitcopy(&linear->fb, fb);
>  
>  		linear->map = xe_bo_mmap_ext(fd, linear->fb.gem_handle,
>  					     linear->fb.size, PROT_READ | PROT_WRITE);
> -- 
> 2.25.1
> 
