Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C8F6E5AE
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2020 10:27:11 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200129181601.15918-1-imre.deak@intel.com>
In-Reply-To: <20200129181601.15918-1-imre.deak@intel.com>
Message-ID: <158037903617.16598.16881778556273041828@skylake-alporthouse-com>
Date: Thu, 30 Jan 2020 10:10:36 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/9] lib/ioctl_wrappers: Query if device
 supports set/get legacy tiling
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
To: Imre Deak <imre.deak@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Imre Deak (2020-01-29 18:15:53)
> From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
> 
> Add a method to query if the device supports setting and getting legacy
> tiling formats for buffer objects.

Legacy is never a good choice for a name longterm. Say what you mean

gem_mmap_gtt_uses_tiling or
gem_mmap_aperture_has_detiling

> 
> Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  lib/ioctl_wrappers.c | 17 +++++++++++++++++
>  lib/ioctl_wrappers.h |  1 +
>  2 files changed, 18 insertions(+)
> 
> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index 627717d2..c1abb575 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -133,6 +133,23 @@ __gem_get_tiling(int fd, struct drm_i915_gem_get_tiling *arg)
>         return err;
>  }
>  
> +/**
> + * gem_has_legacy_hw_tiling:
> + * @fd: open i915 drm file descriptor
> + *
> + * Feature check to query if the device supports setting/getting
> + * legacy tiling formats for buffer objects
> + *
> + * Returns: True if tiling is supported
> + */
> +bool
> +gem_has_legacy_hw_tiling(int fd)
> +{
> +       struct drm_i915_gem_get_tiling arg = {};
> +
> +       return (__gem_get_tiling(fd, &arg) != -EOPNOTSUPP);

There was already an interface for this, the number of available fences.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
