Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054CEC5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 14:01:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7561F112AAD;
	Mon, 11 Mar 2024 14:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WHjqqWIr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F4C112AAC
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 14:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710165665; x=1741701665;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dkvZ2DWigMEOe2HrJeVlPNeFXkRxysFELK+AaPCZeZ0=;
 b=WHjqqWIrnKX2hu3x3ekK/DfijL589SuyPyWMH/9kk2opWdMYC96gihGC
 FXUBKdGLDI4wEgQD8GzGegcmvAbiPDe0VJkGhAuYTNhlSjDivvXEACznr
 HqUMZoR9IMhvhFof2VD2XlUM6ejuo53tAAsA6uCtOfrVvprehw6Tr+1JP
 Ri1jDjdrtJH6J7TXFyTFflbBEBMkpYp7pkPe5MiDmFi3LQiSU2gOpPE7T
 bOq1lKbu1fbjZVDzWlLX0X2Zw/qUZTtzTUZ04ub2nXmUSUMbrseWflgxB
 rvGhIarQB5EUUEwneLboA8wsfXAi5z3VKKMLXsyIZ5NVkzifS1c52ahMO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="8645619"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="8645619"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 07:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="11270402"
Received: from unknown (HELO localhost) ([10.245.244.202])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 07:01:01 -0700
Date: Mon, 11 Mar 2024 15:00:58 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 08/25] tests/intel: Introduce Blitter subcategory
Message-ID: <20240311140058.cn24jnqvdbat4s3p@zkempczy-mobl2>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
 <20240308083657.1092049-9-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240308083657.1092049-9-katarzyna.piecielska@intel.com>
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

On Fri, Mar 08, 2024 at 08:36:40AM +0000, Katarzyna Piecielska wrote:
> Let's introduce Blitter subcategory.
> 
> v2: introduce more granularity in Blitter subcategory to not break
> automation:
>  - igt@gem_exercise_blt@fast-copy* - s/blitter/fast-copy/
>  - igt@gem_linear_blits@ - s/blitter/linear blit/
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  tests/intel/gem_exercise_blt.c      | 14 +++++++-------
>  tests/intel/gem_linear_blits.c      |  4 ++--
>  tests/intel/gem_set_tiling_vs_blt.c |  3 +++
>  tests/intel/gen9_exec_parse.c       |  3 +++
>  4 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/gem_exercise_blt.c
> index 4a9bc3729..0aa660ce9 100644
> --- a/tests/intel/gem_exercise_blt.c
> +++ b/tests/intel/gem_exercise_blt.c
> @@ -14,18 +14,18 @@
>   * TEST: gem exercise blt
>   * Description: Exercise blitter commands
>   * Feature: blitter
> - * Run type: FULL
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
> index 64f220cb3..eeb5cd541 100644
> --- a/tests/intel/gem_linear_blits.c
> +++ b/tests/intel/gem_linear_blits.c
> @@ -54,8 +54,8 @@
>   * Category: Infrastructure
>   * Description: Test doing many blits with a working set larger than the aperture size.
>   * Feature: blitter
> - * Functionality: blitter
> - * Sub-category: CMD submission
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
> + * Category: Desktop client
>   * Run type: FULL
>   *
>   * SUBTEST: allowed-all
> -- 
> 2.34.1
>

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
