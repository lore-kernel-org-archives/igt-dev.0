Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F26C982FA
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 09:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2815410E46A;
	Tue, 22 Sep 2026 09:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EaOz49gA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3F710E66A;
 Tue, 22 Sep 2026 09:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790070765; x=1821606765;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gyHuMIDNfGj8yMVN2kZ2Yf9WUZTb9yn5/lDV6KhHxm0=;
 b=EaOz49gAGwo0KNnieekDH3JuvKCEZ4QUqivSy4+bt/636DSGxKFOZfW3
 YTChaDhunD7idDPhHubO0Nn4nMf+Ciix7m+1nxkMwVP3Mw8wYL/K+V1yS
 XETZUd/rAEYQeQwZyI0jrbfQW7AvB83jxQBW2gewiIeTx/uWvfnX9UWNe
 Pte6AaFQwFniQRqduDVOcP6YqStz+908ZWW15cC7uy0n7J8PsmWueqVFX
 j9i2pk+5yUZA4A8ZfdGQWbhAtdUnv1r+gdGIDYf3vsXAADVdno82FN8JZ
 rmMOexqeaq/MZa+qN0KXeFW0ST/eheDWHP0CsDrncY4ggW2CLdrL81FEe A==;
X-CSE-ConnectionGUID: Oa7poBrdRDm4RcJR6/WE9w==
X-CSE-MsgGUID: e1EBQhWLR/yJIqB6EbZLwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90774782"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="90774782"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 02:52:44 -0700
X-CSE-ConnectionGUID: T3V2uAT2Tt2WW/+3mSnI6Q==
X-CSE-MsgGUID: 7g+ANz6aTw+WMFMcfnqGFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="269589107"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 02:52:43 -0700
Date: Tue, 22 Sep 2026 11:52:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFU?= =?utf-8?Q?=3A?= failure for
 lib/igt_core: Make build reproducible (rev5)
Message-ID: <20260922095241.dnbofkcpeto2wgx2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260921135515.137949-1-kamil.konieczny@linux.intel.com>
 <179002292294.188435.348951557947320157@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179002292294.188435.348951557947320157@61270ab9df2a>
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
On 2026-09-21 at 20:35:22 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/igt_core: Make build reproducible (rev5)
> URL   : https://patchwork.freedesktop.org/series/173723/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_9104 -> IGTPW_15874
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15874 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15874, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/index.html
> 
> Participating hosts (39 -> 38)
> ------------------------------
> 
>   Missing    (1): bat-dg2-13 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15874:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@reset:
>     - bat-twl-2:          [PASS][1] -> [ABORT][2] +1 other test abort
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9104/bat-twl-2/igt@i915_selftest@live@reset.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/bat-twl-2/igt@i915_selftest@live@reset.html
> 

This is unrelated, please file a bug and run a Full i915 run.



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15874 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@too-high:
>     - bat-apl-1:          [PASS][3] -> [DMESG-WARN][4] ([i915#13735]) +37 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9104/bat-apl-1/igt@kms_addfb_basic@too-high.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/bat-apl-1/igt@kms_addfb_basic@too-high.html
> 
>   * igt@kms_flip@basic-flip-vs-modeset@c-dp1:
>     - bat-apl-1:          [PASS][5] -> [DMESG-WARN][6] ([i915#13735] / [i915#180]) +21 other tests dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9104/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/bat-apl-1/igt@kms_flip@basic-flip-vs-modeset@c-dp1.html
> 
>   
>   [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
>   [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_9104 -> IGTPW_15874
>   * Linux: CI_DRM_19193 -> CI_DRM_19195
> 
>   CI-20190529: 20190529
>   CI_DRM_19193: ab82471ddff094939d9981e0647332562c7e1c9b @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_19195: 42735b6937d60963dd302128231fb74a18164a60 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_15874: 6652228e6112eff7ccbb18f5985b9a1413dd29e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_9104: a89d58dad0dd62228269a6049b39fc39ae6cf698 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15874/index.html
