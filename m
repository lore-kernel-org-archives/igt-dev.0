Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2727C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 14:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613AC10EB4C;
	Thu, 21 Mar 2024 14:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGkpwU4z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C84010EB4C
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711032072; x=1742568072;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4fQRbS1Rh9+B3aJdfLSmQ1lN/VV8VWy6aRruNfqf2KI=;
 b=kGkpwU4zOF4DAQXLihNFeO3QWnIV+wbHnCUuIl4jVd5R2RIz1NY2xBYt
 flFrXuDkJ3qEl0Pt/kc3+e0VRZN4KUQD1dGZlbYayhOmVGxx+xh8EA01q
 /JIxyyODjg2nd8tq/DyPu2YLnVz9/XEU8ayX9G/O07G6/8yeZxMXTSfQM
 EaANVjFralQ3uQx911wq4p9sbID+65eSwaQ0xAgEGmC6o+Zdm/ViwdcuZ
 hgAGDIXJgSxrPkHb/U0ctH+L7HjljUP5WY5AY6O/0HrgH7M844nTT5EMl
 xsL5M00CptzAwBzgdk7FE9NTDmssWVZRKX63KaOy+cS+P9PkO93Hn63+E Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6632077"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="6632077"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 07:41:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14492375"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 07:41:11 -0700
Date: Thu, 21 Mar 2024 15:40:50 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: Re: [PATCH i-g-t v4 14/25] tests/intel: Introduce Obsolete subcategory
Message-ID: <20240321144050.ds4fpoxclsi4qxyn@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
References: <20240314143455.1436688-1-katarzyna.piecielska@intel.com>
 <20240314143455.1436688-15-katarzyna.piecielska@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240314143455.1436688-15-katarzyna.piecielska@intel.com>
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
On 2024-03-14 at 14:34:44 +0000, Katarzyna Piecielska wrote:
> gen3_* tests are obsolete, so let's put them into one subcategory.
> 
> v2: change functionality to 'obsolete_test' to not break automation
> tools
> v3: Category and Sub-category need to be unique as well, so change
> Sub-category s/Obsolete/Obsolete_gen3/.
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
> index 3c6fb141a..2bb5517c8 100644
> --- a/tests/intel/gen3_mixed_blits.c
> +++ b/tests/intel/gen3_mixed_blits.c
> @@ -51,6 +51,9 @@
>  /**
>   * TEST: gen3 mixed blits
>   * Feature: obsolete
> + * Sub-category: Obsolete_gen3
> + * Functionality: obsolete_test

As you change also Functionality, there are two left to correct:

tests/intel/kms_pipe_b_c_ivb.c: * Functionality: kms_core, obsolete
tests/kms_tv_load_detect.c: * Functionality: obsolete

Regards,
Kamil

> + * Category: Obsolete
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gen3_render_linear_blits.c b/tests/intel/gen3_render_linear_blits.c
> index 7dfb2709a..681d7b01b 100644
> --- a/tests/intel/gen3_render_linear_blits.c
> +++ b/tests/intel/gen3_render_linear_blits.c
> @@ -50,6 +50,9 @@
>  /**
>   * TEST: gen3 render linear blits
>   * Feature: obsolete
> + * Sub-category: Obsolete_gen3
> + * Functionality: obsolete_test
> + * Category: Obsolete
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gen3_render_mixed_blits.c b/tests/intel/gen3_render_mixed_blits.c
> index f8e1bdfbd..ee42f068b 100644
> --- a/tests/intel/gen3_render_mixed_blits.c
> +++ b/tests/intel/gen3_render_mixed_blits.c
> @@ -51,6 +51,9 @@
>  /**
>   * TEST: gen3 render mixed blits
>   * Feature: obsolete
> + * Sub-category: Obsolete_gen3
> + * Functionality: obsolete_test
> + * Category: Obsolete
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gen3_render_tiledx_blits.c b/tests/intel/gen3_render_tiledx_blits.c
> index 1abe5adbc..ca49576a9 100644
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
> + * Sub-category: Obsolete_gen3
> + * Category: Obsolete
> + * Functionality: obsolete_test
>   * Run type: FULL
>   *
>   * SUBTEST:
> diff --git a/tests/intel/gen3_render_tiledy_blits.c b/tests/intel/gen3_render_tiledy_blits.c
> index b1f4b628a..dfd3ef947 100644
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
> + * Sub-category: Obsolete_gen3
> + * Category: Obsolete
> + * Functionality: obsolete_test
>   * Run type: FULL
>   *
>   * SUBTEST:
> -- 
> 2.34.1
> 
