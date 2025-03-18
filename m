Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A413C28B28
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 12:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B398E10E47B;
	Tue, 18 Mar 2025 12:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z79J50y4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D75010E46D;
 Tue, 18 Mar 2025 12:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742301370; x=1773837370;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=W7+3/B7CGUeyrGQqvIGoBIifETAxbzoBODcOAfwjHEo=;
 b=Z79J50y4D/B1KEceP126+4h9W9touvSkOnYZIa+ZbE1KMtBz4nwCKkGB
 6JImPzR64gufO/AcTYYe6WyhIzy9oWo/5W5RvTcUvj/a+sibYPBZZd6Px
 jLn4Cop3b1NhJVFAxjaVBYXFXokjYuTT9HCVhHiA2dHPNiSENfhPUQbzA
 IXc9StKiH32J+tEA9OMZBMR3SKHNQXnzoGyJydCWWBH6wceZqAJVA5HnT
 9HCNwOia1xbzePDn6YV+j84OAaML+tPqZsW0rLDa2GY6/D7aefiIHvubv
 18oZfuo4BCIiMLbr9yUIJ6iR3gJPhhrxcvvlyB1AoMR7NVmluQhdfebn3 Q==;
X-CSE-ConnectionGUID: JyOjT9XGQrGc542Tpisalg==
X-CSE-MsgGUID: pMMQhQysTAmC2B4IqUGx9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43541987"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="43541987"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 05:36:10 -0700
X-CSE-ConnectionGUID: 66w3mSZLRniJeBP0ZGFxjg==
X-CSE-MsgGUID: KKIGDN1DTxOqhmt2WNU6Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="127084012"
Received: from unknown (HELO [10.245.252.104]) ([10.245.252.104])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 05:36:09 -0700
Message-ID: <9b59e883-8cba-431f-9120-c11126bed834@linux.intel.com>
Date: Tue, 18 Mar 2025 13:36:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Close_sys?=
 =?UTF-8?Q?fs_and_debugfs_test_gap_between_i915_and_Xe?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250318095350.57133-1-peter.senna@linux.intel.com>
 <174230018303.48165.12984179128478197757@18a75f3d1eae>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174230018303.48165.12984179128478197757@18a75f3d1eae>
Content-Type: text/plain; charset=UTF-8
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

Dear I915,

On 18.03.2025 13:16, Patchwork wrote:
> == Series Details ==
> 
> Series: Close sysfs and debugfs test gap between i915 and Xe
> URL   : https://patchwork.freedesktop.org/series/146433/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8276_full -> IGTPW_12790_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12790_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12790_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12790/index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): shard-glk-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12790_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@blocking-wf_vblank@a-hdmi-a1:
>     - shard-tglu:         [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8276/shard-tglu-2/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12790/shard-tglu-9/igt@kms_flip@blocking-wf_vblank@a-hdmi-a1.html
> 
>   * igt@kms_flip@blocking-wf_vblank@a-hdmi-a2:
>     - shard-rkl:          NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12790/shard-rkl-3/igt@kms_flip@blocking-wf_vblank@a-hdmi-a2.html
> 
>   * igt@kms_flip@plain-flip-ts-check:
>     - shard-dg2:          [PASS][4] -> [FAIL][5] +3 other tests fail
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8276/shard-dg2-6/igt@kms_flip@plain-flip-ts-check.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12790/shard-dg2-5/igt@kms_flip@plain-flip-ts-check.html
> 
>   * igt@kms_flip@plain-flip-ts-check@a-edp1:
>     - shard-mtlp:         [PASS][6] -> [FAIL][7] +1 other test fail
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8276/shard-mtlp-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12790/shard-mtlp-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html
> 
>   * igt@kms_flip@plain-flip-ts-check@b-vga1:
>     - shard-snb:          [PASS][8] -> [FAIL][9] +2 other tests fail
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8276/shard-snb5/igt@kms_flip@plain-flip-ts-check@b-vga1.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12790/shard-snb4/igt@kms_flip@plain-flip-ts-check@b-vga1.html
> 
>   * igt@perf_pmu@busy-hang@bcs0:
>     - shard-mtlp:         [PASS][10] -> [DMESG-WARN][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8276/shard-mtlp-3/igt@perf_pmu@busy-hang@bcs0.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12790/shard-mtlp-7/igt@perf_pmu@busy-hang@bcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_flip@blocking-wf_vblank:
>     - shard-rkl:          [DMESG-WARN][12] ([i915#12964]) -> [FAIL][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8276/shard-rkl-7/igt@kms_flip@blocking-wf_vblank.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12790/shard-rkl-3/igt@kms_flip@blocking-wf_vblank.html

These are unrelated to my change. Please fix and re-run.

Thank you,

Peter
