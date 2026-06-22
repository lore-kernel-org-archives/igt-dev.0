Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D744CDB46F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 15:01:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDF010E62B;
	Mon, 22 Jun 2026 15:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5rLzju6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9650110E62B
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 15:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782140476; x=1813676476;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BVd5xqmtGV2WYdo4WNOR6Yt3lTWXEkTgg0AGEMvnw9I=;
 b=a5rLzju6HXXJ0H9a7Lqa33ExkQ90jPj4lVrJ8Z8lIK2dzptaiqSl1V2r
 FIg1JeQ8Jb6Pyn7KaUZknkkPEA5bITScITxabLGZruArjDKqUnIZm7E1e
 u3f4AFzADcMwkVKm0hsQkfHFDnM+RCfsvEAxqJerl0MV2UFgWJPYNFja9
 xzKbAXT+TfanTr9Q1wsbSL/c4KLwDbPbKSh2moQfcG/2m9IJW9b+9l0sB
 A5JK9+HwRPpoaVCo7M4MHNhi9cFlIfy3v52nNluSzre1yBWVNYMU/WMNc
 9EoQgdzZy8rjkS5omx16gpXkBEuhvpkXYdnYJQxL0A3jMGS2vaEEtmS7u w==;
X-CSE-ConnectionGUID: uaBbObzYSAShDRkoivWBuw==
X-CSE-MsgGUID: a66o0Y7MTAKCZKzZBO64rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93989740"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="93989740"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 08:01:16 -0700
X-CSE-ConnectionGUID: XeNnBPh7RZChyozwV2nH7w==
X-CSE-MsgGUID: pWf+hSs4RHOjq2c1TO454g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="245102966"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 08:01:13 -0700
Date: Mon, 22 Jun 2026 17:00:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 kamil.konieczny@intel.com, riana.tauro@intel.com,
 sk.anirban@intel.com, jani.nikula@intel.com
Subject: Re: [PATCH v3 i-g-t] tests/intel: Enable survivability tests on
 discrete platforms >= BMG
Message-ID: <20260622150056.ueb7a3uvvbucqlu5@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 himanshu.girotra@intel.com, igt-dev@lists.freedesktop.org,
 ramadevi.gandi@intel.com, kamil.konieczny@intel.com,
 riana.tauro@intel.com, sk.anirban@intel.com, jani.nikula@intel.com
References: <20260622122431.11139-1-himanshu.girotra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622122431.11139-1-himanshu.girotra@intel.com>
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

Hi himanshu.girotra,
On 2026-06-22 at 17:54:31 +0530, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
> 
> The survivability mode tests in xe_survivability and xe_configfs were
> initially developed for Battlemage (BMG) and gated with IS_BATTLEMAGE.
> Survivability mode is, however, supported by the KMD on all discrete
> platforms from BMG onwards.
> 
> Mirror this on the IGT side by replacing the BMG-only check with a
> runtime discrete check combined with a graphics version check
> of at least BMG (IP_VER(20, 1)).
> 
> v2: use is_intel_dgfx() (Jani Nikula)
> v3: add xe_has_survivability() helper in lib/xe/xe_query (Kamil Konieczny)
> 
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/xe/xe_query.c              | 14 ++++++++++++++
>  lib/xe/xe_query.h              |  1 +
>  tests/intel/xe_configfs.c      |  6 +++---
>  tests/intel/xe_survivability.c |  2 +-
>  4 files changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index f0799f268..68e60ddc7 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -23,6 +23,7 @@
>  #include "igt_debugfs.h"
>  #include "ioctl_wrappers.h"
>  #include "igt_map.h"
> +#include "intel_common.h"
>  #include "intel_pat.h"
>  
>  #include "xe_query.h"
> @@ -813,6 +814,19 @@ xe_dev_FN(xe_number_engines, engines->num_engines, unsigned int);
>   */
>  xe_dev_FN(xe_has_vram, has_vram, bool);
>  
> +/**
> + * xe_has_survivability:
> + * @fd: xe device fd
> + *
> + * Returns true if xe device @fd supports survivability mode. Survivability
> + * mode is supported on discrete platforms from Battlemage (BMG) onwards.
> + */
> +bool xe_has_survivability(int fd)
> +{
> +	return is_intel_dgfx(fd) &&
> +	       intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(20, 1);
> +}
> +
>  /**
>   * xe_vram_size:
>   * @fd: xe device fd
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 9f04a7422..59330d80f 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -153,6 +153,7 @@ struct drm_xe_query_gt_list *xe_gt_list(int fd);
>  struct drm_xe_query_oa_units *xe_oa_units(int fd);
>  unsigned int xe_number_engines(int fd);
>  bool xe_has_vram(int fd);
> +bool xe_has_survivability(int fd);
>  uint64_t xe_vram_size(int fd, int gt);
>  uint64_t xe_visible_vram_size(int fd, int gt);
>  uint64_t xe_available_vram_size(int fd, int gt);
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index e7c797eb7..450c0a119 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -377,16 +377,16 @@ static void close_configfs_group(int configfs_fd, int configfs_device_fd)
>  int igt_main()
>  {
>  	int fd, configfs_fd, configfs_device_fd;
> -	uint32_t devid;
>  	bool is_vf_device;
> +	bool has_survivability;
>  	const char *engine = NULL;
>  
>  	igt_fixture() {
>  		struct drm_xe_engine_class_instance *hwe;
>  
>  		fd = drm_open_driver(DRIVER_XE);
> -		devid = intel_get_drm_devid(fd);
>  		is_vf_device = intel_is_vf_device(fd);
> +		has_survivability = xe_has_survivability(fd);
>  		set_bus_addr(fd);
>  
>  		xe_for_each_engine(fd, hwe) {
> @@ -410,7 +410,7 @@ int igt_main()
>  
>  	igt_describe("Validate survivability mode");
>  	igt_subtest("survivability-mode") {
> -		igt_require(IS_BATTLEMAGE(devid));
> +		igt_require(has_survivability);
>  		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");
>  		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_survivability_mode(configfs_device_fd);
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index d5d7e048c..74488bbea 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -217,7 +217,7 @@ int igt_main()
>  
>  	igt_fixture() {
>  		fd = drm_open_driver(DRIVER_XE);
> -		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
> +		igt_require(xe_has_survivability(fd));
>  		vf_device = intel_is_vf_device(fd);
>  		igt_require_f(!vf_device, "survivability mode not supported in VF\n");
>  		pci_xe = igt_device_get_pci_device(fd);
> -- 
> 2.50.1
> 
