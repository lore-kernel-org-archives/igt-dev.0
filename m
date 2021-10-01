Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 647CC6E50C
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Oct 2021 09:39:04 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id k3so567005qve.10
 for <igt-dev@lists.freedesktop.org>; Fri, 01 Oct 2021 02:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210930052124.980259-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20210930052124.980259-1-priyanka.dandamudi@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Fri, 1 Oct 2021 10:38:35 +0100
Message-ID: <CAM0jSHPSV_oXM+F89Md3OziewqCGdrX0_GryRjSvrSdpmXHXAQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_nop: Update poll
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

On Thu, 30 Sept 2021 at 06:29, <priyanka.dandamudi@intel.com> wrote:
>
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
> The set_caching ioctl returns -ENODEV for discrete.
> So,updated the poll sequential test case accordingly.
>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  tests/i915/gem_exec_nop.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
> index c435335b..9123f9f5 100644
> --- a/tests/i915/gem_exec_nop.c
> +++ b/tests/i915/gem_exec_nop.c
> @@ -232,6 +232,7 @@ static void poll_sequential(int fd, const intel_ctx_t *ctx,
>         unsigned long cycles;
>         uint64_t elapsed;
>         bool cached;
> +       int expect;
>
>         flags = I915_EXEC_NO_RELOC;
>         if (gen == 4 || gen == 5)
> @@ -251,7 +252,8 @@ static void poll_sequential(int fd, const intel_ctx_t *ctx,
>         memset(obj, 0, sizeof(obj));
>         obj[0].handle = gem_create(fd, 4096);
>         obj[0].flags = EXEC_OBJECT_WRITE;
> -       cached = __gem_set_caching(fd, obj[0].handle, 1) == 0;
> +       expect = __gem_set_caching(fd, obj[0].handle, 1);
> +       cached = gem_has_lmem(fd)? expect == -ENODEV: expect == 0;

Could maybe also just write this as:

cached = true;
if (!gem_has_lmem(fd))
       cached = __gem_set_caching(fd, obj[0].handle, 1);

>         obj[1].handle = gem_create(fd, 4096);
>         obj[1].relocs_ptr = to_user_pointer(reloc);
>         obj[1].relocation_count = ARRAY_SIZE(reloc);
> --
> 2.25.1
>
