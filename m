Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D03C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 10:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D2010E4A8;
	Thu, 21 Mar 2024 10:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vvn0pKvY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 470B310E4A8
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 10:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711015915; x=1742551915;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eJZ5iXejFpyxSO4VFLrBDkorJXt1IdIavxAxqF9FHRI=;
 b=Vvn0pKvYkm8KA6Xnmhtp1uo2aRQP70zkv1ucWM/fh6p6gqrg7D/3V58+
 icmO104rQDxWfAhSlimgVq81dhkJM4gbC/eRMUJtiMmkUkIOTulaT/6c1
 PcokMI4BxTDUDW8u02xRnCwBnOpIpEN5XFb0Hs9Goio2U/4SJDgW3XNiE
 LiHWkcdS31YSXCfLL31RYRDcfcQ12POk1Vj6ZKcQFRVb4fjZaqykyUmjz
 RG89KBfrJLj++iDu8VIiVU44Z3geqhgdxtmblve8qZVpkc8EdwwNHUqQx
 7wxAB64XwcJJ7DfYk5cXhQUPVWYHUiATNr9NwCtCG23QTewvMns49fq0g Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="9779154"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="9779154"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14536886"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 03:11:53 -0700
Date: Thu, 21 Mar 2024 11:11:50 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v4 08/25] tests/intel: Introduce Blitter subcategory
Message-ID: <20240321100544.67qyd66zo36hyfel@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
 <20240314143455.1436688-9-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240314143455.1436688-9-katarzyna.piecielska@intel.com>
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

Hi Katarzyna,
On 2024-03-14 at 14:34:38 +0000, Katarzyna Piecielska wrote:
> Let's introduce Blitter subcategory.
> 
> v2: introduce more granularity in Blitter subcategory to not break
> automation:
>  - igt@gem_exercise_blt@fast-copy* - s/blitter/fast-copy/
>  - igt@gem_linear_blits@ - s/blitter/linear blit/
> 
> v2: Make Sub-category/Functionality/Feature unique values. (Kamil)
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  tests/intel/gem_exercise_blt.c      | 16 ++++++++--------
>  tests/intel/gem_linear_blits.c      |  6 +++---
>  tests/intel/gem_set_tiling_vs_blt.c |  3 +++
>  tests/intel/gen9_exec_parse.c       |  3 +++
>  4 files changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/gem_exercise_blt.c
> index 4a9bc3729..39bbdda17 100644
> --- a/tests/intel/gem_exercise_blt.c
> +++ b/tests/intel/gem_exercise_blt.c
> @@ -13,19 +13,19 @@
>  /**
>   * TEST: gem exercise blt
>   * Description: Exercise blitter commands
> - * Feature: blitter
> - * Run type: FULL
> + * Feature: blitter feature
> + * Sub-category: Blitter
> + * Category: Desktop client
> + * Functionality: fast-copy
>   * Test category: GEM_Legacy
> + * Run type: FULL
>   *
>   * SUBTEST: fast-copy
> - * Description:
> - *   Check fast-copy blit
> - *   blitter
> + * Description: Check fast-copy blit blitter
>   *
>   * SUBTEST: fast-copy-emit
> - * Description:
> - *   Check multiple fast-copy in one batch
> - *   blitter
> + * Description: Check multiple fast-copy in one batch blitter
> + *
>   */
>  
>  IGT_TEST_DESCRIPTION("Exercise blitter commands");
> diff --git a/tests/intel/gem_linear_blits.c b/tests/intel/gem_linear_blits.c
> index 64f220cb3..aac84211f 100644
> --- a/tests/intel/gem_linear_blits.c
> +++ b/tests/intel/gem_linear_blits.c
> @@ -53,9 +53,9 @@
>   * TEST: gem linear blits
>   * Category: Infrastructure
>   * Description: Test doing many blits with a working set larger than the aperture size.
> - * Feature: blitter
> - * Functionality: blitter
> - * Sub-category: CMD submission
> + * Feature: blitter feature
> + * Functionality: linear blits
> + * Sub-category: Blitter
>   * Test category: GEM_Legacy
>   * Run type: FULL
>   *
> diff --git a/tests/intel/gem_set_tiling_vs_blt.c b/tests/intel/gem_set_tiling_vs_blt.c
> index 9077e0f3f..28469f5f3 100644
> --- a/tests/intel/gem_set_tiling_vs_blt.c
> +++ b/tests/intel/gem_set_tiling_vs_blt.c
> @@ -61,6 +61,9 @@
>   * TEST: gem set tiling vs blt
>   * Description: Check for proper synchronization of tiling changes vs. tiled gpu access.
>   * Feature: blitter, gtt
---------------^
Should be:
 * Feature: blitter feature, gtt

> + * Functionality: tiling
> + * Sub-category: Blitter
> + * Category: Desktop client
>   * Run type: FULL
>   *
>   * SUBTEST: tiled-to-tiled
> diff --git a/tests/intel/gen9_exec_parse.c b/tests/intel/gen9_exec_parse.c
> index 33ff6bcb5..509a2e80f 100644
> --- a/tests/intel/gen9_exec_parse.c
> +++ b/tests/intel/gen9_exec_parse.c
> @@ -36,6 +36,9 @@
>  /**
>   * TEST: gen9 exec parse
>   * Feature: blitter, command_parser
---------------^
Same here,

Regards,
Kamil

> + * Sub-category: Blitter
> + * Functionality: command_parser
> + * Category: Desktop client
>   * Run type: FULL
>   *
>   * SUBTEST: allowed-all
> -- 
> 2.34.1
> 
