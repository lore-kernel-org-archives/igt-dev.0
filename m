Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965C3C5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 15:20:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3939F112B13;
	Mon, 11 Mar 2024 15:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCJaEqGh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A10112B12
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 15:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710170449; x=1741706449;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nTmKAwFz/hPZXM+elDj2/SuJR46VakjXbdPrBmrzTxU=;
 b=eCJaEqGhdN8PrHmXo5/dSIAzIUBMfLZm/5iNaaCrIMRQw9/vJuwgTwhz
 +hu6T2ZI+2pbpdei21gJ/XirvVRKl115m2gaqI93SsEmnLZK4/6FM5FZW
 NXfFukbV13vplK/Bte6N2REAf6SdljDtomQmQHE9I471zxjclOWtkU6UT
 OTSWABCpMl/e8Iv8DFI4pMd02hx5+Lk8YQ7yFTYGREyLKgDBEAoDWRXHg
 yqd40egoJ3KOE0U2lfwfoAV91HmcSdkomXrDTuf0npvCZcu6NhljPi/p0
 JlwX2bG0QfXNPd9/4k4v11+x0PS+/PHFG+0nB+kV1C5KCEdMuUfSn22vw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="8655950"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="8655950"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 08:20:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11090887"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 08:20:46 -0700
Date: Mon, 11 Mar 2024 16:20:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 14/25] tests/intel: Introduce Obsolete subcategory
Message-ID: <20240311152043.dppk6szl4uuhypls@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
 <20240308083657.1092049-15-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240308083657.1092049-15-katarzyna.piecielska@intel.com>
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
On 2024-03-08 at 08:36:46 +0000, Katarzyna Piecielska wrote:
> gen3_* tests are obsolete, so let's put them into one subcategory.
> 
> v2: change functionality to 'obsolete_test' to not break automation
> tools
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gen3_mixed_blits.c         | 3 +++
>  tests/intel/gen3_render_linear_blits.c | 3 +++
>  tests/intel/gen3_render_mixed_blits.c  | 3 +++
>  tests/intel/gen3_render_tiledx_blits.c | 5 ++++-
>  tests/intel/gen3_render_tiledy_blits.c | 5 ++++-
>  5 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/gen3_mixed_blits.c b/tests/intel/gen3_mixed_blits.c
> index 3c6fb141a..f204244db 100644
> --- a/tests/intel/gen3_mixed_blits.c
> +++ b/tests/intel/gen3_mixed_blits.c
> @@ -51,6 +51,9 @@
>  /**
>   * TEST: gen3 mixed blits
>   * Feature: obsolete
> + * Sub-category: Obsolete

Hmm, now Sub-category and Category have the same names, maybe
here (for sub-category):

 * Sub-category: Obsolate_gen3

What do you think?

Regards,
Kamil

> + * Functionality: obsolete_test
> + * Category: Obsolete
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gen3_render_linear_blits.c b/tests/intel/gen3_render_linear_blits.c
> index 7dfb2709a..97976ac20 100644
> --- a/tests/intel/gen3_render_linear_blits.c
> +++ b/tests/intel/gen3_render_linear_blits.c
> @@ -50,6 +50,9 @@
>  /**
>   * TEST: gen3 render linear blits
>   * Feature: obsolete
> + * Sub-category: Obsolete
> + * Functionality: obsolete_test
> + * Category: Obsolete
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gen3_render_mixed_blits.c b/tests/intel/gen3_render_mixed_blits.c
> index f8e1bdfbd..4f02ec5ba 100644
> --- a/tests/intel/gen3_render_mixed_blits.c
> +++ b/tests/intel/gen3_render_mixed_blits.c
> @@ -51,6 +51,9 @@
>  /**
>   * TEST: gen3 render mixed blits
>   * Feature: obsolete
> + * Sub-category: Obsolete
> + * Functionality: obsolete_test
> + * Category: Obsolete
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gen3_render_tiledx_blits.c b/tests/intel/gen3_render_tiledx_blits.c
> index 1abe5adbc..65358b053 100644
> --- a/tests/intel/gen3_render_tiledx_blits.c
> +++ b/tests/intel/gen3_render_tiledx_blits.c
> @@ -25,7 +25,7 @@
>   *
>   */
>  
> -/** @file gen3_linear_render_blits.c
> +/** @file gen3_render_tiledx_blits.c
>   *
>   * This is a test of doing many blits, with a working set
>   * larger than the aperture size.
> @@ -51,6 +51,9 @@
>  /**
>   * TEST: gen3 render tiledx blits
>   * Feature: obsolete
> + * Sub-category: Obsolete
> + * Category: Obsolete
> + * Functionality: obsolete_test
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gen3_render_tiledy_blits.c b/tests/intel/gen3_render_tiledy_blits.c
> index b1f4b628a..c13e395b9 100644
> --- a/tests/intel/gen3_render_tiledy_blits.c
> +++ b/tests/intel/gen3_render_tiledy_blits.c
> @@ -25,7 +25,7 @@
>   *
>   */
>  
> -/** @file gen3_linear_render_blits.c
> +/** @file gen3_render_tiledy_blits.c
>   *
>   * This is a test of doing many blits, with a working set
>   * larger than the aperture size.
> @@ -51,6 +51,9 @@
>  /**
>   * TEST: gen3 render tiledy blits
>   * Feature: obsolete
> + * Sub-category: Obsolete
> + * Category: Obsolete
> + * Functionality: obsolete_test
>   * Run type: FULL
>   *
>   * SUBTEST:
> -- 
> 2.34.1
> 
