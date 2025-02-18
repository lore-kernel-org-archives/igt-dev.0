Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE34C02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 15:50:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C16610E728;
	Tue, 18 Feb 2025 15:50:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCzqXpnG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CBC10E0D9;
 Tue, 18 Feb 2025 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739893852; x=1771429852;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=maMnhsEWGui8mzzU1fnckShLXjgISuGXQk8zmWQATH4=;
 b=fCzqXpnGx6UDqeidKtSQJJ6lQPsIiBmdjOYrxLBHv/z/lAJsMGuuCt35
 KyWVk8ay7rz9W5ZZHtdV8yVlaCsTAN/Wi8YVpxtDXHugZL7XnpyOnCLj4
 lyLzt1LFzY/p14JVq+ilCFKjAotYPSPPjHdbIKvWvOqdDhnneMK1WcoLp
 bFrlh/31rroEbQ7jGvnuNrSU1JopJCnqWxsHEVwkKj9FxX/C5dVPoqb1B
 TRXJHYjSigQyAu3EMPBCJIWmdG8RxCtMyl2C1xnxW/7NUseMT4P4hwl95
 gy14/tZL8mxUPfRLTg9BSDHE5mMPlFVH+a9scMUJQxpXfHWq9JgbJekUn g==;
X-CSE-ConnectionGUID: kVjqdO7nRtiwgi3Wm91mdw==
X-CSE-MsgGUID: GSmifCqrTzOcib5fXY6PVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44245395"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44245395"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 07:50:52 -0800
X-CSE-ConnectionGUID: SG8+OEM/QPuY+DqpIxpbRg==
X-CSE-MsgGUID: URIVli/FQSa7mRRRHZyizw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119641162"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 07:50:50 -0800
Date: Tue, 18 Feb 2025 16:50:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm8=?= =?utf-8?Q?r?=
 tests/intel/i915_fb_tiling: convert to subtest basic-x-tiling
Message-ID: <20250218155035.oungqjrigvnaojua@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250217173149.157360-1-kamil.konieczny@linux.intel.com>
 <173988634011.3574365.14346100315712020454@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173988634011.3574365.14346100315712020454@b555e5b46a47>
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
On 2025-02-18 at 13:45:40 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/i915_fb_tiling: convert to subtest basic-x-tiling
> URL   : https://patchwork.freedesktop.org/series/144971/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8235_full -> XEIGTPW_12616_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12616_full absolutely need to be
>   verified manually.

Unrelated to i915 test, no need for re-run.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12616_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12616_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@test-cursor@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12616/shard-lnl-7/igt@kms_async_flips@test-cursor@pipe-b-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
>     - shard-dg2-set2:     [PASS][2] -> [DMESG-WARN][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8235/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12616/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-bmg:          NOTRUN -> [SKIP][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12616/shard-bmg-6/igt@xe_live_ktest@xe_dma_buf.html
> 
>   * igt@xe_live_ktest@xe_migrate:
>     - shard-bmg:          [PASS][5] -> [SKIP][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8235/shard-bmg-5/igt@xe_live_ktest@xe_migrate.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12616/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html
> 
>   * igt@xe_sriov_scheduling@equal-throughput:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12616/shard-dg2-463/igt@xe_sriov_scheduling@equal-throughput.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     [SKIP][8] ([Intel XE#314]) -> [FAIL][9]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8235/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12616/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_color@deep-color:
>     - shard-dg2-set2:     [INCOMPLETE][10] ([Intel XE#4346]) -> [DMESG-WARN][11]
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8235/shard-dg2-434/igt@kms_color@deep-color.html
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12616/shard-dg2-463/igt@kms_color@deep-color.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12616_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotunplug-rescan:
>     - shard-lnl:          NOTRUN -> [ABORT][12] ([Intel XE#3914]) +1 other test abort
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12616/shard-lnl-8/igt@core_hotunplug@hotunplug-rescan.html
> 
...cut...

>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8235 -> IGTPW_12616
>   * Linux: xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5 -> xe-2677-c282b8face163244076dac30e4c9ffd74dc89044
> 
>   IGTPW_12616: 12616
>   IGT_8235: e7e14eff66bc42329903ee579f019094cf1fdfce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5: 297dc497ff4e957b8a82d4d9f67631e322bdd2a5
>   xe-2677-c282b8face163244076dac30e4c9ffd74dc89044: c282b8face163244076dac30e4c9ffd74dc89044
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12616/index.html
