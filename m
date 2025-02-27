Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C27C1B087
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 10:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BBB10EA93;
	Thu, 27 Feb 2025 10:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mBpBxbN4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CC010EA8D;
 Thu, 27 Feb 2025 10:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740653861; x=1772189861;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hdWSz6kdeiKFaEnrVuM7MSEL1JxrQdoSbETUUo5g8IY=;
 b=mBpBxbN4YswUJ7ybJsxelVCzfTLVszWpvx9QiB+E3lktdgbCX9efDZw+
 KFzSQxnkBks4CgwT/6TrckfbmZJU+jyqf0rlDW+Y0UesOYsHye2szUUxl
 qXS5DRnPsnH1YhkoqlvzV/9ZAH/JYYQmmEbtyv/+zPI2zCubv2y384NAn
 0DM//wshU5CUJV0ALg+1xwWJ89izgxYZEwOsnSQFAtJzBVr+HzgUcXcKQ
 xSn9ReKrQeoV5UMTpL9tt8jRMUpJ2pWY7JzLbwlC9jpWcuYfQ673In1Zf
 xnsVrMAMiiWX2bcjPAstZNvHfeUt4R8XqiIG2s+pQhkP2r+idPAkr2L/6 Q==;
X-CSE-ConnectionGUID: SFh1LRY0Qpywh92aHXsF9A==
X-CSE-MsgGUID: Gvn+h2IMQgqdChcLst8WQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52176287"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="52176287"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 02:57:40 -0800
X-CSE-ConnectionGUID: b+/G5Fj1SZu6l68iDANY3Q==
X-CSE-MsgGUID: yj01cShLR2Wi/lt6zcjw2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="121926932"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 02:57:39 -0800
Date: Thu, 27 Feb 2025 11:57:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_series_sta?=
 =?utf-8?Q?rting_wit?= =?utf-8?Q?h?= [i-g-t,1/2] lib/syncobj: Make running
 under Valgrind quiet
Message-ID: <20250227105736.mfszr7xkbmx3ygi4@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20250225124454.1976-1-tvrtko.ursulin@igalia.com>
 <174063814648.2601346.6022084386360518790@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <174063814648.2601346.6022084386360518790@b555e5b46a47>
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
On 2025-02-27 at 06:35:46 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/2] lib/syncobj: Make running under Valgrind quiet
> URL   : https://patchwork.freedesktop.org/series/145403/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8249 -> IGTPW_12665
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12665 absolutely need to be
>   verified manually.

Unrelated to a change, please file bugs and re-run.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12665, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/index.html
> 
> Participating hosts (44 -> 44)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12665:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@load:
>     - bat-twl-1:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8249/bat-twl-1/igt@i915_module_load@load.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/bat-twl-1/igt@i915_module_load@load.html
> 
>   * igt@i915_selftest@live@reset:
>     - bat-adlp-11:        [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8249/bat-adlp-11/igt@i915_selftest@live@reset.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/bat-adlp-11/igt@i915_selftest@live@reset.html
> 
>   * igt@i915_selftest@live@slpc:
>     - bat-twl-1:          NOTRUN -> [INCOMPLETE][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/bat-twl-1/igt@i915_selftest@live@slpc.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12665 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live:
>     - bat-adlp-11:        [PASS][6] -> [ABORT][7] ([i915#13696])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8249/bat-adlp-11/igt@i915_selftest@live.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/bat-adlp-11/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@reset:
>     - bat-twl-2:          [PASS][8] -> [ABORT][9] ([i915#12919] / [i915#13503]) +1 other test abort
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8249/bat-twl-2/igt@i915_selftest@live@reset.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/bat-twl-2/igt@i915_selftest@live@reset.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_module_load@load:
>     - bat-mtlp-9:         [DMESG-WARN][10] ([i915#13494]) -> [PASS][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8249/bat-mtlp-9/igt@i915_module_load@load.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/bat-mtlp-9/igt@i915_module_load@load.html
> 
>   * igt@i915_selftest@live@execlists:
>     - bat-twl-1:          [INCOMPLETE][12] -> [PASS][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8249/bat-twl-1/igt@i915_selftest@live@execlists.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/bat-twl-1/igt@i915_selftest@live@execlists.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_selftest@live:
>     - bat-twl-1:          [INCOMPLETE][14] -> [INCOMPLETE][15] ([i915#13761])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8249/bat-twl-1/igt@i915_selftest@live.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/bat-twl-1/igt@i915_selftest@live.html
> 
>   
>   [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
>   [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
>   [i915#13503]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13503
>   [i915#13696]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13696
>   [i915#13761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13761
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8249 -> IGTPW_12665
>   * Linux: CI_DRM_16189 -> CI_DRM_16190
> 
>   CI-20190529: 20190529
>   CI_DRM_16189: 1afde926204e64fbc8e4e98aef49f8c56228bf70 @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_16190: 8541a64154cd8b9c07977dedc1d22883f43279a0 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12665: 12665
>   IGT_8249: 8cb34f260a285ff7eaa3d79cf71f0a4960e4c890 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12665/index.html
