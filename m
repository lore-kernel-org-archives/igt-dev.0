Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A4AC54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 19 Mar 2024 12:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CE710FA6F;
	Tue, 19 Mar 2024 12:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y+xj/f0E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E0810FA6F
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Mar 2024 12:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710852082; x=1742388082;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fKmLhzeB8zWoJGg0y33g/Q9qKMhgEiU8Kuk9pWp39KY=;
 b=Y+xj/f0E1e6nRXM+SQnBtRUor2RnILg+ZM0+u/frqqGxcfrcYW+Uc2ms
 FjC3DdioX/x3fwd72dQyVYngNsLiuyXUFRfgwxb+D3B/35AF1c5RE/W+f
 zsXNCpezJRsX5Lsep4cd5qmm1uS47L3DE1LBuEQUtZHAmOSbFahPLdvxW
 kdpyRa19zvge1hS7YMT7kswJy4TGjwvasfQbGwAb8DnkmarcNL6+t4ztY
 uq7gWJwjqAUTB8wOo/8QhwD92Jk8NFstUFyVDPLrtYIQO18zedokqEKuf
 dN9gpa6nboJSXeTutORRBKfSM5oS05AKZk2ll0OquB/jelCI/EekqAeS6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16859271"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="16859271"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 05:41:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; d="scan'208";a="13698278"
Received: from unknown (HELO localhost) ([10.245.246.227])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 05:40:28 -0700
Date: Tue, 19 Mar 2024 13:40:25 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v4 08/25] tests/intel: Introduce Blitter subcategory
Message-ID: <20240319124025.yke7qhbsi6fqiypi@zkempczy-mobl2>
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

On Thu, Mar 14, 2024 at 02:34:38PM +0000, Katarzyna Piecielska wrote:
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
> + * Sub-category: Blitter
> + * Functionality: command_parser

I guess _ is not necessary here, with this nit fixed:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> + * Category: Desktop client
>   * Run type: FULL
>   *
>   * SUBTEST: allowed-all
> -- 
> 2.34.1
> 
