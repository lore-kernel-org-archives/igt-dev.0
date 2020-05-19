Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E1089CDF
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2020 19:47:39 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200519190257.16709-1-ashutosh.dixit@intel.com>
References: <20200519190257.16709-1-ashutosh.dixit@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158991765572.8153.3177849308791104850@build.alporthouse.com>
Date: Tue, 19 May 2020 20:47:35 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_tiled_wb: skip on devices
 without mappable aperture
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Ashutosh Dixit (2020-05-19 20:02:57)
> From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
> 
> Skip on devices without mappable aperture.
> 
> Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/i915/gem_tiled_wb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/i915/gem_tiled_wb.c b/tests/i915/gem_tiled_wb.c
> index b7f352fc7..b61a1b2e8 100644
> --- a/tests/i915/gem_tiled_wb.c
> +++ b/tests/i915/gem_tiled_wb.c
> @@ -139,6 +139,7 @@ igt_simple_main
>         uint32_t handle;
>  
>         fd = drm_open_driver(DRIVER_INTEL);
> +       gem_require_mappable_ggtt(fd);

To be precise, also

	igt_require(gem_available_fences() > 0);

and the ability to WB mmap. You'll note that even the mmap used here is
not yet supported on mmap-offset only HW.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
