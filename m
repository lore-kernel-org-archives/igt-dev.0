Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F4AC3DA7F
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 09:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5000A10E167;
	Mon,  5 Aug 2024 09:18:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pd/7dWXD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A3810E167;
 Mon,  5 Aug 2024 09:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722849484; x=1754385484;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=B8b67RkMp74smO+8+hDcxq5O3rROa3BmLlB0P3NvUqs=;
 b=Pd/7dWXDWagGLTYwxlvuIhmtEj4DgMdpXyuh/4aXPNyeDscDw05J/4u+
 oNTAacT9+DC/Dq1aLGP/CVWbi+BJE+h0R9c/WxlS0WPlDyc+4PUXPB5E+
 /cmq5usjSJhiLuloZght6QleimEVsSudvg0JrLTH32bpIYdUL90HOV1+H
 XhxmpLYW4cxuJHzYduvYGfZWcbAuXgOez/k7Lu72SA4PD2gQ0N+C7U435
 BQBV+4dBxegprU8SubGABhqmOoydaBr30z+veiyOl0DqBzRfbzNNYCaRF
 egyz2xdO0h2jTMjcqNI+G/Aj+HuLdsPI7Fvz4C8wfIIVKF+csnOpY48ST A==;
X-CSE-ConnectionGUID: IYkTj4CCRC6jLOmNtupPQQ==
X-CSE-MsgGUID: WFGIp2PiQGuQeqG+AdHK+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="32174557"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="32174557"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 02:18:03 -0700
X-CSE-ConnectionGUID: DXpl1RkKQcudaytQchr9FQ==
X-CSE-MsgGUID: 7c2smREeTxSSHmtnOUTqSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="86671269"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 02:18:02 -0700
Date: Mon, 5 Aug 2024 11:17:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 Print version in lsgpu tool
Message-ID: <20240805091745.oxgiumbgpkjcqtqd@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240802092746.22001-1-kamil.konieczny@linux.intel.com>
 <172263085334.503738.829761789150155248@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172263085334.503738.829761789150155248@2413ebb6fbb6>
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
On 2024-08-02 at 20:34:13 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Print version in lsgpu tool
> URL   : https://patchwork.freedesktop.org/series/136841/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15173_full -> IGTPW_11523_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11523_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11523_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11523/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11523_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_ctx_persistence@smoketest:
>     - shard-rkl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15173/shard-rkl-1/igt@gem_ctx_persistence@smoketest.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11523/shard-rkl-4/igt@gem_ctx_persistence@smoketest.html
> 
>   * igt@i915_suspend@forcewake:
>     - shard-snb:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15173/shard-snb7/igt@i915_suspend@forcewake.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11523/shard-snb7/igt@i915_suspend@forcewake.html
> 
>   * igt@perf_pmu@most-busy-idle-check-all@rcs0:
>     - shard-mtlp:         [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15173/shard-mtlp-4/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11523/shard-mtlp-3/igt@perf_pmu@most-busy-idle-check-all@rcs0.html
> 

These are unrelated to a tool lsgpu.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11523_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-mtlp:         NOTRUN -> [SKIP][7] ([i915#8411])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11523/shard-mtlp-6/igt@api_intel_bb@object-reloc-purge-cache.html
>
...cut...
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7952 -> IGTPW_11523
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_15173: 974ee82a5f44e91fd93895cc12fb1e76e55b229a @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11523: 11523
>   IGT_7952: 7952
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11523/index.html
