Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE32C282EC
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 09:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDF610E3D0;
	Mon, 17 Mar 2025 09:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMqGgVt/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D2810E3D0
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 09:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742202766; x=1773738766;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uQ2YR0Q5UK0CqAprQcoDH62PiMeWHKAaX/OmxfkbLfU=;
 b=VMqGgVt/nOQVsIXccqJ6B06ctXZ5XmuejoWIxrnFvKCqIczEoVePb1Ol
 d7zkwgwLnuYEYkfKqWKRR/DWHlMotI02U93pztXa9fLlNNPmYTBMCbNAH
 1j5/a6gWGUQb04COvqvWTrWTf4zfXrypHE70iqpFKad94QodhH98aRIrB
 u7iVImfG+sXe6dROegWzB6vgz3K2OdPQlZ5fq5/StCiUkLN0qUBNUn8UO
 FrTIU7wRl08CCOZPDG72LqvUotna39nztsEGEOhzWM9yLwGmiMlf9KY1J
 nL6BeabzlwJ/ShUhWgKL2YyG93S+FrLXMjmWT1pC8WujLh6DI3QbquE2d Q==;
X-CSE-ConnectionGUID: po3omfl8Q2iOGc/etUXh9A==
X-CSE-MsgGUID: /2tfoD1ERaevNXYfApLIpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="46931366"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="46931366"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 02:12:46 -0700
X-CSE-ConnectionGUID: Fl8OSy8URXWBbgQD5HWsCg==
X-CSE-MsgGUID: edFjWu1JSwuokVdDoVZIhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="122064401"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.101.99])
 ([10.245.101.99])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 02:12:45 -0700
Message-ID: <9529ca23-b281-4178-b31e-fc70be6c848f@linux.intel.com>
Date: Mon, 17 Mar 2025 10:12:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] lib/igt_pm: Introduce helper to check for PM
 capability
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250314112732.795523-1-jakub1.kolakowski@intel.com>
 <20250314112732.795523-2-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250314112732.795523-2-jakub1.kolakowski@intel.com>
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



On 3/14/2025 12:27 PM, Jakub Kolakowski wrote:
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
>   lib/igt_pm.c | 18 ++++++++++++++++++
>   lib/igt_pm.h |  1 +
>   2 files changed, 19 insertions(+)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 1a5d9c42b..dd37f20f6 100644
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
> @@ -1470,3 +1472,19 @@ void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
>   	igt_require(igt_sysfs_has_attr(gtfd, "slpc_ignore_eff_freq"));
>   	igt_sysfs_set_u32(gtfd, "slpc_ignore_eff_freq", val);
>   }
> +
> +
> +/**
> + * igt_has_pci_pm_capability:
> + * @dev: pci device

The function uses pci_dev as the parameter name, but the documentation 
refers to it as @dev, make it consistent.

> + *
> + * Returns: true if the device has PCI Power Management capability, false otherwise.
> + */
> +bool igt_has_pci_pm_capability(struct pci_device *pci_dev)
> +{
> +	int offset;
> +
> +	offset = find_pci_cap_offset(pci_dev, PCI_PM_CAP_ID);
> +	

trailing whitespace

> +	return (offset > 0);
> +}
> \ No newline at end of file
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index 6b428f53e..c73972f2a 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -97,5 +97,6 @@ uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
>   uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
>   int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
>   void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
> +bool igt_has_pci_pm_capability(struct pci_device *pci_dev);
>   
>   #endif /* IGT_PM_H */

With documentation updated and trailing whitespace removed,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
