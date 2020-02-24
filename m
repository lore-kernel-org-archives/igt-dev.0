Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0866E9B0
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2020 22:48:28 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20200224150358.1472416-1-lionel.g.landwerlin@intel.com>
 <20200224150358.1472416-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20200224150358.1472416-2-lionel.g.landwerlin@intel.com>
Message-ID: <158258450363.26598.11244006457853766017@skylake-alporthouse-com>
Date: Mon, 24 Feb 2020 22:48:23 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/i915/perf: fix subslice
 availability testing
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Lionel Landwerlin (2020-02-24 15:03:58)
> Fixes the perf oa-formats tests on Gen9LP.
> 
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Fixes: 53f8f541ca ("lib: Add i915_perf library")
> ---
>  lib/i915/perf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
> index 9977c745..5b5b7f90 100644
> --- a/lib/i915/perf.c
> +++ b/lib/i915/perf.c
> @@ -157,7 +157,7 @@ intel_perf_for_devinfo(uint32_t device_id,
>  
>                 perf->devinfo.slice_mask |= 1ULL << s;
>                 for (uint32_t ss = 0; ss < topology->max_subslices; ss++) {
> -                       if (!subslice_available(topology, 0, s))
> +                       if (!subslice_available(topology, s, ss))
>                                 continue;

Yes, that does seem to match the arguments better.
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
