Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A303DC3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 18:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C71310E91C;
	Thu,  1 Aug 2024 18:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GI8MRVml";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EBE10E91B;
 Thu,  1 Aug 2024 18:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722537629; x=1754073629;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Hrcc3aDn271wY/YWClWYE+E4iZ6XqpMyh/WMkqsSTfE=;
 b=GI8MRVmlm1VHGUnPi7I1yiSBiqafsEtC6FvPhrmgo+KRujvFKyskrT/1
 2n13OMrmT2y24kj19Py4/sh8k4+355NkSPueQlUtHhQP+I+kEaEvk9gVW
 OUxQprYdyq2HqE96WBM+MgeBA2H6C8JF7pelUk4sO7287bOgpn6cETuXf
 YRULAa3MfNhahTj5lpHsMQX+lhmyXhZ4G2vafDNbkDZlIyOoOt4VDZk50
 gQlTxAiMM96AGXFIrlTgyQJYu70czT6Ysc3aQL8Ayg4k/GMo0lCQ9ykVB
 TL9K6rs3qiwm9UsA3X7DSk32x9CvEZBjnQRFqn07iMJ622/qND1NtFVu3 Q==;
X-CSE-ConnectionGUID: RCbNoLj0TxaL905ibe3e2A==
X-CSE-MsgGUID: lUm7Tj1OTS26v8QsSEkViA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24291680"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="24291680"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 11:40:28 -0700
X-CSE-ConnectionGUID: cPHc9Fm/TbSyfx2N+9WJJQ==
X-CSE-MsgGUID: 0Q8czQ4YSIqTTVFGbN/1VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="55061212"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 11:40:27 -0700
Date: Thu, 1 Aug 2024 20:40:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org,
 Ewelina Musial <ewelina.musial@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for Add
 sysfs node checks for gt_freq and pm_residency tests
Message-ID: <20240801184008.hexaqma7zzbblgl2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org,
 Ewelina Musial <ewelina.musial@intel.com>
References: <20240801143848.509164-1-marcin.bernatowicz@linux.intel.com>
 <172253382979.488729.17173470171343744431@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172253382979.488729.17173470171343744431@2413ebb6fbb6>
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

Hi igt-dev,
On 2024-08-01 at 17:37:09 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add sysfs node checks for gt_freq and pm_residency tests
> URL   : https://patchwork.freedesktop.org/series/136802/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7950_full -> XEIGTPW_11516_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11516_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11516_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 4)
> ------------------------------
> 
>   Additional (1): shard-bmg 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11516_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_getversion@all-cards:
>     - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-dg2-432/igt@core_getversion@all-cards.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11516/shard-dg2-433/igt@core_getversion@all-cards.html
> 
>   * igt@kms_pm_rpm@basic-rte:
>     - shard-lnl:          [PASS][3] -> [SKIP][4] +2 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-8/igt@kms_pm_rpm@basic-rte.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11516/shard-lnl-5/igt@kms_pm_rpm@basic-rte.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-lnl:          [PASS][5] -> [FAIL][6] +3 other tests fail
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-4/igt@kms_vrr@flipline.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11516/shard-lnl-5/igt@kms_vrr@flipline.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-lnl:          [SKIP][7] ([Intel XE#1439]) -> [SKIP][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7950/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11516/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 

Above errors and warning are unrelated.

>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4:
>     - {shard-bmg}:        NOTRUN -> [DMESG-WARN][9] +13 other tests dmesg-warn
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11516/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4.html
> 
>   * igt@kms_content_protection@legacy:
>     - {shard-bmg}:        NOTRUN -> [FAIL][10] +16 other tests fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11516/shard-bmg-8/igt@kms_content_protection@legacy.html
> 
>   * {igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3}:
>     - {shard-bmg}:        NOTRUN -> [INCOMPLETE][11] +4 other tests incomplete
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11516/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html
> 
>   * igt@kms_sequence@get-idle:
>     - {shard-bmg}:        NOTRUN -> [SKIP][12] +207 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11516/shard-bmg-6/igt@kms_sequence@get-idle.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - {shard-bmg}:        NOTRUN -> [TIMEOUT][13] +6 other tests timeout
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11516/shard-bmg-5/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11516_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_7950 -> IGTPW_11516
>   * Linux: xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055 -> xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a
> 

This is again changing both IGT and xe kmd build or
am I missing something?

+cc Ewelina.

Regards,
Kamil

>   IGTPW_11516: de49f37570efa660431bbd43d61608c690e92953 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7950: 7950
>   xe-1699-6d89c6866adbcecfc3ca559d1bdef8be50805055: 6d89c6866adbcecfc3ca559d1bdef8be50805055
>   xe-1704-abbcf7af3bd79f8729a6dba72674a81730f97f8a: abbcf7af3bd79f8729a6dba72674a81730f97f8a
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11516/index.html
