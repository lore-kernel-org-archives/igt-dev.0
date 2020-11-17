Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CDB6E223
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2020 13:41:59 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201117125257.28089-2-tzimmermann@suse.de>
References: <20201117125257.28089-1-tzimmermann@suse.de>
 <20201117125257.28089-2-tzimmermann@suse.de>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 17 Nov 2020 13:41:48 +0000
Message-ID: <160562050836.22621.11084460317362613537@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH v4 1/8] tests/fbdev: Move existing tests into
 separate subgroups
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
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel.vetter@ffwll.ch, petri.latvala@intel.com
Cc: igt-dev@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Thomas Zimmermann (2020-11-17 12:52:50)
> +static void framebuffer_tests(int fd)
> +{
> +       struct fb_fix_screeninfo fix_info;
> +
> +       igt_fixture {
> +               igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) == 0);

igt_info("Testing fbdev: %s\n", fix_info.id);

would be a useful addition.

> +       }
>  
> +       igt_describe("Check mmap operations on framebuffer memory");
>         igt_subtest("mmap") {
>                 void *map;
>  
> @@ -77,11 +76,39 @@ igt_main
>  
>                 map = mmap(NULL, fix_info.smem_len,
>                            PROT_WRITE, MAP_SHARED, fd, 0);
> -               igt_assert(map != MAP_FAILED);
> +               igt_require(map != MAP_FAILED);

Under what conditions do we want to allow a driver to fail to provide
mmap()? I haven't spotted anything in uapi/fb.h to indicate what bits of
the iface are optional, or other rules userspace needs to follow.

igt_skip_on(!fix_info.smem_len)?

If mmap() failing is the only true indicator that its not supported, so
be it. In which case is errno significant?
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
