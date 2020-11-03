Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4B96E5BF
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2020 12:01:26 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id i18so10972401ots.0
 for <igt-dev@lists.freedesktop.org>; Tue, 03 Nov 2020 04:01:26 -0800 (PST)
MIME-Version: 1.0
References: <20201103104813.18236-1-tzimmermann@suse.de>
 <20201103104813.18236-2-tzimmermann@suse.de>
In-Reply-To: <20201103104813.18236-2-tzimmermann@suse.de>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 3 Nov 2020 13:01:14 +0100
Message-ID: <CAKMK7uGPFZvnYKEMQhAVE-2SVMzvPOAvvwY0CLpDyB4nQsK8Ag@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH 1/2] tests/fbdev: Store framebuffer pointer at
 function scope
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
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 3, 2020 at 11:48 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Quick intro to igt subtests: They can be enumerated without running
them (--list-subtest), which skips everything in these blocks, and
they can be run individually (with --run-subtest).

This means if you extract setup code into common code, you have to
pull it all out into igt_fixtures. But that also complicates the test
flow if e.g. another test would be trying to unload the fbdev driver,
so generally only  a good idea if you need a given pieces of setup for
all tests (or a set of tests in an igt_subtest_group) and the code is
expensive enough to warrant the extraction.

I'd just extract this into an fbdev mmap helper here that you can call
from test functions as needed. That's simpler.
-Daniel

> ---
>  tests/fbdev.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index e5efeb93..11df954d 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -42,6 +42,7 @@ igt_main
>         struct fb_var_screeninfo var_info;
>         struct fb_fix_screeninfo fix_info;
>         int fd = -1;
> +       void *map = NULL;
>
>         /*
>          * Should this test focus on the fbdev independent of any drm driver,
> @@ -71,7 +72,6 @@ igt_main
>         }
>
>         igt_subtest("mmap") {
> -               void *map;
>
>                 igt_require(fix_info.smem_len);
>
> @@ -80,10 +80,11 @@ igt_main
>                 igt_assert(map != MAP_FAILED);
>
>                 memset(map, 0, fix_info.smem_len);
> -               munmap(map, fix_info.smem_len);
>         }
>
>         igt_fixture {
> +               if (map && map != MAP_FAILED)
> +                       munmap(map, fix_info.smem_len);
>                 close(fd);
>         }
>  }
> --
> 2.29.0
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
