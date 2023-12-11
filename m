Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981AA10E0DD
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Dec 2023 11:04:41 +0000 (UTC)
Date: Mon, 11 Dec 2023 12:04:30 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH i-g-t 2/2] lib: restore FLAG_SCANOUT usage for Xe
Message-ID: <ZXbsvhQVB2ahT0KS@fdugast-desk.home>
References: <20231211105844.30534-1-matthew.auld@intel.com>
 <20231211105844.30534-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231211105844.30534-2-matthew.auld@intel.com>
MIME-Version: 1.0
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

On Mon, Dec 11, 2023 at 10:58:44AM +0000, Matthew Auld wrote:
> Looks to have been accidentally removed in all the various uapi
> refactoring and cleanup. Selecting SCANOUT here is needed to ensure that
> WC is also selected for the cpu_caching.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

It was accidentally removed during a rebase of commit ("xe_query: Kill \
visible_vram_if_possible"), my bad.

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/igt_draw.c | 3 ++-
>  lib/igt_fb.c   | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 6d0bcb997..637b9ba76 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -802,7 +802,8 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
>  		tmp.handle = xe_bo_create(fd, 0,
>  					  ALIGN(tmp.size, xe_get_default_alignment(fd)),
>  					  vram_if_possible(fd, 0),
> -					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
> +					  DRM_XE_GEM_CREATE_FLAG_SCANOUT);
>  
>  	tmp.stride = rect->w * pixel_size;
>  	tmp.bpp = buf->bpp;
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 907464273..0446cefc9 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -1208,7 +1208,8 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
>  		} else if (is_xe_device(fd)) {
>  			fb->gem_handle = xe_bo_create(fd, 0, fb->size,
>  						      vram_if_possible(fd, 0),
> -						      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +						      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM |
> +						      DRM_XE_GEM_CREATE_FLAG_SCANOUT);
>  		} else if (is_vc4_device(fd)) {
>  			fb->gem_handle = igt_vc4_create_bo(fd, fb->size);
>  
> -- 
> 2.43.0
> 
