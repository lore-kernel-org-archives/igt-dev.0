Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154DCCCF9F8
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 11:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C454010EA99;
	Fri,  7 Nov 2025 11:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ks3StExK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB9B10EA99
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 11:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762515030; x=1794051030;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vBdKxnHW5gpHIrv745H7DD/vgMq/popfmQZpzdT87z0=;
 b=ks3StExK6YkIDPk+38xgRoWX3OII/FRl7ru9cdRIsWNqMsOxtOh+woEO
 TyDo82hxNO+76AOpOolO9nSlhaa8cVk8otAnS7z9LBDkcgAANLD/rUnqp
 dL9gSLn5RO+lyvX2fFcOPvAXMss7RCvDetlFW1IugvcnrzBnhgRl0KKjG
 Gj2xf8s+itqNQX30UVlRLs1tGfslJ8ulBo1r4wFndBCJg3V3F7eOeDVOF
 al7O09GChPAAcoOtdbv09P5m1j+W31x+Z3sWSS5hfPV9/n/gFELPjyUmL
 D5GsmW9Pd3Cp4eEMa5u6Gb8lVBnhdhlPk4G4YhePbW44aZLv+76CvN5pT Q==;
X-CSE-ConnectionGUID: Yr6+X7ZTTVSO+nb3kFh6nQ==
X-CSE-MsgGUID: CTQKo4Q9TXmC1Z/35sUoDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75354509"
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="75354509"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:30:30 -0800
X-CSE-ConnectionGUID: zr2mlXYrTpupxsOuBN40/A==
X-CSE-MsgGUID: Lk6l5kkDQHSzaRsHE0KHzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="188453372"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 03:30:13 -0800
Date: Fri, 7 Nov 2025 12:29:54 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 balasubramani.vivekanandan@intel.com
Subject: Re: [PATCH i-g-t v2 1/3] lib: Add NVL-S support
Message-ID: <20251107112954.ajfrp4zxjikjgxla@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 balasubramani.vivekanandan@intel.com
References: <20251106153419.1741989-1-shekhar.chauhan@intel.com>
 <20251106153419.1741989-2-shekhar.chauhan@intel.com>
 <20251107003741.GF3905809@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251107003741.GF3905809@mdroper-desk1.amr.corp.intel.com>
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

Hi Matt,
On 2025-11-06 at 16:37:41 -0800, Matt Roper wrote:
> On Thu, Nov 06, 2025 at 09:04:17PM +0530, Shekhar Chauhan wrote:
> > Add NVL-S device info.
> > 
> > v2: Fix indentation/spacing for PantherLake and Novalake in
> > lib/intel_chipset.h (Kamil)
> > 
> > Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> > Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> > ---
> >  lib/intel_chipset.h     |  4 +++-
> >  lib/intel_device_info.c | 12 ++++++++++++
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> > index 2f6bf788a..70ea78464 100644
> > --- a/lib/intel_chipset.h
> > +++ b/lib/intel_chipset.h
> > @@ -93,6 +93,7 @@ struct intel_device_info {
> >  	bool is_lunarlake : 1;
> >  	bool is_battlemage : 1;
> >  	bool is_pantherlake : 1;
> > +	bool is_novalake: 1;
> >  
> >  	const struct intel_cmds_info *cmds_info;
> >  	const char *codename;
> > @@ -209,7 +210,8 @@ void intel_check_pch(void);
> >  #define IS_PONTEVECCHIO(devid)	(intel_get_device_info(devid)->is_pontevecchio)
> >  #define IS_LUNARLAKE(devid)	(intel_get_device_info(devid)->is_lunarlake)
> >  #define IS_BATTLEMAGE(devid)	(intel_get_device_info(devid)->is_battlemage)
> > -#define IS_PANTHERLAKE(devid)  (intel_get_device_info(devid)->is_pantherlake)
> > +#define IS_PANTHERLAKE(devid)	(intel_get_device_info(devid)->is_pantherlake)
> > +#define IS_NOVALAKE(devid)	(intel_get_device_info(devid)->is_novalake)
> >  
> >  #define IS_GEN(devid, x)	(intel_get_device_info(devid)->graphics_ver == x)
> >  
> > diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> > index a853f9ab4..fe452d50f 100644
> > --- a/lib/intel_device_info.c
> > +++ b/lib/intel_device_info.c
> > @@ -539,6 +539,16 @@ static const struct intel_device_info intel_pantherlake_info = {
> >  	.cmds_info = &xe2_cmds_info,
> >  };
> >  
> > +static const struct intel_device_info intel_novalake_info = {
> > +	.graphics_ver = 30,
> > +	.graphics_rel = 04,
> 
> It's not great that we keep on adding graphics version and release
> numbers in IGT for new platforms.  That was supposed to stop with MTL,
> but we keep making exceptions for "one more platform until we get around
> to doing the cleanup."
> 
> I know Xin, Ravi, and possibly other people have been working on the
> necessary cleanup to get proper version numbers without ugly hacks like
> this.  Is there any chance that some of their work can land soon so that
> we can handle versioning properly?
> 
> 
> Matt

That new solution is still wip, imho this NVL/CRI should go with
what we have now. 

Regards,
Kamil

> 
> > +	.display_ver = 35,
> > +	.has_4tile = true,
> > +	.is_novalake = true,
> > +	.codename = "novalake",
> > +	.cmds_info = &xe2_cmds_info,
> > +};
> > +
> >  #define INTEL_PCI_ID_INIT(_id, _info) { \
> >  	.vendor_id = 0x8086, .device_id = (_id), \
> >  	.subvendor_id = PCI_MATCH_ANY, .subdevice_id = PCI_MATCH_ANY, \
> > @@ -657,6 +667,8 @@ static const struct pci_id_match intel_device_match[] = {
> >  
> >  	INTEL_PTL_IDS(INTEL_PCI_ID_INIT, &intel_pantherlake_info),
> >  
> > +	INTEL_NVLS_IDS(INTEL_PCI_ID_INIT, &intel_novalake_info),
> > +
> >  	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
> >  };
> >  
> > -- 
> > 2.51.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
