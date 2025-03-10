Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F39C282DE
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 08:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0DB10E039;
	Mon, 10 Mar 2025 08:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jghfDxOb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B641710E039
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 08:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741594748; x=1773130748;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9IxORRH+X5gRFgL0kx86xlvBZVc9bO6slg+3AdeqrWU=;
 b=jghfDxObOZ6Y93xvYnf45Z5XrZpFMZs3+IiR6JgiFyvc58dJVOoVqlXT
 76/OF1WYYAz+wsxsNTye0/Ep7Kl373Tf/+D3T304wRU0S9lR93BfjTmMK
 xpWzu23td0Q7+KoVEYr8yp9QpYX9fy5vDh4U6LX2dvEbbcrGEwup3J6vB
 vwGLS6oXxPSzAWlHmT62dU3YJK/OfXMGUkAchIA08H0vbmBMR1N2ozxSU
 Z4HAJXNHUWet18TR45FzQ+vxDZkD5Bzb346Wk5KG30pEZ1HoquejK9rFQ
 2MU50QxhLdsCVbvCMqcNos7ahfwpVlQXtsKc+WNPq76jTk1CGqfu95ZBG A==;
X-CSE-ConnectionGUID: I5uSFawTQ0239BbiNYHxWA==
X-CSE-MsgGUID: zhRI7od4Sq6u2NoLIGeryw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="45370635"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="45370635"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 01:19:06 -0700
X-CSE-ConnectionGUID: IEn1Pvc1TMOYY2y85tq9iQ==
X-CSE-MsgGUID: +bRM4AylSimHexyEeBIbcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="119856920"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.116.143])
 ([10.245.116.143])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 01:19:05 -0700
Message-ID: <97374906-44cb-4535-a736-10788938f02e@linux.intel.com>
Date: Mon, 10 Mar 2025 09:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm: Add a check for power management
 capability
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250306190621.260153-1-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250306190621.260153-1-jakub1.kolakowski@intel.com>
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



On 3/6/2025 8:06 PM, Jakub Kolakowski wrote:
> Add a check for power management capability of device tested. Currently
> if test is started on configuration that does not support the PM
> capability it doesn't skip, instead depending on test it may fail, abort
> or timeout.
> With this change test will skip with a clear message why it did.
> 
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   tests/intel/xe_pm.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index c2026474d..049596ebc 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -17,6 +17,7 @@
>   
>   #include "igt.h"
>   #include "lib/igt_device.h"
> +#include "lib/igt_pci.h"
>   #include "lib/igt_pm.h"
>   #include "lib/igt_sysfs.h"
>   #include "lib/igt_syncobj.h"
> @@ -38,6 +39,8 @@
>   #define PREFETCH (0x1 << 1)
>   #define UNBIND_ALL (0x1 << 2)
>   
> +#define PCI_PM_CAP_ID 0x01
> +
>   enum mem_op {
>   	READ,
>   	WRITE,
> @@ -779,6 +782,7 @@ igt_main
>   	device_t device;
>   	uint32_t d3cold_allowed;
>   	int sysfs_fd;
> +	int offset;
>   
>   	const struct s_state {
>   		const char *name;
> @@ -812,6 +816,11 @@ igt_main
>   		device.fd_xe = drm_open_driver(DRIVER_XE);
>   		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
>   		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
> +
> +		/* Make sure power management capability is present for device being tested */
> +		offset = find_pci_cap_offset(device.pci_root, PCI_PM_CAP_ID);
> +		igt_require_f(offset > 0, "PCI power management capability not found\n");
> +

Shouldn't this requirement apply only to D-states?

>   		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
>   
>   		/* Always perform initial once-basic exec checking for health */

