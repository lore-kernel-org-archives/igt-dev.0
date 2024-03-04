Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D534FC48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 15:19:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D4110E8D7;
	Mon,  4 Mar 2024 15:19:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dND4jLZr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E12710E8D7
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 15:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709565551; x=1741101551;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5hbVCWwd8XeqZHsQFV905VPXRKcFOCFuH3hj+rhAqMw=;
 b=dND4jLZrc1qWCwze0yglbxUGeWo8Dq3D0P9CYMe9VJ1Jk74R9N5aP5ga
 kKng1QiV5jwz248omeT3tWHarTbbnRU77+zj9w3PXN37qTHjhQ5KPbARq
 oYsSIkAYNuKmgX7BEHRYWEJrttXZwogCOvnT+DiwkLoHi/p7jARMNpVhP
 t6gXOXdNy+ZBJyShof6eJFeywiVtWX761I3A4IVvPlsASKg2L8w3tsVoM
 JYCoCNPMiEKumrTcnyflsCCyTr87YoNikF0x0DNNz+jLzNdCLRQW3hEPx
 xOAdsAQvXlj5ZF2zmW+A3vHID5iASilGEqrxBZ8K4n7pX4BKYZNC3CJp5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="7876433"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="7876433"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:19:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="32189793"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 07:19:10 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 83FDC580960;
 Mon,  4 Mar 2024 07:19:08 -0800 (PST)
Date: Mon, 4 Mar 2024 16:19:05 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: igt-dev@lists.freedesktop.org, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 14/24] tests/intel: Introduce Obsolete subcategory
Message-ID: <20240304161905.22f7cf84@maurocar-mobl2>
In-Reply-To: <20240304111617.849785-15-katarzyna.piecielska@intel.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-15-katarzyna.piecielska@intel.com>
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

On Mon,  4 Mar 2024 11:16:07 +0000
Katarzyna Piecielska <katarzyna.piecielska@intel.com> wrote:

> gen3_* tests are obsolete, so let's put them into one subcategory.
> 
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/gen3_mixed_blits.c         | 3 +++
>  tests/intel/gen3_render_linear_blits.c | 3 +++
>  tests/intel/gen3_render_mixed_blits.c  | 3 +++
>  tests/intel/gen3_render_tiledx_blits.c | 3 +++
>  tests/intel/gen3_render_tiledy_blits.c | 3 +++
>  5 files changed, 15 insertions(+)
> 
> diff --git a/tests/intel/gen3_mixed_blits.c b/tests/intel/gen3_mixed_blits.c
> index 3c6fb141a..b9ae784da 100644
> --- a/tests/intel/gen3_mixed_blits.c
> +++ b/tests/intel/gen3_mixed_blits.c
> @@ -51,6 +51,9 @@
>  /**
>   * TEST: gen3 mixed blits
>   * Feature: obsolete
> + * Sub-category: Obsolete
> + * Functionality: obsolete
> + * Category: Obsolete
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gen3_render_linear_blits.c b/tests/intel/gen3_render_linear_blits.c
> index 7dfb2709a..e62a0e9a1 100644
> --- a/tests/intel/gen3_render_linear_blits.c
> +++ b/tests/intel/gen3_render_linear_blits.c
> @@ -50,6 +50,9 @@
>  /**
>   * TEST: gen3 render linear blits
>   * Feature: obsolete
> + * Sub-category: Obsolete
> + * Functionality: obsolete
> + * Category: Obsolete

same here.

>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gen3_render_mixed_blits.c b/tests/intel/gen3_render_mixed_blits.c
> index f8e1bdfbd..f3fa937d0 100644
> --- a/tests/intel/gen3_render_mixed_blits.c
> +++ b/tests/intel/gen3_render_mixed_blits.c
> @@ -51,6 +51,9 @@
>  /**
>   * TEST: gen3 render mixed blits
>   * Feature: obsolete
> + * Sub-category: Obsolete
> + * Functionality: obsolete
> + * Category: Obsolete
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gen3_render_tiledx_blits.c b/tests/intel/gen3_render_tiledx_blits.c
> index 1abe5adbc..88dd606ec 100644
> --- a/tests/intel/gen3_render_tiledx_blits.c
> +++ b/tests/intel/gen3_render_tiledx_blits.c
> @@ -51,6 +51,9 @@
>  /**
>   * TEST: gen3 render tiledx blits
>   * Feature: obsolete
> + * Sub-category: Obsolete
> + * Category: Obsolete
> + * Functionality: obsolete
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gen3_render_tiledy_blits.c b/tests/intel/gen3_render_tiledy_blits.c
> index b1f4b628a..c2fa63c74 100644
> --- a/tests/intel/gen3_render_tiledy_blits.c
> +++ b/tests/intel/gen3_render_tiledy_blits.c
> @@ -51,6 +51,9 @@
>  /**
>   * TEST: gen3 render tiledy blits
>   * Feature: obsolete
> + * Sub-category: Obsolete
> + * Category: Obsolete
> + * Functionality: obsolete
>   * Run type: FULL
>   *
>   * SUBTEST:
