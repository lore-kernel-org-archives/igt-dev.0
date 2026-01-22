Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A54C44500
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 10:50:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A400389146;
	Thu, 22 Jan 2026 10:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CY81CA03";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE2889146
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 10:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769079014; x=1800615014;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=luaiy1fpeZYHqDmDkKRPheu1wP4nLVYPbE9pxbFPs/Q=;
 b=CY81CA03jz5YdC/fyzftVF76kTdR0Qlt4V/Dn2zW0WsNVswN9ulXUF0i
 uPG2MM/RMJfpGcGBV+CPdhVkXTqQZrxYVU5akFD23isPntNxP3LHvNJk+
 SEkNFZtW6LzT0T0Oscp3g9Yo/8UV1tyMn209N/rGipJwsWScyQbV3isUP
 BcDCNaFO8iH+kT6HV8iO89G0rVA3ezqu+8dkKSOSCTvewjdoHb7obQsXx
 QENPjNiDRI6ooBXYBRftT5xr5GzgZ8EdFWWcS09PhHDUmq2Q/KgCnNpnc
 wN30BUO/moSKNB+xB2tRZHMfk9LrYRd4wx7e5bRQu7u7LMsHaS/UkZo4r w==;
X-CSE-ConnectionGUID: qaJCLiuZT/u1F070k1Pr/w==
X-CSE-MsgGUID: D6IB1+yuQ16xcCxDboe63A==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81428799"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81428799"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 02:50:14 -0800
X-CSE-ConnectionGUID: s91jt7zPTn23RnY3QL0rVw==
X-CSE-MsgGUID: 5Pi6JbAgRI2d/37sJ2C6xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="207030106"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 02:50:13 -0800
Date: Thu, 22 Jan 2026 11:49:56 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Sharma, Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_module_load: Add driver unload
 before force-probe
Message-ID: <20260122104956.2bb4cdkby4hjjuwq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Sharma, Nishit" <nishit.sharma@intel.com>
References: <20260121045003.116426-1-nishit.sharma@intel.com>
 <74599fd049cb837f788d038123225f5a581eb9f8.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74599fd049cb837f788d038123225f5a581eb9f8.camel@intel.com>
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

Hi Summers,,
On 2026-01-21 at 19:04:55 +0000, Summers, Stuart wrote:
> On Wed, 2026-01-21 at 04:50 +0000, nishit.sharma@intel.com wrote:
> > From: Nishit Sharma <nishit.sharma@intel.com>
> > 
> > Previously, a skip condition prevented the IGT test from executing if
> > certain drivers were present. This change removes the skip logic and
> 
> I'd reword this slightly to say that in the current implementation,
> this test will skip based on the order of execution of other tests - if
> another test loads the driver first, this test will skip, which
> prevents testing of force_probe=*.
> 
> Otherwise I agree:
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> 

I merged it with reword subject and description,

Regards,
Kamil

> > instead explicitly unloads any unwanted drivers using
> > igt_intel_driver_unload(unwanted_drivers[i]) before invoking
> > load_and_check_xe("force_probe=*"). This ensures the test runs
> > reliably
> > by cleaning up the environment, allowing the Xe driver to be loaded
> > and
> > tested as intended.
> > 
> > Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> > ---
> >  tests/intel/xe_module_load.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/tests/intel/xe_module_load.c
> > b/tests/intel/xe_module_load.c
> > index 6fcf4f806..0c75c4ebc 100644
> > --- a/tests/intel/xe_module_load.c
> > +++ b/tests/intel/xe_module_load.c
> > @@ -134,8 +134,7 @@ int igt_main()
> >  
> >         igt_subtest("force-load") {
> >                 for (int i = 0; unwanted_drivers[i] != NULL; i++) {
> > -
> >                        igt_skip_on_f(igt_kmod_is_loaded(unwanted_drive
> > rs[i]),
> > -                                     "%s is already loaded\n",
> > unwanted_drivers[i]);
> > +                       igt_intel_driver_unload(unwanted_drivers[i]);
> >                 }
> >  
> >                 load_and_check_xe("force_probe=*");
> 
