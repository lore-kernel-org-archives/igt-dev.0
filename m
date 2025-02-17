Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748A6C021A0
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 08:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3332A10E26D;
	Mon, 17 Feb 2025 08:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="efK5WReW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC38B10E26D;
 Mon, 17 Feb 2025 08:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739782310; x=1771318310;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DyF2gEHlX1PqdzhuQkwXScZ+pULvkHgAhc8MVYfHoN4=;
 b=efK5WReWedaFCakyXZvChZtFLcGWjZ8YVpITR4LGz4scCW72lmGSJo1T
 +iYJQ3KzsB7W5HGf34Nit9WDXl64m3MJgON7Wtc5hbQxF161EBhr3/Ym6
 gttVr5/cuxLltriDUy8/QXDStcPyevagW+pR+1d6Z4JgydAVix+v2G/ZS
 5AnPnbNELPRCs/NrqL9whD6D9tfcBXwY65jxrchSF70Pi1K7NC+Q/vA0r
 xBbNltWGqEtp5+u8/hf5g43+ZKPhnrdbWulf/Xr1+CguskJ4OvuLU7RqC
 oi206pd9PxIMIhVvibzk6Xq1o0wauydJRp3ylFcyoFk63VW/Qr30/GdY8 A==;
X-CSE-ConnectionGUID: UL9WbNztSDiofTCJNW2T4A==
X-CSE-MsgGUID: vYevf4bNTzSjiT7uclm/Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="57985703"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="57985703"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:51:50 -0800
X-CSE-ConnectionGUID: atP6JTEXTwujd0Dzh4D+NA==
X-CSE-MsgGUID: 8+HNJMTIQZ6RtMXIpWdr3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="114690180"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 00:51:49 -0800
Date: Mon, 17 Feb 2025 09:51:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/kms_color: Disable CTM at the end of CTM tests
Message-ID: <20250217085147.bhl3gszxzkpd2wor@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250214-disable-cwb-v2-1-d01f7a100748@quicinc.com>
 <173959545432.2331501.17464903189778793128@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173959545432.2331501.17464903189778793128@b555e5b46a47>
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
On 2025-02-15 at 04:57:34 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_color: Disable CTM at the end of CTM tests
> URL   : https://patchwork.freedesktop.org/series/144911/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16138_full -> IGTPW_12605_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12605_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12605_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12605/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12605_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rps@reset:
>     - shard-snb:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16138/shard-snb6/igt@i915_pm_rps@reset.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12605/shard-snb5/igt@i915_pm_rps@reset.html
> 

Unrelated, no need for rerun.

Regards,
Kamil

>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_16138_full and IGTPW_12605_full:
> 
> ### New IGT tests (3) ###
> 
>   * igt@kms_cursor_edge_walk@128x128-left-edge@pipe-d-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.23] s
> 
>   * igt@kms_cursor_edge_walk@256x256-right-edge@pipe-c-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.62] s
> 
>   * igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.60] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12605_full that come from known issues:
> 
...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8230 -> IGTPW_12605
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_16138: cbd747025a1ef985e1ebfa040aa0da4a5d77aacd @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12605: 958298e5eaff0eaeb07c632b08acf4cbb191e84e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8230: 8230
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12605/index.html
