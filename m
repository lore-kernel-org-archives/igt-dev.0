Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC9EC36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 18:17:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1056D10E4AC;
	Mon, 24 Mar 2025 18:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGQUUQTw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA32D10E4AC
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 18:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742840247; x=1774376247;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=U15mTzCV+pC5cmQT+xdwJgmjG8lLpFu/S2jts0BREe8=;
 b=LGQUUQTwCthQIKT9aPrWgYJYOJhZsQTrehtURyXFcNYDK6QGA9IZx0js
 dXrY2WJwSRZcNRPn8sd2MiCsLVID1jR8SMTm0bW5w9fzTnGPKODOzPpLW
 NpOMVyKgnio2CTBrllCh+2W0jGip9XK9EqH6G9o86hbZqCDYA40nRiLze
 TqXKxYyKyiLPheBzdMB8dK593oLatEH2VuB2RbAMY1SOJDiVRzyejvjgS
 vn/QPirZZ4R5ZIT0HCzhAYG39wESavaVLqsDJc9luenEFfGsTS/TH6eMy
 9M2FcW++wFqCTdONM9BNsm5KOViq6eSHyyIvCIvYSMrxIcDnN+0fLYgVq Q==;
X-CSE-ConnectionGUID: Y5AXBNR2TmmUqMzCDviJoQ==
X-CSE-MsgGUID: pyi8y4+sT8aJnq1nmqePDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54728839"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="54728839"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 11:17:27 -0700
X-CSE-ConnectionGUID: 89TSHZfsQmOBuWSxwv3alg==
X-CSE-MsgGUID: 27LD1K3rQk+wW3xTm1f1OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="124907480"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 11:17:24 -0700
Date: Mon, 24 Mar 2025 19:17:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
Cc: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
Subject: Re: [PATCH i-g-t v4 2/2] tests/intel/xe_pm: Add a check for power
 management capability
Message-ID: <20250324181710.ksj44kgbsnahc66y@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 igt-dev@lists.freedesktop.org,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20250318150108.1055169-1-jakub1.kolakowski@intel.com>
 <20250318150108.1055169-3-jakub1.kolakowski@intel.com>
 <30298e71-5dc6-477a-b3ef-73f0996b9e35@intel.com>
 <5c0a4a66-8e05-4f14-acc0-96487cc43590@linux.intel.com>
 <337176d1-41f4-481e-b81e-0f818f45a4ba@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <337176d1-41f4-481e-b81e-0f818f45a4ba@intel.com>
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

Hi Poosa,,
On 2025-03-19 at 20:29:29 +0530, Poosa, Karthik wrote:
> 
> On 19-03-2025 13:44, Bernatowicz, Marcin wrote:
> > 
> > 
> > On 3/19/2025 9:05 AM, Poosa, Karthik wrote:
> > > 
> > > On 18-03-2025 20:31, Jakub Kolakowski wrote:
> > > > Add a check for power management capability of device tested in tests
> > > > related to D3 states. Currently if test is started on configuration
> > > > that does not support the PM capability it doesn't skip, instead
> > > > depending on test it may fail, abort or timeout.
> > > > With this change test will skip with a clear message why it did.
> > > > 
> > > > Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> > > > Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> > > > Cc: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> > > > Signed-off-by: Jakub Kolakowski<jakub1.kolakowski@intel.com>

Applied with a comment added in first commit:
For SR-IOV VFs (Virtual Functions) the Power Management Capability
is optional.

Thank you for a fix.

Regards,
Kamil

> > > > ---
> > > >   tests/intel/xe_pm.c | 3 +++
> > > >   1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> > > > index c2026474d..70f0613fb 100644
> > > > --- a/tests/intel/xe_pm.c
> > > > +++ b/tests/intel/xe_pm.c
> > > > @@ -146,6 +146,9 @@ static void vram_d3cold_threshold_restore(int sig)
> > > >   static bool setup_d3(device_t device, enum igt_acpi_d_state state)
> > > >   {
> > > > +    igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
> > > > +              "PCI power management capability not found\n");
> > > 
> > > Hi Jakub,
> > > 
> > > As per PCIe Base spec, all PCI Express Functions are required to
> > > support PCI Power Management Capability.
> > > 
> > > Only legacy PCI devices wouldn't have it.
> > > 
> > > Can you share details of failures without this capability.
> > > 
> > > All Xe supported GPUs are PCIe complaint, this check may not be
> > > needed at all.
> > 
> > This happens for runs with Virtual Function (VF) passed to Virtual
> > Machine (VM).
> > 
> > "9.6 SR-IOV Power Management
> > This section defines the PCI Express SR-IOV power management
> > capabilities and protocols.
> > The Power Management Capability is required for PFs as described in
> > Chapter 5 .
> > For VFs, the Power Management Capability is optional."
> > 
> > -- 
> > marcin
> Okay, LGTM then.
> Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>
> > > 
> > > > +
> > > >       dpms_on_off(device, DRM_MODE_DPMS_OFF);
> > > >       /*
> > 
