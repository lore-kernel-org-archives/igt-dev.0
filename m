Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38381CD5BAC
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 16:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB95910E4C3;
	Thu, 21 May 2026 16:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bO3UCtg+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8410C10E4C3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 16:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779381130; x=1810917130;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8STP86rqAfHAaXVN75Jer3SBmnYPJc/45CudmaBu6Ow=;
 b=bO3UCtg+Qr8HiT4X+nWx03uN40pxWjXyp5IOp6G9nlUNA3+Lg0bD0Dpb
 ok1gH1oCE0doA2kV2WGiFVl6uh0AxUL2/8mLrhh0ATE0zc9JScs7RJcGg
 b6udSqrJvC0+Ne/X7VlRAXJs0ePl/OQIKNEx3/XUSp6hSbsqU1MzNv40b
 TBGDHTiRn5tG+8/jIYbcQ8yi19B1SFyvcwydJCYrveaf7P+sFq7x2vMYJ
 MaRq19Cr1fpcY9mfacq63rkdQhLkQFI5u/aVt9O+mePmf8w9RbRMK34om
 4PYzfLax98OI9D2W5XY2l7DGmYVxXap0xNnkkPVIMiCxy0f2w8kPEU0UA w==;
X-CSE-ConnectionGUID: UoUtI2YfQn6IrXlz8eIo9w==
X-CSE-MsgGUID: nJlwrATPS1KTgRgobmuWsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80337306"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="80337306"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 09:32:10 -0700
X-CSE-ConnectionGUID: Bzl0QAy0QAW+SsaO/YDCFw==
X-CSE-MsgGUID: RVmL3N0iQUuKwrxQjCfXNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; d="scan'208";a="242373992"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 09:32:09 -0700
Date: Thu, 21 May 2026 18:32:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Fix
 duplicate documentation descriptions
Message-ID: <20260521163207.frzshvwlk4fuenpy@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260520123010.2482801-1-swati2.sharma@intel.com>
 <20260521104717.xt5nuw62uo4aijvi@kamilkon-DESK.igk.intel.com>
 <799f0c4b-c399-42da-89c8-2d2cc7d7a361@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <799f0c4b-c399-42da-89c8-2d2cc7d7a361@intel.com>
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

