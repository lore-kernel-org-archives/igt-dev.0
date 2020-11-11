Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AE66E046
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2020 09:54:20 +0000 (UTC)
Date: Wed, 11 Nov 2020 11:54:04 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201111095404.GC7444@platvala-desk.ger.corp.intel.com>
References: <20201110075102.5033-1-tzimmermann@suse.de>
 <20201110075102.5033-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110075102.5033-4-tzimmermann@suse.de>
Subject: Re: [igt-dev] [PATCH v3 3/8] tests/fbdev: Add tests for read
 operations on framebuffer
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
Cc: igt-dev@lists.freedesktop.org, chris@chris-wilson.co.uk
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 10, 2020 at 08:50:57AM +0100, Thomas Zimmermann wrote:
> The read tests check the read buffer against the content of the mapped
> framebuffer.
> 
> v3:
> 	* put igt_describe() before igt_subtest() (Petri)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  tests/fbdev.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index fc66210a..97d66217 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -25,6 +25,7 @@
>  
>  #include "igt.h"
>  
> +#include <errno.h>
>  #include <fcntl.h>
>  #include <string.h>
>  #include <sys/ioctl.h>
> @@ -64,6 +65,7 @@ static void framebuffer_tests(int fd)
>  {
>  	struct fb_fix_screeninfo fix_info;
>  	void *map;
> +	void *buf;
>  
>  	igt_fixture {
>  		igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) == 0);
> @@ -73,10 +75,33 @@ static void framebuffer_tests(int fd)
>  			   PROT_WRITE, MAP_SHARED, fd, 0);
>  		igt_assert(map != MAP_FAILED);
>  
> +		buf = malloc(fix_info.smem_len);
> +		igt_assert(buf);

igt_require here instead. The thumb rule is igt_assert for checks
where failure says "kernel is broken", igt_require where failure says
"cannot test this".


> +	}
> +
> +	igt_describe("Check read operations on framebuffer memory");
> +	igt_subtest("read") {
> +		ssize_t ret;
> +		int cmp;
> +
> +		/* fill framebuffer with 0 and compare */
>  		memset(map, 0, fix_info.smem_len);
> +		ret = pread(fd, buf, fix_info.smem_len, 0);
> +		igt_require_f(ret == (ssize_t)fix_info.smem_len, "pread failed, ret=%zd\n", ret);
> +		cmp = memcmp(map, buf, fix_info.smem_len);
> +		igt_require_f(!cmp, "read buffer differs from mapped framebuffer for 0\n");
> +
> +		/* fill framebuffer with 0x55 and compare */
> +		memset(map, 0x55, fix_info.smem_len);
> +		ret = pread(fd, buf, fix_info.smem_len, 0);
> +		igt_require_f(ret == (ssize_t)fix_info.smem_len, "pread failed, ret=%zd\n", ret);
> +		cmp = memcmp(map, buf, fix_info.smem_len);
> +		igt_require_f(!cmp, "read buffer differs from mapped framebuffer for 0x55\n");

Here, these igt_requires should be igt_asserts.

>  	}
>  
>  	igt_fixture {
> +		free(buf);
> +		memset(map, 0, fix_info.smem_len); // don't leave garbage on the screen

Make sure fix_info has good values here in the case where we didn't
execute any subtests in framebuffer_tests(). If I read right it's
initialized in the igt_fixture so it should be good...


-- 
Petri Latvala


>  		munmap(map, fix_info.smem_len);
>  	}
>  }
> -- 
> 2.29.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
