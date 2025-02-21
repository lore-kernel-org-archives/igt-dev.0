Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C60C021AA
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 09:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8390910EA40;
	Fri, 21 Feb 2025 09:04:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GsX0Do98";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95ED410EA3F;
 Fri, 21 Feb 2025 09:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740128667; x=1771664667;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Gu43Ecq/hIjFTOJCa7dLT0HSRWFqrCWsRpmCtJ7lAxA=;
 b=GsX0Do98hSYyDvPV1q/EuDC2CNMvxEaef7t5XqMczLeKWUA0F/doLfoQ
 ZqGD4jhrvr3MUzlXAdYO0s+GZbPhVgXSRnBwXWpODVfnzOBGNhg78gQgk
 dmQTMyuVCZ3xkQ6El1T3I/41tT64J5Jv6+K2TGddatV90lHaPjjJslQ7F
 4t4bo8Tp9DixpqU5P7/woGkiLIMazUmxILVnf1iaKzMGpfSLKNGfxft4t
 GwN8lyAQbLW0aGP3NdEKBMxcb7eBGbAsrVaDUgbcb7eF+XrjhU+soWT1Q
 OGIZrChPqfOKOIIEbisbc4fJNNSzPfZL+z7g6gy+hLk/k1j3wJaJkXFTw g==;
X-CSE-ConnectionGUID: CPc6MYorQFiKqU3ucjJBsA==
X-CSE-MsgGUID: 28xQPYDgT+uqFQ/MduAOQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41147363"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41147363"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 01:04:27 -0800
X-CSE-ConnectionGUID: mx1M6D4HRoy2uegk5QICCQ==
X-CSE-MsgGUID: D/In/PEQTMySqQqtdble/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; d="scan'208";a="115143749"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 01:04:26 -0800
Date: Fri, 21 Feb 2025 10:04:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 tools/intel_reg: Add --pci-slot option (rev2)
Message-ID: <20250221090409.vjrfd6vz3rz66isu@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250219121050.71831-1-kamil.konieczny@linux.intel.com>
 <174009275333.297946.7137604893102913240@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174009275333.297946.7137604893102913240@b555e5b46a47>
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
On 2025-02-20 at 23:05:53 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tools/intel_reg: Add --pci-slot option (rev2)
> URL   : https://patchwork.freedesktop.org/series/144206/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8240_full -> XEIGTPW_12637_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12637_full absolutely need to be
>   verified manually.

Unrelated to tools change, no test nor lib changed.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12637_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12637_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12637/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d:
>     - shard-dg2-set2:     [PASS][2] -> [INCOMPLETE][3] +1 other test incomplete
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8240/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12637/shard-dg2-463/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-d.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-bmg:          [PASS][4] -> [SKIP][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8240/shard-bmg-8/igt@xe_live_ktest@xe_dma_buf.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12637/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     [DMESG-WARN][6] ([Intel XE#4330]) -> [DMESG-WARN][7]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8240/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12637/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     [SKIP][8] ([Intel XE#314]) -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8240/shard-dg2-434/igt@kms_cdclk@mode-transition-all-outputs.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12637/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12637_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
>     - shard-dg2-set2:     [PASS][10] -> [DMESG-WARN][11] ([Intel XE#4330]) +23 other tests dmesg-warn
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8240/shard-dg2-466/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12637/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html
 
...cut...

> Build changes
> -------------
> 
>   * IGT: IGT_8240 -> IGTPW_12637
> 
>   IGTPW_12637: 8bb0f4666cbeb80bf4139a6bfb9e1580e22450bf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8240: aa097b2264d0eae71f718791f83097d979ddf8b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6: e19eb43c82480789a93ce0c452e22bbd851b93c6
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12637/index.html
