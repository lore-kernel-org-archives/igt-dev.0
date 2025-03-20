Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0EDC36000
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 11:52:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02B810E603;
	Thu, 20 Mar 2025 11:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nWWEfkkB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119EF10E603
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 11:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742471573; x=1774007573;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=snvv3gzx2Ezt1Vulq1PlM4YnsAGAo7Spo6VjSkbnNlw=;
 b=nWWEfkkBhkgLQd8awjvtXjpC8H+ldNRPNIR6tsMiOlEC0KlYzltNn14d
 SNYyhBExqoEWQt3IsIT02Dr7HzmixSV7fwnJQ2ujhLemnuksVKfx/6MbV
 4LOg9wQCccHr38nBwvFZw4UCzw4IiC2mCDQsNrqwEwniM07ZiMa/AStwt
 BCFiTyFJSIDyH0yqTzXMLNH0MbO54tIssaDLGpQKVqqCA+v4rzJMls9rH
 hxvIugGX6NIDayin3ntiDjV6kCa4V3iRlxxVScxdahW9a1td978ahWgDb
 3V3xtBCTVHIv7feeAPk4232l1C1Xel98C6v4AbaG5y83/XThgynwH1HP/ g==;
X-CSE-ConnectionGUID: vGLTCltwRIu/32VuwU0Rsg==
X-CSE-MsgGUID: aHsTa088QT22YbJ+Wnmdrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="55074418"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="55074418"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 04:52:52 -0700
X-CSE-ConnectionGUID: e7FzrJvsSWe+lH28khqfRg==
X-CSE-MsgGUID: 7DTy3CR5REeZ8AXDsQjLLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="124009583"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 04:52:50 -0700
Date: Thu, 20 Mar 2025 12:52:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
Cc: "Poosa, Karthik" <karthik.poosa@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
Subject: Re: [PATCH i-g-t v4 2/2] tests/intel/xe_pm: Add a check for power
 management capability
Message-ID: <20250320115233.rivlffn6cpqumxde@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 "Poosa, Karthik" <karthik.poosa@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20250318150108.1055169-1-jakub1.kolakowski@intel.com>
 <20250318150108.1055169-3-jakub1.kolakowski@intel.com>
 <30298e71-5dc6-477a-b3ef-73f0996b9e35@intel.com>
 <5c0a4a66-8e05-4f14-acc0-96487cc43590@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c0a4a66-8e05-4f14-acc0-96487cc43590@linux.intel.com>
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
On 2025-03-19 at 09:14:14 +0100, Bernatowicz, Marcin wrote:
> 
> 
> On 3/19/2025 9:05 AM, Poosa, Karthik wrote:
> > 
> > On 18-03-2025 20:31, Jakub Kolakowski wrote:
> > > Add a check for power management capability of device tested in tests
> > > related to D3 states. Currently if test is started on configuration
> > > that does not support the PM capability it doesn't skip, instead
> > > depending on test it may fail, abort or timeout.
> > > With this change test will skip with a clear message why it did.
> > > 
> > > Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> > > Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> > > Cc: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> > > Signed-off-by: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> > > ---
> > >   tests/intel/xe_pm.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> > > index c2026474d..70f0613fb 100644
> > > --- a/tests/intel/xe_pm.c
> > > +++ b/tests/intel/xe_pm.c
> > > @@ -146,6 +146,9 @@ static void vram_d3cold_threshold_restore(int sig)
> > >   static bool setup_d3(device_t device, enum igt_acpi_d_state state)
> > >   {
> > > +    igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
> > > +              "PCI power management capability not found\n");
> > 
> > Hi Jakub,
> > 
> > As per PCIe Base spec, all PCI Express Functions are required to support
> > PCI Power Management Capability.
> > 
> > Only legacy PCI devices wouldn't have it.
> > 
> > Can you share details of failures without this capability.
> > 
> > All Xe supported GPUs are PCIe complaint, this check may not be needed
> > at all.
> 
> This happens for runs with Virtual Function (VF) passed to Virtual Machine
> (VM).
> 
> "9.6 SR-IOV Power Management
> This section defines the PCI Express SR-IOV power management capabilities
> and protocols.
> The Power Management Capability is required for PFs as described in Chapter
> 5 .
> For VFs, the Power Management Capability is optional."

Can we add this explanation as a comment in code?
imho one sentence like:

PCIe power management is mandatory for real hardware devices,
for SR-IOV VFs it is optional.

or something like that?

Regards,
Kamil

> 
> --
> marcin
> 
> > 
> > 
> > > +
> > >       dpms_on_off(device, DRM_MODE_DPMS_OFF);
> > >       /*
> 
