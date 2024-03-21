Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B281FC54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 14:52:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5987510EB94;
	Thu, 21 Mar 2024 14:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7+hG+C9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADF710EB94
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711032735; x=1742568735;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NiMH0CBZ/IpRSvKvWkwSs5wHc+Q/7+mKtww+SrAMwDw=;
 b=k7+hG+C94ejqhillSw1oqXckgMqRpzNm5Xu/3Qi7nIS0/ou6w8eXg1z2
 VLSDI8Lg+IIYyGf4v1dWSKbkMIP7pszNDtKBLV8qCdflbm/jyZWwAGOxm
 DKjeqyPUoL29vn3MbRVbAFbRm6cA2iCmnxgKfwbEGOCiQFy2x65B/xUK5
 9PDB2EEkPF/IvP96sDB3Pi5adzjtLdDPw++cA+WsQ60hYUQ/N6OLSBaFa
 7bOnPHzKiMsBOl3LgTkRXOp/gwkaJtlw2fDZecmHA9gjbUuQjyGrBxy3f
 +CJ6M7wLH+n6FTRkQJe4iqAhQ+yMYHd4GZl/CWv2g03iYCE/HLBdjTuMD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16572576"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="16572576"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 07:52:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="19002316"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 07:52:12 -0700
Date: Thu, 21 Mar 2024 15:52:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v4 15/25] tests/intel: Introduce Power management
 subcategory
Message-ID: <20240321145210.stxd32ghx65ealw5@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
 <20240314143455.1436688-16-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314143455.1436688-16-katarzyna.piecielska@intel.com>
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
On 2024-03-14 at 14:34:45 +0000, Katarzyna Piecielska wrote:
> Let's put e.g. pm_rps, pm_rpm, sseu, hwmon, suspend, freg multipliers
> and others under Power management subcategory.
> 
> v2: Make Sub-category/Functionality/Feature unique values. (Kamil)
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/intel/gem_pxp.c               | 3 ++-
>  tests/intel/i915_pm_freq_mult.c     | 9 ++++++---
>  tests/intel/i915_pm_rc6_residency.c | 1 +
>  tests/intel/i915_pm_rpm.c           | 2 ++
>  tests/intel/i915_pm_rps.c           | 3 +++
>  tests/intel/i915_pm_sseu.c          | 3 +++
>  tests/intel/i915_power.c            | 3 +++
>  tests/intel/i915_suspend.c          | 3 +++
>  8 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
> index 6a7f8e487..bef6056ba 100644
> --- a/tests/intel/gem_pxp.c
> +++ b/tests/intel/gem_pxp.c
> @@ -10,9 +10,10 @@
>  /**
>   * TEST: gem pxp
>   * Description: Test PXP that manages protected content through arbitrated HW-PXP-session
> - * Feature: PXP
> + * Feature: Protected Xe Path
------------------------ ^^
Is this correct? As I see this is as a hardware capability, not
driver. Maybe: cross-device? or device-to-device

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

There are Sub-category conflicts with 'Firmware':

tests/intel/i915_pm_freq_mult.c: * Category: Firmware
tests/intel/xe_huc_copy.c: * Category: Firmware building block

tests/intel/gem_huc_copy.c: * Sub-category: Firmware
tests/intel/i915_selftest.c: * Sub-category: Firmware

> + * Functionality: freg multipliers
------------------------^
This is here lowercase 'G', should be 'q' - lowercase 'Q', so
s/freg/freq/

> + * Test category: i915
-------------------- ^^^^
imho drop this line.

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
> index 820edd45e..3225ca25b 100644
> --- a/tests/intel/i915_pm_rps.c
> +++ b/tests/intel/i915_pm_rps.c
> @@ -49,6 +49,9 @@
>   * Description: Render P-States tests - verify GPU frequency changes
>   * Feature: pm_rps
>   * Test category: pm_rps
> + * Functionality: rps
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
-------------------- ^^^^^^^
Do we need 'Test category'? If yes, maybe something other to
write in this field? It can potentialy collide.

Regards,
Kamil

> + * Functionality: suspend
> + * Sub-category: Power management
> + * Category: Desktop client
>   * Run type: FULL
>   *
>   * SUBTEST: basic-s2idle-without-i915
> -- 
> 2.34.1
> 
