Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23C2C36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 13:35:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EC8910E41A;
	Mon, 24 Mar 2025 13:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gFXWUfYY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26F610E419;
 Mon, 24 Mar 2025 13:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742823312; x=1774359312;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Jc9mAFAKfNz5f6hosts8XUNyvoZg8aAnx0kKfNJFQ3E=;
 b=gFXWUfYYpILgkaCJ0Wuj/vMhs0qidwmHectmEUwxUezofPyu1wAIXIUf
 wOzjyuHU1zw9aBMc+3lUTzpT1l24uCxlDDbcHfkCv+emPjRrmrpe5Dngr
 8ITdkFpRMI5qYaApyHfpA9tbjapLkzL+2pBvyn7WAM7Zsa5JGjO/SVmS8
 1D6cjH0uE9A/DCXo0Cg54mj11+JWXC+J7bNg2xfPHKwsRSN1/cKA2pmyV
 dUtjvpdF7ThIzAHavwuXPDFUL2X/6bWPDIztHD7WPZLGSlaCNPTnSBJA+
 fLM+3OhLw9GjFvryqpQLUlypC/NLNbi5gdW6Lzg86dV1vsH5H3qqE7rhQ w==;
X-CSE-ConnectionGUID: OidFWPiMRImnvf0C7C+ZJw==
X-CSE-MsgGUID: duT2K490QDKyJdPMPpPSig==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="54233557"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="54233557"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:35:11 -0700
X-CSE-ConnectionGUID: oqYg6axSR1ipk96jaIrfTw==
X-CSE-MsgGUID: 46u3/MZ4RGe9+3pcL2GsKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="124829545"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 06:35:09 -0700
Date: Mon, 24 Mar 2025 14:35:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 lib/iga64: miscelanious improvements
Message-ID: <20250324133507.fncn347gvu5obvft@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250314-iga64_misc-v1-0-b2d1337b808d@intel.com>
 <174204046417.39672.1350862335415220492@18a75f3d1eae>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174204046417.39672.1350862335415220492@18a75f3d1eae>
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
On 2025-03-15 at 12:07:44 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/iga64: miscelanious improvements
> URL   : https://patchwork.freedesktop.org/series/146324/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8275_full -> XEIGTPW_12782_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12782_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12782_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12782_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-dp-2:
>     - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8275/shard-bmg-7/igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-dp-2.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12782/shard-bmg-7/igt@kms_atomic_transition@plane-all-transition-nonblocking@pipe-b-dp-2.html
> 
>   * igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_decode1:
>     - shard-bmg:          NOTRUN -> [FAIL][3] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12782/shard-bmg-6/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_video_decode1.html
> 

Unrelated as this touches only compute for DG2.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12782_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#623])
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12782/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1466])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12782/shard-lnl-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
...cut...

>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8275 -> IGTPW_12782
> 
>   IGTPW_12782: 12782
>   IGT_8275: a851348546d61620c263d3292148f67620efa7d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2824-deccd667e475e826a1cdd91ab9aec4f897bd30c4: deccd667e475e826a1cdd91ab9aec4f897bd30c4
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12782/index.html
