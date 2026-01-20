Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BFBD2ECF7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 09:11:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAC410E592;
	Tue, 20 Jan 2026 09:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bZGPjsLp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086B710E591;
 Tue, 20 Jan 2026 09:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768900261; x=1800436261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=clMp0YUeBWjvuHCYutZKm9sLYKEb3OmLpAw3Vr4ZHcM=;
 b=bZGPjsLprB/WF//Ob97W0N+7aLfucJc2/UP8NLjHe3sf9kuLOisKQ5YX
 /MmVpXR9iLgCzucnecJRBi18lIvLnESGbwOG47wM7px3H6oCF8AZps7cq
 hbyfpEMK9mSmD3sYKdvQYKMnDvdWDTeiBiijVjunaRTWUh0UhWkZ8wHFR
 jXZmnjU0IFTP+tBAhw+ysJ5+HJgvTkj1tw5XxZlPNluV0jrAfUcosCdSc
 egveC3SFuMr7wvDDbLA9WZCn9wq27IUPcEZm+BHv7bUaWsEEfn/u16lGV
 9FV/XI4I2eCwNfgraA/q2zLrtyqp60dYV5eJPRwUXCrI1nyBjdAutMx+t A==;
X-CSE-ConnectionGUID: c0dzkGntTJqkVDguHwxXxA==
X-CSE-MsgGUID: 8Px9NyRbTX6ul6dIajVoHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="92766550"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="92766550"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 01:11:00 -0800
X-CSE-ConnectionGUID: lVb4qRbMT2eoFUE5xtcrFA==
X-CSE-MsgGUID: PoMfgTIfTeOUfcythzp0bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="206413439"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.70])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 01:10:59 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= i915.CI.Full: failure for
 tests/intel/gem_lmem_swapping:
 Avoid false failures from oom-killer (rev8)
Date: Tue, 20 Jan 2026 10:10:57 +0100
Message-ID: <2778826.KRxA6XjA2N@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <176887552915.169327.12057879371263442688@a3b018990fe9>
References: <20260119101735.1328416-2-janusz.krzysztofik@linux.intel.com>
 <176887552915.169327.12057879371263442688@a3b018990fe9>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi I915-ci-infra@lists.freedesktop.org,

On Tuesday, 20 January 2026 03:18:49 CET Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/gem_lmem_swapping: Avoid false failures from oom-killer (rev8)
> URL   : https://patchwork.freedesktop.org/series/159160/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8706_full -> IGTPW_14370_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14370_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14370_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14370/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14370_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1:
>     - shard-tglu:         [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8706/shard-tglu-9/igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14370/shard-tglu-2/igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1:
>     - shard-tglu:         [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8706/shard-tglu-9/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14370/shard-tglu-2/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1.html

The change under this pre-merge testing only touches 
igt@gem_lmam_swapping@smem-oom.  The above are not related.  Please update 
filters and re-report.

Thanks,
Janusz

> 
>   
> New tests
> ---------
...


