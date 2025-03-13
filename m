Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D98C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 11:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BA110E846;
	Thu, 13 Mar 2025 11:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYPHiiyO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFDB10E136
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 11:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741864352; x=1773400352;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7BV6r6HNbbUF2B8uwx1WIl95jl8g/nmi1oGoxtMbCOg=;
 b=RYPHiiyOnLbQMN6eA0BQfedolBBdGf+6WV2Td3kPh5JUSDTau9084JPl
 H03+aNVcUKzkyxJBoEup24zbo86dxfCzuL0ZjVWihMVuH9QZ92u3LS0MK
 TmSjJjfPVfjNjMP421TPQql/CeJklG7YwWv9T7GXrQc7s5F6TvmCD3EoX
 5FJ09Wc0KsXzmgkmE3mRf5+9XiyYV1bbRIrJ2MZ/Pp2NwlYxtaV7ZMIyJ
 q4kt20baCbQCxDjWVwihKE1GD+YirnhDzJYTTuFMcUUtddr9iTxyO8je7
 V3x/pmRvr83/ZzjH2ar14cq+JiXKeNW0c0uiTotdAm/AQf5DM0bbvMajU w==;
X-CSE-ConnectionGUID: tEzqUxIqTnuvzed9+Ckk5g==
X-CSE-MsgGUID: TNmyd4ZbRGqkemc0wv7PYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53969805"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="53969805"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 04:12:26 -0700
X-CSE-ConnectionGUID: Zg+zzWKvRvWEfSHYs8CD1A==
X-CSE-MsgGUID: Mf4Ev+drR/uEQnsk4IxW2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="121133056"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 04:12:24 -0700
Date: Thu, 13 Mar 2025 12:12:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/igt_pm: Introduce helper to check for PM
 capability
Message-ID: <20250313111222.mdnwusyycdme3kxt@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
References: <20250311170144.602535-1-jakub1.kolakowski@intel.com>
 <20250311170144.602535-2-jakub1.kolakowski@intel.com>
 <e41cdd6b-7e95-4957-9a98-8420fffe684a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e41cdd6b-7e95-4957-9a98-8420fffe684a@linux.intel.com>
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

Hi Bernatowicz,,
On 2025-03-13 at 11:30:01 +0100, Bernatowicz, Marcin wrote:
> 
> 
> On 3/11/2025 6:01 PM, Jakub Kolakowski wrote:
> > Add power management capability checking helper. With this helper one
> > can make sure the capability is present on device under test before
> > proceeding with any actions related to PM.
> 
> Maybe mention that it's PCI Power Managment capability, something like:
> "Introduce igt_pm_has_pm_capability(), a helper function to check whether a
> PCI device supports the PCI Power Management (PM) capability. ..."
> 
> This is mainly aimed to check
> > for availability of D-states but overall it checks for the PCI
> > capability in general.
> 
> I would drop this statement, the helper does not explicitly verify support
> for specific D-states (to check for specific D-state availability, the Power
> Management Control/Status Register (PMCSR) must be examined). Also, the
> phrase "checks for the PCI capability in general" is vague.
> 
> > 
> > Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> > Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> > Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> > Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> > ---
> >   lib/igt_pm.c | 20 ++++++++++++++++++++
> >   lib/igt_pm.h |  1 +
> >   2 files changed, 21 insertions(+)
> > 
> > diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> > index 1a5d9c42b..21e3137ab 100644
> > --- a/lib/igt_pm.c
> > +++ b/lib/igt_pm.c
> > @@ -45,6 +45,7 @@
> >   #include "igt_pm.h"
> >   #include "igt_aux.h"
> >   #include "igt_sysfs.h"
> > +#include "igt_pci.h"
> >   /**
> >    * SECTION:igt_pm
> > @@ -81,6 +82,7 @@ enum {
> >   #define MAX_POLICY_STRLEN	strlen(MAX_PERFORMANCE_STR)
> >   /* Root Port bus can have max 32 dev and each dev can have max 8 func */
> >   #define MAX_PCI_DEVICES		256
> > +#define PCI_PM_CAP_ID 0x01
> >   int8_t *__sata_pm_policies;
> >   int __scsi_host_cnt;
> > @@ -1470,3 +1472,21 @@ void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val)
> >   	igt_require(igt_sysfs_has_attr(gtfd, "slpc_ignore_eff_freq"));
> >   	igt_sysfs_set_u32(gtfd, "slpc_ignore_eff_freq", val);
> >   }
> > +
> > +
> > +/**
> > + * igt_is_pm_supported:
> > + * @dev: pci device
> > + *
> > + * Returns: True if power management capability is present, otherwise false
> 
> Indicate it's PCI capability: "Returns: true if the device has PCI Power
> Management capability, false otherwise."
> 
> > + */
> > +bool igt_is_pm_supported(struct pci_device *pci_dev)
> 
> Shouldn't the function name start with igt_pm_ ?
> 
> Maybe igt_pm_has_pm_capability(...) ?

Or one of two (latter looks better imo):

igt_pm_has_pci_pm_capability()

igt_has_pci_pm_capability()

Regards,
Kamil

> 
> > +{
> > +	int offset;
> > +
> > +	offset = find_pci_cap_offset(pci_dev, PCI_PM_CAP_ID);
> > +	if (offset > 0)
> > +		return true;
> > +
> > +	return false;
> 
> return (offset > 0);
> 
> > +}
> > \ No newline at end of file
> > diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> > index 6b428f53e..befb61f3c 100644
> > --- a/lib/igt_pm.h
> > +++ b/lib/igt_pm.h
> > @@ -97,5 +97,6 @@ uint64_t igt_pm_get_runtime_suspended_time(struct pci_device *pci_dev);
> >   uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
> >   int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
> >   void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
> > +bool igt_is_pm_supported(struct pci_device *pci_dev);
> >   #endif /* IGT_PM_H */
> 
