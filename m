Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA819C282EC
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 16:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FF4310E436;
	Mon, 17 Mar 2025 16:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="alHWo6/X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9E010E436
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 16:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742230611; x=1773766611;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uf43BLWDLqrEpwQhyBNJ1dUKoCihnDbIV9pGJl87Bug=;
 b=alHWo6/XtGF09tytSlgvszZvS1yurg9v6zkupqnwiCV1uEDrmGZZGp5x
 ztpVNvDyZSBg0Nrulde/SPkH+cTpiG47PRAX1fBwHB2WikFe+OtUlXjvk
 5rbGS/uQJutpAuEVSl6EJJ8PKZNQw7TgOfluh15yKmM2B1i31hyus2pet
 IbYhtPjm3voNNCf0eMzxd3ncxhBdi4l+V4tiy8qNydd9PPIlrYID4l0QM
 ZJDr5RWrh9EebUHPNjEXhQ1ZYb9un1zzX3G8G9L7uIWmcekSn0/r6/FwJ
 EZcmOftM7zmgU6mqY8+MqKu3fSnjPmwjerKOkJ4d/nZPf9t45TGXR0vUy Q==;
X-CSE-ConnectionGUID: edRDzCS4Q8KapIKqWeXwmQ==
X-CSE-MsgGUID: vo9ImUsnSSqKqXbOJt99bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43535270"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="43535270"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 09:56:50 -0700
X-CSE-ConnectionGUID: 0gPBdVPsTjG+EWH0pGDSPA==
X-CSE-MsgGUID: grpY9DueRG2wXnCWtRCYNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="122008829"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 09:56:48 -0700
Date: Mon, 17 Mar 2025 17:56:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] lib/igt_pm: Introduce helper to check for
 PM capability
Message-ID: <20250317165646.vnx6fkqnwfrfxdej@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
References: <20250314112732.795523-1-jakub1.kolakowski@intel.com>
 <20250314112732.795523-2-jakub1.kolakowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250314112732.795523-2-jakub1.kolakowski@intel.com>
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
On 2025-03-14 at 11:27:31 +0000, Jakub Kolakowski wrote:
> Introduce igt_has_pci_pm_capability(), a helper function to check
> whether a PCI device supports the PCI Power Management (PM) capability.
> With this helper one can make sure the capability is present on device
> under test before proceeding with any actions related to PM.
> 
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>  lib/igt_pm.c | 18 ++++++++++++++++++
>  lib/igt_pm.h |  1 +
>  2 files changed, 19 insertions(+)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 1a5d9c42b..dd37f20f6 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -45,6 +45,7 @@
>  #include "igt_pm.h"
>  #include "igt_aux.h"
>  #include "igt_sysfs.h"
> +#include "igt_pci.h"

Keep it alphabetical, move it up and maybe sort a little this now?
There is igt_aux in middle...

>  
>  /**
>   * SECTION:igt_pm
> @@ -81,6 +82,7 @@ enum {
>  #define MAX_POLICY_STRLEN	strlen(MAX_PERFORMANCE_STR)
>  /* Root Port bus can have max 32 dev and each dev can have max 8 func */
>  #define MAX_PCI_DEVICES		256
> +#define PCI_PM_CAP_ID 0x01
>  int8_t *__sata_pm_policies;
>  int __scsi_host_cnt;
>  
> @@ -1470,3 +1472,19 @@ void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
>  	igt_require(igt_sysfs_has_attr(gtfd, "slpc_ignore_eff_freq"));
>  	igt_sysfs_set_u32(gtfd, "slpc_ignore_eff_freq", val);
>  }
> +
> +
> +/**
> + * igt_has_pci_pm_capability:
> + * @dev: pci device
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
> \ No newline at end of file

Add newline here.

With this
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

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
