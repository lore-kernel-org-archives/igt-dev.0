Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E2DF47CC6
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 20:15:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DF710E053;
	Thu,  5 Mar 2026 20:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJ7tfEfs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730E410E053
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 20:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772741746; x=1804277746;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cOGHEzLQtJbaIPgUcBajYIefim9ovRLGIqxouZiisyU=;
 b=hJ7tfEfsh9aNBIJFfNd5s7GlY1c3L7z8uKqf3G0UofGVtFIKiGhvQ/oT
 Tf+yQG+RL3PB5lRFpykcsCbPWrgO8X4SI11Gin3jVIMv2fETM/7KvOvM1
 Wbc7PX95QLlEXf5iGPNawOXDoWYLtamgVIHLvATF0/M3hkFAvjtn22r/h
 yhW/b6UkPug1wjySxIVapr+KOxNoNn3lgkAJ3WrDPPthGh9+XS8XLd6AF
 ulHWPmK//qSvMiek43nr/f1B0EOOc50cNcwCFoAlWmbfaWS7Fd1HlmzzF
 wY/Q9pomt+wHS/bLXtuCrKYTEXEmWsRx44W+tJjefGI/hW4hhdIYHpDqL w==;
X-CSE-ConnectionGUID: CO9eO8F/SqamMLNhGVjTAQ==
X-CSE-MsgGUID: jXz9K6WxQTe9d0qg+80Z7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73542956"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73542956"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 12:15:45 -0800
X-CSE-ConnectionGUID: NfBZe0QCSOeNYeuYeWm1dw==
X-CSE-MsgGUID: ErTOLwWlQL6QI86kGt4uGg==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 12:15:43 -0800
Date: Thu, 5 Mar 2026 21:15:27 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>
Subject: Re: [PATCH i-g-t] Revert "lib/intel_pat: use kernel debugfs as
 authoritative PAT source for Xe"
Message-ID: <20260305201527.73rsjtgrmurqcbqj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 "Sharma, Nishit" <nishit.sharma@intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>
References: <20260305003047.2290389-1-ashutosh.dixit@intel.com>
 <MW4PR11MB71513EA99A9655ED36977DD5E47DA@MW4PR11MB7151.namprd11.prod.outlook.com>
 <20260305040517.GM4694@mdroper-desk1.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305040517.GM4694@mdroper-desk1.amr.corp.intel.com>
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
On 2026-03-04 at 20:05:17 -0800, Matt Roper wrote:
> On one hand, we shouldn't let buggy tests dictate IGT library behavior
> and prevent us from developing the libraries that we need across the
> entire codebase.  But on the other hand, we also don't want to leave
> individual tests that we have in CI in a failing state with no
> documented plans on how to fix things.
> 
> If a fix of xe_oa is easy, then we should develop that immediately (and
> if we'd done that early we probably could even have submitted it in the
> same series as the library changes so that they'd go in together). But
> in this case the issues with the xe_oa test are a bit deeper and
> probably non-trivial to fix:
> 
>  * Some of the tests are just plain wrong.  E.g., rather than checking
>    for the behavior expected by userspace (e.g., "can I access this
>    register for read/write as expected?") they're checking internal
>    implementation details that userspace has no business being aware of
>    in the first place ("is this register specifically programmed in the
>    FORCE_TO_NONPRIV registers?") and what they're trying to confirm is
>    itself incorrect (and will fail once we make some fixes on the KMD
>    side).
> 
>  * Other tests are logically correct at the high-level, but rather than
>    being written as a proper Xe test that uses the Xe interfaces that
>    real userspace would, they're using an IGT library that's mostly
>    intended for display tests that need to run on both i915 and Xe.
>    Since important uapi details like PAT index don't exist on i915,
>    they're not part of this library's interface and thus the test can't
>    pick the values it wants and pass them in; instead the library
>    handles them implicitly internally.  That's fine for tests that are
>    running as root, but once we stopped hardcoding magic numbers into
>    the library, there was an implicit requirement that the test calling
>    the library have root privilege to access debugfs --- since the xe_oa
>    test drops privileges, this doesn't work.

Reverted commit was:
"lib/intel_pat: use kernel debugfs as authoritative PAT source for Xe"

If userspace needs to read PAT values dynamically then why is it debugfs?
Debugfs should never be used for 'autoritative' source of information,
it should not become userspace API. Here it should be either ioctl (xe
query) or sysfs.

It could be used for temporal solution until there will be agreement
how to do it but then userspace should expect that temporal solution
in debugfs will disappear. But still there is a risk that if it will
stay for too long it will become uAPI.

> 
>  * Even the tests that are 100% functionally correct are still hard to
>    follow because the i915-compatibility libraries are trying to cobble
>    together something that works across a couple decades worth of i915
>    uapi evolution, followed by a switch to an entirely different driver.
>    For pure-Xe tests we really need to cut out all the unnecessary
>    compatibility layers so that it's clear what a test is doing and so
>    that it can be accurately debugged if/when it reports failures.
> 
> So maybe in the short term we need to blacklist the test to prevent CI
> from trying to run it, and then as the test gets rewritten to fix its
> issues the various subtests can be removed from the blacklist to let
> them start running again?

There was another attempt around PAT, I do not know if it is valid
in this context:

https://patchwork.freedesktop.org/series/161756/
lib/intel_pat: Handle platforms without compressed PAT index

+cc Zbigniew, Matthew Auld and Sanjay Yadav

Regards,
Kamil

> 
> Another option which might be quicker in the short term would be to add
> a new library function like "intel_bb_prepare_to_drop_priv()" which
> could be called at the beginning of any test using intel_bb that plans
> to drop privileges so that the library can grab all the necessary
> details from debugfs while it still has root powers and cache them
> internally.  Then it could use that internal cache later once it has
> dropped privilege and can no longer get values directly from debugfs.
> But I don't know if we really want to add a new interface to the
> intel_bb library's house of cards if we really want to re-write the test
> anyway.
> 
> 
> Matt
> 
> On Wed, Mar 04, 2026 at 06:27:43PM -0800, Sharma, Nishit wrote:
> > Hi Ashutosh,
> > 
> > I understand the concern but the xe_pat patch was reviewed and +1 given by MattR and with reasoning regarding xe_oa https://patchwork.freedesktop.org/patch/706754/?series=161927&rev=2
> > Hence, we went ahead with the merge. In case if you feel it's major regression a partial revert of lib changes can be done.
> > 
> > Regards
> > Nishit
> > 
> > -----Original Message-----
> > From: Dixit, Ashutosh <ashutosh.dixit@intel.com> 
> > Sent: Thursday, March 5, 2026 6:01 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Girotra, Himanshu <himanshu.girotra@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> > Subject: [PATCH i-g-t] Revert "lib/intel_pat: use kernel debugfs as authoritative PAT source for Xe"
> > 
> > This reverts commit 4e59b8e7779b04ba982cd5b17c023511ee2f0ed7.
> > 
> > This patch caused a major regression in xe_oa tests and should not have been merged. Revert for now and re-merge after the regression is fixed.
> > 
> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > ---
> >  lib/intel_pat.c      | 37 ++++++++++----------
> >  tests/intel/xe_pat.c | 80 ++++----------------------------------------
> >  2 files changed, 24 insertions(+), 93 deletions(-)
[cut]
