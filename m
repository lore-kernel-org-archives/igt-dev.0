Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8166E02A
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2020 11:27:28 +0000 (UTC)
Date: Mon, 23 Nov 2020 13:27:24 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201123112724.GP7444@platvala-desk.ger.corp.intel.com>
References: <20201120105217.5058-1-tzimmermann@suse.de>
 <20201120105217.5058-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120105217.5058-2-tzimmermann@suse.de>
Subject: Re: [igt-dev] [PATCH v6 1/8] tests/fbdev: Move existing tests into
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

On Fri, Nov 20, 2020 at 11:52:10AM +0100, Thomas Zimmermann wrote:
> Move the existing tests into subgroups for testing modesetting and
> accessing the framebuffer.
> 
> v5:
> 	* test mmap() with igt_assert() (Daniel, Chris)
> v4:
> 	* declare fd as volatile (Petri)
> 	* add info test to CI
> v3:
> 	* put igt_describe() before igt_subtest() and igt_subtest_group()
> 	  (Petri)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/fbdev.c                         | 53 ++++++++++++++++++++-------
>  tests/intel-ci/fast-feedback.testlist |  1 +
>  2 files changed, 41 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index e5efeb93..a803f445 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -37,28 +37,17 @@
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
>  
> +	igt_describe("Check if screeninfo is valid");
>  	igt_subtest("info") {
>  		unsigned long size;
>  
> @@ -69,7 +58,17 @@ igt_main
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
> +	igt_describe("Check mmap operations on framebuffer memory");
>  	igt_subtest("mmap") {
>  		void *map;
>  
> @@ -82,6 +81,34 @@ igt_main
>  		memset(map, 0, fix_info.smem_len);
>  		munmap(map, fix_info.smem_len);
>  	}
> +}
> +
> +igt_main
> +{
> +	volatile int fd = -1;
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
> +	igt_describe("Check modesetting");
> +	igt_subtest_group {
> +		mode_tests(fd);
> +	}
> +
> +	igt_describe("Check framebuffer access");
> +	igt_subtest_group {
> +		framebuffer_tests(fd);
> +	}
>  
>  	igt_fixture {
>  		close(fd);
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index 83722f83..a40410a8 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -2,6 +2,7 @@
>  
>  igt@core_auth@basic-auth
>  igt@debugfs_test@read_all_entries
> +igt@fbdev@info
>  igt@fbdev@mmap
>  igt@gem_basic@bad-close
>  igt@gem_basic@create-close
> -- 
> 2.29.2
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
