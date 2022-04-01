Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7F810E34D
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Apr 2022 09:11:07 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id f3so1538711qvz.10
 for <igt-dev@lists.freedesktop.org>; Fri, 01 Apr 2022 02:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220401072826.6447-1-arjun.melkaveri@intel.com>
In-Reply-To: <20220401072826.6447-1-arjun.melkaveri@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 1 Apr 2022 10:10:40 +0100
Message-ID: <CAM0jSHMryYAhTKVOngAQupMv35xR3evavgb3sK90L6yRS9W91g@mail.gmail.com>
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_lmem_swapping: Fix bug
 in test_smem_oom
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

 On Fri, 1 Apr 2022 at 08:28, Arjun Melkaveri <arjun.melkaveri@intel.com> wrote:
>
> ctx was not initialized with all physical engines,
> after device reopening.
> This change would resolve assert issue seen in __do_evict.
>
> v2: Added missing intel_ctx_destroy.
>

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5528 ?

> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>

Sorry for breaking this,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>  tests/i915/gem_lmem_swapping.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> index 43f0688f..432607b0 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -428,10 +428,14 @@ static void test_smem_oom(int i915,
>
>                 fill_params(i915, &params, region, 0, 1, true);
>
> +               ctx = intel_ctx_create_all_physical(fd);
> +               __gem_context_set_persistence(fd, ctx->id, false);
> +
>                 igt_install_exit_handler(smem_oom_exit_handler);
>                 __do_evict(fd, ctx, &region->region, &params,
>                            params.seed + child + 1);
>
> +               intel_ctx_destroy(fd, ctx);
>                 close(fd);
>         }
>
> --
> 2.25.1
>
