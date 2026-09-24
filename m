Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C965C98314
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 07:56:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB7110F38C;
	Thu, 24 Sep 2026 07:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mt5bXNwJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E8610F37E;
 Thu, 24 Sep 2026 07:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790236268; x=1821772268;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Jpx2GfPcEVco0uT2T1fe8O4Taorq5PrgwCw7wZVKUuA=;
 b=mt5bXNwJjcSzj6IqTc+dvh0SCQmjAFqA3bfLeY+IysJyo4MkOgAFNSku
 m6IWGNBH9o3lJcJhDWX09lbwZ+xsvyLjt7L4wOnGYP9lDZ6TKJOfS857T
 3gRKRQs2c2wkq35DVvFQm+n033ExK5serCK6mw7yov2RnolMeWRgSU2az
 3tri16DYMP+M+yW0Iud13rwlpa7bxOKuDy3/v/9XKsipM7y4B8WCuF0bb
 C57uvuWYKZfj/8jMsgbtIn0AGNIG+G7i8ioI/YP1S09CBj4sXZoCGaIxy
 imz2kg0MU3suVrvHXtKVuyXd6AlzHqidjmS+uAqlrsHPkY8fmP8/a2xnI w==;
X-CSE-ConnectionGUID: M/fVPiaZTY+lJAAapKmztg==
X-CSE-MsgGUID: +cYvHICQQfuSwzcM1hvHXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91016485"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="91016485"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 00:51:07 -0700
X-CSE-ConnectionGUID: fcArDGJqQeSGl20VOwl1Xg==
X-CSE-MsgGUID: AVIAnkwxTzW2INX21kbHWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="277111243"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 00:51:06 -0700
Date: Thu, 24 Sep 2026 09:50:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZv?= =?utf-8?Q?r?=
 tests/kms_atomic: skip missing CRTC props in state snapshot
Message-ID: <20260924075048.52kwxm734q7akycj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260923152113.1513938-1-aurabindo.pillai@amd.com>
 <179020563583.198725.1434891016913920582@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179020563583.198725.1434891016913920582@61270ab9df2a>
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
On 2026-09-23 at 23:20:35 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_atomic: skip missing CRTC props in state snapshot
> URL   : https://patchwork.freedesktop.org/series/174822/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_9111 -> IGTPW_15890
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15890 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15890, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15890/index.html
> 
> Participating hosts (39 -> 38)
> ------------------------------
> 
>   Missing    (1): bat-dg2-13 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15890:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pm_rpm@basic-rte:
>     - bat-dg2-8:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9111/bat-dg2-8/igt@kms_pm_rpm@basic-rte.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15890/bat-dg2-8/igt@kms_pm_rpm@basic-rte.html
> 

This is unrelated, please run i915 Full testing.



Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15890 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_auth@basic-auth:
>     - bat-adlp-6:         [PASS][3] -> [DMESG-WARN][4] ([i915#15673])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9111/bat-adlp-6/igt@core_auth@basic-auth.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15890/bat-adlp-6/igt@core_auth@basic-auth.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_debugfs@read-all-entries:
>     - bat-adlp-6:         [DMESG-WARN][5] ([i915#15673]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9111/bat-adlp-6/igt@core_debugfs@read-all-entries.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15890/bat-adlp-6/igt@core_debugfs@read-all-entries.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - bat-dg2-8:          [SKIP][7] ([i915#1072] / [i915#9732]) -> [SKIP][8] ([i915#9688]) +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9111/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15890/bat-dg2-8/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#15673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15673
>   [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_9111 -> IGTPW_15890
> 
>   CI-20190529: 20190529
>   CI_DRM_19210: 703cd271db3a35088460ab3fec0a96bd48e7fe04 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_15890: f0219c1f66edea612b4009d3f86b585e14f818cd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_9111: 4aeabf104b136437d0ccc57caf32a752587d595c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15890/index.html
