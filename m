Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B00F43682
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 08:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A827C10E992;
	Fri, 17 Apr 2026 08:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CilxSivi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0EE10E992
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 08:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776416002; x=1807952002;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pbDBSGDhOfR+pHmo1hrRvoz8NTbHpCoy3R/LcbEUa0s=;
 b=CilxSiviHSjrYp2ru0PkO0+4NOMDY1T8/dZRs4jOg5c6stAtoVbsejjZ
 kNeRWLhjEqNkWnYqCCKWwt+vjTwcML2bVx7z8PFAQuNLC6k6XplPBA6L+
 pm3/Fl6Q6a6kUmkYKUM/H0W6AOCgL0pk57ehtWf8YtvP1MYeB55prFBk1
 1TIy/Trzcq1H9dr2hYWUJ7b6DaU97iVtrpsBnuq/3qPFwDcILDLYZFz27
 K1oUpU0e+HRaS0SDf+ozYUpPJkIIdQS1oHDSqMTEH05bVGhlPVNV/9UBz
 clg8OTWZGT2NoDJ2f7JvJRHG5DO0g9giqkRaxU4dHR1z/hnDkH8UAX2MT w==;
X-CSE-ConnectionGUID: q1S16BqfQay0w1p7lArISQ==
X-CSE-MsgGUID: Tf60TPigTWmb5vDIiaFkwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="80017904"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="80017904"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 01:53:22 -0700
X-CSE-ConnectionGUID: ctRidg93TzSaBc1hUCcHJQ==
X-CSE-MsgGUID: 9QEadMH7T0KpfQFsDA0oNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; d="scan'208";a="226631403"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.127])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 01:53:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: Re: [PATCH v2 0/7] Remove deep-pkgc subtest
In-Reply-To: <20260417083506.33404-1-mohammed.thasleem@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260417083506.33404-1-mohammed.thasleem@intel.com>
Date: Fri, 17 Apr 2026 11:53:17 +0300
Message-ID: <c5ae1bf696bfc870cde43d595598de777428ced7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 17 Apr 2026, Mohammed Thasleem <mohammed.thasleem@intel.com> wrote:
> Remove the deep-pkgc subtest as it depends on other display IPs which makes
> testing unreliable. Current validation uses Package C-state counters that
> are affected by unrelated system components and requires platform-specific
> checks that vary across different platforms.
> A redesigned test with proper display IP isolation will be implemented
> in a future patch.

Doing this in reverts like this breaks bisect.

I basically do this on all of my series before submitting:

$ git rebase -i origin -x 'ninja -C build'


BR,
Jani.

>
> Mohammed Thasleem (7):
>   Revert "tests/intel/kms_pm_dc: Ensure eDP detection before skipping
>     test"
>   Revert "tests/intel/kms_pm_dc: Add polling for deep-pkgc"
>   Revert "tests/intel/kms_pm_dc: Update test duration to 4 seconds"
>   Revert "tests/intel/kms_pm_dc: Update VRR handling and eDP output
>     check"
>   Revert "tests/intel/kms_pm_dc: Add time unit macros and update delay
>     calculation"
>   Revert "tests/intel/kms_pm_dc: Add a new test to validate the deep
>     sleep state during extended vblank"
>   tests/intel/kms_pm_dc: Remove unused pkgc functions
>
>  tests/intel/kms_pm_dc.c | 98 -----------------------------------------
>  1 file changed, 98 deletions(-)

-- 
Jani Nikula, Intel
