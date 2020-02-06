Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3024E6F9FC
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2020 09:38:54 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <cf38e7ad4819c3024504e714ab3192e0c2e8a1fb.1580971240.git.ashutosh.dixit@intel.com>
In-Reply-To: <cf38e7ad4819c3024504e714ab3192e0c2e8a1fb.1580971240.git.ashutosh.dixit@intel.com>
Message-ID: <158098192923.3986.7099412071090447139@skylake-alporthouse-com>
Date: Thu, 06 Feb 2020 09:38:49 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_blits: Fix for devices without
 mappable aperture
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Ashutosh Dixit (2020-02-06 06:45:11)
> Skip using the gtt or applying tiling. Instead use the blitter for
> detiling on devices without mappable aperture.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Lgtm,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/i915/gem_blits.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
> index f9cb12bb8..985be3a63 100644
> --- a/tests/i915/gem_blits.c
> +++ b/tests/i915/gem_blits.c
> @@ -143,7 +143,7 @@ static void buffer_set_tiling(const struct device *device,
>         const bool has_64b_reloc = device->gen >= 8;
>         uint32_t stride, size, pitch;
>         uint32_t *batch;
> -       int i;
> +       int i, err;
>  
>         if (buffer->tiling == tiling)
>                 return;
> @@ -162,7 +162,9 @@ static void buffer_set_tiling(const struct device *device,
>         obj[0].handle = gem_create(device->fd, size);
>         if (tiling) {
>                 obj[0].flags = EXEC_OBJECT_NEEDS_FENCE;
> -               gem_set_tiling(device->fd, obj[0].handle, tiling, stride);
> +               err = __gem_set_tiling(device->fd, obj[0].handle, tiling, stride);
> +               /* If we can't use fences, we won't use ggtt detiling later. */
> +               igt_assert(err == 0 || err == -EOPNOTSUPP);

I would have probably just used something like

buffer->fenced = false;
if (__gem_set_tiling(device->fd, obj[0].handle, tiling, stride) == 0)
	buffer->fenced = true;

>         }
>  
>         obj[1].handle = buffer->handle;
> @@ -381,6 +383,11 @@ static void *download(const struct device *device,
>  
>         igt_assert(posix_memalign(&linear, 4096, buffer->size) == 0);
>  
> +       if (!gem_has_mappable_ggtt(device->fd) && buffer->tiling) {

if (buffer->tiling && !buffer->fenced) {

> +               igt_assert(blit_to_linear(device, buffer, linear));
> +               return linear;
> +       }
> +
>         switch (mode) {
>         case CPU:
>                 if (buffer->tiling) {
> @@ -755,6 +762,9 @@ igt_main
>                                                                 buffer_set_tiling(&device, dst, dst_tiling);
>  
>                                                                 for (enum mode down = CPU; down <= WC; down++) {
> +                                                                       if (down == GTT && !gem_has_mappable_ggtt(device.fd))
> +                                                                               continue;
> +
>                                                                         igt_debug("Testing src_tiling=%d, dst_tiling=%d, down=%d at (%d, %d) x (%d, %d)\n",
>                                                                                   src_tiling,
>                                                                                   dst_tiling,
> -- 
> 2.25.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
