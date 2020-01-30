Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC7C6E5B2
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 10:28:02 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200129181601.15918-1-imre.deak@intel.com>
 <20200129181601.15918-2-imre.deak@intel.com>
In-Reply-To: <20200129181601.15918-2-imre.deak@intel.com>
Message-ID: <158037910689.16598.200295248016799513@skylake-alporthouse-com>
Date: Thu, 30 Jan 2020 10:11:46 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/9] lib/igt_fb: Fix creating FBs on
 platforms w/o HW detiling
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
To: Imre Deak <imre.deak@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Imre Deak (2020-01-29 18:15:54)
> On platforms w/o HW detiling don't fail creating the FB due to the
> expected error from the set_tiling IOCTL.
> 
> Most of the tests use a cairo surface to draw, which don't depend on the
> HW detiling. Other tests (using lib/igt_draw.c or drawing to the FB
> directly, like kms_draw_crc, kms_frontbuffer) are failing atm and will
> need to be fixed separately.
> 
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  lib/igt_fb.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index c81b9de8..ec7e9991 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -944,9 +944,10 @@ static int create_bo_for_fb(struct igt_fb *fb)
>  
>                 if (is_i915_device(fd)) {
>                         fb->gem_handle = gem_create(fd, fb->size);
> -                       gem_set_tiling(fd, fb->gem_handle,
> -                                      igt_fb_mod_to_tiling(fb->modifier),
> -                                      fb->strides[0]);
> +                       if (gem_has_legacy_hw_tiling(fd))
> +                               gem_set_tiling(fd, fb->gem_handle,
> +                                              igt_fb_mod_to_tiling(fb->modifier),
> +                                              fb->strides[0]);

/* If we can't use fences, we won't use ggtt detiling later */
__gem_set_tiling()
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
