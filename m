Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A8BC4828F
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 19:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B0C10E81F;
	Wed,  7 Feb 2024 19:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XPG7DHk4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F90F10E724
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 19:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707335979; x=1738871979;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i1wxU1o7KPDeW6FSF7U24mdBkXPqLny0gNDaT/TjH7Q=;
 b=XPG7DHk45yDL3fP9KFeBGJogpsx8f60AxSqH+K53yhwoF805TNppdhvO
 hamkXzbcq6Dturomydq5WvSdSDd/Gv3mdYu/JD1qAbw1mT5fji4HD/Czz
 0eNZlUdyCz8KdsW0PPoaf3HbW8zYGX0VUj2DBLgpzIJ3YNDRbp2NiZ1IG
 6G6SjBgeU02h3L/rFQQ5ifb/NmVBnbUHw3UrsTsnbACcqWych+1UBRvPj
 5y041W/2rlO3SGDMNTPMqWWnIz6iciaXBRbqYN+7rCMLhtp+iOZcak9PF
 4hANFTZx5We+lpOXqfK+dCfPsG4gkqjTZwllI6HwCfsvHvgSLsACoRDr0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="4931322"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="4931322"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 11:59:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1739248"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.22.5])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 11:59:36 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_live_ktest: Rename subtest to match
 suite
Date: Wed, 07 Feb 2024 20:59:24 +0100
Message-ID: <38805745.J2Yia2DhmK@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240207185925.235046-1-lucas.demarchi@intel.com>
References: <20240207185925.235046-1-lucas.demarchi@intel.com>
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

Hi Lukas,

On Wednesday, 7 February 2024 19:56:59 CET Lucas De Marchi wrote:
> The test suite name in the kernel modules contain an xe_ prefix.
> Upcoming changes for filtering will make the match more strict,
> so rename the subtests to match the test suite name.
> 
> References: https://lore.kernel.org/igt-dev/3267150.N7aMVyhfb1@jkrzyszt-mobl2.ger.corp.intel.com/
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> 
> build tested only, let's see what CI returns
> 
>  tests/intel-ci/xe-fast-feedback.testlist |  6 +++---
>  tests/intel/xe_live_ktest.c              | 16 ++++++++--------
>  2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index d8fd66a45..b5e96d536 100644
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
> +igt@xe_live_ktest@xe_dmabuf

AFAICS, the corresponding test suite is named "xe_dma_buf".  If you prefer 
"xe_dmabuf" then we have to fix that also on the kernel side.

Otherwise, LGTM.

Thanks,
Janusz

> +igt@xe_live_ktest@xe_migrate
>  
>  # Move fault_mode tests at the end to unblock execution
>  igt@xe_exec_fault_mode@twice-basic
> diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
> index 5f5f1dff7..4b8e60676 100644
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
> @@ -37,10 +37,10 @@ struct kunit_tests {
>  };
>  
>  static const struct kunit_tests live_tests[] = {
> -	{ "xe_bo_test",		"bo" },
> -	{ "xe_dma_buf_test",	"dmabuf" },
> -	{ "xe_migrate_test",	"migrate" },
> -	{ "xe_mocs_test",	"mocs" },
> +	{ "xe_bo_test",		"xe_bo" },
> +	{ "xe_dma_buf_test",	"xe_dmabuf" },
> +	{ "xe_migrate_test",	"xe_migrate" },
> +	{ "xe_mocs_test",	"xe_mocs" },
>  };
>  
>  igt_main
> 




