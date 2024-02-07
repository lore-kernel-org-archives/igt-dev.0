Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E528C4828D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 11:27:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DDF112E54;
	Wed,  7 Feb 2024 11:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYmSkQj+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F74C112E54
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 11:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707305274; x=1738841274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H0Qkkny2xWZs7O9H8y56EDOoqdv2X13zofRjqhITcdE=;
 b=TYmSkQj+Ry7GgcCBQEdJXZaR8ibVUH5dde9VfwBh6E33INX43CNg1MLp
 WS46qoJTj1qxNegaBrYq1paJZPzvx1TBcJZMhQ/zFNzrVAawfIlUCJtL7
 UIFuEX1F0vwBIx6YFKh0ppPekgT2v3CCI7Ty1Mgk7AFJzeFHy0JPfA0Bp
 5UdslcKLIM8FuAWiKce/bHftYXsu52/XDfQvidbklUGoCQyw9W4KMaHrV
 x6cd7dhHz9zTupLCs5MbXhm5vwnfDWTcq2AV9ZDiiE2J5Ey5ZYXVmgECY
 MhBnk2PUG8O08ogkf+P6UfirEWBi840uO5cILsCGGXHo0mXEXiapXnEwd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="1102779"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1102779"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 03:27:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1603219"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.22.5])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 03:27:51 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 2/2] xe_live_ktest: Use xe_live_test kernel module
Date: Wed, 07 Feb 2024 12:27:48 +0100
Message-ID: <1760950.X513TT2pbd@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240202004529.552806-3-lucas.demarchi@intel.com>
References: <20240202004529.552806-1-lucas.demarchi@intel.com>
 <20240202004529.552806-3-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Friday, 2 February 2024 01:45:29 CET Lucas De Marchi wrote:
> https://patchwork.freedesktop.org/series/126786/ groups all the live
> tests into a single kernel module. Use that module to run any of the
> tests triggered by igt.
> 
> To make the live kunit tests work, rename the subtests so they match
> what the kernel uses.

There was some discussion on this patch on today's XE IGT status meeting, and 
the conclusion was: can we have these split into two patches, one for subtest 
renaming, and one for switching to single module?

Thanks,
Janusz

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist |  6 +++---
>  tests/intel/xe_live_ktest.c              | 25 ++++++++++--------------
>  2 files changed, 13 insertions(+), 18 deletions(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index f297fe965..797a78563 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -227,9 +227,9 @@ igt@kms_psr@psr-sprite-plane-onoff
>  igt@core_hotunplug@unbind-rebind
>  
>  # Run KUnit tests at the end
> -igt@xe_live_ktest@bo
> -igt@xe_live_ktest@dmabuf
> -igt@xe_live_ktest@migrate
> +igt@xe_live_ktest@xe_bo
> +igt@xe_live_ktest@xe_dmabuf
> +igt@xe_live_ktest@xe_migrate
>  
>  # Move fault_mode tests at the end to unblock execution
>  igt@xe_exec_fault_mode@twice-basic
> diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
> index 5f5f1dff7..d65378858 100644
> --- a/tests/intel/xe_live_ktest.c
> +++ b/tests/intel/xe_live_ktest.c
> @@ -9,38 +9,33 @@
>   * Functionality: kunit
>   * Test category: functionality test
>   *
> - * SUBTEST: bo
> + * SUBTEST: xe_bo
>   * Description:
>   *	Kernel dynamic selftests to check if GPU buffer objects are
>   *	being handled properly.
>   * Functionality: bo
>   *
> - * SUBTEST: dmabuf
> + * SUBTEST: xe_dmabuf
>   * Description: Kernel dynamic selftests for dmabuf functionality.
>   * Functionality: dmabuf
>   *
> - * SUBTEST: migrate
> + * SUBTEST: xe_migrate
>   * Description:
>   *	Kernel dynamic selftests to check if page table migrations
>   *	are working properly.
>   * Functionality: migrate
>   *
> - * SUBTEST: mocs
> + * SUBTEST: xe_mocs
>   * Description:
>   *	Kernel dynamic selftests to check mocs configuration.
>   * Functionality: mocs
>   */
>  
> -struct kunit_tests {
> -	const char *kunit;
> -	const char *name;
> -};
> -
> -static const struct kunit_tests live_tests[] = {
> -	{ "xe_bo_test",		"bo" },
> -	{ "xe_dma_buf_test",	"dmabuf" },
> -	{ "xe_migrate_test",	"migrate" },
> -	{ "xe_mocs_test",	"mocs" },
> +static const char *live_tests[] = {
> +	"xe_bo",
> +	"xe_dmabuf",
> +	"xe_migrate",
> +	"xe_mocs"
>  };
>  
>  igt_main
> @@ -48,5 +43,5 @@ igt_main
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(live_tests); i++)
> -		igt_kunit(live_tests[i].kunit, live_tests[i].name, NULL);
> +		igt_kunit("xe_live_test", live_tests[i], NULL);
>  }
> 




