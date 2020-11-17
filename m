Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EDA6E20C
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2020 13:44:49 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20201117125257.28089-3-tzimmermann@suse.de>
References: <20201117125257.28089-1-tzimmermann@suse.de>
 <20201117125257.28089-3-tzimmermann@suse.de>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 17 Nov 2020 13:44:41 +0000
Message-ID: <160562068144.22621.4601494672640293308@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH v4 2/8] tests/fbdev: Map framebuffer in
 igt_fixture
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

Quoting Thomas Zimmermann (2020-11-17 12:52:51)
> The mapping of the framebuffer memory will be useful for read/write
> tests. Move it into an igt_fixture block.
> 
> v4:
>         * declare map as volatile (Petri)
>         * test struct fb_fix_screeninfo.smem_len with igt_assert()
>         * remove mmap test from CI
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  tests/fbdev.c                         | 14 ++++++--------
>  tests/intel-ci/fast-feedback.testlist |  1 -
>  2 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index 44a26a6d..eebd2a83 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -63,22 +63,20 @@ static void mode_tests(int fd)
>  static void framebuffer_tests(int fd)
>  {
>         struct fb_fix_screeninfo fix_info;
> +       void * volatile map;
>  
>         igt_fixture {
>                 igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) == 0);
> -       }
> -
> -       igt_describe("Check mmap operations on framebuffer memory");
> -       igt_subtest("mmap") {
> -               void *map;
> -
> -               igt_require(fix_info.smem_len);
> +               igt_assert(fix_info.smem_len);
>  
>                 map = mmap(NULL, fix_info.smem_len,
>                            PROT_WRITE, MAP_SHARED, fd, 0);
> -               igt_require(map != MAP_FAILED);
> +               igt_assert(map != MAP_FAILED);

And now we go back to failing all tests if no mmap, rather than
skipping unsupported later tests. In the fixture, require would
definitely be preferable (as the test is abandoned before it is even
run).

>  
>                 memset(map, 0, fix_info.smem_len);
> +       }
> +
> +       igt_fixture {
>                 munmap(map, fix_info.smem_len);
>         }
>  }
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
