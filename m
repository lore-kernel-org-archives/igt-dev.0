Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4D3C47DB3
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 12:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE0410E767;
	Fri,  2 Feb 2024 12:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IxVlKbRC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4451A10E213
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2024 12:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706875220; x=1738411220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lb2+CVIPuXmMQQnK9JgjDR9duarQdwr2r3WPl6SjiZg=;
 b=IxVlKbRCnqguSiYNPCDBlSzzYyehDttHpiHvsy14FfsQ3dz/9CA01ijv
 tPbP4Q1bsM9l2mtOBunRPCUanf7nHqwQ91vv0SSBTHX2/vm8ml4yKdJtS
 7dEGldaYEEmJV8f11EX8AvhmgHIwNAESyEjL9FALS4no8VLatyVl1FSFn
 kJKNRvl5oRvhE6h7dl1L5p/1GaCI3/tdiBMNre97ORhy7JKmPUO3h2bnz
 57qrMgUVAvGdK2MuAR0LJDc1FAt/t8ve59lYNcFHM8zL2X3gkmeWlcAQt
 GWQk0DACn31uczmsfpLDcdPn6kKql2dzea3c8e86XOOeJORqd2kz5/Pr3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="309222"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="309222"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 04:00:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="37492112"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.2.73])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 04:00:18 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t 2/2] xe_live_ktest: Use xe_live_test kernel module
Date: Fri, 02 Feb 2024 13:00:14 +0100
Message-ID: <3493194.som1txNFv6@jkrzyszt-mobl2.ger.corp.intel.com>
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

Both the KUnit module name and the IGT test name clearly indicate they are 
strictly related to Xe.  Then, I think that shorter subtest names, without the 
xe_ prefix, are better in that narrow name space.  Couldn't we then rename 
test suits on the kernel side instead of adding that redundant prefix also to 
IGT subtest names?

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




