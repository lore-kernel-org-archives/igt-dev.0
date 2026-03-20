Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77D61098797
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 15:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7376510E1D6;
	Fri, 20 Mar 2026 15:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAjLnHUo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1179D10E1D6;
 Fri, 20 Mar 2026 15:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774019189; x=1805555189;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eIjwC868oyh1xkgr506nUSwmu7YJ4Ulcmmy97Qyj1x4=;
 b=RAjLnHUoiCuAodotb1ikhP1D5om1ZnJ9HyAl/YeaIXYoMwBiTPGPaAb1
 T+PyVhNmlEwuGnidkNSTegu+T01xNPq5w8fCSVxQdYQi90oUD+ScQXIkY
 2bBuvslblDfPK1q36LSFZe2FQFKR7DgNTYMeqqDBWDJm0SRlP9TP8I2gB
 nA3btQiBdvSFYLX3Q8GvnEIDyBEiolswdolezksag4XOswqfcYjQw5oin
 NCS1B9mnjHhHohSB1WqCxZxJG2y/AZKOXyFsuTadmtwR2S1/kZNWfRk+L
 sYUpIyhrKb50HkmaNSUhLNkXZzzgu5SXXPwKJ02D+jTdAKmkc/MlzEGbx g==;
X-CSE-ConnectionGUID: 4K7jd7IvQU+CYyDp201H3w==
X-CSE-MsgGUID: JCsAimk7T8uhwAQxdx2yWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="74285128"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="74285128"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 08:06:29 -0700
X-CSE-ConnectionGUID: d0wd9xlYRY+e5oe80oSN0g==
X-CSE-MsgGUID: gYv6i22sQbSARGiC8MgZEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="223529697"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 08:06:27 -0700
Date: Fri, 20 Mar 2026 16:06:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xiandong Wang <xiandong.wang@mediatek.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 tests/kms_cursor_legacy: relax checks on MTK
Message-ID: <20260320150613.wjnz2lqf3amona2r@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Xiandong Wang <xiandong.wang@mediatek.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260317084024.9036-1-xiandong.wang@mediatek.com>
 <177389216481.373904.12962110847463549303@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177389216481.373904.12962110847463549303@a3b018990fe9>
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
On 2026-03-19 at 03:49:24 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_cursor_legacy: relax checks on MTK
> URL   : https://patchwork.freedesktop.org/series/163364/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_18167_full -> IGTPW_14791_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14791_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14791_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14791/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14791_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_balancer@full-late-pulse:
>     - shard-mtlp:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18167/shard-mtlp-8/igt@gem_exec_balancer@full-late-pulse.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14791/shard-mtlp-8/igt@gem_exec_balancer@full-late-pulse.html
> 

Not related to tests/kms_cursor_legacy

Regards,
Kamil 

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_18167_full and IGTPW_14791_full:
> 
> ### New IGT tests (5) ###
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-3:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-3:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-c-dp-3:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-3:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.47] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14791_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][3] ([i915#8411])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14791/shard-dg1-14/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
...cut...
