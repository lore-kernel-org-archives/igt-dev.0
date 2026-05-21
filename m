Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F239ACD4F5E
	for <igt-dev@archiver.kernel.org>; Thu, 21 May 2026 10:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DB310E385;
	Thu, 21 May 2026 10:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAHGelsl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 220C310F2E8
 for <igt-dev@lists.freedesktop.org>; Thu, 21 May 2026 10:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779360461; x=1810896461;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uBPV7a2l7jq1wsAPtpmKDvRJs6/DvIfbKHzugJH40dw=;
 b=JAHGelslniHgg4qq/P0kKwpZerVviy46/O2qSI1p9lTZa92J7a/I4px3
 rvKKXiYfnhokyJ1Abpk46bOlKGbMN9bLQQqHZASTshqV6C8l3Hn60Rhoj
 xIQ9jXTfXhXLlw0QWcD+hQ9FqfLm8gP5v1xBTwxoQNXCiPYq/oEmkDQ4c
 ZYMi3ZA0Nfpr89Q1P5GQTZOb1viDp3w6u7Nt2nAvdJnYAH9mPdZafTADj
 KJx1w2YmEG/nakRmRYaWhEsl7koYPomuiOckqRJcjuXJlzhYfeOml3EBS
 L+20io3ojONX/hOzZil33xMDF36rmRVOpjFKDESVyA3cBTtxSoNcud6fD g==;
X-CSE-ConnectionGUID: oh6TTPzKTFetMx9BQM9+wQ==
X-CSE-MsgGUID: SAUoCeDfQ5O9A/QbC5JLrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="84160286"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="84160286"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 03:47:41 -0700
X-CSE-ConnectionGUID: /iXlwyhAT8Cr5LlQjcmFvw==
X-CSE-MsgGUID: wS6821uaSAe3/6uPotoQEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; d="scan'208";a="264016401"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 03:47:38 -0700
Date: Thu, 21 May 2026 12:47:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Fix
 duplicate documentation descriptions
Message-ID: <20260521104717.xt5nuw62uo4aijvi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260520123010.2482801-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520123010.2482801-1-swati2.sharma@intel.com>
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

Hi Swati,
On 2026-05-20 at 18:00:10 +0530, Swati Sharma wrote:
> Multiple SUBTEST entries shared identical descriptions across different
> test scenarios (offscreen, primary screen, secondary screen).
> 
> Fix by consolidating feature variants into arg[] parameters and
> updating descriptions to include scenario context (screen, plane,
> fb type, panel count, draw method).
> 
> This reduces documentation SUBTEST entries from 315 to 33.

I did a check with new and old, using:
old-build/build/tests/kms_frontbuffer_tracking --l > aold
new-build/build/tests/kms_frontbuffer_tracking --l > anew
diff -u aold anew

and results looks correct.

imho you can reduce it even more, see below.

