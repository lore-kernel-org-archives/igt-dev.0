Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559BCC282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 10:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0746710E833;
	Thu, 13 Mar 2025 10:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMG98UPW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6860410E82B
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741861806; x=1773397806;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cqfQ1WF0xIWB/fwpbZ+pE9zffrDhjcLV3Y19qqBIJoo=;
 b=eMG98UPW318BtwrqgbePKf6TH+MXp+wfzICwp2HhA//eXlwubnMUq7K1
 LFxe+mYRNhcEtmKHtW2T2Ao6Bzq5n3eyGkFAOgsPvoTAeuwYTRAU5HIM6
 4rGinrhoO1oab1MTOM/s03EwE1LQzHz++leZ+sMc3KlLl8n9UdmSeozxT
 SQOhQrq6A9nz0fDJl6Tns3d9wXSydUqek0PTlNUpPT1KkylhykUWvT+Np
 k/dMOH3GM1/y+PBUpQKQuLGZHyoVHjDJMFYyA1jTbE3bJCLd9w7WBgUWr
 zvM4x5r1Ym0M7GmQajykJZtY5xTLJSAaGwQ1wAkeSuayeH5DtJR6cL9Nw Q==;
X-CSE-ConnectionGUID: Ok1l8GlpQV+69xN7AP9VIA==
X-CSE-MsgGUID: xC5g4vs5SBuYAGavZjuxWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42140400"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="42140400"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 03:30:06 -0700
X-CSE-ConnectionGUID: EFU9AlJWSy6CN+mB1q3lCQ==
X-CSE-MsgGUID: D34rDt9nSgKA8EpDdwRx2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="120876063"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.3.119])
 ([10.246.3.119])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 03:30:05 -0700
Message-ID: <e41cdd6b-7e95-4957-9a98-8420fffe684a@linux.intel.com>
Date: Thu, 13 Mar 2025 11:30:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_pm: Introduce helper to check for PM
 capability
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250311170144.602535-1-jakub1.kolakowski@intel.com>
 <20250311170144.602535-2-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250311170144.602535-2-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 3/11/2025 6:01 PM, Jakub Kolakowski wrote:
> Add power management capability checking helper. With this helper one
> can make sure the capability is present on device under test before
> proceeding with any actions related to PM. 

Maybe mention that it's PCI Power Managment capability, something like: 
"Introduce igt_pm_has_pm_capability(), a helper function to check 
whether a PCI device supports the PCI Power Management (PM) capability. ..."

This is mainly aimed to check
> for availability of D-states but overall it checks for the PCI
> capability in general.

I would drop this statement, the helper does not explicitly verify 
support for specific D-states (to check for specific D-state 
availability, the Power Management Control/Status Register (PMCSR) must 
be examined). Also, the phrase "checks for the PCI capability in 
general" is vague.

> 
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   lib/igt_pm.c | 20 ++++++++++++++++++++
>   lib/igt_pm.h |  1 +
>   2 files changed, 21 insertions(+)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 1a5d9c42b..21e3137ab 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -45,6 +45,7 @@
>   #include "igt_pm.h"
>   #include "igt_aux.h"
>   #include "igt_sysfs.h"
> +#include "igt_pci.h"
>   
>   /**
>    * SECTION:igt_pm
> @@ -81,6 +82,7 @@ enum {
>   #define MAX_POLICY_STRLEN	strlen(MAX_PERFORMANCE_STR)
>   /* Root Port bus can have max 32 dev and each dev can have max 8 func */
>   #define MAX_PCI_DEVICES		256
> +#define PCI_PM_CAP_ID 0x01
>   int8_t *__sata_pm_policies;
>   int __scsi_host_cnt;
>   
> @@ -1470,3 +1472,21 @@ void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
>   	igt_require(igt_sysfs_has_attr(gtfd, "slpc_ignore_eff_freq"));
>   	igt_sysfs_set_u32(gtfd, "slpc_ignore_eff_freq", val);
>   }
> +
> +
> +/**
> + * igt_is_pm_supported:
> + * @dev: pci device
> + *
> + * Returns: True if power management capability is present, otherwise false

Indicate it's PCI capability: "Returns: true if the device has PCI Power 
Management capability, false otherwise."

> + */
> +bool igt_is_pm_supported(struct pci_device *pci_dev)

Shouldn't the function name start with igt_pm_ ?

Maybe igt_pm_has_pm_capability(...) ?

> +{
> +	int offset;
> +
> +	offset = find_pci_cap_offset(pci_dev, PCI_PM_CAP_ID);
> +	if (offset > 0)
> +		return true;
> +
> +	return false;

return (offset > 0);

> +}
> \ No newline at end of file
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index 6b428f53e..befb61f3c 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -97,5 +97,6 @@ uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
>   uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
>   int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
>   void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
> +bool igt_is_pm_supported(struct pci_device *pci_dev);
>   
>   #endif /* IGT_PM_H */

