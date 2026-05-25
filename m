Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09386CD5BC9
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 14:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28BB10E112;
	Mon, 25 May 2026 14:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gP+iVjBK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245C910E112
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 14:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779718695; x=1811254695;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tBj397/2g2jgNplCgpNMbtTSFuFKhoIK1LpYYlbO1EQ=;
 b=gP+iVjBKWLMNdBjjpPDPcrqAXDRVQXH58t8vjyauG5QU65w3vf8ohoa8
 f8NClja6cQbYCtMgxaeqXPapVBGhQF2fKss7UN2k75zACF4t23szINQLc
 47ZHqrx19hXQv+/i+sShVLHIAW9GFcRcH2K+HVPIJVwbp1EUpo3PVlMBQ
 pXWh3X3GqfRlWbgjMo6moYEllPl3OYyC1p/tEW9nSTfCHpyd+Nav7xUcM
 PTcIxUuwFYoF04wOt7YlDZXu8r0dBlQ3c9RzcwGEJibwc3tFAWMegt0Q1
 JDFjTgLgzXY+B0LCyskBgc0ylF3gXvoXPHIYSbeOPW8erTeq/+ILS+7pI Q==;
X-CSE-ConnectionGUID: 2eNrlJcsSYW4aUtDPOrg7Q==
X-CSE-MsgGUID: 5Zf/1c1hSsC07+Ns9IO1EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="103219956"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="103219956"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:18:14 -0700
X-CSE-ConnectionGUID: I8zbb90ETRKgl9LMR2RhFg==
X-CSE-MsgGUID: A4EOMYpwTK+jntAeyzHNMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="240776977"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.3])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 07:18:13 -0700
Date: Mon, 25 May 2026 17:18:09 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
Subject: Re: [PATCH v2 0/7] Remove deep-pkgc subtest
Message-ID: <ahRaIc6kM1hGLZrt@intel.com>
References: <20260417083506.33404-1-mohammed.thasleem@intel.com>
 <aeIo15_JaYs0A_Y7@intel.com>
 <937ff9a3-ff20-400c-a634-d3eb493556d4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <937ff9a3-ff20-400c-a634-d3eb493556d4@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Mon, May 25, 2026 at 07:41:29PM +0530, Thasleem, Mohammed wrote:
> 
> On 17-04-2026 06:04 pm, Ville Syrjälä wrote:
> > On Fri, Apr 17, 2026 at 02:04:59PM +0530, Mohammed Thasleem wrote:
> >> Remove the deep-pkgc subtest as it depends on other display IPs which makes
> >> testing unreliable. Current validation uses Package C-state counters that
> >> are affected by unrelated system components and requires platform-specific
> >> checks that vary across different platforms.
> >> A redesigned test with proper display IP isolation will be implemented
> >> in a future patch.
> > What is the actual plan for that? How would it even be implemented
> > and when should we expect to get it?
> It's in discussion with hardware design team to come up with hooks for 
> better validation and tracking.

And how are you going to catch regression on current systems?

> >> Mohammed Thasleem (7):
> >>    Revert "tests/intel/kms_pm_dc: Ensure eDP detection before skipping
> >>      test"
> >>    Revert "tests/intel/kms_pm_dc: Add polling for deep-pkgc"
> >>    Revert "tests/intel/kms_pm_dc: Update test duration to 4 seconds"
> >>    Revert "tests/intel/kms_pm_dc: Update VRR handling and eDP output
> >>      check"
> >>    Revert "tests/intel/kms_pm_dc: Add time unit macros and update delay
> >>      calculation"
> >>    Revert "tests/intel/kms_pm_dc: Add a new test to validate the deep
> >>      sleep state during extended vblank"
> >>    tests/intel/kms_pm_dc: Remove unused pkgc functions
> >>
> >>   tests/intel/kms_pm_dc.c | 98 -----------------------------------------
> >>   1 file changed, 98 deletions(-)
> >>
> >> -- 
> >> 2.43.0

-- 
Ville Syrjälä
Intel
