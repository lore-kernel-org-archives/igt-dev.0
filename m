Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE2EC021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 16:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7928610E43A;
	Tue, 18 Feb 2025 16:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJKMFeGL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E87510E3F9;
 Tue, 18 Feb 2025 16:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739895177; x=1771431177;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/hTPu/RLOLnCdHDGTkCL939zF52GhKcVAOq8KNj6ctA=;
 b=HJKMFeGL2pZr0sEj1aoT/UIb0hXbjcE4HBSmJlmRGt0TP2rMDGZdy/f1
 vT0Fp7cphe9rPuSmFmFWVyWhW5WfaNJO2eH9+UJ4SUTXWhcBdh/i7QnoE
 HZ+61hskMxzC7AyYyER3Dp6m/FEBoaPpKkQ2V6dl3e/yR5W6sSEC7ghXj
 okzylDboYuv/Ag7FZwX+DSLVK8kkWEDrizJzq/MJ1t123Z5oGnRgT5JOE
 nCj5ID8bTqpO/jNfGNNfgWA8HweHRbOxX0g1P0r+etPk9rck0ZsnBxoj1
 itkBJ6RewOOVYr8rarAHty/58Fgf2DyE7SrsNBld+V7pqNzagMPAt/zcV Q==;
X-CSE-ConnectionGUID: Ex83F+9DQqmUJbxoivB9FA==
X-CSE-MsgGUID: nKZVbYNZTrO/w05HEFESsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44248142"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="44248142"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 08:12:57 -0800
X-CSE-ConnectionGUID: GWGWimpaRyuei/aO2GdnoA==
X-CSE-MsgGUID: RY+aOHf+T0ell5BRE1fvyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119651808"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 08:12:56 -0800
Date: Tue, 18 Feb 2025 17:12:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 tools: rename lsfacts into igt_facts
Message-ID: <20250218161253.tnnzes5c6ieempno@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250217133229.104948-1-kamil.konieczny@linux.intel.com>
 <173984910881.3442418.13000177992068879180@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173984910881.3442418.13000177992068879180@b555e5b46a47>
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
On 2025-02-18 at 03:25:08 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tools: rename lsfacts into igt_facts
> URL   : https://patchwork.freedesktop.org/series/144952/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8235_full -> XEIGTPW_12614_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12614_full absolutely need to be
>   verified manually.

Unrelated to tools change, no test nor lib changed.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12614_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12614_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-bmg:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12614/shard-bmg-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
>     - shard-lnl:          NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12614/shard-lnl-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12614/shard-dg2-433/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
>     - shard-lnl:          [PASS][4] -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8235/shard-lnl-3/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12614/shard-lnl-2/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html
> 
>   * igt@xe_sriov_scheduling@equal-throughput:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][6] +2 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12614/shard-dg2-463/igt@xe_sriov_scheduling@equal-throughput.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12614_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_hotunplug@hotunplug-rescan:
>     - shard-lnl:          NOTRUN -> [ABORT][7] ([Intel XE#3914]) +1 other test abort
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12614/shard-lnl-8/igt@core_hotunplug@hotunplug-rescan.html
> 

...cut...

>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8235 -> IGTPW_12614
>   * Linux: xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5 -> xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95
> 
>   IGTPW_12614: fcf3a4bab154798c24335cdce60a7f91c5e8ddb3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8235: e7e14eff66bc42329903ee579f019094cf1fdfce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5: 297dc497ff4e957b8a82d4d9f67631e322bdd2a5
>   xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95: 2269ae390491a4d5ba7f0b86befde426a9eedd95
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12614/index.html
