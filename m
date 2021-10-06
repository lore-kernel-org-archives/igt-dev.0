Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D336E516
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Oct 2021 11:13:18 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id e16so2076575qte.13
 for <igt-dev@lists.freedesktop.org>; Wed, 06 Oct 2021 04:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211006095407.1036362-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20211006095407.1036362-1-priyanka.dandamudi@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 6 Oct 2021 12:12:49 +0100
Message-ID: <CAM0jSHMCjd0_YC8tAmSwf+Nrpw5rF=qAo1vWm6FyToc8mwBMxQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915/gem_exec_nop: Update poll
 sequential
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, Matthew Auld <matthew.auld@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 6 Oct 2021 at 11:02, <priyanka.dandamudi@intel.com> wrote:
>
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
> set_caching ioctl will get skipped for discrete
> and mmap__cpu gets used by default.
>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  tests/i915/gem_exec_nop.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
> index 03adc9ee..5ea815f6 100644
> --- a/tests/i915/gem_exec_nop.c
> +++ b/tests/i915/gem_exec_nop.c
> @@ -238,6 +238,7 @@ static void poll_sequential(int fd, const intel_ctx_t *ctx,
>                 flags |= I915_EXEC_SECURE;
>
>         nengine = 0;
> +       cached = true;
>         for_each_ctx_engine(fd, ctx, e) {
>                 if (!gem_class_can_store_dword(fd, e->class) ||
>                     !gem_class_has_mutable_submission(fd, e->class))
> @@ -251,7 +252,8 @@ static void poll_sequential(int fd, const intel_ctx_t *ctx,
>         memset(obj, 0, sizeof(obj));
>         obj[0].handle = gem_create(fd, 4096);
>         obj[0].flags = EXEC_OBJECT_WRITE;
> -       cached = __gem_set_caching(fd, obj[0].handle, 1) == 0;
> +       if(!gem_has_lmem(fd))
> +               cached = __gem_set_caching(fd, obj[0].handle, 1) == 0;

For better readability, the cached = true should probably be placed here, i.e:

cached = true;
if (!has_lmem())
        cached = ...

Reviewed-by: Matthew Auld <matthew.auld@intel.com>


>         obj[1].handle = gem_create(fd, 4096);
>         obj[1].relocs_ptr = to_user_pointer(reloc);
>         obj[1].relocation_count = ARRAY_SIZE(reloc);
> --
> 2.25.1
>
