Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2FAC43458
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 11:11:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FEE10E060;
	Tue, 14 Jul 2026 11:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVgXVE6/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A75710E060
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 11:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784027433; x=1815563433;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jXhi0A2xyRSVaR3k+qXixkLdPKsT27DPy6bfpjF1YOw=;
 b=BVgXVE6/i5BMZyAbF1vT4C+PLxFPos+EYGAkSL4Lgg38W5GE8UEU+eI8
 5HaMDEa17tOSOmwPk23x8/IRtlnSn6UI9p/P795nRpeUEFIurvFgxfzRf
 QhokIKM8Ec5257udrC7qlIdIwHcu64LBLoTdjtiwKSb1XtqOr1Cdl3r8P
 B2MuFU24kGVpdoNLujwdKzJiO+qTUM7zego3VXqxBUQVDtvsPOTcFvbmQ
 WzaBw1vU5sk9qndhWCBdWRQ6mBFr2+AkePl7NKggIxROWNdiOm/v5KyTe
 c7C09QcfylrlL3bOnq7PeQbaBfZlHb5BC4ThaN1gH8l3moBwOHzkXRuSx g==;
X-CSE-ConnectionGUID: rnClEBNATs28X3W7Z1L2fA==
X-CSE-MsgGUID: Wa581tAcS5mvNkvXFZAZog==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84841182"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="84841182"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 04:10:32 -0700
X-CSE-ConnectionGUID: hgXywpROSQil4nPb87fjWA==
X-CSE-MsgGUID: oZZj29j9S/eVeJ0DUZxbpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; d="scan'208";a="255879039"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 04:10:30 -0700
Date: Tue, 14 Jul 2026 13:10:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Anirban, Sk" <sk.anirban@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com,
 soham.purkait@intel.com, mallesh.koujalagi@intel.com
Subject: Re: [PATCH 1/2] tests/intel/xe_survivability: update ignored dmesg
 regex
Message-ID: <20260714111010.ql7aaowfcyaicf35@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Anirban, Sk" <sk.anirban@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com,
 raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com
References: <20260709070905.405108-4-sk.anirban@intel.com>
 <20260709070905.405108-5-sk.anirban@intel.com>
 <20260709151204.fzvhu4voxtu3wv7e@kamilkon-DESK.igk.intel.com>
 <e563df48-ab6b-465e-9ca1-c2841976931f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e563df48-ab6b-465e-9ca1-c2841976931f@intel.com>
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

Hi Anirban,,
On 2026-07-13 at 22:59:04 +0530, Anirban, Sk wrote:
> Hi,
> 
> On 09-07-2026 08:42 pm, Kamil Konieczny wrote:
> > Hi Sk,
> > On 2026-07-09 at 12:39:07 +0530, Sk Anirban wrote:
> > > The kernel now reports -ENOTRECOVERABLE when the device is wedged.
> > > As runtime-survivability deliberately wedges the device, update
> > > dmesg regex so igt_runner does not treat the expected error logs
> > > as failures.
> > > 
> > > kernel implementation:
> > > https://patchwork.freedesktop.org/series/168780/
> > > 
> > > Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> > > ---
> > >   tests/intel/xe_survivability.c | 7 ++++---
> > >   1 file changed, 4 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> > > index 74488bbea..cc54b37ad 100644
> > > --- a/tests/intel/xe_survivability.c
> > > +++ b/tests/intel/xe_survivability.c
> > > @@ -43,12 +43,13 @@ static char bus_addr[NAME_MAX];
> > >   static void ignore_wedged_in_dmesg(void)
> > >   {
> > >   	/* this is needed for igt_runner so it will ignore it */
> > > -	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: -ECANCELED"
> > Please keep old value for some time (a year?).
> 
> As kernel changes are merged, we may no longer receive the same error code
> (ECANCELED) in wedge scenarios.
> Additionally, if there are any gaps in the kernel patches that still result
> in ECANCELED being returned, we won't be able to detect that issue using IGT
> if we keep the old error codes here.

Hmm, up to you but it could make testing for older kernels hard,
e.g. those which will not backport kernel changes yet. So up to
you, both this on one below is acceptable.

> 
> > > +	igt_emit_ignore_dmesg_regex("GT[0-9A-Fa-f]*: failed to enable GuC scheduling policies: -ENOTRECOVERABLE"
> > >   				    "|CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged"
> > > -				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
> > > +				    "|GT[0-9A-Fa-f]*: reset failed .-ENOTRECOVERABLE"
> > Same here, keep both.
> > 
> > >   				    "|GT[0-9A-Fa-f]*: Failed to submit"
> > >   				    "|Modules linked in:"
> > > -				    "|__pfx___drm_");
> > > +				    "|__pfx___drm_"
> > > +				    "|-ENOTRECOVERABLE");
> > Do not add such, it could made to ignore errors in unrelated context.
> 
> ENOTRECOVERABLE is intended to be returned only for wedged-state scenarios
> by the kernel. I think the test should ignore any failures that return this
> error code.

The problem is that this regex is applied to kernel error and
you do not know if it will be dropped from other contexts,
outside of your test. So it is better to make sure it was from
xe driver. As it is now it is too generic.

Regards,
Kamil

> 
> Thanks
> Anirban
> 
> > 
> > Regards,
> > Kamil
> > 
> > >   }
> > >   static bool check_survivability_mode_sysfs(void)
> > > -- 
> > > 2.43.0
> > > 
