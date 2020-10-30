Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5346E9AA
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2020 13:04:30 +0000 (UTC)
Date: Fri, 30 Oct 2020 15:04:27 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201030130427.GJ7444@platvala-desk.ger.corp.intel.com>
References: <20201030113653.3605117-1-chris@chris-wilson.co.uk>
 <20201030113653.3605117-2-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030113653.3605117-2-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] fbdev: Force module load
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 30, 2020 at 11:36:53AM +0000, Chris Wilson wrote:
> If there are no /dev/fbN, force loading of the first available drm
> module and try again.
> 
> v2: Use drm_load_module() directly
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2582
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Petri Latvala <petri.latvala@intel.com>


Nice.

For the series,
Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/fbdev.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/fbdev.c b/tests/fbdev.c
> index fe320b14f..e5efeb93d 100644
> --- a/tests/fbdev.c
> +++ b/tests/fbdev.c
> @@ -43,8 +43,16 @@ igt_main
>  	struct fb_fix_screeninfo fix_info;
>  	int fd = -1;
>  
> +	/*
> +	 * Should this test focus on the fbdev independent of any drm driver,
> +	 * or should it look for fbdev of a particular device?
> +	 */
>  	igt_fixture {
>  		fd = open("/dev/fb0", O_RDWR);
> +		if (fd < 0) {
> +			drm_load_module(DRIVER_ANY);
> +			fd = open("/dev/fb0", O_RDWR);
> +		}
>  		igt_require_f(fd != -1, "/dev/fb0\n");
>  
>  		igt_require(ioctl(fd, FBIOGET_VSCREENINFO, &var_info) == 0);
> -- 
> 2.28.0
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