> 
> v2: Addressed review comments - made descriptions shorter (Kamil)
> 
> Co-developed-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_frontbuffer_tracking.c | 1432 ++++++++----------------
>  1 file changed, 468 insertions(+), 964 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index e7bb3fa18..37706cab5 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -27,7 +27,7 @@
>  /**
>   * TEST: kms frontbuffer tracking
>   * Category: Display
> - * Description: Test the Kernel's frontbuffer tracking mechanism and its related features: FBC, PSR and DRRS
> + * Description: Test the Kernel's frontbuffer tracking mechanism and its related features: FBC, PSR, HDR and DRRS
>   * Driver requirement: i915, xe
>   * Mega feature: General Display Features
>   */
> @@ -59,82 +59,51 @@
>   * SUBTEST: pipe-fbc-rte
>   * Description: Sanity test to enable FBC on each pipe.
>   *
> - * SUBTEST: drrs-%dp-rte
> - * Description: Sanity test to enable DRRS with %arg[1] panels.
> + * SUBTEST: %s-%dp-rte
> + * Description: Sanity test to enable %arg[1] with %arg[2] panels.
>   *
> - * SUBTEST: fbc-%dp-rte
> - * Description: Sanity test to enable FBC with %arg[1] panels.
> - *
> - * SUBTEST: psr-%dp-rte
> - * Description: Sanity test to enable PSR with %arg[1] panels.
> - *
> - * SUBTEST: hdr-%dp-rte
> - * Description: Sanity test to enable PSR with %arg[1] panels.
> - *
> - * SUBTEST: fbcdrrs-%dp-rte
> - * Description: Sanity test to enable FBC & DRRS with %arg[1] panels.
> - *
> - * SUBTEST: fbcpsr-%dp-rte
> - * Description: Sanity test to enable FBC & PSR with %arg[1] panels.
> - *
> - * SUBTEST: fbchdr-%dp-rte
> - * Description: Sanity test to enable FBC & HDR with %arg[1] panels.
> - *
> - * SUBTEST: drrshdr-%dp-rte
> - * Description: Sanity test to enable HDR & DRRS with %arg[1] panels.
> - *
> - * SUBTEST: psrhdr-%dp-rte
> - * Description: Sanity test to enable HDR & PSR with %arg[1] panels.
> - *
> - * SUBTEST: fbcdrrshdr-%dp-rte
> - * Description: Sanity test to enable HDR, FBC & DRRS with %arg[1] panels.
> - *
> - * SUBTEST: fbcpsrhdr-%dp-rte
> - * Description: Sanity test to enable HDR, FBC & PSR with %arg[1] panels.
> + * arg[1]:
>   *
> - * arg[1].values:   1, 2
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
> + *
> + * arg[2].values:   1, 2
>   */
>  
>  /**
> - * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * SUBTEST: %s-1p-offscreen-pri-%s-draw-%s
> + * Description: Draw a set of rectangles targeting offscreen buffer using %arg[3] method
> + * 		with %arg[1], using %arg[2]
>   *
> - * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: drrshdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: psrhdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbcpsrhdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * arg[1]:
>   *
> - * SUBTEST: fbcdrrshdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1]:
> + * arg[2]:
>   *
>   * @indfb:          Individual fb
>   * @shrfb:          Shared fb
>   *
> - * arg[2]:
> + * arg[3]:
>   *
>   * @blt:            Blitter
>   * @mmap-wc:        MMAP-WC
> @@ -142,51 +111,31 @@
>   */
>  
>  /**
> - * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s

Note that name here is the same as in previous hunk:
%s-1p-offscreen-pri-%s-draw-%s


> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * SUBTEST: %s-1p-offscreen-pri-%s-draw-%s
> + * Description: Draw a set of rectangles targeting offscreen buffer using %arg[3] method
> + * 		with %arg[1], using %arg[2]
>   * Driver requirement: i915
>   *
> - * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: drrshdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: psrhdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbcdrrshdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1]:
> + * arg[2]:
>   *
>   * @indfb:          Individual fb
>   * @shrfb:          Shared fb
>   *
> - * arg[2]:
> + * arg[3]:
>   *
>   * @mmap-cpu:       MMAP-CPU
>   * @mmap-gtt:       MMAP-GTT

imho you can add these two lines to previous description
and drop this hunk.

> @@ -194,59 +143,34 @@
>   */
>  
>  /**
> - * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * SUBTEST: %s-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on primary screen using %arg[4] method on %arg[3]
> + * 		with %arg[1], %arg[2] panel(s) and individual fb
>   * Driver requirement: i915
>   *
> - * SUBTEST: hdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1].values:   1, 2
> + * arg[2].values:   1, 2
>   *
> - * arg[2]:
> + * arg[3]:
>   *
>   * @cur:            Cursor plane
>   * @pri:            Primary plane
>   * @spr:            Sprite plane
>   *
> - * arg[3]:
> + * arg[4]:
>   *
>   * @mmap-cpu:       MMAP-CPU
>   * @mmap-gtt:       MMAP-GTT
> @@ -254,48 +178,33 @@
>   */
>  
>  /**
> - * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s

Same name as in previous hunk:
%s-%dp-primscrn-%s-indfb-draw-%s

> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: hdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * SUBTEST: %s-%dp-primscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on primary screen using %arg[4] method on %arg[3]
> + * 		with %arg[1], %arg[2] panel(s) and individual fb
>   *
> - * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1].values:   1, 2
> + * arg[2].values:   1, 2
>   *
> - * arg[2]:
> + * arg[3]:
>   *
>   * @cur:            Cursor plane
>   * @pri:            Primary plane
>   * @spr:            Sprite plane
>   *
> - * arg[3]:
> + * arg[4]:
>   *
>   * @blt:            Blitter
>   * @mmap-wc:        MMAP-WC

Same here, add these two to previous and drop hunk.

> @@ -303,42 +212,27 @@
>   */
>  
>  /**
> - * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: hdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * SUBTEST: %s-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on primary screen on primary plane using %arg[3] method
> + * 		with %arg[1], %arg[2] panel(s) and shared fb
>   *
> - * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbchdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: drrshdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: psrhdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbcdrrshdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1].values:   1, 2
> + * arg[2].values:   1, 2
>   *
> - * arg[2]:
> + * arg[3]:
>   *
>   * @blt:            Blitter
>   * @mmap-wc:        MMAP-WC
> @@ -346,53 +240,28 @@
>   */
>  
>  /**
> - * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s

Same name as in previous hunk:
%s-%dp-primscrn-pri-shrfb-draw-%s

> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: hdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbchdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: drrshdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: psrhdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * SUBTEST: %s-%dp-primscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on primary screen on primary plane using %arg[3] method
> + * 		with %arg[1], %arg[2] panel(s) and shared fb
>   * Driver requirement: i915
>   *
> - * SUBTEST: fbcdrrshdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1].values:   1, 2
> + * arg[2].values:   1, 2
>   *
> - * arg[2]:
> + * arg[3]:
>   *
>   * @mmap-cpu:       MMAP-CPU
>   * @mmap-gtt:       MMAP-GTT

Same here, move these two and drop hunk.

> @@ -400,46 +269,31 @@
>   */
>  
>  /**
> - * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * SUBTEST: %s-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on secondary screen using %arg[3] method on %arg[2]
> + * 		with %arg[1] and individual fb
>   *
> - * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: hdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1]:
> + * arg[2]:
>   *
>   * @cur:            Cursor plane
>   * @pri:            Primary plane
>   * @spr:            Sprite plane
>   *
> - * arg[2]:
> + * arg[3]:
>   *
>   * @blt:            Blitter
>   * @mmap-wc:        MMAP-WC
> @@ -447,57 +301,32 @@
>   */
>  
>  /**
> - * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s

Same name as in prev:

%s-2p-scndscrn-%s-indfb-draw-%s

> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: hdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * SUBTEST: %s-2p-scndscrn-%s-indfb-draw-%s
> + * Description: Draw a set of rectangles on secondary screen using %arg[3] method on %arg[2]
> + * 		with %arg[1] and individual fb
>   * Driver requirement: i915
>   *
> - * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1]:
> + * arg[2]:
>   *
>   * @cur:            Cursor plane
>   * @pri:            Primary plane
>   * @spr:            Sprite plane
>   *
> - * arg[2]:
> + * arg[3]:
>   *
>   * @mmap-cpu:       MMAP-CPU
>   * @mmap-gtt:       MMAP-GTT

Same here, move these two and drop hunk.

> @@ -505,40 +334,25 @@
>   */
>  
>  /**
> - * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * SUBTEST: %s-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on secondary screen on primary plane using %arg[2] method
> + * 		with %arg[1] and shared fb
>   *
> - * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: hdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbchdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: drrshdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: psrhdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - *
> - * SUBTEST: fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1]:
> + * arg[2]:
>   *
>   * @blt:            Blitter
>   * @mmap-wc:        MMAP-WC
> @@ -546,51 +360,26 @@
>   */
>  
>  /**
> - * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s

Same name as above:
%s-2p-scndscrn-pri-shrfb-draw-%s

> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: hdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * SUBTEST: %s-2p-scndscrn-pri-shrfb-draw-%s
> + * Description: Draw a set of rectangles on secondary screen on primary plane using %arg[2] method
> + * 		with %arg[1] and shared fb
>   * Driver requirement: i915
>   *
> - * SUBTEST: fbchdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: drrshdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: psrhdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> - * Driver requirement: i915
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1]:
> + * arg[2]:
>   *
>   * @mmap-cpu:       MMAP-CPU
>   * @mmap-gtt:       MMAP-GTT

Move these two and drop hunk.

> @@ -598,84 +387,53 @@
>   */
>  
>  /**
> - * SUBTEST: drrs-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - *
> - * SUBTEST: fbc-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - *
> - * SUBTEST: psr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - *
> - * SUBTEST: hdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - *
> - * SUBTEST: fbcdrrs-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * SUBTEST: %s-%dp-pri-indfb-multidraw
> + * Description: Draw a set of rectangles on primary plane using alternated drawing methods
> + * 		with %arg[1], %arg[2] panel(s) and individual fb
>   *
> - * SUBTEST: fbcpsr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - *
> - * SUBTEST: fbchdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - *
> - * SUBTEST: drrshdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - *
> - * SUBTEST: psrhdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - *
> - * SUBTEST: fbcdrrshdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> - *
> - * SUBTEST: fbcpsrhdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * arg[1]:
>   *
> - * arg[1].values:   1, 2
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
> + *
> + * arg[2].values:   1, 2
>   */
>  
>  /**
> - * SUBTEST: drrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - *
> - * SUBTEST: fbc-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - *
> - * SUBTEST: psr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - *
> - * SUBTEST: hdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - *
> - * SUBTEST: fbcdrrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - *
> - * SUBTEST: fbcpsr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * SUBTEST: %s-%s-draw-%s
> + * Description: Test pixel formats (%arg[2]) that are not FORMAT_DEFAULT using %arg[3] method with %arg[1]
>   *
> - * SUBTEST: fbchdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - *
> - * SUBTEST: drrshdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - *
> - * SUBTEST: psrhdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - *
> - * SUBTEST: fbcdrrshdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1]:
> + * arg[2]:
>   *
>   * @rgb101010:      FORMAT_RGB101010
>   * @rgb565:         FORMAT_RGB565
>   * @argb161616f:    FORMAT_ARGB161616F
>   * @abgr161616f:    FORMAT_ABGR161616F
>   *
> - * arg[2]:
> + * arg[3]:
>   *
>   * @blt:            Blitter
>   * @mmap-wc:        MMAP-WC
> @@ -683,58 +441,32 @@
>   */
>  
>  /**
> - * SUBTEST: drrs-%s-draw-%s

Same name:
%s-%s-draw-%s

> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbc-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> - *
> - * SUBTEST: psr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> - *
> - * SUBTEST: hdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcdrrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcpsr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbchdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> - *
> - * SUBTEST: drrshdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> - *
> - * SUBTEST: psrhdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * SUBTEST: %s-%s-draw-%s
> + * Description: Test pixel formats (%arg[2]) that are not FORMAT_DEFAULT using %arg[3] method with %arg[1]
>   * Driver requirement: i915
>   *
> - * SUBTEST: fbcdrrshdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> - * Driver requirement: i915
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1]:
> + * arg[2]:
>   *
>   * @rgb101010:      FORMAT_RGB101010
>   * @rgb565:         FORMAT_RGB565
>   * @argb161616f:    FORMAT_ARGB161616F
>   * @abgr161616f:    FORMAT_ABGR161616F
>   *
> - * arg[2]:
> + * arg[3]:
>   *
>   * @mmap-cpu:       MMAP-CPU
>   * @mmap-gtt:       MMAP-GTT

Move these two and drop hunk.

Regards,
Kamil

> @@ -742,73 +474,49 @@
>   */
>  
>  /**
> - * SUBTEST: drrs-slowdraw
> - * Description: Sleep a little bit between drawing operations with DRRS
> - *
> - * SUBTEST: psr-slowdraw
> - * Description: Sleep a little bit between drawing operations with PSR
> - *
> - * SUBTEST: fbcdrrs-slowdraw
> - * Description: Sleep a little bit between drawing operations with FBC & DRRS
> + * SUBTEST: %s-slowdraw
> + * Description: Sleep a little bit between drawing operations with %arg[1]
>   *
> - * SUBTEST: fbcpsr-slowdraw
> - * Description: Sleep a little bit between drawing operations with FBC & PSR
> - *
> - * SUBTEST: drrshdr-slowdraw
> - * Description: Sleep a little bit between drawing operations with DRRS & HDR
> - *
> - * SUBTEST: psrhdr-slowdraw
> - * Description: Sleep a little bit between drawing operations with PSR & HDR
> + * arg[1]:
>   *
> - * SUBTEST: fbcdrrshdr-slowdraw
> - * Description: Sleep a little bit between drawing operations with DRRS, HDR & FBC
> + * @drrs:       DRRS
> + * @psr:        PSR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * SUBTEST: fbcpsrhdr-slowdraw
> - * Description: Sleep a little bit between drawing operations with PSR, HDR & FBC
>   */
>  
>  /**
> - * SUBTEST: drrs-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * SUBTEST: %s-%dp-primscrn-%s-%sflip-blt
> + * Description: Exercise %arg[4] page flips on primary screen with %arg[1],
> + * 		%arg[2] panel(s) and %arg[3] fb
>   *
> - * SUBTEST: fbc-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - *
> - * SUBTEST: psr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - *
> - * SUBTEST: hdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - *
> - * SUBTEST: fbcdrrs-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - *
> - * SUBTEST: fbcpsr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - *
> - * SUBTEST: fbchdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - *
> - * SUBTEST: drrshdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - *
> - * SUBTEST: psrhdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - *
> - * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1].values:   1, 2
> + * arg[2].values:   1, 2
>   *
> - * arg[2]:
> + * arg[3]:
>   *
>   * @indfb:          Individual fb
>   * @shrfb:          Shared fb
>   *
> - * arg[3]:
> + * arg[4]:
>   *
>   * @ms:             Modeset
>   * @pg:             Page flip
> @@ -816,45 +524,30 @@
>   */
>  
>  /**
> - * SUBTEST: drrs-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * SUBTEST: %s-2p-scndscrn-%s-%sflip-blt
> + * Description: Exercise %arg[3] page flips on secondary screen with %arg[1]
> + * 		and %arg[2] fb
>   *
> - * SUBTEST: fbc-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - *
> - * SUBTEST: psr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - *
> - * SUBTEST: hdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - *
> - * SUBTEST: fbcdrrs-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - *
> - * SUBTEST: fbcpsr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - *
> - * SUBTEST: fbchdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - *
> - * SUBTEST: drrshdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - *
> - * SUBTEST: psrhdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> - *
> - * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1]:
> + * arg[2]:
>   *
>   * @indfb:          Individual fb
>   * @shrfb:          Shared fb
>   *
> - * arg[2]:
> + * arg[3]:
>   *
>   * @ms:             Modeset
>   * @pg:             Page flip
> @@ -862,474 +555,285 @@
>   */
>  
>  /**
> - * SUBTEST: fbc-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcdrrs-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcpsr-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbchdr-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> + * SUBTEST: %s-%dp-%s-fliptrack-mmap-gtt
> + * Description: Check if the hardware tracking works after page flips with %arg[1],
> + * 		%arg[2] panel(s) and %arg[3] fb
>   * Driver requirement: i915
>   *
> - * SUBTEST: fbcdrrshdr-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> - * Driver requirement: i915
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> - * Driver requirement: i915
> + * @fbc:        FBC
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1].values:   1, 2
> + * arg[2].values:   1, 2
>   *
> - * arg[2]:
> + * arg[3]:
>   *
>   * @indfb:          Individual fb
>   * @shrfb:          Shared fb
>   */
>  
>  /**
> - * SUBTEST: drrs-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * SUBTEST: %s-%dp-primscrn-%s-indfb-move
> + * Description: Move %arg[3] around on primary screen with %arg[1],
> + * 		%arg[2] panel(s) and individual fb
>   *
> - * SUBTEST: fbc-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> - *
> - * SUBTEST: psr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> - *
> - * SUBTEST: hdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> - *
> - * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> - *
> - * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> - *
> - * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> - *
> - * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> - *
> - * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> - *
> - * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1].values:   1, 2
> + * arg[2].values:   1, 2
>   *
> - * arg[2]:
> + * arg[3]:
>   *
>   * @spr:            Sprite plane
>   * @cur:            Cursor plane
>   */
>  
>  /**
> - * SUBTEST: drrs-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> - *
> - * SUBTEST: fbc-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * SUBTEST: %s-2p-scndscrn-%s-indfb-move
> + * Description: Move %arg[2] around on secondary screen with %arg[1] and individual fb
>   *
> - * SUBTEST: psr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> - *
> - * SUBTEST: hdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> - *
> - * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> - *
> - * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> - *
> - * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> - *
> - * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> - *
> - * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> - *
> - * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1]:
> + * arg[2]:
>   *
>   * @spr:            Sprite plane
>   * @cur:            Cursor plane
>   */
>  
>  /**
> - * SUBTEST: drrs-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> - *
> - * SUBTEST: fbc-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * SUBTEST: %s-%dp-primscrn-%s-indfb-onoff
> + * Description: Enable and disable %arg[3] a few times on primary screen with %arg[1],
> + * 		%arg[2] panel(s) and individual fb
>   *
> - * SUBTEST: psr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> - *
> - * SUBTEST: hdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> - *
> - * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> - *
> - * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> - *
> - * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> - *
> - * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> - *
> - * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> - *
> - * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1].values:   1, 2
> + * arg[2].values:   1, 2
>   *
> - * arg[2]:
> + * arg[3]:
>   *
>   * @spr:            Sprite plane
>   * @cur:            Cursor plane
>   */
>  
>  /**
> - * SUBTEST: drrs-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> - *
> - * SUBTEST: fbc-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> - *
> - * SUBTEST: psr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * SUBTEST: %s-2p-scndscrn-%s-indfb-onoff
> + * Description: Enable and disable %arg[2] a few times on secondary screen with %arg[1] and individual fb
>   *
> - * SUBTEST: hdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> - *
> - * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> - *
> - * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> - *
> - * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> - *
> - * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> - *
> - * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> - *
> - * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1]:
> + * arg[2]:
>   *
>   * @spr:            Sprite plane
>   * @cur:            Cursor plane
>   */
>  
>  /**
> - * SUBTEST: drrs-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: fbc-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: psr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: hdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * SUBTEST: %s-%dp-primscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen sprite plane covering the primary screen with %arg[1],
> + * 		%arg[2] panel(s) and individual fb
>   *
> - * SUBTEST: fbcdrrs-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: fbcpsr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: fbchdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: drrshdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: psrhdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: fbcdrrshdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: fbcpsrhdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: fbc-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: psr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: hdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: fbcpsr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: fbchdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: drrshdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> - *
> - * SUBTEST: psrhdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * arg[1]:
>   *
> - * SUBTEST: fbcdrrshdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
> + *
> + * arg[2].values:   1, 2
> + * SUBTEST: %s-2p-scndscrn-spr-indfb-fullscreen
> + * Description: Put a fullscreen sprite plane covering the secondary screen with %arg[1] and individual fb
>   *
> - * SUBTEST: fbcpsrhdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * arg[1]:
>   *
> - * arg[1].values:   1, 2
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
> + *
> + * arg[2].values:   1, 2
>   */
>  
>  /**
> - * SUBTEST: drrs-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> - *
> - * SUBTEST: fbc-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> - *
> - * SUBTEST: psr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> - *
> - * SUBTEST: hdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> - *
> - * SUBTEST: fbcdrrs-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> - *
> - * SUBTEST: fbcpsr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> - *
> - * SUBTEST: fbchdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> - *
> - * SUBTEST: drrshdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * SUBTEST: %s-%s-scaledprimary
> + * Description: Try different primary plane scaling strategies with %arg[1] and %arg[2] fb
>   *
> - * SUBTEST: psrhdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> - *
> - * SUBTEST: fbcdrrshdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1]:
> + * arg[2]:
>   *
>   * @indfb:          Individual fb
>   * @shrfb:          Shared fb
>   */
>  
>  /**
> - * SUBTEST: drrs-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with DRRS
> - *
> - * SUBTEST: fbc-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with FBC
> - *
> - * SUBTEST: psr-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with PSR
> + * SUBTEST: %s-modesetfrombusy
> + * Description: Modeset from a busy buffer to a non-busy buffer with %arg[1]
>   *
> - * SUBTEST: hdr-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with HDR
> - *
> - * SUBTEST: fbcdrrs-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with FBC & DRRS
> - *
> - * SUBTEST: fbcpsr-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with FBC & PSR
> - *
> - * SUBTEST: fbchdr-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with FBC & HDR
> - *
> - * SUBTEST: drrshdr-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with DRRS & HDR
> - *
> - * SUBTEST: psrhdr-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with HDR & PSR
> + * arg[1]:
>   *
> - * SUBTEST: fbcdrrshdr-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with DRRS, HDR & FBC
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * SUBTEST: fbcpsrhdr-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with HDR, PSR & FBC
>   */
>  
>  /**
> - * SUBTEST: drrs-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of DRRS
> + * SUBTEST: %s-suspend
> + * Description: Make sure suspend/resume keeps us on the same state of %arg[1]
>   *
> - * SUBTEST: fbc-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of FBC
> - *
> - * SUBTEST: psr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of PSR
> - *
> - * SUBTEST: hdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of HDR
> - *
> - * SUBTEST: fbcdrrs-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of FBC & DRRS
> - *
> - * SUBTEST: fbcpsr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of FBC & PSR
> - *
> - * SUBTEST: fbchdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of FBC & HDR
> - *
> - * SUBTEST: drrshdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of HDR & DRRS
> - *
> - * SUBTEST: psrhdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of HDR & PSR
> + * arg[1]:
>   *
> - * SUBTEST: fbcdrrshdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of HDR, DRRS & FBC
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * SUBTEST: fbcpsrhdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of HDR, PSR & FBC
>   */
>  
>  /**
> - * SUBTEST: drrs-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbc-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> - *
> - * SUBTEST: psr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * SUBTEST: %s-farfromfence-mmap-gtt
> + * Description: Test drawing as far from the fence start as possible with %arg[1]
>   * Driver requirement: i915
>   *
> - * SUBTEST: hdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcdrrs-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcpsr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbchdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> - *
> - * SUBTEST: drrshdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> + * arg[1]:
>   *
> - * SUBTEST: psrhdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> + * @drrs:       DRRS
> + * @fbc:        FBC
> + * @psr:        PSR
> + * @hdr:        HDR
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @drrshdr:    DRRS & HDR
> + * @psrhdr:     PSR & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * SUBTEST: fbcdrrshdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
> - *
> - * SUBTEST: fbcpsrhdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> - * Driver requirement: i915
>   */
>  
>  /**
> - * SUBTEST: fbc-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> - *
> - * SUBTEST: fbcdrrs-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> + * SUBTEST: %s-stridechange
> + * Description: Change the frontbuffer stride by doing a modeset with %arg[1]
>   *
> - * SUBTEST: fbcpsr-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> - *
> - * SUBTEST: fbchdr-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> + * arg[1]:
>   *
> - * SUBTEST: fbcdrrshdr-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> + * @fbc:        FBC
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * SUBTEST: fbcpsrhdr-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
>   */
>  
>  /**
> - * SUBTEST: fbc-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> - *              basic drawing test, else set the mode & test if FBC is disabled
> - *
> - * SUBTEST: fbcdrrs-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> - *              basic drawing test, else set the mode & test if FBC is disabled
> + * SUBTEST: %s-tiling-%s
> + * Description: Test %arg[2] formats with %arg[1], if the tiling format supports
> + * 		FBC do the basic drawing test, else set the mode & test if FBC is disabled
>   *
> - * SUBTEST: fbcpsr-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> - *              basic drawing test, else set the mode & test if FBC is disabled
> - *
> - * SUBTEST: fbchdr-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> - *              basic drawing test, else set the mode & test if FBC is disabled
> - *
> - * SUBTEST: fbcdrrshdr-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> - *              basic drawing test, else set the mode & test if FBC is disabled
> + * arg[1]:
>   *
> - * SUBTEST: fbcpsrhdr-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> - *              basic drawing test, else set the mode & test if FBC is disabled
> + * @fbc:        FBC
> + * @fbcdrrs:    FBC & DRRS
> + * @fbcpsr:     FBC & PSR
> + * @fbchdr:     FBC & HDR
> + * @fbcdrrshdr: FBC, DRRS & HDR
> + * @fbcpsrhdr:  FBC, PSR & HDR
>   *
> - * arg[1]:
> + * arg[2]:
>   *
>   * @4:              4 tiling
>   * @linear:         Linear tiling
> -- 
> 2.25.1
> 
