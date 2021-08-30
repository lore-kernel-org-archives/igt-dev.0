Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E4089836
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Aug 2021 15:59:33 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 q11-20020a9d4b0b000000b0051acbdb2869so13986958otf.2
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Aug 2021 08:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210827130002.1188868-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210827130002.1188868-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 30 Aug 2021 17:59:21 +0200
Message-ID: <CAKMK7uG8m7kpMyey2UHDP=ZG54Sahfysiiez-0p3H4CrUrRbTQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [i-g-t] lib/i915: Use FIXED mapping only for discrete
 memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Aug 27, 2021 at 3:07 PM Tejas Upadhyay
<tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
>
> The FIXED mapping is only used for discrete, and mapping type
> is pre-defined. This disables the other type of mmap
> offsets when discrete memory is used.
>
> Taken from kernel commit:
> commit 7961c5b60f23 ("drm/i915: Add TTM offset argument to mmap.")
>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> ---
>  include/drm-uapi/i915_drm.h | 1 +
>  lib/i915/gem_mman.c         | 8 +++++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
> index a1c0030c..b46367f2 100644
> --- a/include/drm-uapi/i915_drm.h
> +++ b/include/drm-uapi/i915_drm.h
> @@ -871,6 +871,7 @@ struct drm_i915_gem_mmap_offset {
>  #define I915_MMAP_OFFSET_WC  1
>  #define I915_MMAP_OFFSET_WB  2
>  #define I915_MMAP_OFFSET_UC  3
> +#define I915_MMAP_OFFSET_FIXED 4
>
>         /*
>          * Zero-terminated chain of extensions.
> diff --git a/lib/i915/gem_mman.c b/lib/i915/gem_mman.c
> index 0406a0b9..1917c24d 100644
> --- a/lib/i915/gem_mman.c
> +++ b/lib/i915/gem_mman.c
> @@ -75,7 +75,13 @@ bool gem_has_legacy_mmap(int fd)
>
>  bool gem_has_mmap_offset_type(int fd, const struct mmap_offset *t)

Please document any library functions that you touch/update,
especially when they're not yet documented.

It would be really good to document an entire file, because currently
the igt doc situation in the gem area is very bad.
-Daniel

>  {
> -       return gem_has_mmap_offset(fd) || t->type == I915_MMAP_OFFSET_GTT;
> +       if (gem_has_mmap_offset(fd))
> +               if (!gem_has_lmem(fd))
> +                       return !(t->type == I915_MMAP_OFFSET_FIXED);
> +               else
> +                       return !(t->type != I915_MMAP_OFFSET_FIXED);
> +       else
> +               return false;
>  }
>
>  /**
> --
> 2.31.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
