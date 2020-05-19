Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33826E550
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 13:52:38 +0000 (UTC)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20200519134405.1876899-1-chris@chris-wilson.co.uk>
References: <20200519134405.1876899-1-chris@chris-wilson.co.uk>
Date: Tue, 19 May 2020 16:50:20 +0300
Message-ID: <87r1vgt4o3.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Remove early
 has_known_intel_chipset() check
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
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Chris Wilson <chris@chris-wilson.co.uk> writes:

> When opening a specific driver, open that driver. Once we have the
> device fd, we can then do feature checks that the tests *actually*
> require.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  lib/drmtest.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
>
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 040ca39c2..70fd64c95 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -118,24 +118,6 @@ bool is_vc4_device(int fd)
>  	return __is_device(fd, "vc4");
>  }
>  
> -static bool has_known_intel_chipset(int fd)
> -{
> -	struct drm_i915_getparam gp;
> -	int devid = 0;
> -
> -	memset(&gp, 0, sizeof(gp));
> -	gp.param = I915_PARAM_CHIPSET_ID;
> -	gp.value = &devid;
> -
> -	if (ioctl(fd, DRM_IOCTL_I915_GETPARAM, &gp, sizeof(gp)))
> -		return false;
> -
> -	if (!intel_gen(devid))
> -		return false;

Has this been used to weed out the protos/nonpublished pciid ones?
-Mika


> -
> -	return true;
> -}
> -
>  static char _forced_driver[16] = "";
>  
>  /**
> @@ -636,7 +618,7 @@ void igt_require_amdgpu(int fd)
>  
>  void igt_require_intel(int fd)
>  {
> -	igt_require(is_i915_device(fd) && has_known_intel_chipset(fd));
> +	igt_require(is_i915_device(fd));
>  }
>  
>  void igt_require_vc4(int fd)
> -- 
> 2.26.2
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
