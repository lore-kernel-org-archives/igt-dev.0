Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA876C87FD2
	for <igt-dev@archiver.kernel.org>; Mon, 11 Aug 2025 10:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC5610E436;
	Mon, 11 Aug 2025 10:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UsFPcTrG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B0C10E436
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Aug 2025 10:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754909156; x=1786445156;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=0U3Bb2mdPcEX+Lu7Ce7krbqrGXeruhLnvOTbjoAZ3G4=;
 b=UsFPcTrGs3dgmBtoozYlwrnskJiEgKXOaRawfX692qXCaKRVBexaR61P
 17qnhaRp9TtO5SSf9zXlS/7Qqj7+NxIyOsnvPmELqByS31ocx8ETew1yv
 aDS6exNVVmuT3lu5lzWYxyzz7+gnHeKSP6Uv0niMO3VSAcu9mb31qaQjt
 0UhVmYeSPp6bF5S1chFIjUlhic8qwDGQPEyYjDabdjxfz3tMYExGlIFdZ
 MmrGZdNIt4GDI+zUiVWIy+sW7Fhqbc22dZrNc1oLBBOcsvixjq1El6TP4
 CHKBaJxvlEudbi3ckQPdZ+Xp1e3PSuh1Fu2rv0tvVBGanK55kUK1zK15f A==;
X-CSE-ConnectionGUID: yFkZq14XT5WSxG/ziZiiUA==
X-CSE-MsgGUID: R8rna44/T+ecyQMXl7aS4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68526940"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="68526940"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:45:56 -0700
X-CSE-ConnectionGUID: y0xR+eSaQLK10GsXY2sk8w==
X-CSE-MsgGUID: 1uPJvVrWRdyXr7pYWLOZwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165876415"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.84])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:45:54 -0700
Date: Mon, 11 Aug 2025 12:45:50 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 igt-dev@lists.freedesktop.org, Daniel Charles <daniel.charles@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_compute_preempt: remove WMTP check in
 multiprocess tests
Message-ID: <hq3btmoytyqwgvvux5snaozq7g3uux52uqygt7k5ew3276nxnd@lpy7kbiymexj>
References: <20250811054650.37114-2-zbigniew.kempczynski@intel.com>
 <20250811103136.cmmcleqlqdduutaj@kamilkon-DESK.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250811103136.cmmcleqlqdduutaj@kamilkon-DESK.igk.intel.com>
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

On Mon, Aug 11, 2025 at 12:31:36PM +0200, Kamil Konieczny wrote:
> Hi Zbigniew,
> On 2025-08-11 at 07:46:51 +0200, Zbigniew Kempczyński wrote:
> > Before forking we test WMTP preemption in test_compute_preempt()
> > which is synchronous. Remove this check as it is redundant, there's
> > dedicated 'compute-preempt' subtest which does it.
> 
> I do not see a dedicated VRAM test, only SYSTEM_RAM?
> Something like: compute-preempt-vram?

Generally on the beginning we just need to check if WMTP preemption
is supported, memory doesn't matter. Tests which -vram are testing
this functionality more thoroughly so adding compute-preempt-vram
is not increasing our coverage.

> I do not think it is a blocker so
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Thanks for the review.

--
Zbigniew

> 
> > 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Daniel Charles <daniel.charles@intel.com>
> > ---
> >  tests/intel/xe_compute_preempt.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
> > index 7a468e7426..c9b194869c 100644
> > --- a/tests/intel/xe_compute_preempt.c
> > +++ b/tests/intel/xe_compute_preempt.c
> > @@ -102,7 +102,6 @@ igt_main
> >  				igt_debug("RAM: %" PRIu64 ", child count: %d\n",
> >  					  ram_mb, child_count);
> >  
> > -				test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
> >  				igt_fork(child, child_count)
> >  					test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
> >  				igt_waitchildren();
> > @@ -129,7 +128,6 @@ igt_main
> >  				igt_debug("RAM: %" PRIu64 ", child count: %d\n",
> >  					  ram_mb, child_count);
> >  
> > -				test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
> >  				igt_fork(child, child_count)
> >  					test_compute_preempt(xe, hwe, false, EXECENV_PREF_SYSTEM);
> >  				igt_waitchildren();
> > @@ -156,7 +154,6 @@ igt_main
> >  				igt_debug("VRAM: %" PRIu64 ", child count: %d\n",
> >  					  vram_mb, child_count);
> >  
> > -				test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
> >  				igt_fork(child, child_count)
> >  					test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
> >  				igt_waitchildren();
> > @@ -183,7 +180,6 @@ igt_main
> >  				igt_debug("VRAM: %" PRIu64 ", child count: %d\n",
> >  					  vram_mb, child_count);
> >  
> > -				test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
> >  				igt_fork(child, child_count)
> >  					test_compute_preempt(xe, hwe, false, EXECENV_PREF_VRAM);
> >  				igt_waitchildren();
> > -- 
> > 2.43.0
> > 