Hi Sharma,,
On 2026-05-21 at 17:20:30 +0530, Sharma, Swati2 wrote:
> Hi Kamil
> 
> On 21-05-2026 04:17 pm, Kamil Konieczny wrote:
> > Hi Swati,
> > On 2026-05-20 at 18:00:10 +0530, Swati Sharma wrote:
> > > Multiple SUBTEST entries shared identical descriptions across different
> > > test scenarios (offscreen, primary screen, secondary screen).
> > > 
> > > Fix by consolidating feature variants into arg[] parameters and
> > > updating descriptions to include scenario context (screen, plane,
> > > fb type, panel count, draw method).
> > > 
> > > This reduces documentation SUBTEST entries from 315 to 33.
> > I did a check with new and old, using:
> > old-build/build/tests/kms_frontbuffer_tracking --l > aold
> > new-build/build/tests/kms_frontbuffer_tracking --l > anew
> > diff -u aold anew
> > 
> > and results looks correct.
> > 
> > imho you can reduce it even more, see below.
> > 
> > > v2: Addressed review comments - made descriptions shorter (Kamil)
> > > 
> > > Co-developed-by: Claude Opus 4.6
> > > Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> > > ---
> > >   tests/intel/kms_frontbuffer_tracking.c | 1432 ++++++++----------------
> > >   1 file changed, 468 insertions(+), 964 deletions(-)
> > > 
> > > diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> > > index e7bb3fa18..37706cab5 100644
> > > --- a/tests/intel/kms_frontbuffer_tracking.c
> > > +++ b/tests/intel/kms_frontbuffer_tracking.c
> > > @@ -27,7 +27,7 @@
> > >   /**
> > >    * TEST: kms frontbuffer tracking
> > >    * Category: Display
> > > - * Description: Test the Kernel's frontbuffer tracking mechanism and its related features: FBC, PSR and DRRS
> > > + * Description: Test the Kernel's frontbuffer tracking mechanism and its related features: FBC, PSR, HDR and DRRS
> > >    * Driver requirement: i915, xe
> > >    * Mega feature: General Display Features
> > >    */
> > > @@ -59,82 +59,51 @@
> > >    * SUBTEST: pipe-fbc-rte
> > >    * Description: Sanity test to enable FBC on each pipe.
> > >    *
> > > - * SUBTEST: drrs-%dp-rte
> > > - * Description: Sanity test to enable DRRS with %arg[1] panels.
> > > + * SUBTEST: %s-%dp-rte
> > > + * Description: Sanity test to enable %arg[1] with %arg[2] panels.
> > >    *
> > > - * SUBTEST: fbc-%dp-rte
> > > - * Description: Sanity test to enable FBC with %arg[1] panels.
> > > - *
> > > - * SUBTEST: psr-%dp-rte
> > > - * Description: Sanity test to enable PSR with %arg[1] panels.
> > > - *
> > > - * SUBTEST: hdr-%dp-rte
> > > - * Description: Sanity test to enable PSR with %arg[1] panels.
> > > - *
> > > - * SUBTEST: fbcdrrs-%dp-rte
> > > - * Description: Sanity test to enable FBC & DRRS with %arg[1] panels.
> > > - *
> > > - * SUBTEST: fbcpsr-%dp-rte
> > > - * Description: Sanity test to enable FBC & PSR with %arg[1] panels.
> > > - *
> > > - * SUBTEST: fbchdr-%dp-rte
> > > - * Description: Sanity test to enable FBC & HDR with %arg[1] panels.
> > > - *
> > > - * SUBTEST: drrshdr-%dp-rte
> > > - * Description: Sanity test to enable HDR & DRRS with %arg[1] panels.
> > > - *
> > > - * SUBTEST: psrhdr-%dp-rte
> > > - * Description: Sanity test to enable HDR & PSR with %arg[1] panels.
> > > - *
> > > - * SUBTEST: fbcdrrshdr-%dp-rte
> > > - * Description: Sanity test to enable HDR, FBC & DRRS with %arg[1] panels.
> > > - *
> > > - * SUBTEST: fbcpsrhdr-%dp-rte
> > > - * Description: Sanity test to enable HDR, FBC & PSR with %arg[1] panels.
> > > + * arg[1]:
> > >    *
> > > - * arg[1].values:   1, 2
> > > + * @drrs:       DRRS
> > > + * @fbc:        FBC
> > > + * @psr:        PSR
> > > + * @hdr:        HDR
> > > + * @fbcdrrs:    FBC & DRRS
> > > + * @fbcpsr:     FBC & PSR
> > > + * @fbchdr:     FBC & HDR
> > > + * @drrshdr:    DRRS & HDR
> > > + * @psrhdr:     PSR & HDR
> > > + * @fbcdrrshdr: FBC, DRRS & HDR
> > > + * @fbcpsrhdr:  FBC, PSR & HDR
> > > + *
> > > + * arg[2].values:   1, 2
> > >    */
> > >   /**
> > > - * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > - *
> > > - * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > - *
> > > - * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > + * SUBTEST: %s-1p-offscreen-pri-%s-draw-%s
> > > + * Description: Draw a set of rectangles targeting offscreen buffer using %arg[3] method
> > > + * 		with %arg[1], using %arg[2]
> > >    *
> > > - * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > - *
> > > - * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > - *
> > > - * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > - *
> > > - * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > - *
> > > - * SUBTEST: drrshdr-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > - *
> > > - * SUBTEST: psrhdr-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > - *
> > > - * SUBTEST: fbcpsrhdr-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > + * arg[1]:
> > >    *
> > > - * SUBTEST: fbcdrrshdr-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > + * @drrs:       DRRS
> > > + * @fbc:        FBC
> > > + * @psr:        PSR
> > > + * @hdr:        HDR
> > > + * @fbcdrrs:    FBC & DRRS
> > > + * @fbcpsr:     FBC & PSR
> > > + * @fbchdr:     FBC & HDR
> > > + * @drrshdr:    DRRS & HDR
> > > + * @psrhdr:     PSR & HDR
> > > + * @fbcdrrshdr: FBC, DRRS & HDR
> > > + * @fbcpsrhdr:  FBC, PSR & HDR
> > >    *
> > > - * arg[1]:
> > > + * arg[2]:
> > >    *
> > >    * @indfb:          Individual fb
> > >    * @shrfb:          Shared fb
> > >    *
> > > - * arg[2]:
> > > + * arg[3]:
> > >    *
> > >    * @blt:            Blitter
> > >    * @mmap-wc:        MMAP-WC
> > > @@ -142,51 +111,31 @@
> > >    */
> > >   /**
> > > - * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s
> > Note that name here is the same as in previous hunk:
> > %s-1p-offscreen-pri-%s-draw-%s
> 
> Yes indeed, but check driver reqt too. Previous one is for i915/xe both.
> 
> This one only for i915. That's why splitting is required.
> 

Right, I missed that, sorry for noise.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > - * Driver requirement: i915
> > > - *
> > > - * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > - * Driver requirement: i915
> > > - *
> > > - * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > - * Driver requirement: i915
> > > - *
> > > - * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > - * Driver requirement: i915
> > > - *
> > > - * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > - * Driver requirement: i915
> > > - *
> > > - * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > + * SUBTEST: %s-1p-offscreen-pri-%s-draw-%s
> > > + * Description: Draw a set of rectangles targeting offscreen buffer using %arg[3] method
> > > + * 		with %arg[1], using %arg[2]
> > >    * Driver requirement: i915
> > >    *
> > > - * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > - *
> > > - * SUBTEST: drrshdr-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > - *
> > > - * SUBTEST: psrhdr-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > - *
> > > - * SUBTEST: fbcdrrshdr-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > + * arg[1]:
> > >    *
> > > - * SUBTEST: fbcpsrhdr-1p-offscreen-pri-%s-draw-%s
> > > - * Description: Draw a set of rectangles on the screen using the provided method
> > > + * @drrs:       DRRS
> > > + * @fbc:        FBC
> > > + * @psr:        PSR
> > > + * @hdr:        HDR
> > > + * @fbcdrrs:    FBC & DRRS
> > > + * @fbcpsr:     FBC & PSR
> > > + * @fbchdr:     FBC & HDR
> > > + * @drrshdr:    DRRS & HDR
> > > + * @psrhdr:     PSR & HDR
> > > + * @fbcdrrshdr: FBC, DRRS & HDR
> > > + * @fbcpsrhdr:  FBC, PSR & HDR
> > >    *
> > > - * arg[1]:
> > > + * arg[2]:
> > >    *
> > >    * @indfb:          Individual fb
> > >    * @shrfb:          Shared fb
> > >    *
> > > - * arg[2]:
> > > + * arg[3]:
> > >    *
> > >    * @mmap-cpu:       MMAP-CPU
> > >    * @mmap-gtt:       MMAP-GTT
> > imho you can add these two lines to previous description
> > and drop this hunk.
> > 
[cut]
