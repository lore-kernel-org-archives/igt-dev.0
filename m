Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A5AC282EC
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 16:54:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F8710E23B;
	Tue, 18 Mar 2025 16:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YSR2P5dH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03E210E23B
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Mar 2025 16:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742316882; x=1773852882;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=XDQ7ZvL9wxe3+GCa2gaV1AvcUI9/ifMPnpCarZJZly4=;
 b=YSR2P5dHLBZfLBTAJcJrZdlUZmMuvcIMA+Wxo4+Xfocdv3IvVozgqyE/
 P8fTLyII1fN4I3hHnUK3ZyeZpAdKy/f3e8sdRB5DrTioa6xQ7eVHZYLlE
 Ln+0OceEztiCJ0wr2b6mRDjFKFW70wF8ywbV3Y+tVSm4xpJko8yuMaUnj
 wwlwnpMsk+AWXbYRSHWjhQ62I42vxQsrbv0FkWP/ZokaydvAKmSa6mj7z
 SB+nCCfEgnGPhrrrcbFDiYQ2RaAzmWC88tBLHuVgLhEAolSyWNbyh+IEY
 zyKOq+RJAbOnpJUcW62uKJzoUbRvyqowkPsgqFcL3Q0Qfi+Jl3t61tUYD w==;
X-CSE-ConnectionGUID: hBYbPPbXSziJqP0Qcyqjiw==
X-CSE-MsgGUID: 5DvMtr6CRyOmmZIY9Pctuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="68823089"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="68823089"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 09:54:42 -0700
X-CSE-ConnectionGUID: K1cU4jRWQVOyqm7EXz/Jlw==
X-CSE-MsgGUID: FqJ4kLy2RZ2vwiDUIyACTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="122051631"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 09:54:40 -0700
Date: Tue, 18 Mar 2025 17:54:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_pm: Introduce helper to check for
 PM capability
Message-ID: <20250318165438.kmm6kun3scsbhn3y@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
References: <20250318150108.1055169-1-jakub1.kolakowski@intel.com>
 <20250318150108.1055169-2-jakub1.kolakowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250318150108.1055169-2-jakub1.kolakowski@intel.com>
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

Hi Jakub,
On 2025-03-18 at 15:01:07 +0000, Jakub Kolakowski wrote:
> Introduce igt_has_pci_pm_capability(), a helper function to check
> whether a PCI device supports the PCI Power Management (PM) capability.
> With this helper one can make sure the capability is present on device
> under test before proceeding with any actions related to PM.
> 
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_pm.c | 19 ++++++++++++++++++-
>  lib/igt_pm.h |  1 +
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 1a5d9c42b..7f9cbd69a 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -40,10 +40,11 @@
>  #include <dirent.h>
>  
>  #include "drmtest.h"
> +#include "igt_aux.h"
>  #include "igt_device_scan.h"
>  #include "igt_kms.h"
> +#include "igt_pci.h"
>  #include "igt_pm.h"
> -#include "igt_aux.h"
>  #include "igt_sysfs.h"
>  
>  /**
> @@ -81,6 +82,7 @@ enum {
>  #define MAX_POLICY_STRLEN	strlen(MAX_PERFORMANCE_STR)
>  /* Root Port bus can have max 32 dev and each dev can have max 8 func */
>  #define MAX_PCI_DEVICES		256
> +#define PCI_PM_CAP_ID 0x01
>  int8_t *__sata_pm_policies;
>  int __scsi_host_cnt;
>  
> @@ -1470,3 +1472,18 @@ void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
>  	igt_require(igt_sysfs_has_attr(gtfd, "slpc_ignore_eff_freq"));
>  	igt_sysfs_set_u32(gtfd, "slpc_ignore_eff_freq", val);
>  }
> +
> +/**
> + * igt_has_pci_pm_capability:
> + * @pci_dev: PCI device struct
> + *
> + * Returns: true if the device has PCI Power Management capability, false otherwise.
> + */
> +bool igt_has_pci_pm_capability(struct pci_device *pci_dev)
> +{
> +	int offset;
> +
> +	offset = find_pci_cap_offset(pci_dev, PCI_PM_CAP_ID);
> +
> +	return (offset > 0);
> +}
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index 6b428f53e..c73972f2a 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -97,5 +97,6 @@ uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
>  uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
>  int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
>  void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
> +bool igt_has_pci_pm_capability(struct pci_device *pci_dev);
>  
>  #endif /* IGT_PM_H */
> -- 
> 2.34.1
> 
