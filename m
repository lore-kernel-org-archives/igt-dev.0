Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65714CDB46B
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 10:12:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30C310E5ED;
	Mon, 22 Jun 2026 10:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RRe3sjij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCFC10E5D2
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 10:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782123129; x=1813659129;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AitnuIxBU1mki18qmcEQXJz8qxQvsmaFt7io04VhicE=;
 b=RRe3sjijA/tWJ9/7FU+hc5ceZvB7rfom02aRtdMKWzOzMPE1QBdEZQ1V
 ezeBCx9s1A2l3YSkXGbaQCOo1TuJFSZhbyIN6lNMvS+Z4ojc9kim1zlSt
 0ByY9k7hYPUeUYK0Crp4TkJVSf9Cg6oxUASsOPjEKS8bzkFUEo5189FGk
 U9dufOStO60Enr676RhU9rlWqf/taZmeYYDLqD06x/+IYzDN92ZOgI6Ge
 TDbuFxRPFZdhgjfw7p83ZgMX4/GnEujzqP/cOxHa1etndo/sAd/1VeZhu
 qYxsLySl2Os31oDo4znDNOJpfGvKG9+2AcFXt1N5Qd0Gq63v6+xFf40uX A==;
X-CSE-ConnectionGUID: gYGdIvY1Q+G/lb3PPfsJdQ==
X-CSE-MsgGUID: /aCk7ZExQuSvry4EcesLug==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="94349412"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="94349412"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 03:12:09 -0700
X-CSE-ConnectionGUID: aTVXJB5QScK0jBbeJ8RNOg==
X-CSE-MsgGUID: VlTaroTuRLGcTaRBT4YC6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="248043102"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 03:12:06 -0700
Date: Mon, 22 Jun 2026 12:12:04 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org, riana.tauro@intel.com, jani.nikula@intel.com
Subject: Re: [PATCH v2 i-g-t] tests/intel: Enable survivability tests on
 discrete platforms >= BMG
Message-ID: <20260622101204.f5d6o3uiodrf4qh6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 himanshu.girotra@intel.com, igt-dev@lists.freedesktop.org,
 riana.tauro@intel.com, jani.nikula@intel.com
References: <20260618164245.20139-1-himanshu.girotra@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618164245.20139-1-himanshu.girotra@intel.com>
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
On 2026-06-18 at 22:12:45 +0530, himanshu.girotra@intel.com wrote:
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
> 
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel/xe_configfs.c      | 5 ++++-
>  tests/intel/xe_survivability.c | 4 +++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index e7c797eb7..9ba8f94ec 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -11,6 +11,7 @@
>  #include "igt_kmod.h"
>  #include "igt_sriov_device.h"
>  #include "igt_sysfs.h"
> +#include "intel_common.h"
>  #include "xe/xe_query.h"
>  
>  /**
> @@ -379,6 +380,7 @@ int igt_main()
>  	int fd, configfs_fd, configfs_device_fd;
>  	uint32_t devid;
>  	bool is_vf_device;
> +	bool is_dgfx;
>  	const char *engine = NULL;
>  
>  	igt_fixture() {
> @@ -387,6 +389,7 @@ int igt_main()
>  		fd = drm_open_driver(DRIVER_XE);
>  		devid = intel_get_drm_devid(fd);
>  		is_vf_device = intel_is_vf_device(fd);
> +		is_dgfx = is_intel_dgfx(fd);
>  		set_bus_addr(fd);
>  
>  		xe_for_each_engine(fd, hwe) {
> @@ -410,7 +413,7 @@ int igt_main()
>  
>  	igt_describe("Validate survivability mode");
>  	igt_subtest("survivability-mode") {
> -		igt_require(IS_BATTLEMAGE(devid));
> +		igt_require(is_dgfx && intel_graphics_ver(devid) >= IP_VER(20, 1));

Can you create a function xe_has_survivabilty(fd) in lib/xe_quer.h
and use it in both places?

Regards,
Kamil


>  		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");
>  		configfs_device_fd = create_device_configfs_group(configfs_fd);
>  		test_survivability_mode(configfs_device_fd);
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index d5d7e048c..0b3121a08 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -16,6 +16,7 @@
>  #include "igt_sriov_device.h"
>  #include "igt_sysfs.h"
>  #include "intel_allocator.h"
> +#include "intel_common.h"
>  #include "xe/xe_gt.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> @@ -217,7 +218,8 @@ int igt_main()
>  
>  	igt_fixture() {
>  		fd = drm_open_driver(DRIVER_XE);
> -		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
> +		igt_require(is_intel_dgfx(fd) &&
> +			    intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(20, 1));
>  		vf_device = intel_is_vf_device(fd);
>  		igt_require_f(!vf_device, "survivability mode not supported in VF\n");
>  		pci_xe = igt_device_get_pci_device(fd);
> -- 
> 2.50.1
> 
