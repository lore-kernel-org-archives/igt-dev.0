Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1BFCD343F
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 15:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6EAC10E113;
	Fri, 15 May 2026 15:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixKWi3vK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF88610E113
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778858624; x=1810394624;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=f1vWG11KpROwPlm9CarUP0ALT7nW0e+77YEk6AmEmvI=;
 b=ixKWi3vKPgoZFSDMpqTPhNDTEzzsd04/AwC5ltsyYo1ssUC6lP+oEGOQ
 jyEhoGoSZcypOCXfSEP5kFfFC3f9msgplieaigOwpWko6aeE1R/Ygn/wD
 Pn6TbgWzDk2OTraTPno/nZN4iwXqF1kPtEL8yQEXsp76H0ZEEGAaUdvFJ
 b/CpdRq9umklon84V+1nFolhCDNxYESl5UOUMmTOPjqAG5x/SKviTDyFv
 bBwUTTk/i3JuNGyS7tvMLjFN3dyX126kzh2WfUn7SYQiOzjDywUfmQAD1
 jM4SrO3T8mwtHyf0nB3YBGVgQ6RDy3KWnWKXnMRbKmHHpZ5oSmUcW7XF3 Q==;
X-CSE-ConnectionGUID: vsSc83OKS7ivlBBCE7nqVA==
X-CSE-MsgGUID: 9vYaoxinSdmT2xYJGYhJhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="78952398"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="78952398"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 08:23:44 -0700
X-CSE-ConnectionGUID: XvNO/GuRQNOWR/7FPriB4A==
X-CSE-MsgGUID: Yo7i65DASAusvS0et7Cxtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="238600530"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 08:23:42 -0700
Date: Fri, 15 May 2026 17:23:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, pawel.sikora@intel.com,
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Fix
 duplicate documentation descriptions
Message-ID: <20260515152340.pvpexlzgde27e2fw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org, pawel.sikora@intel.com,
 Jan Sokolowski <jan.sokolowski@intel.com>
References: <20260515080728.2433990-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515080728.2433990-1-swati2.sharma@intel.com>
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
On 2026-05-15 at 13:37:28 +0530, Swati Sharma wrote:
> Multiple SUBTEST entries shared identical descriptions across different
> test scenarios (offscreen, primary screen, secondary screen). This
> caused ambiguous documentation output.
> 
> Fix by:
> - Adding features in description.
> - Appending scenario context (targeting offscreen buffer, on primary/
>   secondary screen, with individual/shared fb) to differentiate test
>   variants operating on different screens or framebuffers.
> - Adding missing Driver requirement: i915 to HDR combo subtests in
>   i915-only draw method blocks.
> 

Can you add here few Cc?

