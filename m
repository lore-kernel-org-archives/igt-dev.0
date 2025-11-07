Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F074CCF9F8
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 19:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B6E10EB62;
	Fri,  7 Nov 2025 19:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NsOZT7lG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8750610EB62
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 19:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762544863; x=1794080863;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KCpmLsYkB7H2ILMwAgnefkdSQOJCsb1tuSA9aMTOEcA=;
 b=NsOZT7lGCNfY9wEiE/CZAnyL9h3FMT5nypYvkhgH4Flwj5l4O81tWfk2
 Au9FRj9etCnko7YvfFruvZdKsjdmvmQrfKWgNtRux877Vs4CmEde9m5RF
 ou/QA1IWr4SRDHJja6yNQ4IKsp/Fav5A+ztlqoEy/IIVcBvPI1tjsn8Yp
 d3Nkp0K738CrYFDi1sRgISDYrOA40V4zjgkCswXMJ+WY2LsJ5XK52tufL
 AyCtfp3GQ2OImLOK9Cvp5qIhCscDMNyuKTDeExE81rHyO0b8MISWDqYxF
 kTshLx+hEFFfwng+hcbg1fpcjEb/vUt1H6Hquqi5oyzU6Cw4dv56IWOuu g==;
X-CSE-ConnectionGUID: lUO1LACgTpmKb9tWqj1g8w==
X-CSE-MsgGUID: AGI8y65KRmypB1E2h7dJsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="82100385"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="82100385"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 11:47:43 -0800
X-CSE-ConnectionGUID: H+WIujnoQtmcyJVCYio7Bg==
X-CSE-MsgGUID: xXMiSKgGRh+ADrF4sRSQNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="188377557"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 11:47:42 -0800
Date: Fri, 7 Nov 2025 20:47:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Xin Wang <x.wang@intel.com>
Cc: igt-dev@lists.freedesktop.org,
	Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH v8 2/2] lib/intel_device_info: Query runtime xe device
 graphics versions
Message-ID: <20251107194739.s2yrsh2xt7greq3q@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Xin Wang <x.wang@intel.com>, igt-dev@lists.freedesktop.org,
 Stuart Summers <stuart.summers@intel.com>
References: <20251020231253.138842-1-x.wang@intel.com>
 <20251020231253.138842-3-x.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251020231253.138842-3-x.wang@intel.com>
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

Hi Xin,
On 2025-10-20 at 23:12:53 +0000, Xin Wang wrote:
> For platforms with graphics_ver >= 20, query the runtime xe device ver
> instead of relying solely on hardcoded values from the PCI device table.
> This enables accurate IP minor version (graphics_rel) detection for
> platforms like Xe2 where different steppings have different IP versions.
> 
> Implementation details:
> - Use weak symbol linkage for xe_ipver_cache_lookup() to handle static
>   library compilation (libigt_chipset.a, libigt_device_scan.a) without
>   xe_query.c dependencies which are used for i915 tools (i915_perf and
>   intel_gpu_top)
> - Provide a weak stub that returns NULL when xe_query is not linked
> - For Gen20+ platforms, prefer runtime xe device versions over static data
> - Fall back to PCI table if xe device info is unavailable
> - Reset cache on query failure to allow retry
> 
> Remove hardcoded graphics_rel from static table entries for xe devices
> as they will be populated at runtime from GMD_ID.
> 
> This unifies device info handling between i915 and xe drivers, enabling:
> - Platform-specific workarounds based on accurate IP versions
> - Consistent device info API across both drivers

+Cc: "Stuart Summers" <stuart.summers@intel.com>
> 
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  lib/intel_device_info.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index a853f9ab4..87b1069be 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -3,6 +3,16 @@
>  #include "i915_pciids_local.h"
>  
>  #include <strings.h> /* ffs() */
> +#include <stddef.h>
> +#include <string.h>
> +
> +/* Weak symbol stub - will be overridden if xe_query.c is linked */
> +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid) __attribute__((weak));
> +
> +struct xe_device_ipver *xe_ipver_cache_lookup(uint32_t devid)
> +{
> +	return NULL;
> +}
>  

This seems wrong, you cannot cache by devid, either you
already have it or not. Also devid depends on register(s)
reading and you can access that only when you have fd already
opened.

>  static const struct intel_device_info intel_generic_info = {
>  	.graphics_ver = 0,
> @@ -505,7 +515,6 @@ static const struct intel_device_info intel_pontevecchio_info = {
>  
>  static const struct intel_device_info intel_lunarlake_info = {
>  	.graphics_ver = 20,
> -	.graphics_rel = 4,

This also seems wrong, please keep old values for compatibility,
here and below.

Regards,
Kamil

>  	.display_ver = 20,
>  	.has_4tile = true,
>  	.has_flatccs = true,
> @@ -517,7 +526,6 @@ static const struct intel_device_info intel_lunarlake_info = {
>  
>  static const struct intel_device_info intel_battlemage_info = {
>  	.graphics_ver = 20,
> -	.graphics_rel = 1,
>  	.display_ver = 14,
>  	.has_4tile = true,
>  	.has_flatccs = true,
> @@ -529,7 +537,6 @@ static const struct intel_device_info intel_battlemage_info = {
>  
>  static const struct intel_device_info intel_pantherlake_info = {
>  	.graphics_ver = 30,
> -	.graphics_rel = 0,
>  	.display_ver = 30,
>  	.has_4tile = true,
>  	.has_flatccs = true,
> @@ -675,6 +682,8 @@ const struct intel_device_info *intel_get_device_info(uint16_t devid)
>  {
>  	static __thread const struct intel_device_info *cache = &intel_generic_info;
>  	static __thread uint16_t cached_devid;
> +	static __thread struct intel_device_info xe_dev_info;
> +	struct xe_device_ipver *ipver;
>  	int i;
>  
>  	if (cached_devid == devid)
> @@ -689,6 +698,17 @@ const struct intel_device_info *intel_get_device_info(uint16_t devid)
>  	cached_devid = devid;
>  	cache = (void *)intel_device_match[i].match_data;
>  
> +	if (cache->graphics_ver >= 20) {
> +		ipver = xe_ipver_cache_lookup(devid);
> +		if (ipver && ipver->devid == devid) {
> +			memcpy(&xe_dev_info, cache, sizeof(struct intel_device_info));
> +			xe_dev_info.graphics_ver = ipver->graphics_ver;
> +			xe_dev_info.graphics_rel = ipver->graphics_rel;
> +			cache = &xe_dev_info;
> +		} else {
> +			cached_devid = 0;
> +		}
> +	}
>  out:
>  	return cache;
>  }
> -- 
> 2.43.0
> 
