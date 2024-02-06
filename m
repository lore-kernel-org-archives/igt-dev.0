Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E107DC48297
	for <igt-dev@archiver.kernel.org>; Tue,  6 Feb 2024 16:33:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818C610ECF0;
	Tue,  6 Feb 2024 16:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TugtIRX0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4204A10ECF0
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Feb 2024 16:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707237231; x=1738773231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y/5QI0XfB0FH99AeEZGzCEQ3IGKC2P3ovFQAMCrPAxU=;
 b=TugtIRX0ZbnzVCI/dKYoSLqmOyVMGe/CIqEwzu/7ACq8/uFtC4dmTTT6
 EHdJmmaR/z05jeu4Ui2MRJmSNpTA6fvOuGj/IZwP3Vun9cEqcEx9UfqpI
 8LKJwmiDUuKhvjtqgaocOT+8mbB2sRJzkI3DURGAq1wwJUlT4WIfVXajt
 PwgXqPmB1ZTEchW99igVqWtjxVFHnL4cSgHeNGRY3vJldcRUEzHspxFY1
 gYhHSkcY6h+EQDWfu33K+NnDoEfv+eahoKeBvGqa7RkdhEPqaPyHlnEup
 aA6yLIuvXMyhEw6PCu+EAgSR+U5D7jCb4ZSYJrEixPXIHNfH4TJ5doX9U Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="673496"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="673496"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 08:33:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1108626"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.2.162])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 08:33:49 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: =?UTF-8?B?4pyX?= CI.xeBAT: failure for lib/kunit: Support writable
 filter* parameters of kunit module (rev4)
Date: Tue, 06 Feb 2024 17:33:45 +0100
Message-ID: <2202702.NgBsaNRSFp@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <170721770211.1055288.15188107011819615537@5338d5abeb45>
References: <20240206101514.6897-10-janusz.krzysztofik@linux.intel.com>
 <170721770211.1055288.15188107011819615537@5338d5abeb45>
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

On Tuesday, 6 February 2024 12:08:22 CET Patchwork wrote:
> == Series Details ==
> 
> Series: lib/kunit: Support writable filter* parameters of kunit module (rev4)
> URL   : https://patchwork.freedesktop.org/series/129174/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7704_BAT -> XEIGTPW_10636_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_10636_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_10636_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_10636_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_live_ktest@bo:
>     - bat-adlp-7:         [PASS][1] -> [TIMEOUT][2] +2 other tests timeout
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7704/bat-adlp-7/igt@xe_live_ktest@bo.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10636/bat-adlp-7/igt@xe_live_ktest@bo.html

As a side effect of the last patch of the series, introduced in v4, when 
subtest names on IGT side don't match test suite names on the kernel side we 
are now apparently getting completely empty KTAP reports from the kernel when 
using a filter_glob string that doesn't match any test suite name.  As a 
result, the tests are waiting for the KTAP report to appear in dmesg 
indefinitely, until interrupted by igt_runner on timeout.

If you think those timeouts provide a good reason for dropping that last patch 
from the series (I don't) then please speak up.

Thanks,
Janusz

> 
>   * igt@xe_live_ktest@migrate:
>     - bat-pvc-2:          [PASS][3] -> [TIMEOUT][4] +2 other tests timeout
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7704/bat-pvc-2/igt@xe_live_ktest@migrate.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10636/bat-pvc-2/igt@xe_live_ktest@migrate.html
>     - bat-dg2-oem2:       [PASS][5] -> [TIMEOUT][6] +2 other tests timeout
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7704/bat-dg2-oem2/igt@xe_live_ktest@migrate.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10636/bat-dg2-oem2/igt@xe_live_ktest@migrate.html
>     - bat-atsm-2:         [PASS][7] -> [TIMEOUT][8] +2 other tests timeout
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7704/bat-atsm-2/igt@xe_live_ktest@migrate.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10636/bat-atsm-2/igt@xe_live_ktest@migrate.html
> 
>   
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7704 -> IGTPW_10636
>   * Linux: xe-734-3df53f864df3b874612fba223cfd30915009784f -> xe-736-b1651bcc3e78d3eca42061e8cf6bf1fea6843026
> 
>   IGTPW_10636: 10636
>   IGT_7704: 7704
>   xe-734-3df53f864df3b874612fba223cfd30915009784f: 3df53f864df3b874612fba223cfd30915009784f
>   xe-736-b1651bcc3e78d3eca42061e8cf6bf1fea6843026: b1651bcc3e78d3eca42061e8cf6bf1fea6843026
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_10636/index.html
> 




