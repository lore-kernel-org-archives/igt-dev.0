Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23086CD5BA4
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 12:48:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E4510ECA5;
	Tue, 19 May 2026 12:48:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0BCAh2K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB5A10ECA5
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 12:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779194888; x=1810730888;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=25BYuoplsMdDy4J3eWCwJEQ4V8gpWTWbfAL2yb6xVGE=;
 b=A0BCAh2K+L+eETEkDpE9/l1R+Cuhem/ayyQ+u9AUUvNmI9bBZ+xx1bDN
 4+UA7BYU5PcdMVJ0wDadrsl6+Yf7Wtqzat4YKT0XdTmkt6PoLHFQMmadz
 /mOB/erFcKO7UHNZLRxP3gJDoJ1s5VwWTk/Se2rt98jckGAsfGS52Qx0l
 2GmwbRHbrjZWPNQkY5MfNJAKPuALDM4FHhuAjMYNgerFn9BgWinAi1CZp
 prOx8W1cJBp5HGlZk1wB++wO5gDYr6uykZa7uDsIvmUyeTFln6eX5Bxle
 WaAikNqnL68iF85PNbhwl3LMIKRn+NrJsmIEsyEyDdC4wMWo6tYqAySbp A==;
X-CSE-ConnectionGUID: C7bOjCOuSMCltqpjWRleIQ==
X-CSE-MsgGUID: JRFGqw/YQR6u+R3WINhraQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79092600"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="79092600"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 05:48:08 -0700
X-CSE-ConnectionGUID: X3YCXXU6TWWfYCNYvF1Kxg==
X-CSE-MsgGUID: aLuxPSl2QDiGENhWW3abvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="263539272"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 05:48:07 -0700
Date: Tue, 19 May 2026 14:48:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXI=?= =?utf-8?Q?e?= for
 tests/kms_cursor_crc: Add MediaTek platform support
Message-ID: <20260519124805.de4ouqah2a3xwdtb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jason-JH Lin <jason-jh.lin@mediatek.com>
References: <20260515072934.495031-1-jason-jh.lin@mediatek.com>
 <177885929544.75062.5045903731471049171@5ab824fced77>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177885929544.75062.5045903731471049171@5ab824fced77>
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
On 2026-05-15 at 15:34:55 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_cursor_crc: Add MediaTek platform support
> URL   : https://patchwork.freedesktop.org/series/166626/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8917 -> IGTPW_15190
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_15190 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_15190, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15190/index.html
> 
> Participating hosts (41 -> 40)
> ------------------------------
> 
>   Additional (1): fi-skl-6600u 
>   Missing    (2): bat-dg2-13 fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_15190:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-atsm-1:         [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8917/bat-atsm-1/igt@i915_selftest@live@hangcheck.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15190/bat-atsm-1/igt@i915_selftest@live@hangcheck.html
> 

Unrelated, no need for full test.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_15190 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@dmabuf@all-tests:
>     - bat-arlh-2:         NOTRUN -> [SKIP][3] ([i915#11346] / [i915#15931])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15190/bat-arlh-2/igt@dmabuf@all-tests.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-skl-6600u:       NOTRUN -> [SKIP][4] ([i915#2190])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15190/fi-skl-6600u/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - fi-skl-6600u:       NOTRUN -> [SKIP][5] ([i915#4613]) +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15190/fi-skl-6600u/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arlh-3:         [PASS][6] -> [DMESG-FAIL][7] ([i915#12061]) +1 other test dmesg-fail
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8917/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15190/bat-arlh-3/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - fi-skl-6600u:       NOTRUN -> [SKIP][8] +11 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15190/fi-skl-6600u/igt@kms_dsc@dsc-basic.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live:
>     - bat-dg2-8:          [DMESG-FAIL][9] ([i915#12061]) -> [PASS][10] +1 other test pass
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8917/bat-dg2-8/igt@i915_selftest@live.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15190/bat-dg2-8/igt@i915_selftest@live.html
>     - bat-arlh-2:         [INCOMPLETE][11] ([i915#15978]) -> [PASS][12]
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8917/bat-arlh-2/igt@i915_selftest@live.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15190/bat-arlh-2/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@guc_multi_lrc:
>     - bat-arlh-2:         [INCOMPLETE][13] -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8917/bat-arlh-2/igt@i915_selftest@live@guc_multi_lrc.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15190/bat-arlh-2/igt@i915_selftest@live@guc_multi_lrc.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-arls-5:         [DMESG-FAIL][15] ([i915#12061]) -> [PASS][16] +1 other test pass
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8917/bat-arls-5/igt@i915_selftest@live@workarounds.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15190/bat-arls-5/igt@i915_selftest@live@workarounds.html
>     - bat-dg2-9:          [DMESG-FAIL][17] ([i915#12061]) -> [PASS][18] +1 other test pass
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8917/bat-dg2-9/igt@i915_selftest@live@workarounds.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15190/bat-dg2-9/igt@i915_selftest@live@workarounds.html
>     - bat-mtlp-9:         [DMESG-FAIL][19] ([i915#12061]) -> [PASS][20] +1 other test pass
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8917/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15190/bat-mtlp-9/igt@i915_selftest@live@workarounds.html
> 
>   
>   [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#15931]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931
>   [i915#15978]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15978
>   [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8917 -> IGTPW_15190
> 
>   CI-20190529: 20190529
>   CI_DRM_18494: 25de7fb53bca724e7864b6bd8280aa1ec59429e3 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_15190: 15190
>   IGT_8917: 65d691069f26fc2a42c79e2364241320b85d48bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15190/index.html
