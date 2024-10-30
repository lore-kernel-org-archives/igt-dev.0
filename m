Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869CAD5CCA9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 12:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1A710E2CE;
	Wed, 30 Oct 2024 12:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7hVSbr0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E18C10E2CE;
 Wed, 30 Oct 2024 12:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730293098; x=1761829098;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pfYK8kL9ZIdy7YUPiytewBLDuGv/5ynkBjXz+CizS74=;
 b=P7hVSbr07cPn2cRvkEXcEBY5aSEM+ufgFCK68vFMFi32yK7j3D/j/xOT
 5LZv+JinHd3RtuaRrCq0256QkQ9WYFyKiGTSskWHMxWRiQFo8pUVeeRcj
 oHZ580QhNwR1ZTMlEj9x4R5TVSOmu8TLERK6eXv27ynpl5EWr+auY1qz2
 SL2+glVozX4SKGU6gSHRTFgjqBJBK6ZHiOHuc2k9UT8Fiwqvl3MmybO7S
 L9zDE/sTZYw1zGPCeryWLcO4HL15AeIHfgrJlFF5HpFJGyFFULinQ341H
 DeHPa6YxajUBxkVr6B6ZAFa0Cv3Zy8Q9y7yAYtxbAr2ApJfZ75N4d8jL1 g==;
X-CSE-ConnectionGUID: unYXoP9XTbuWAwU0kj0hjw==
X-CSE-MsgGUID: qD6aAfVjTIOrQ2BeEC372Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="29437513"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="29437513"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 05:58:17 -0700
X-CSE-ConnectionGUID: OE7x2wEAS5+anwEoR4ObkA==
X-CSE-MsgGUID: L4831dS8SOq4LerrLW5wbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; d="scan'208";a="82241040"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 05:58:15 -0700
Date: Wed, 30 Oct 2024 13:58:13 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 Ignore more warns in xe_wedged tests (rev2)
Message-ID: <20241030125813.yd7et7pkzdae2gxq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241029182259.125117-1-kamil.konieczny@linux.intel.com>
 <173025397467.1362048.17792868325139902408@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173025397467.1362048.17792868325139902408@2413ebb6fbb6>
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
On 2024-10-30 at 02:06:14 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Ignore more warns in xe_wedged tests (rev2)
> URL   : https://patchwork.freedesktop.org/series/140511/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8088 -> IGTPW_11997
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11997 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11997, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11997/index.html
> 
> Participating hosts (47 -> 45)
> ------------------------------
> 
>   Missing    (2): bat-arls-1 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11997:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - bat-apl-1:          [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-apl-1/igt@i915_selftest@live.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11997/bat-apl-1/igt@i915_selftest@live.html
> 

Unrelated to Xe test, no need for respin imho.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11997 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_module_load@load:
>     - bat-apl-1:          [PASS][3] -> [DMESG-WARN][4] ([i915#180] / [i915#1982]) +2 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-apl-1/igt@i915_module_load@load.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11997/bat-apl-1/igt@i915_module_load@load.html
> 
>   * igt@i915_module_load@reload:
>     - bat-apl-1:          [PASS][5] -> [DMESG-WARN][6] ([i915#180])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-apl-1/igt@i915_module_load@reload.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11997/bat-apl-1/igt@i915_module_load@reload.html
> 
>   * igt@i915_selftest@live:
>     - bat-dg2-8:          [PASS][7] -> [ABORT][8] ([i915#12133]) +1 other test abort
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-dg2-8/igt@i915_selftest@live.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11997/bat-dg2-8/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@sanitycheck:
>     - bat-apl-1:          [PASS][9] -> [DMESG-WARN][10] ([i915#11621]) +77 other tests dmesg-warn
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-apl-1/igt@i915_selftest@live@sanitycheck.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11997/bat-apl-1/igt@i915_selftest@live@sanitycheck.html
> 
>   * igt@kms_flip@basic-flip-vs-wf_vblank:
>     - bat-apl-1:          [PASS][11] -> [DMESG-WARN][12] ([i915#11621] / [i915#180] / [i915#1982]) +2 other tests dmesg-warn
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11997/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
> 
>   * igt@kms_pm_rpm@basic-pci-d3-state:
>     - bat-apl-1:          [PASS][13] -> [DMESG-WARN][14] ([i915#11621] / [i915#180]) +42 other tests dmesg-warn
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11997/bat-apl-1/igt@kms_pm_rpm@basic-pci-d3-state.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live:
>     - bat-arlh-3:         [ABORT][15] ([i915#12133]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-arlh-3/igt@i915_selftest@live.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11997/bat-arlh-3/igt@i915_selftest@live.html
>     - bat-mtlp-6:         [ABORT][17] ([i915#12133] / [i915#12216]) -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-mtlp-6/igt@i915_selftest@live.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11997/bat-mtlp-6/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arlh-3:         [ABORT][19] ([i915#12061]) -> [PASS][20]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11997/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>     - bat-mtlp-6:         [ABORT][21] ([i915#12216]) -> [PASS][22]
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8088/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11997/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
> 
>   
>   [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
>   [i915#12216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12216
>   [i915#180]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/180
>   [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8088 -> IGTPW_11997
>   * Linux: CI_DRM_15607 -> CI_DRM_15608
> 
>   CI-20190529: 20190529
>   CI_DRM_15607: fb2691707e2d5a8c704ae5e48bc5a314a308b0e0 @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_15608: b97473387ce132222c9b71f7cf39c2cd814cbb6f @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11997: 9156a7b175d9a24154d8ced92e5e8170aab14fe1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8088: 0030d5bc92b8e4ac991db1c88af1f0ad7593812a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11997/index.html
