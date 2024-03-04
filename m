Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04361C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:20:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DCB112286;
	Mon,  4 Mar 2024 15:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEDB4+IZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6020F112284
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709565628; x=1741101628;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UwM+QPjKwefd11qnFKRIA4ky0PGyQUY1ISaFMJiKXXE=;
 b=hEDB4+IZqXBM3yyLzLKO8SLmQq1r4baOPIJiKGKBqPQJt390ZLE9q9Vb
 8aHKcRFPY4dZ7lNUnxNMYxu5n+CHVouFJYOR7nkXA/VTETcQI5U8CNePq
 UqwBwBDzf4olHI8wfRgFHql+VYuDlOPxcQoSVNKEI7FPxTs2iU1FCnf6k
 EgPp+UMPlmSCTtXCzBYhQ5SUZPaAPEy4Z1pnjD5GW5sVcfcRWWiZ7+Q5y
 a3Ws3gyswAhnKq9WF1dI729967kplwhRMgVnBuBozQjKYwAwXDNcdqfT2
 ehID2k8fVKUstgig1ZCq2OOHyDxs3SN28oRMJ5Kqj4lSpSlXGQZaiM3xT g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7874402"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="7874402"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:20:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="8889301"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:20:26 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 676125807E7;
 Mon,  4 Mar 2024 07:20:24 -0800 (PST)
Date: Mon, 4 Mar 2024 16:20:21 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t 15/24] tests/intel: Introduce Power management
 subcategory
Message-ID: <20240304162021.2dc3b70d@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-16-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-16-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon,  4 Mar 2024 11:16:08 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> Let's put e.g. pm_rps, pm_rpm, sseu, hwmon, suspend, freg multipliers
> and others under Power management subcategory.

LGTM.

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/intel/gem_pxp.c               | 1 +
>  tests/intel/i915_pm_freq_mult.c     | 9 ++++++---
>  tests/intel/i915_pm_rc6_residency.c | 1 +
>  tests/intel/i915_pm_rpm.c           | 2 ++
>  tests/intel/i915_pm_rps.c           | 3 +++
>  tests/intel/i915_pm_sseu.c          | 3 +++
>  tests/intel/i915_power.c            | 3 +++
>  tests/intel/i915_suspend.c          | 3 +++
>  8 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
> index 6a7f8e487..72f34c982 100644
> --- a/tests/intel/gem_pxp.c
> +++ b/tests/intel/gem_pxp.c
> @@ -13,6 +13,7 @@
>   * Feature: PXP
>   * Functionality: pxp
>   * Sub-category: Power management
> + * Category: Desktop client
>   * Run type: FULL
>   *
>   * SUBTEST: create-protected-buffer
> diff --git a/tests/intel/i915_pm_freq_mult.c b/tests/intel/i915_pm_freq_mult.c
> index 49f6722b1..de65eaedf 100644
> --- a/tests/intel/i915_pm_freq_mult.c
> +++ b/tests/intel/i915_pm_freq_mult.c
> @@ -12,9 +12,12 @@
>  #include "igt_sysfs.h"
>  /**
>   * TEST: i915 pm freq mult
> - * Description:
> - *   Tests for sysfs controls (or multipliers) for IP blocks which run at frequencies different
> - *   from the main GT frequency.
> + * Description: Tests for sysfs controls (or multipliers) for IP blocks which
> + *		run at frequencies different from the main GT frequency.
> + * Category: Firmware
> + * Functionality: freg multipliers
> + * Test category: i915
> + * Sub-category: Power management
>   * Run type: FULL
>   *
>   * SUBTEST: media-freq
> diff --git a/tests/intel/i915_pm_rc6_residency.c b/tests/intel/i915_pm_rc6_residency.c
> index 30f57858d..67ae1f1f9 100644
> --- a/tests/intel/i915_pm_rc6_residency.c
> +++ b/tests/intel/i915_pm_rc6_residency.c
> @@ -46,6 +46,7 @@
>   * Feature: GuCRC, pm_rc6
>   * Functionality: rc6
>   * Sub-category: Power management
> + * Category: Desktop client
>   * Run type: FULL
>   *
>   * SUBTEST: media-rc6-accuracy
> diff --git a/tests/intel/i915_pm_rpm.c b/tests/intel/i915_pm_rpm.c
> index 9fbfac744..be8d5fd77 100644
> --- a/tests/intel/i915_pm_rpm.c
> +++ b/tests/intel/i915_pm_rpm.c
> @@ -44,6 +44,8 @@
>   * TEST: i915 pm rpm
>   * Feature: pm_rpm
>   * Functionality: D3 state entry-exit
> + * Sub-category: Power management
> + * Category: Desktop client
>   * Test category: pm_rpm
>   * Run type: FULL
>   *
> diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
> index 820edd45e..17784daa9 100644
> --- a/tests/intel/i915_pm_rps.c
> +++ b/tests/intel/i915_pm_rps.c
> @@ -49,6 +49,9 @@
>   * Description: Render P-States tests - verify GPU frequency changes
>   * Feature: pm_rps
>   * Test category: pm_rps
> + * Functionality: pm_rps
> + * Sub-category: Power management
> + * Category: Desktop client
>   * Run type: FULL
>   *
>   * SUBTEST: basic-api
> diff --git a/tests/intel/i915_pm_sseu.c b/tests/intel/i915_pm_sseu.c
> index cee29a7c5..354403ef2 100644
> --- a/tests/intel/i915_pm_sseu.c
> +++ b/tests/intel/i915_pm_sseu.c
> @@ -39,6 +39,9 @@
>   * TEST: i915 pm sseu
>   * Description: Tests slice/subslice/EU power gating functionality.
>   * Feature: pm_sseu
> + * Sub-category: Power management
> + * Category: Desktop client
> + * Functionality: sseu
>   * Run type: FULL
>   *
>   * SUBTEST: full-enable
> diff --git a/tests/intel/i915_power.c b/tests/intel/i915_power.c
> index ee00cbcd8..0f083b375 100644
> --- a/tests/intel/i915_power.c
> +++ b/tests/intel/i915_power.c
> @@ -13,6 +13,9 @@
>   * Feature: hwmon
>   * Run type: FULL
>   * Test category: GEM_Legacy
> + * Sub-category: Power management
> + * Category: Desktop client
> + * Functionality: hwmon
>   *
>   * SUBTEST: sanity
>   * Description: Sanity check gpu power measurement
> diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
> index 4ee815031..7c96e25f5 100644
> --- a/tests/intel/i915_suspend.c
> +++ b/tests/intel/i915_suspend.c
> @@ -49,6 +49,9 @@
>   * Feature: suspend
>   * Functionality: s2idle w/o i915
>   * Test category: suspend
> + * Functionality: suspend
> + * Sub-category: Power management
> + * Category: Desktop client
>   * Run type: FULL
>   *
>   * SUBTEST: basic-s2idle-without-i915
