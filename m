Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6528ACAC598
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 10:08:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E962010E6DB;
	Tue, 16 Sep 2025 10:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="be5b5K5Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF4F10E6DB
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 10:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758017316; x=1789553316;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=I8kW87WjX4TVu1X7WUf64OGBwXV1KDC1cAruLgBGG+I=;
 b=be5b5K5Y2QAkEM25piePSgfyeo+anI0tnBLasvyxNf0riVa4m6q9OrS6
 wWAXWqA3KLcIhClwvhNVR62J3plNr5abXkny7iEXTsmz9D66hTUrFFNtT
 gZfls2g0aifUkOvAdm/D3D2vCa7RgiLpOQjAs1NzM+TdgDHHi1rip1Q0D
 N/aZnLeHlVKXVhW5erLCKL+C15+9XgyL4IliE9o2kcRBGHZorHmHKBlng
 Ib9q8HwbD16sKeC89S40XeHC1WgmihfwT+NV6v1vdJQoMtmlvkQLOSRxe
 AIxPctL+Xj1FasYYY8z+GiGTE+EEJLZEJI5QTDfmeXT6cDRUHw5W9bNUy g==;
X-CSE-ConnectionGUID: D9qLkPY5Teap5K4GgnBENw==
X-CSE-MsgGUID: Nn1y7NvHTL6uvv/zOmcLrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="63924757"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="63924757"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 03:08:35 -0700
X-CSE-ConnectionGUID: 5E9INaj9TCK3ksZVzqLJ1w==
X-CSE-MsgGUID: D7Ma5vX/QC2sbz8jKvf0/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="205860456"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 03:08:33 -0700
Date: Tue, 16 Sep 2025 12:08:31 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: pravalika.gurram@intel.com, igt-dev@lists.freedesktop.org,
 nishit.sharma@intel.com, himal.prasad.ghimiray@intel.com
Subject: Re: [PATCH v6 2/2] intel-ci: Blocklist compression PAT index for LNL
Message-ID: <20250916100831.lslizf6zown7fe46@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 pravalika.gurram@intel.com, igt-dev@lists.freedesktop.org,
 nishit.sharma@intel.com, himal.prasad.ghimiray@intel.com
References: <20250915105057.1468276-1-pravalika.gurram@intel.com>
 <20250915105057.1468276-3-pravalika.gurram@intel.com>
 <20250915120829.ghqdzoe3wz3kl5vp@kamilkon-DESK.igk.intel.com>
 <871po7k6uq.wl-ashutosh.dixit@intel.com>
 <87ms6v78n5.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87ms6v78n5.wl-ashutosh.dixit@intel.com>
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

Hi Dixit,,
On 2025-09-15 at 13:39:26 -0700, Dixit, Ashutosh wrote:
> On Mon, 15 Sep 2025 09:39:41 -0700, Dixit, Ashutosh wrote:
> >
> > On Mon, 15 Sep 2025 05:08:29 -0700, Kamil Konieczny wrote:
> > >
> > > Hi pravalika.gurram,
> > > On 2025-09-15 at 16:20:57 +0530, pravalika.gurram@intel.com wrote:
> > > > From: Pravalika Gurram <pravalika.gurram@intel.com>
> > > >
> > > > Madvise does not support compression on LNL.
> > > > Therefore, compression-related PAT index
> > > > test cases have been blocklisted for this platform.
> > > >
> > > > Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> > >
> > > Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >
> > What is the guidance for when we blocklist a test vs. when we skip it,
> > using igt_skip or igt_require?
> 
> IMO we should skip it in the code, so anyone looking at the code will know
> the test doesn't work on LNL, without having to look at the blocklists.
> 
> Blocklisting concerns CI, so we may or may not want to blocklist it for CI
> (in addition to skipping in code).

You are right, it is better. One more thing to consider is to
skip on all iGPU, not only on LNL.

Regards,
Kamil

> 
> >
> > >
> > > > ---
> > > >  tests/intel-ci/xe.lnl.core.blocklist.txt | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
> > > > index 1e69170d8..3a21d7263 100644
> > > > --- a/tests/intel-ci/xe.lnl.core.blocklist.txt
> > > > +++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
> > > > @@ -83,3 +83,9 @@ igt@xe_live_ktest@xe_eudebug
> > > >  igt@xe_oa@oa-tlb-invalidate
> > > >  igt@xe_oa@unprivileged-single-ctx-counters
> > > >  ##################################################################
> > > > +# Expected fail as per the current behaviour compression
> > > > +# for madvise needs to skipped on LNL
> > > > +##################################################################
> > > > +igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-.*
> > > > +igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-.*
> > > > +##################################################################
> > > > --
> > > > 2.34.1
> > > >
