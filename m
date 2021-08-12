Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF606E456
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Aug 2021 19:38:48 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 d10-20020a9d4f0a0000b02904f51c5004e3so9126496otl.9
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Aug 2021 12:38:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210527140732.5762-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210527140732.5762-1-daniel.vetter@ffwll.ch>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 12 Aug 2021 21:38:36 +0200
Message-ID: <CAKMK7uEWFYS+UU57sFg+0wmGteHUGcDiYvz9aPnnCRGpA=WYdg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t] tests/vgem_basic: Fix unload testcase
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT development <igt-dev@lists.freedesktop.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, May 27, 2021 at 4:07 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> An mmap _should_ keep the module alive.
>
> This reverts
>
> commit 8abe91985b30f8a26cdcb6816d2393956f171ea5
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Wed Oct 5 14:40:16 2016 +0100
>
>     igt/vgem_basic: Allow mmap() to persist without the vgem module loaded
>
> With real drivers there is usually more than just shmem around, so
> encoding this as some kind of expectation just doesn't make sense at
> all.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Merged with Thomas' irc-ack. I'll go right ahead and merge the kernel
side too so there's not too much window for CI breakage.
-Daniel
> ---
>  tests/vgem_basic.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
> index 526636dd1772..57c575e2e51b 100644
> --- a/tests/vgem_basic.c
> +++ b/tests/vgem_basic.c
> @@ -382,14 +382,18 @@ static void test_unload(void)
>         close(dmabuf);
>
>         /* Although closed, the mmap should keep the dmabuf/module alive */
> -       igt_assert_f(module_unload() == 0,
> -                    "A mmap should not keep the module alive\n");
> +       igt_assert_f(module_unload() != 0,
> +                    "A mmap should keep the module alive\n");
>
>         for (int page = 0; page < bo.size >> 12; page++)
>                 ptr[1024*page + page%1024] = page;
>
>         /* And finally we should have no more uses on the module. */
>         munmap(ptr, bo.size);
> +
> +       igt_assert_f(module_unload() == 0,
> +                    "No mmap anymore, should be able to unload\n");
> +
>  }
>
>  static bool has_prime_export(int fd)
> --
> 2.24.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
