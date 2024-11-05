Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8713D31764
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 16:32:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB9D10E079;
	Tue,  5 Nov 2024 16:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LxKHlBrN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB7010E079;
 Tue,  5 Nov 2024 16:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730824342; x=1762360342;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nzjJ3OCzAKqdqfgxInNTfIqDBSZySx801aAktiaeQ3c=;
 b=LxKHlBrN6Eb8wX+JMMeCFj2+M3SLhYfLu463xW4+ZEChujXT4i/55SW6
 jhvD4hJQX+ANjmKl6Q1LgQndk4MOtsCeltm1CFc33A2IUs0uwsDBqUp4I
 zUVUYsiUna68Yc1gNZWj8XK8ILrFoHULOkuOhkNlVkN9SrpQrFiVjWjKj
 EXN2aMpCzzOmjaDNaDnEx9Z33s6JdN3IcN4W8PnmwZ7EyYUfdlPYzJsnu
 AKcFJlV3oAXrwZXm1KgTcQjayV7JcAxrOr0kEHQ2KkYmB5MSXMz+qot7c
 BR5cGTfpEGnuljd92aktaAMKeVSUqEGkb+BDNon/xJQ08gvDZebQZF8m6 Q==;
X-CSE-ConnectionGUID: P6ygRzpXSC+3f16iK3xZLw==
X-CSE-MsgGUID: xZCva9g9TmezJJE4i8HxSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30756338"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30756338"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 08:32:21 -0800
X-CSE-ConnectionGUID: WXl126fuTg2iUWT8plxGDQ==
X-CSE-MsgGUID: /FLLOF9SR8iHF0VPiiOp0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="114873876"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 08:32:20 -0800
Date: Tue, 5 Nov 2024 17:32:18 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeff Dagenais <jeff.dagenais@gmail.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_scripts=2Fge?=
 =?utf-8?Q?nerate=5Figa64=5Fcodes?= =?utf-8?Q?=3A?= prevent objcopy from
 modifying the input file
Message-ID: <20241105163218.7r7cs26sb7usmqe5@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jeff Dagenais <jeff.dagenais@gmail.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241030184054.73065-1-jdagenais@tesla.com>
 <173070239306.1390299.1888583966717986023@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173070239306.1390299.1888583966717986023@2413ebb6fbb6>
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
On 2024-11-04 at 06:39:53 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: scripts/generate_iga64_codes: prevent objcopy from modifying the input file
> URL   : https://patchwork.freedesktop.org/series/140771/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8091 -> IGTPW_12015
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12015 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12015, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/index.html
> 
> Participating hosts (46 -> 44)
> ------------------------------
> 
>   Missing    (2): fi-snb-2520m bat-adls-6 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12015:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_fence@nb-await@vecs0:
>     - bat-rpls-4:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-rpls-4/igt@gem_exec_fence@nb-await@vecs0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-rpls-4/igt@gem_exec_fence@nb-await@vecs0.html
> 
>   

This is unrelated to change in scripts, no need for respin
as I will merge this soon.

Regards,
Kamil

> New tests
> ---------
> 
>   New tests have been introduced between IGT_8091 and IGTPW_12015:
> 
> ### New IGT tests (1) ###
> 
>   * igt@debugfs_test@basic-hwmon:
>     - Statuses : 7 pass(s) 36 skip(s)
>     - Exec time: [0.0, 0.00] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12015 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_selftest@live:
>     - bat-twl-1:          [PASS][3] -> [INCOMPLETE][4] ([i915#12133] / [i915#9413])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-twl-1/igt@i915_selftest@live.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-twl-1/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - bat-twl-1:          [PASS][5] -> [INCOMPLETE][6] ([i915#9413])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-twl-1/igt@i915_selftest@live@gt_lrc.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-twl-1/igt@i915_selftest@live@gt_lrc.html
> 
>   * igt@i915_selftest@live@reset:
>     - bat-atsm-1:         [PASS][7] -> [ABORT][8] ([i915#12133])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-atsm-1/igt@i915_selftest@live@reset.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-atsm-1/igt@i915_selftest@live@reset.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - bat-dg2-13:         [PASS][9] -> [DMESG-WARN][10] ([i915#12253])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-dg2-13/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_exec_fence@basic-await:
>     - bat-dg2-14:         [FAIL][11] ([i915#12660]) -> [PASS][12] +1 other test pass
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-dg2-14/igt@gem_exec_fence@basic-await.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-dg2-14/igt@gem_exec_fence@basic-await.html
> 
>   * igt@i915_selftest@live:
>     - bat-mtlp-6:         [DMESG-WARN][13] ([i915#10341] / [i915#12133]) -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-mtlp-6/igt@i915_selftest@live.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-mtlp-6/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-mtlp-6:         [DMESG-WARN][15] ([i915#11349] / [i915#12133]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8091/bat-mtlp-6/igt@i915_selftest@live@hangcheck.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/bat-mtlp-6/igt@i915_selftest@live@hangcheck.html
> 
>   
>   [i915#10341]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10341
>   [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
>   [i915#12133]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12133
>   [i915#12253]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12253
>   [i915#12660]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12660
>   [i915#9413]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9413
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8091 -> IGTPW_12015
>   * Linux: CI_DRM_15616 -> CI_DRM_15620
> 
>   CI-20190529: 20190529
>   CI_DRM_15616: baf0f5492ee64d9edaa4a9aae47c7dc6dc3e2c31 @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_15620: 9c4962db90300e1d8daca8ed54195bc31d0ee932 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12015: 12015
>   IGT_8091: 8091
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12015/index.html
