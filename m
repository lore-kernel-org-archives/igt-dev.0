Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525376E188
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Sep 2021 11:11:20 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id z2so1159052qvl.10
 for <igt-dev@lists.freedesktop.org>; Wed, 01 Sep 2021 04:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210901103402.1253909-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20210901103402.1253909-3-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210901103402.1253909-3-tejaskumarx.surendrakumar.upadhyay@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 1 Sep 2021 12:10:51 +0100
Message-ID: <CAM0jSHMq9QAzefVX8Hui0t3EJMZtB2uT559t4oRvZhjT0S=7=Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [i-g-t, V4 2/2] i915_drm.h sync
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 1 Sept 2021 at 11:41, Tejas Upadhyay
<tejaskumarx.surendrakumar.upadhyay@intel.com> wrote:
>
> Sync to get I915_MMAP_OFFSET_FIXED define value.
>
> Taken from kernel commit:
>     commit 7961c5b60f23 ("drm/i915: Add TTM offset argument to mmap.")

When syncing the uapi header we want to grab all the changes for that
commit, including all the kernel doc etc.

You can run 'make headers_install' on the kernel tree for the above
commit, and then just copy the generated header over to IGT.

>
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
> ---
>  include/drm-uapi/i915_drm.h | 1 +
>  lib/i915/i915_drm_local.h   | 2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)
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
> diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
> index 0e3cef81..dd646aed 100644
> --- a/lib/i915/i915_drm_local.h
> +++ b/lib/i915/i915_drm_local.h
> @@ -20,8 +20,6 @@ extern "C" {
>   * clean these up when kernel uapi headers are sync'd.
>   */
>
> -#define I915_MMAP_OFFSET_FIXED 4
> -
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.31.1
>
