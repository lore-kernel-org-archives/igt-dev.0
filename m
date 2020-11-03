Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41BFE6EC88
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2020 12:58:20 +0000 (UTC)
Date: Tue, 3 Nov 2020 14:58:16 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201103125816.GO7444@platvala-desk.ger.corp.intel.com>
References: <20201103104813.18236-1-tzimmermann@suse.de>
 <20201103104813.18236-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103104813.18236-3-tzimmermann@suse.de>
Subject: Re: [igt-dev] [PATCH 2/2] tests/fbdev: Add tests for read/write ops
 on framebuffer
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 11:48:13AM +0100, Thomas Zimmermann wrote:
> Read and write tests check the read and written buffer against the
> content of the mapped framebuffer. Fbdev has some specific behavior
> when reading/writing near the EOF, which the eof test checks.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  tests/fbdev.c | 80 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index 11df954d..045b0874 100644
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
> @@ -43,6 +44,7 @@ igt_main
>  	struct fb_fix_screeninfo fix_info;
>  	int fd = -1;
>  	void *map = NULL;
> +	void *buf = NULL;

In addition to what Daniel and Chris already pointed out:

Behind the scenes igt_subtest and igt_fixture use longjmp. Variables
in function scope that are assigned after setjmp have unspecified
values after longjmp. Translated to IGT terms: Variables declared in
igt_main that are assigned to when inside igt_fixture or igt_subtest
have unspecified values when inside another such block.

In essence if you move the variables to be shared across multiple
tests they need to be moved all the way to global scope.


-- 
Petri Latvala



>  
>  	/*
>  	 * Should this test focus on the fbdev independent of any drm driver,
> @@ -82,7 +84,85 @@ igt_main
>  		memset(map, 0, fix_info.smem_len);
>  	}
>  
> +	igt_subtest("read") {
> +		ssize_t ret;
> +		int cmp;
> +
> +		/* allocate two additional byte for eof test */
> +		buf = malloc(fix_info.smem_len + 2);
> +		igt_assert(buf);
> +
> +		/* framebuffer should be 0 from mmap test */
> +		ret = pread(fd, buf, fix_info.smem_len, 0);
> +		igt_require_f(ret == (ssize_t)fix_info.smem_len, "pread failed\n");
> +		cmp = memcmp(map, buf, fix_info.smem_len);
> +		igt_require_f(!cmp, "read buffer differs from mapped framebuffer for 0\n");
> +
> +		/* fill framebuffer with 0x55 and compare again */
> +		memset(map, 0x55, fix_info.smem_len);
> +		ret = pread(fd, buf, fix_info.smem_len, 0);
> +		igt_require_f(ret == (ssize_t)fix_info.smem_len, "pread failed\n");
> +		cmp = memcmp(map, buf, fix_info.smem_len);
> +		igt_require_f(!cmp, "read buffer differs from mapped framebuffer for 0x55\n");
> +	}
> +
> +	igt_subtest("write") {
> +		ssize_t ret;
> +		int cmp;
> +
> +		/* clear framebuffer and compare again */
> +		memset(buf, 0, fix_info.smem_len);
> +		ret = pwrite(fd, buf, fix_info.smem_len, 0);
> +		igt_require_f(ret == (ssize_t)fix_info.smem_len, "pwrite failed\n");
> +		cmp = memcmp(map, buf, fix_info.smem_len);
> +		igt_require_f(!cmp, "write buffer differs from mapped framebuffer for 0\n");
> +	}
> +
> +	igt_subtest("eof") {
> +		unsigned long lastindex = fix_info.smem_len - 1;
> +		unsigned char *maplast = &((unsigned char *)map)[lastindex];
> +		unsigned char *buflast = &((unsigned char *)buf)[lastindex];
> +		long long ret;
> +
> +		*buflast = 0x55;
> +
> +		/* write across EOF; set remaining bytes */
> +		ret = (long long)pwrite(fd, buflast, 2, lastindex);
> +		igt_require_f(ret == 1, "write crossed EOF, ret=%lld\n", ret);
> +		igt_require_f(*maplast == *buflast, "write buffer differs from mapped framebuffer at final byte, "
> +		                                    "maplast=%u buflast=%u\n", *maplast, *buflast);
> +
> +		/* write at EOF; get ENOSPC */
> +		ret = (long long)pwrite(fd, &buflast[1], 1, lastindex + 1);
> +		igt_require_f((ret == -1) && (errno == ENOSPC), "write at EOF, ret=%lld\n", ret);
> +
> +		*maplast = 0;
> +
> +		/* write final byte */
> +		ret = (long long)pwrite(fd, buflast, 1, lastindex);
> +		igt_require_f(ret == 1, "write before EOF, ret=%lld\n", ret);
> +		igt_require_f(*maplast == *buflast, "write buffer differs from mapped framebuffer at final byte, "
> +		                                    "maplast=%u buflast=%u\n", *maplast, *buflast);
> +
> +		/* write after EOF; get EFBIG */
> +		ret = (long long)pwrite(fd, &buflast[2], 1, lastindex + 2);
> +		igt_require_f((ret == -1) && (errno == EFBIG), "write after EOF, ret=%lld\n", ret);
> +
> +		*maplast = 0;
> +
> +		/* read across the EOF; get remaining bytes */
> +		ret = (long long)pread(fd, buflast, 2, lastindex);
> +		igt_require_f(ret == 1, "read before EOF\n");
> +		igt_require_f(*maplast == *buflast, "read buffer differs from mapped framebuffer at final byte, "
> +		                                    "maplast=%u buflast=%u\n", *maplast, *buflast);
> +
> +		/* read after EOF; get 0 */
> +		ret = (long long)pread(fd, &buflast[1], 1, lastindex + 1);
> +		igt_require_f(ret == 0, "read at EOF, ret=%lld\n", ret);
> +	}
> +
>  	igt_fixture {
> +		free(buf);
>  		if (map && map != MAP_FAILED)
>  			munmap(map, fix_info.smem_len);
>  		close(fd);
> -- 
> 2.29.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
