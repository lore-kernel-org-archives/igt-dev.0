Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3841C48260
	for <igt-dev@archiver.kernel.org>; Thu,  8 Feb 2024 08:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02EAD10E258;
	Thu,  8 Feb 2024 08:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQDTnqp7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC79410E132
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2024 08:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707380588; x=1738916588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1OW0jEzxLY1XS/D7nVCFcV2mWJ0WKNMnRNaqzVdXRwg=;
 b=QQDTnqp7AOO0gtDTdjN12WMvmX6ODzStXMwrksKEK90jn5iWzTyYkocQ
 1T7Zv0sEdxstiGASiGVlwQVdbrCi32wtpGZwLIaw3cwHjzuy8vUtY6yar
 BG/CwwSBit7J0tdny8YtOU40Zn1yMDp8ToZ1JrTdN2dDc38k84KmJa+bK
 wuU5aEwoqyn5Tzr5vwQOzl/xeK0kPB7PxmXI2GgmkmZDusNsBFsY6Zxnv
 CxoQeKEVbCMg6XYgaE0qbGejm9IPEEDFXF/1J6HUg1VsTbOJ0J5y0wmpj
 idSBOgMwnoSPD9qWTUvt6CuhQwHeSLKyoQQliv8jAsU3Hf17ki9tIkUBO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="395585326"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; d="scan'208";a="395585326"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 00:23:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="824761498"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; d="scan'208";a="824761498"
Received: from karolcwi-mobl.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.ger.corp.intel.com) ([10.213.22.32])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 00:23:06 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, mchehab@kernel.org,
 kamil.konieczny@linux.intel.com,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_live_ktest: Rename subtest to match
 suite
Date: Thu, 08 Feb 2024 09:23:03 +0100
Message-ID: <48784957.MN2xkq1pzW@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240207224343.250877-1-lucas.demarchi@intel.com>
References: <20240207224343.250877-1-lucas.demarchi@intel.com>
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

On Wednesday, 7 February 2024 23:43:43 CET Lucas De Marchi wrote:
> The test suite name in the kernel modules contain an xe_ prefix.
> Upcoming changes for filtering will make the match more strict,
> so rename the subtests to match the test suite name. dmabuf subtest also
> needs an extra underscore to match the kernel side.
> 
> v2: s/xe_dmabuf/xe_dma_buf/ to really match test suite name (Janusz)
> 
> References: https://lore.kernel.org/igt-dev/3267150.N7aMVyhfb1@jkrzyszt-mobl2.ger.corp.intel.com/
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

> ---
>  tests/intel-ci/xe-fast-feedback.testlist |  6 +++---
>  tests/intel/xe_live_ktest.c              | 16 ++++++++--------
>  2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index d8fd66a45..6c01374c1 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -228,9 +228,9 @@ igt@kms_psr@psr-sprite-plane-onoff
>  igt@core_hotunplug@unbind-rebind
>  
>  # Run KUnit tests at the end
> -igt@xe_live_ktest@bo
> -igt@xe_live_ktest@dmabuf
> -igt@xe_live_ktest@migrate
> +igt@xe_live_ktest@xe_bo
> +igt@xe_live_ktest@xe_dma_buf
> +igt@xe_live_ktest@xe_migrate
>  
>  # Move fault_mode tests at the end to unblock execution
>  igt@xe_exec_fault_mode@twice-basic
> diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
> index 5f5f1dff7..bb612bae3 100644
> --- a/tests/intel/xe_live_ktest.c
> +++ b/tests/intel/xe_live_ktest.c
> @@ -9,23 +9,23 @@
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
> + * SUBTEST: xe_dma_buf
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
> @@ -37,10 +37,10 @@ struct kunit_tests {
>  };
>  
>  static const struct kunit_tests live_tests[] = {
> -	{ "xe_bo_test",		"bo" },
> -	{ "xe_dma_buf_test",	"dmabuf" },
> -	{ "xe_migrate_test",	"migrate" },
> -	{ "xe_mocs_test",	"mocs" },
> +	{ "xe_bo_test",		"xe_bo" },
> +	{ "xe_dma_buf_test",	"xe_dma_buf" },
> +	{ "xe_migrate_test",	"xe_migrate" },
> +	{ "xe_mocs_test",	"xe_mocs" },
>  };
>  
>  igt_main
> 