> Co-developed-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel/kms_frontbuffer_tracking.c | 583 +++++++++++++------------
>  1 file changed, 294 insertions(+), 289 deletions(-)
> 
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index e7bb3fa18..034222aa2 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -27,7 +27,7 @@
>  /**
>   * TEST: kms frontbuffer tracking
>   * Category: Display
> - * Description: Test the Kernel's frontbuffer tracking mechanism and its related features: FBC, PSR and DRRS
> + * Description: Test the Kernel's frontbuffer tracking mechanism and its related features: FBC, PSR, DRRS and HDR
>   * Driver requirement: i915, xe
>   * Mega feature: General Display Features
>   */
> @@ -69,7 +69,7 @@
>   * Description: Sanity test to enable PSR with %arg[1] panels.
>   *
>   * SUBTEST: hdr-%dp-rte
> - * Description: Sanity test to enable PSR with %arg[1] panels.
> + * Description: Sanity test to enable HDR with %arg[1] panels.
>   *
>   * SUBTEST: fbcdrrs-%dp-rte
>   * Description: Sanity test to enable FBC & DRRS with %arg[1] panels.
> @@ -97,37 +97,37 @@
>  
>  /**
>   * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS, targeting offscreen buffer

Can we make it shorter?  For example:

 * SUBTEST: %s-1p-offscreen-pri-%s-draw-%s
 * Description: Draw a set of rectangles on the screen using the provided method with %s, targeting offscreen buffer
 *
 * arg[1]:
 *
 * @drss:	DRSS
 * @fbc:	FBC
 * @fbcdrss:	FBC & DRSS
 * @fbchdr:	FBC & HDR
 * @psr:	PSR
 *

arg[2]: and arg[3] will take old values from arg[1] and arg[2]

The same pattern could be used in other subtests names and descriptions.

Regards,
Kamil

> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS, targeting offscreen buffer

>   *
>   * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, targeting offscreen buffer
>   *
>   * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR, targeting offscreen buffer
>   *
>   * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with HDR, targeting offscreen buffer
>   *
>   * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & DRRS, targeting offscreen buffer
>   *
>   * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & PSR, targeting offscreen buffer
>   *
>   * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & HDR, targeting offscreen buffer
>   *
>   * SUBTEST: drrshdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS & HDR, targeting offscreen buffer
>   *
>   * SUBTEST: psrhdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR & HDR, targeting offscreen buffer
>   *
>   * SUBTEST: fbcpsrhdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, PSR & HDR, targeting offscreen buffer
>   *
>   * SUBTEST: fbcdrrshdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, DRRS & HDR, targeting offscreen buffer
>   *
>   * arg[1]:
>   *
> @@ -143,43 +143,48 @@
>  
>  /**
>   * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS, targeting offscreen buffer
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, targeting offscreen buffer
>   * Driver requirement: i915
>   *
>   * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR, targeting offscreen buffer
>   * Driver requirement: i915
>   *
>   * SUBTEST: hdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with HDR, targeting offscreen buffer
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & DRRS, targeting offscreen buffer
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & PSR, targeting offscreen buffer
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbchdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & HDR, targeting offscreen buffer
> + * Driver requirement: i915
>   *
>   * SUBTEST: drrshdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS & HDR, targeting offscreen buffer
> + * Driver requirement: i915
>   *
>   * SUBTEST: psrhdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR & HDR, targeting offscreen buffer
> + * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrshdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, DRRS & HDR, targeting offscreen buffer
> + * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsrhdr-1p-offscreen-pri-%s-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, PSR & HDR, targeting offscreen buffer
> + * Driver requirement: i915
>   *
>   * arg[1]:
>   *
> @@ -195,47 +200,47 @@
>  
>  /**
>   * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: hdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with HDR, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & DRRS, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & PSR, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & HDR, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS & HDR, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR & HDR, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, DRRS & HDR, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, PSR & HDR, on primary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * arg[1].values:   1, 2
> @@ -255,37 +260,37 @@
>  
>  /**
>   * SUBTEST: drrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS, on primary screen, with individual fb
>   *
>   * SUBTEST: fbc-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, on primary screen, with individual fb
>   *
>   * SUBTEST: psr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR, on primary screen, with individual fb
>   *
>   * SUBTEST: hdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with HDR, on primary screen, with individual fb
>   *
>   * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & DRRS, on primary screen, with individual fb
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & PSR, on primary screen, with individual fb
>   *
>   * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & HDR, on primary screen, with individual fb
>   *
>   * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS & HDR, on primary screen, with individual fb
>   *
>   * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR & HDR, on primary screen, with individual fb
>   *
>   * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, DRRS & HDR, on primary screen, with individual fb
>   *
>   * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, PSR & HDR, on primary screen, with individual fb
>   *
>   * arg[1].values:   1, 2
>   *
> @@ -304,37 +309,37 @@
>  
>  /**
>   * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS, on primary screen, with shared fb
>   *
>   * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, on primary screen, with shared fb
>   *
>   * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR, on primary screen, with shared fb
>   *
>   * SUBTEST: hdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with HDR, on primary screen, with shared fb
>   *
>   * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & DRRS, on primary screen, with shared fb
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & PSR, on primary screen, with shared fb
>   *
>   * SUBTEST: fbchdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & HDR, on primary screen, with shared fb
>   *
>   * SUBTEST: drrshdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS & HDR, on primary screen, with shared fb
>   *
>   * SUBTEST: psrhdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR & HDR, on primary screen, with shared fb
>   *
>   * SUBTEST: fbcdrrshdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, DRRS & HDR, on primary screen, with shared fb
>   *
>   * SUBTEST: fbcpsrhdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, PSR & HDR, on primary screen, with shared fb
>   *
>   * arg[1].values:   1, 2
>   *
> @@ -347,47 +352,47 @@
>  
>  /**
>   * SUBTEST: drrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbc-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: psr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: hdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with HDR, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrs-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & DRRS, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & PSR, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbchdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & HDR, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: drrshdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS & HDR, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: psrhdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR & HDR, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrshdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, DRRS & HDR, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsrhdr-%dp-primscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, PSR & HDR, on primary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * arg[1].values:   1, 2
> @@ -401,37 +406,37 @@
>  
>  /**
>   * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS, on secondary screen, with individual fb
>   *
>   * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, on secondary screen, with individual fb
>   *
>   * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR, on secondary screen, with individual fb
>   *
>   * SUBTEST: hdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with HDR, on secondary screen, with individual fb
>   *
>   * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & DRRS, on secondary screen, with individual fb
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & PSR, on secondary screen, with individual fb
>   *
>   * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & HDR, on secondary screen, with individual fb
>   *
>   * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS & HDR, on secondary screen, with individual fb
>   *
>   * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR & HDR, on secondary screen, with individual fb
>   *
>   * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, DRRS & HDR, on secondary screen, with individual fb
>   *
>   * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, PSR & HDR, on secondary screen, with individual fb
>   *
>   * arg[1]:
>   *
> @@ -448,47 +453,47 @@
>  
>  /**
>   * SUBTEST: drrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbc-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: psr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: hdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with HDR, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & DRRS, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & PSR, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & HDR, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS & HDR, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR & HDR, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, DRRS & HDR, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, PSR & HDR, on secondary screen, with individual fb
>   * Driver requirement: i915
>   *
>   * arg[1]:
> @@ -506,37 +511,37 @@
>  
>  /**
>   * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS, on secondary screen, with shared fb
>   *
>   * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, on secondary screen, with shared fb
>   *
>   * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR, on secondary screen, with shared fb
>   *
>   * SUBTEST: hdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with HDR, on secondary screen, with shared fb
>   *
>   * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & DRRS, on secondary screen, with shared fb
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & PSR, on secondary screen, with shared fb
>   *
>   * SUBTEST: fbchdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & HDR, on secondary screen, with shared fb
>   *
>   * SUBTEST: drrshdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS & HDR, on secondary screen, with shared fb
>   *
>   * SUBTEST: psrhdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR & HDR, on secondary screen, with shared fb
>   *
>   * SUBTEST: fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, DRRS & HDR, on secondary screen, with shared fb
>   *
>   * SUBTEST: fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, PSR & HDR, on secondary screen, with shared fb
>   *
>   * arg[1]:
>   *
> @@ -547,47 +552,47 @@
>  
>  /**
>   * SUBTEST: drrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbc-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: psr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: hdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with HDR, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrs-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & DRRS, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & PSR, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbchdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC & HDR, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: drrshdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with DRRS & HDR, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: psrhdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with PSR & HDR, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrshdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, DRRS & HDR, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-%s
> - * Description: Draw a set of rectangles on the screen using the provided method
> + * Description: Draw a set of rectangles on the screen using the provided method with FBC, PSR & HDR, on secondary screen, with shared fb
>   * Driver requirement: i915
>   *
>   * arg[1]:
> @@ -599,74 +604,74 @@
>  
>  /**
>   * SUBTEST: drrs-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods with DRRS
>   *
>   * SUBTEST: fbc-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods with FBC
>   *
>   * SUBTEST: psr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods with PSR
>   *
>   * SUBTEST: hdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods with HDR
>   *
>   * SUBTEST: fbcdrrs-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods with FBC & DRRS
>   *
>   * SUBTEST: fbcpsr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods with FBC & PSR
>   *
>   * SUBTEST: fbchdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods with FBC & HDR
>   *
>   * SUBTEST: drrshdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods with DRRS & HDR
>   *
>   * SUBTEST: psrhdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods with PSR & HDR
>   *
>   * SUBTEST: fbcdrrshdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods with FBC, DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-%dp-pri-indfb-multidraw
> - * Description: Draw a set of rectangles on the screen using alternated drawing methods
> + * Description: Draw a set of rectangles on the screen using alternated drawing methods with FBC, PSR & HDR
>   *
>   * arg[1].values:   1, 2
>   */
>  
>  /**
>   * SUBTEST: drrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with DRRS
>   *
>   * SUBTEST: fbc-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with FBC
>   *
>   * SUBTEST: psr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with PSR
>   *
>   * SUBTEST: hdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with HDR
>   *
>   * SUBTEST: fbcdrrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with FBC & DRRS
>   *
>   * SUBTEST: fbcpsr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with FBC & PSR
>   *
>   * SUBTEST: fbchdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with FBC & HDR
>   *
>   * SUBTEST: drrshdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with DRRS & HDR
>   *
>   * SUBTEST: psrhdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with PSR & HDR
>   *
>   * SUBTEST: fbcdrrshdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with FBC, DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with FBC, PSR & HDR
>   *
>   * arg[1]:
>   *
> @@ -684,47 +689,47 @@
>  
>  /**
>   * SUBTEST: drrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with DRRS
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbc-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with FBC
>   * Driver requirement: i915
>   *
>   * SUBTEST: psr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with PSR
>   * Driver requirement: i915
>   *
>   * SUBTEST: hdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrs-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with FBC & DRRS
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with FBC & PSR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbchdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with FBC & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: drrshdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with DRRS & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: psrhdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with PSR & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrshdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with FBC, DRRS & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsrhdr-%s-draw-%s
> - * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT
> + * Description: Test pixel formats (%arg[1]) that are not FORMAT_DEFAULT with FBC, PSR & HDR
>   * Driver requirement: i915
>   *
>   * arg[1]:
> @@ -761,45 +766,45 @@
>   * Description: Sleep a little bit between drawing operations with PSR & HDR
>   *
>   * SUBTEST: fbcdrrshdr-slowdraw
> - * Description: Sleep a little bit between drawing operations with DRRS, HDR & FBC
> + * Description: Sleep a little bit between drawing operations with FBC, DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-slowdraw
> - * Description: Sleep a little bit between drawing operations with PSR, HDR & FBC
> + * Description: Sleep a little bit between drawing operations with FBC, PSR & HDR
>   */
>  
>  /**
>   * SUBTEST: drrs-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with DRRS, on primary screen
>   *
>   * SUBTEST: fbc-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with FBC, on primary screen
>   *
>   * SUBTEST: psr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with PSR, on primary screen
>   *
>   * SUBTEST: hdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with HDR, on primary screen
>   *
>   * SUBTEST: fbcdrrs-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with FBC & DRRS, on primary screen
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with FBC & PSR, on primary screen
>   *
>   * SUBTEST: fbchdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with FBC & HDR, on primary screen
>   *
>   * SUBTEST: drrshdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with DRRS & HDR, on primary screen
>   *
>   * SUBTEST: psrhdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with PSR & HDR, on primary screen
>   *
>   * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with FBC, DRRS & HDR, on primary screen
>   *
>   * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with FBC, PSR & HDR, on primary screen
>   *
>   * arg[1].values:   1, 2
>   *
> @@ -817,37 +822,37 @@
>  
>  /**
>   * SUBTEST: drrs-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with DRRS, on secondary screen
>   *
>   * SUBTEST: fbc-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with FBC, on secondary screen
>   *
>   * SUBTEST: psr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with PSR, on secondary screen
>   *
>   * SUBTEST: hdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with HDR, on secondary screen
>   *
>   * SUBTEST: fbcdrrs-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with FBC & DRRS, on secondary screen
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with FBC & PSR, on secondary screen
>   *
>   * SUBTEST: fbchdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with FBC & HDR, on secondary screen
>   *
>   * SUBTEST: drrshdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with DRRS & HDR, on secondary screen
>   *
>   * SUBTEST: psrhdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with PSR & HDR, on secondary screen
>   *
>   * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with FBC, DRRS & HDR, on secondary screen
>   *
>   * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-%sflip-blt
> - * Description: Just exercise page flips with the patterns we have
> + * Description: Just exercise page flips with the patterns we have with FBC, PSR & HDR, on secondary screen
>   *
>   * arg[1]:
>   *
> @@ -863,27 +868,27 @@
>  
>  /**
>   * SUBTEST: fbc-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> + * Description: Check if the hardware tracking works after page flips with FBC
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrs-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> + * Description: Check if the hardware tracking works after page flips with FBC & DRRS
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsr-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> + * Description: Check if the hardware tracking works after page flips with FBC & PSR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbchdr-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> + * Description: Check if the hardware tracking works after page flips with FBC & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrshdr-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> + * Description: Check if the hardware tracking works after page flips with FBC, DRRS & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsrhdr-%dp-%s-fliptrack-mmap-gtt
> - * Description: Check if the hardware tracking works after page flips
> + * Description: Check if the hardware tracking works after page flips with FBC, PSR & HDR
>   * Driver requirement: i915
>   *
>   * arg[1].values:   1, 2
> @@ -896,37 +901,37 @@
>  
>  /**
>   * SUBTEST: drrs-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with DRRS
>   *
>   * SUBTEST: fbc-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with FBC
>   *
>   * SUBTEST: psr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with PSR
>   *
>   * SUBTEST: hdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with HDR
>   *
>   * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with FBC & DRRS
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with FBC & PSR
>   *
>   * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with FBC & HDR
>   *
>   * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with DRRS & HDR
>   *
>   * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with PSR & HDR
>   *
>   * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with FBC, DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-move
> - * Description: Just move the %arg[2] around
> + * Description: Just move the %arg[2] around with FBC, PSR & HDR
>   *
>   * arg[1].values:   1, 2
>   *
> @@ -938,37 +943,37 @@
>  
>  /**
>   * SUBTEST: drrs-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with DRRS
>   *
>   * SUBTEST: fbc-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with FBC
>   *
>   * SUBTEST: psr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with PSR
>   *
>   * SUBTEST: hdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with HDR
>   *
>   * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with FBC & DRRS
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with FBC & PSR
>   *
>   * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with FBC & HDR
>   *
>   * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with DRRS & HDR
>   *
>   * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with PSR & HDR
>   *
>   * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with FBC, DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-move
> - * Description: Just move the %arg[1] around
> + * Description: Just move the %arg[1] around with FBC, PSR & HDR
>   *
>   * arg[1]:
>   *
> @@ -978,37 +983,37 @@
>  
>  /**
>   * SUBTEST: drrs-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with DRRS
>   *
>   * SUBTEST: fbc-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with FBC
>   *
>   * SUBTEST: psr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with PSR
>   *
>   * SUBTEST: hdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with HDR
>   *
>   * SUBTEST: fbcdrrs-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with FBC & DRRS
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with FBC & PSR
>   *
>   * SUBTEST: fbchdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with FBC & HDR
>   *
>   * SUBTEST: drrshdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with DRRS & HDR
>   *
>   * SUBTEST: psrhdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with PSR & HDR
>   *
>   * SUBTEST: fbcdrrshdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with FBC, DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-%dp-primscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[2] a few times
> + * Description: Just enable and disable the %arg[2] a few times with FBC, PSR & HDR
>   *
>   * arg[1].values:   1, 2
>   *
> @@ -1020,37 +1025,37 @@
>  
>  /**
>   * SUBTEST: drrs-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with DRRS
>   *
>   * SUBTEST: fbc-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with FBC
>   *
>   * SUBTEST: psr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with PSR
>   *
>   * SUBTEST: hdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with HDR
>   *
>   * SUBTEST: fbcdrrs-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with FBC & DRRS
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with FBC & PSR
>   *
>   * SUBTEST: fbchdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with FBC & HDR
>   *
>   * SUBTEST: drrshdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with DRRS & HDR
>   *
>   * SUBTEST: psrhdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with PSR & HDR
>   *
>   * SUBTEST: fbcdrrshdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with FBC, DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-2p-scndscrn-%s-indfb-onoff
> - * Description: Just enable and disable the %arg[1] a few times
> + * Description: Just enable and disable the %arg[1] a few times with FBC, PSR & HDR
>   *
>   * arg[1]:
>   *
> @@ -1060,107 +1065,107 @@
>  
>  /**
>   * SUBTEST: drrs-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with DRRS, on primary screen
>   *
>   * SUBTEST: fbc-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FBC, on primary screen
>   *
>   * SUBTEST: psr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with PSR, on primary screen
>   *
>   * SUBTEST: hdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with HDR, on primary screen
>   *
>   * SUBTEST: fbcdrrs-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FBC & DRRS, on primary screen
>   *
>   * SUBTEST: fbcpsr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FBC & PSR, on primary screen
>   *
>   * SUBTEST: fbchdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FBC & HDR, on primary screen
>   *
>   * SUBTEST: drrshdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with DRRS & HDR, on primary screen
>   *
>   * SUBTEST: psrhdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with PSR & HDR, on primary screen
>   *
>   * SUBTEST: fbcdrrshdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FBC, DRRS & HDR, on primary screen
>   *
>   * SUBTEST: fbcpsrhdr-%dp-primscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FBC, PSR & HDR, on primary screen
>   *
>   * SUBTEST: drrs-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with DRRS, on secondary screen
>   *
>   * SUBTEST: fbc-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FBC, on secondary screen
>   *
>   * SUBTEST: psr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with PSR, on secondary screen
>   *
>   * SUBTEST: hdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with HDR, on secondary screen
>   *
>   * SUBTEST: fbcdrrs-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FBC & DRRS, on secondary screen
>   *
>   * SUBTEST: fbcpsr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FBC & PSR, on secondary screen
>   *
>   * SUBTEST: fbchdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FBC & HDR, on secondary screen
>   *
>   * SUBTEST: drrshdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with DRRS & HDR, on secondary screen
>   *
>   * SUBTEST: psrhdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with PSR & HDR, on secondary screen
>   *
>   * SUBTEST: fbcdrrshdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FBC, DRRS & HDR, on secondary screen
>   *
>   * SUBTEST: fbcpsrhdr-2p-scndscrn-spr-indfb-fullscreen
> - * Description: Put a fullscreen plane covering the whole screen
> + * Description: Put a fullscreen plane covering the whole screen with FBC, PSR & HDR, on secondary screen
>   *
>   * arg[1].values:   1, 2
>   */
>  
>  /**
>   * SUBTEST: drrs-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with DRRS
>   *
>   * SUBTEST: fbc-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with FBC
>   *
>   * SUBTEST: psr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with PSR
>   *
>   * SUBTEST: hdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with HDR
>   *
>   * SUBTEST: fbcdrrs-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with FBC & DRRS
>   *
>   * SUBTEST: fbcpsr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with FBC & PSR
>   *
>   * SUBTEST: fbchdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with FBC & HDR
>   *
>   * SUBTEST: drrshdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with DRRS & HDR
>   *
>   * SUBTEST: psrhdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with PSR & HDR
>   *
>   * SUBTEST: fbcdrrshdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with FBC, DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-%s-scaledprimary
> - * Description: Try different primary plane scaling strategies
> + * Description: Try different primary plane scaling strategies with FBC, PSR & HDR
>   *
>   * arg[1]:
>   *
> @@ -1194,139 +1199,139 @@
>   * Description: Modeset from a busy buffer to a non-busy buffer with DRRS & HDR
>   *
>   * SUBTEST: psrhdr-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with HDR & PSR
> + * Description: Modeset from a busy buffer to a non-busy buffer with PSR & HDR
>   *
>   * SUBTEST: fbcdrrshdr-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with DRRS, HDR & FBC
> + * Description: Modeset from a busy buffer to a non-busy buffer with FBC, DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-modesetfrombusy
> - * Description: Modeset from a busy buffer to a non-busy buffer with HDR, PSR & FBC
> + * Description: Modeset from a busy buffer to a non-busy buffer with FBC, PSR & HDR
>   */
>  
>  /**
>   * SUBTEST: drrs-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of DRRS
> + * Description: Make sure suspend/resume keeps us on the same state of DRRS with DRRS
>   *
>   * SUBTEST: fbc-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of FBC
> + * Description: Make sure suspend/resume keeps us on the same state of FBC with FBC
>   *
>   * SUBTEST: psr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of PSR
> + * Description: Make sure suspend/resume keeps us on the same state of PSR with PSR
>   *
>   * SUBTEST: hdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of HDR
> + * Description: Make sure suspend/resume keeps us on the same state of HDR with HDR
>   *
>   * SUBTEST: fbcdrrs-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of FBC & DRRS
> + * Description: Make sure suspend/resume keeps us on the same state of FBC & DRRS with FBC & DRRS
>   *
>   * SUBTEST: fbcpsr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of FBC & PSR
> + * Description: Make sure suspend/resume keeps us on the same state of FBC & PSR with FBC & PSR
>   *
>   * SUBTEST: fbchdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of FBC & HDR
> + * Description: Make sure suspend/resume keeps us on the same state of FBC & HDR with FBC & HDR
>   *
>   * SUBTEST: drrshdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of HDR & DRRS
> + * Description: Make sure suspend/resume keeps us on the same state of HDR & DRRS with DRRS & HDR
>   *
>   * SUBTEST: psrhdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of HDR & PSR
> + * Description: Make sure suspend/resume keeps us on the same state of HDR & PSR with PSR & HDR
>   *
>   * SUBTEST: fbcdrrshdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of HDR, DRRS & FBC
> + * Description: Make sure suspend/resume keeps us on the same state of HDR, DRRS & FBC with FBC, DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-suspend
> - * Description: Make sure suspend/resume keeps us on the same state of HDR, PSR & FBC
> + * Description: Make sure suspend/resume keeps us on the same state of HDR, PSR & FBC with FBC, PSR & HDR
>   */
>  
>  /**
>   * SUBTEST: drrs-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible with DRRS
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbc-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible with FBC
>   * Driver requirement: i915
>   *
>   * SUBTEST: psr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible with PSR
>   * Driver requirement: i915
>   *
>   * SUBTEST: hdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible with HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrs-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible with FBC & DRRS
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible with FBC & PSR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbchdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible with FBC & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: drrshdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible with DRRS & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: psrhdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible with PSR & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcdrrshdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible with FBC, DRRS & HDR
>   * Driver requirement: i915
>   *
>   * SUBTEST: fbcpsrhdr-farfromfence-mmap-gtt
> - * Description: Test drawing as far from the fence start as possible
> + * Description: Test drawing as far from the fence start as possible with FBC, PSR & HDR
>   * Driver requirement: i915
>   */
>  
>  /**
>   * SUBTEST: fbc-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> + * Description: Change the frontbuffer stride by doing a modeset with FBC
>   *
>   * SUBTEST: fbcdrrs-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> + * Description: Change the frontbuffer stride by doing a modeset with FBC & DRRS
>   *
>   * SUBTEST: fbcpsr-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> + * Description: Change the frontbuffer stride by doing a modeset with FBC & PSR
>   *
>   * SUBTEST: fbchdr-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> + * Description: Change the frontbuffer stride by doing a modeset with FBC & HDR
>   *
>   * SUBTEST: fbcdrrshdr-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> + * Description: Change the frontbuffer stride by doing a modeset with FBC, DRRS & HDR
>   *
>   * SUBTEST: fbcpsrhdr-stridechange
> - * Description: Change the frontbuffer stride by doing a modeset
> + * Description: Change the frontbuffer stride by doing a modeset with FBC, PSR & HDR
>   */
>  
>  /**
>   * SUBTEST: fbc-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> + * Description: Test %arg[1] formats, if the tiling format supports FBC do the with FBC
>   *              basic drawing test, else set the mode & test if FBC is disabled
>   *
>   * SUBTEST: fbcdrrs-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> + * Description: Test %arg[1] formats, if the tiling format supports FBC do the with FBC & DRRS
>   *              basic drawing test, else set the mode & test if FBC is disabled
>   *
>   * SUBTEST: fbcpsr-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> + * Description: Test %arg[1] formats, if the tiling format supports FBC do the with FBC & PSR
>   *              basic drawing test, else set the mode & test if FBC is disabled
>   *
>   * SUBTEST: fbchdr-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> + * Description: Test %arg[1] formats, if the tiling format supports FBC do the with FBC & HDR
>   *              basic drawing test, else set the mode & test if FBC is disabled
>   *
>   * SUBTEST: fbcdrrshdr-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> + * Description: Test %arg[1] formats, if the tiling format supports FBC do the with FBC, DRRS & HDR
>   *              basic drawing test, else set the mode & test if FBC is disabled
>   *
>   * SUBTEST: fbcpsrhdr-tiling-%s
> - * Description: Test %arg[1] formats, if the tiling format supports FBC do the
> + * Description: Test %arg[1] formats, if the tiling format supports FBC do the with FBC, PSR & HDR
>   *              basic drawing test, else set the mode & test if FBC is disabled
>   *
>   * arg[1]:
> -- 
> 2.25.1
> 
