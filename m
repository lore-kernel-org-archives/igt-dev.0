Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2F66E19A
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2020 09:05:08 +0000 (UTC)
Date: Fri, 6 Nov 2020 11:05:01 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201106090501.GU7444@platvala-desk.ger.corp.intel.com>
References: <20201106082955.8939-1-tzimmermann@suse.de>
 <20201106082955.8939-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106082955.8939-2-tzimmermann@suse.de>
Subject: Re: [igt-dev] [PATCH v2 1/8] tests/fbdev: Move existing tests into
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
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: igt-dev@lists.freedesktop.org, chris@chris-wilson.co.uk
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Nov 06, 2020 at 09:29:48AM +0100, Thomas Zimmermann wrote:
> Move the existing tests into subgroups for testing modesetting and
> accessing the framebuffer.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  tests/fbdev.c | 55 +++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 42 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index e5efeb93..b61e1cea 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -37,24 +37,12 @@
>  
>  #include "igt.h"
>  
> -igt_main
> +static void mode_tests(int fd)
>  {
>  	struct fb_var_screeninfo var_info;
>  	struct fb_fix_screeninfo fix_info;
> -	int fd = -1;
>  
> -	/*
> -	 * Should this test focus on the fbdev independent of any drm driver,
> -	 * or should it look for fbdev of a particular device?
> -	 */
>  	igt_fixture {
> -		fd = open("/dev/fb0", O_RDWR);
> -		if (fd < 0) {
> -			drm_load_module(DRIVER_ANY);
> -			fd = open("/dev/fb0", O_RDWR);
> -		}
> -		igt_require_f(fd != -1, "/dev/fb0\n");
> -
>  		igt_require(ioctl(fd, FBIOGET_VSCREENINFO, &var_info) == 0);
>  		igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) == 0);
>  	}
> @@ -62,6 +50,8 @@ igt_main
>  	igt_subtest("info") {
>  		unsigned long size;
>  
> +		igt_describe("Check if screeninfo is valid");
> +

igt_describe needs to be called before the thing it documents
(igt_subtest_group or igt_subtest), can't call it from inside an
igt_subtest.


>  		size = var_info.yres * fix_info.line_length;
>  		igt_assert_f(size <= fix_info.smem_len,
>  			     "screen size (%d x %d) of pitch %d does not fit within mappable area of size %u\n",
> @@ -69,10 +59,21 @@ igt_main
>  			     fix_info.line_length,
>  			     fix_info.smem_len);
>  	}
> +}
> +
> +static void framebuffer_tests(int fd)
> +{
> +	struct fb_fix_screeninfo fix_info;
> +
> +	igt_fixture {
> +		igt_require(ioctl(fd, FBIOGET_FSCREENINFO, &fix_info) == 0);
> +	}
>  
>  	igt_subtest("mmap") {
>  		void *map;
>  
> +		igt_describe("Check mmap operations on framebuffer memory");
> +

Same here.



>  		igt_require(fix_info.smem_len);
>  
>  		map = mmap(NULL, fix_info.smem_len,
> @@ -82,6 +83,34 @@ igt_main
>  		memset(map, 0, fix_info.smem_len);
>  		munmap(map, fix_info.smem_len);
>  	}
> +}
> +
> +igt_main
> +{
> +	int fd = -1;
> +
> +	/*
> +	 * Should this test focus on the fbdev independent of any drm driver,
> +	 * or should it look for fbdev of a particular device?
> +	 */
> +	igt_fixture {
> +		fd = open("/dev/fb0", O_RDWR);
> +		if (fd < 0) {
> +			drm_load_module(DRIVER_ANY);
> +			fd = open("/dev/fb0", O_RDWR);
> +		}
> +		igt_require_f(fd != -1, "/dev/fb0\n");
> +	}
> +
> +	igt_subtest_group {
> +		igt_describe("Check modesetting");

Same here for this subtest_group, call igt_describe before the
igt_subtest_group block.

> +		mode_tests(fd);
> +	}
> +
> +	igt_subtest_group {
> +		igt_describe("Check framebuffer access");

Same.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
