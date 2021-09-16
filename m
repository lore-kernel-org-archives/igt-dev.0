Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2476EE1F
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Sep 2021 15:25:43 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id p29so19982731lfa.11
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Sep 2021 08:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210916141227.17554-1-vidya.srinivas@intel.com>
In-Reply-To: <20210916141227.17554-1-vidya.srinivas@intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 16 Sep 2021 11:25:30 -0400
Message-ID: <CAJUqKUrnH7grhjC8deuZs9qjsJGKJvoLKoRj3TyyFpgL5BG6pg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915/intel_memory_region: Fix
 regression on 5.4 kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, "Modem, Bhanuprakash" <Bhanuprakash.Modem@intel.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 16, 2021 at 10:24 AM Vidya Srinivas
<vidya.srinivas@intel.com> wrote:
>
> Starting commit 8759c4a3020ce4 "Add intel_buf_init_in_region"
> __intel_buf_init uses gem_create_in_memory_regions instead of
> gem_create. Older kernels like 5.4 still dont have support for
> I915_GEM_CREATE_EXT_MEMORY_REGIONS (i915_gem_create_ext_ioctl)
> from kernel commit (https://patchwork.freedesktop.org/patch/431581/?series=89648&rev=1)
> Due to this, the flip-vs-fences tests are failing on kernel 5.4
> Patch add roll back to gem_create when __gem_create_in_memory_region_list fails.
>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  lib/i915/intel_memory_region.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
> index 3de40549319b..323b96bad232 100644
> --- a/lib/i915/intel_memory_region.c
> +++ b/lib/i915/intel_memory_region.c
> @@ -209,7 +209,9 @@ uint32_t gem_create_in_memory_region_list(int fd, uint64_t size,
>         uint32_t handle;
>         int ret = __gem_create_in_memory_region_list(fd, &handle, size,
>                                                      mem_regions, num_regions);
> -       igt_assert_eq(ret, 0);
> +       if (ret != 0)
> +               handle = gem_create(fd, size);
I'm not sure if this change should be here or should be at the caller
`void __intel_buf_init(...).
> +
Let's have a check before we return, parallel to the removed `
igt_assert_eq(ret, 0);`, Something like `igt_assert(!ret || handle).`
>         return handle;
>  }
>
> --
> 2.33.0
>
