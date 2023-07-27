Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB68D10E584
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 14:00:02 +0000 (UTC)
Date: Thu, 27 Jul 2023 15:59:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230727135930.43cwgtt6g4ud4ymx@kamilkon-desk1>
References: <20230718121443.445343-1-kunal1.joshi@intel.com>
 <20230718121443.445343-3-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Kunal,

On 2023-07-18 at 17:44:43 +0530, Kunal Joshi wrote:

did you forgot "From: Juha-Pekka ..." at beginning of patch?
checkpatch.pl script from Linux kernel notices:

ERROR: Missing Signed-off-by: line by nominal patch author 'Kunal Joshi <kunal1.joshi@intel.com>'

> on xe driver use blitcopy for everything where otherwise would
- ^
Start from uppercase, s/on/On/

> use rendercopy.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Add here your s-o-b when you send someone else patches, same
goes for first patch. +cc Zbigniew and Juha-Pekka

Regards,
Kamil

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
