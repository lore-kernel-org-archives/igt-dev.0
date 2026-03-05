Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CD8F3095D
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 13:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4679010E29E;
	Thu,  5 Mar 2026 13:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ErIIs93S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9345C10E29E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 13:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772717000; x=1804253000;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6050b+rV5tIJaude9PbVkc2y07UzwsSeIJKvZsDLBX8=;
 b=ErIIs93Sp5jBxNlhuyhg/XCSKx32cQ2+IMPFyhIH2XyMT9zbHMfTh8FG
 KNUoK857OueR2pnKrYHBavhd73mWtnRMXdzSlInrJ2+nOwbLRGozd5q8I
 p/WGV+fzzd4vsCdFwKV9OgSBfpaMD/ceaGoglXMzQss/mlQLL2EDxVLv1
 mCKpbjG+JH5yUrhePztMCxCS0j1X/TE3i04M1UHOFrDpfSUa0CS8CXJg6
 OOD5TObojX9+rqrCLE8EqcUxQuTjGVNF0Y3dsEM04YOeT5i97DopMGKyv
 by7n2x+C1yMi/oRsvhVl2NWdRDyagZDd7H/VGMueFzLiXcD+o/WNlVcj4 g==;
X-CSE-ConnectionGUID: 7j3NcL/DRK6anO0c5cPRpw==
X-CSE-MsgGUID: P+ouKo+URreSOeNVEuLTdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84887691"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="84887691"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:23:19 -0800
X-CSE-ConnectionGUID: jB4ziGtPSk6xtbaIabykDg==
X-CSE-MsgGUID: gfJVrpuyRyGuJVdxyZEWfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="249151249"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.31])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:23:20 -0800
Date: Thu, 5 Mar 2026 14:23:17 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: himanshu.girotra@intel.com
Cc: matthew.d.roper@intel.com, x.wang@intel.com, 
 igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 ashutosh.dixit@intel.com
Subject: Re: [PATCH v2 i-g-t] lib/intel_pat: Cache PAT config for
 unprivileged processes
