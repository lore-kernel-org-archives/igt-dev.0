Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E39CA5FC7
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 14:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C2D10E25C;
	Wed, 30 Sep 2026 14:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ck6s05/U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB24B10E25C;
 Wed, 30 Sep 2026 14:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790778246; x=1822314246;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0ioJkJtxHDFhS6fYwJ7ExltTrPv5cmcnqQP4Wzdi75U=;
 b=ck6s05/Uc608eVLPLTm+wqZEM2qtxghlJXEq//SVyoaHfYasuY3yMsiA
 DAIHc6QG1X6T+8glPxD9sPD96h6fjvZK12gfYPkAIENEL3IanpLTHlAkZ
 JLhSKxpFzSVvbq0Pybo03kqP6Z3k8631TgdMqC/kdGEhJkmo3gkn6B1py
 fGKuy6UbvevZB5Dp8hHYtsjTYWbFfTiplK72sQOkipOjnfzpO+4tgL0KE
 HMNtaR8gfBGvHerO/7z+NwqW7sQoAR8aK72eWuFg5OLvT3WpXIPfRKgGN
 7IWle4518E6Svuk9enkCoJlwX/Rx56FnkXsmLYB89KhAi98NnURK8XcRZ w==;
X-CSE-ConnectionGUID: VeZInrMSTWOrGQZlXIwezg==
X-CSE-MsgGUID: 5jzzulIkQMmi/1Ef2v0J8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="102889868"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="102889868"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 07:24:05 -0700
X-CSE-ConnectionGUID: 12RmE5UkT/KYuQXiRXIIlA==
X-CSE-MsgGUID: bZYjRw2WRRGEdjhHA+0Byw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="280464910"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:24:04 -0700
Date: Wed, 30 Sep 2026 16:24:02 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alex Hung <alex.hung@amd.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 Preserve const qualifiers in string parsing (rev2)
Message-ID: <20260930142402.yu3drfevijqhgm22@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260929154950.838280-1-alex.hung@amd.com>
 <179070448303.220377.7903552641769054130@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179070448303.220377.7903552641769054130@61270ab9df2a>
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
On 2026-09-29 at 17:54:43 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Preserve const qualifiers in string parsing (rev2)
> URL   : https://patchwork.freedesktop.org/series/175019/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_9116 -> IGTPW_15919
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15919 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15919, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15919/index.html
> 
> Participating hosts (38 -> 37)
> ------------------------------
> 
>   Missing    (1): bat-dg2-13 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15919:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-arlh-3:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9116/bat-arlh-3/igt@i915_pm_rpm@module-reload.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15919/bat-arlh-3/igt@i915_pm_rpm@module-reload.html
> 

Unrelated, please run FULL i915 tests.



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15919 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Possible fixes ####
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - fi-tgl-1115g4:      [FAIL][3] ([i915#16664]) -> [PASS][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9116/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15919/fi-tgl-1115g4/igt@kms_hdmi_inject@inject-audio.html
> 
>   
>   [i915#16664]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16664
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_9116 -> IGTPW_15919
> 
>   CI-20190529: 20190529
>   CI_DRM_19233: ecc5a84be849c400af610cdc613a0274e3b101b2 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_15919: 15919
>   IGT_9116: 9d4b6ef512b4e2e4d05129c6519313fd13a306d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15919/index.html
