Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5236D0BB6F
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 08:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FEF10E8D1;
	Thu, 24 Oct 2024 08:28:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cTtiUwLs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED2A10E8CE;
 Thu, 24 Oct 2024 08:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729758495; x=1761294495;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lFj9ZuYRYu0p74ZW4QNOQvBqv5FU5t7eHa38yeyqzkM=;
 b=cTtiUwLsMsvC21x++POgesFdiYil7pFJjlxBs0pgTnaTIvaY6FxWgYMM
 QDs0wdsneDadd1rDMFy7gFBpPO5pjAr+TPnuCDK9nHxMDgZjbFdjeIMsv
 ethlrCYodIbXytcz7F7drhI3UrtPWNzzm2S7OZyWIhSoXo8eeNG+CIqir
 E05OLx4Km0DlizuAi6+BZbYHxBOBMTkdw1KFL/Xj6rvPme0yAGx3FAubR
 qIEopMyBcDTbAF9NS09IXuP75XOA5f+aJMeV4O8B+Ug8xbJi2Krc12JiW
 Hzc0iohAbhCcB2rUmCVUYfGy1yFVXD8a2+Imgr3M3hQTeJhKcwYS7xI2Y g==;
X-CSE-ConnectionGUID: JSJnuB3VQKSQF1nmlP35Bg==
X-CSE-MsgGUID: Hx1BASqNSz6ENkOnOxWu3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33063254"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33063254"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 01:28:15 -0700
X-CSE-ConnectionGUID: aYXrNqp0Tc2Ph/jIaGj1PQ==
X-CSE-MsgGUID: 1g7N+dGUT9yYxtcg6fRkkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="85315250"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 01:28:13 -0700
Date: Thu, 24 Oct 2024 10:27:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 rename drm_fdinfo into i915_fdinfo (rev2)
Message-ID: <20241024082757.jsiqjysanihionwb@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241023164537.83876-1-kamil.konieczny@linux.intel.com>
 <172970454385.1324200.12138219116728473938@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172970454385.1324200.12138219116728473938@2413ebb6fbb6>
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
On 2024-10-23 at 17:29:03 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: rename drm_fdinfo into i915_fdinfo (rev2)
> URL   : https://patchwork.freedesktop.org/series/140053/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8082 -> IGTPW_11967
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11967 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11967, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11967/index.html
> 
> Participating hosts (45 -> 46)
> ------------------------------
> 
>   Additional (2): fi-skl-6600u bat-dg1-6 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11967:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live:
>     - bat-jsl-1:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8082/bat-jsl-1/igt@i915_selftest@live.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11967/bat-jsl-1/igt@i915_selftest@live.html
> 

This is unrelated to rename of drm_fdinfo into i915_fdinfo

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11967 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@fbdev@info:
>     - bat-dg1-6:          NOTRUN -> [SKIP][3] ([i915#1849])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11967/bat-dg1-6/igt@fbdev@info.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-skl-6600u:       NOTRUN -> [SKIP][4] ([i915#2190])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11967/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - fi-skl-6600u:       NOTRUN -> [SKIP][5] ([i915#4613]) +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11967/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@i915_selftest@live:
>     - bat-arlh-3:         [PASS][6] -> [ABORT][7] ([i915#12133])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8082/bat-arlh-3/igt@i915_selftest@live.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11967/bat-arlh-3/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arlh-3:         [PASS][8] -> [ABORT][9] ([i915#12061])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8082/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11967/bat-arlh-3/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
>     - bat-dg1-6:          NOTRUN -> [SKIP][10] ([i915#12311]) +54 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11967/bat-dg1-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - fi-skl-6600u:       NOTRUN -> [SKIP][11] +9 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11967/fi-skl-6600u/igt@kms_dsc@dsc-basic.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-dg1-6:          NOTRUN -> [SKIP][12] ([i915#11723])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11967/bat-dg1-6/igt@prime_vgem@basic-write.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live:
>     - bat-twl-1:          [INCOMPLETE][13] ([i915#12133] / [i915#9413]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8082/bat-twl-1/igt@i915_selftest@live.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11967/bat-twl-1/igt@i915_selftest@live.html
>     - bat-dg2-9:          [ABORT][15] ([i915#12133]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8082/bat-dg2-9/igt@i915_selftest@live.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11967/bat-dg2-9/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@client:
>     - bat-dg2-9:          [ABORT][17] ([i915#12305]) -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8082/bat-dg2-9/igt@i915_selftest@live@client.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11967/bat-dg2-9/igt@i915_selftest@live@client.html
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - bat-twl-1:          [INCOMPLETE][19] ([i915#9413]) -> [PASS][20]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8082/bat-twl-1/igt@i915_selftest@live@gt_lrc.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11967/bat-twl-1/igt@i915_selftest@live@gt_lrc.html
> 
>   * igt@i915_selftest@live@late_gt_pm:
>     - fi-cfl-8109u:       [DMESG-WARN][21] ([i915#11621]) -> [PASS][22] +132 other tests pass
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8082/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11967/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
> 
>   
>   [i915#11621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11621
>   [i915#11723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11723
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
>   [i915#12305]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12305
>   [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
>   [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
>   [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8082 -> IGTPW_11967
>   * Linux: CI_DRM_15576 -> CI_DRM_15586
> 
>   CI-20190529: 20190529
>   CI_DRM_15576: d5bac12430b0d4a980c0498b3c946772950e70ee @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_15586: 790c7308eb96861950ceddfd5a0f410cc3306c2e @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11967: cbdcb770dafad19d15b79ad1b4ff91819def477e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11967/index.html
