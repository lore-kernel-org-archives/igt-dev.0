Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA21C02183
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jan 2025 14:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868BD10E36A;
	Tue, 14 Jan 2025 14:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCloboB3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E68D10E35D;
 Tue, 14 Jan 2025 14:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736865157; x=1768401157;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bGn68I2W6HBull32Ji832CLkTw9ybAKguFmaVSRlra4=;
 b=gCloboB3HzTtnydvvo/z6nQjFndcMC4SZnefaQlLhCIBNxlvJIt8vBlh
 3q63gACA8n94AVaWqNct+psPbMB+9Iy1H1L5exOo/f1EqiBuOeN3npMRk
 +ZdvytBofCKJ7LWUqYoHExLMZpy0Rtq1c8ccGEcTXBrtvLpzoe3klZrL8
 xe1W9VUcWMgMa5QBjwYVluxBjUzcMOPkl/Tzb5fwopT0A/WQAD37UKRpN
 YHx5itd7QDtb+8ufzzQV18H5h9r53LP6LsvKfhMOW7OKGp6Eut9tE+bDp
 4jsAVTMFE9GvXzwQ+/5c2ETmSUKNqWcjJmsiaRnhMdRiHs86ipuhHW2bu g==;
X-CSE-ConnectionGUID: J9KSddyvQwOYak6LpYOxIA==
X-CSE-MsgGUID: 5stGieezTfmG2GIeTVfETw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="40926656"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="40926656"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 06:32:36 -0800
X-CSE-ConnectionGUID: 5+PVoQunTjibSX4DfSXWvA==
X-CSE-MsgGUID: PzscafmpT++6NJW4rOOrTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="142100307"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 06:32:35 -0800
Date: Tue, 14 Jan 2025 15:32:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib=2Fmes?=
 =?utf-8?B?b24uYnVpbGQ6?= allow build IGT with link time optimization (rev2)
Message-ID: <20250114143232.4hn3axioqkibcpqr@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250109-fix-lto-v2-1-3dc74d60a124@intel.com>
 <173671755098.3015349.14059085318624153320@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173671755098.3015349.14059085318624153320@b555e5b46a47>
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
On 2025-01-12 at 21:32:30 -0000, Patchwork wrote:

unrelated to this patch, no need for respin.

Regards,
Kamil

> == Series Details ==
> 
> Series: lib/meson.build: allow build IGT with link time optimization (rev2)
> URL   : https://patchwork.freedesktop.org/series/142655/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15931_full -> IGTPW_12419_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12419_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12419_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12419/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12419_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
>     - shard-mtlp:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15931/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12419/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-dg1:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15931/shard-dg1-12/igt@perf_pmu@module-unload.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12419/shard-dg1-17/igt@perf_pmu@module-unload.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12419_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][5] ([i915#8411]) +1 other test skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12419/shard-dg2-8/igt@api_intel_bb@object-reloc-purge-cache.html
>     - shard-rkl:          NOTRUN -> [SKIP][6] ([i915#8411])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12419/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#11078])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12419/shard-rkl-7/igt@device_reset@unbind-cold-reset-rebind.html

...cut...

> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12419/index.html