Message-ID: <gis4rdisrokclywmys6ev6maaojhdvern4ggjtxro6zhv7cpgj@5dhokhtspv3f>
References: <20260305122548.28328-1-himanshu.girotra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305122548.28328-1-himanshu.girotra@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Thu, Mar 05, 2026 at 05:55:48PM +0530, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
> 
> Commit 4e59b8e7779b ("lib/intel_pat: use kernel debugfs as
> authoritative PAT source for Xe") changed the Xe PAT lookup to
> read from debugfs, which requires root access. Some xe_oa subtests
> fork a child process that drops root privileges before performing
> GPU operations that internally need the PAT write-back index.
> After dropping root, the debugfs read fails.
> 
> Fix this by caching the PAT configuration in struct xe_device at
> xe_device_get() time. Since xe_device_get() is called while still
> root, the cache is available to forked children even after
> igt_drop_root(). Tests that open a new fd after forking must call
> xe_device_get() explicitly before dropping root to populate the
> cache for that fd.
> 
> v2: Cache PAT in struct xe_device instead of a global static;
>     drop the intel_pat_precache() helper — xe_device_get() already
>     populates the cache, so call it directly in xe_oa before
>     igt_drop_root() (Ashutosh Dixit)
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Xin Wang <x.wang@intel.com>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  lib/intel_pat.c     | 18 ++++++++++--------
>  lib/xe/xe_query.c   | 10 ++++++++++
>  lib/xe/xe_query.h   |  8 ++++++++
>  tests/intel/xe_oa.c |  8 ++++++++
>  4 files changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 8660a2515..1dcb84cc6 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -6,6 +6,7 @@
>  #include <fcntl.h>
>  #include "igt.h"
>  #include "intel_pat.h"
> +#include "xe/xe_query.h"
>  
>  /**
>   * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table) software configuration
> @@ -99,17 +100,18 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>  	uint16_t dev_id;
>  
>  	/*
> -	 * For Xe driver, query the kernel's PAT software configuration
> -	 * via debugfs. The kernel is the authoritative source for PAT
> -	 * indices, accounting for platform-specific workarounds
> -	 * (e.g. Wa_16023588340) at runtime.
> +	 * For Xe, use the PAT cache stored in struct xe_device.
> +	 * xe_device_get() populates the cache while still root; forked
> +	 * children that inherit the xe_device can use it post-drop_root().
>  	 */
>  	if (is_xe_device(fd)) {
> -		int32_t parsed = xe_get_pat_sw_config(fd, pat);
> +		struct xe_device *xe_dev = xe_device_get(fd);
>  
> -		igt_assert_f(parsed > 0,
> -			     "Failed to get PAT sw_config from debugfs (parsed=%d)\n",
> -			     parsed);
> +		igt_assert_f(xe_dev->pat_cached,
> +			     "PAT not cached in xe_device for fd %d -- "
> +			     "was xe_device_get() called before igt_drop_root()?\n",
> +			     fd);
> +		*pat = xe_dev->pat_cache;
>  		return;
>  	}
>  
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 981d76948..256ec1d4d 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -22,6 +22,7 @@
>  #include "ioctl_wrappers.h"
>  #include "igt_map.h"
>  
> +#include "intel_pat.h"
>  #include "xe_query.h"
>  #include "xe_ioctl.h"
>  
> @@ -299,6 +300,15 @@ struct xe_device *xe_device_get(int fd)
>  	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
>  	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
>  
> +	/*
> +	 * Populate the PAT cache while we still have sufficient privileges
> +	 * to read debugfs.  Forked children that inherit this xe_device
> +	 * (via fork()) will be able to use the cached values even after
> +	 * dropping root with igt_drop_root().
> +	 */
> +	if (xe_get_pat_sw_config(xe_dev->fd, &xe_dev->pat_cache) > 0)
> +		xe_dev->pat_cached = true;

I think you should add some 'fixme' note above because it will work
only for single gpu. This is acceptable atm, but it should be fixed
in case of more gpus (by adding list which caches pat entries for
ver/rel).

So for this fix:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +
>  	/* We may get here from multiple threads, use first cached xe_dev */
>  	pthread_mutex_lock(&cache.cache_mutex);
>  	prev = find_in_cache_unlocked(fd);
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index d7a9f95f9..97bcf0d32 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -9,6 +9,8 @@
>  #ifndef XE_QUERY_H
>  #define XE_QUERY_H
>  
> +#include "intel_pat.h"
> +
>  #include <stdint.h>
>  #include <xe_drm.h>
>  
> @@ -74,6 +76,12 @@ struct xe_device {
>  
>  	/** @dev_id: Device id of xe device */
>  	uint16_t dev_id;
> +
> +	/** @pat_cache: cached PAT index configuration */
> +	struct intel_pat_cache pat_cache;
> +
> +	/** @pat_cached: true once @pat_cache has been populated */
> +	bool pat_cached;
>  };
>  
>  #define xe_for_each_engine(__fd, __hwe) \
> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
> index 927f3f4f2..9ce828619 100644
> --- a/tests/intel/xe_oa.c
> +++ b/tests/intel/xe_oa.c
> @@ -3453,6 +3453,14 @@ test_single_ctx_render_target_writes_a_counter(const struct drm_xe_oa_unit *oau)
>  			/* A local device for local resources. */
>  			drm_fd = drm_reopen_driver(drm_fd);
>  
> +			/*
> +			 * Populate the xe_device cache (including PAT) for
> +			 * the new fd while we still have root privileges.
> +			 * intel_get_pat_idx_*() reads PAT from xe_device,
> +			 * so this must happen before igt_drop_root().
> +			 */
> +			xe_device_get(drm_fd);
> +
>  			igt_drop_root();
>  
>  			single_ctx_helper(oau);
> -- 
> 2.50.1
> 
