Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF82C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 10:02:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E63D610FF0C;
	Mon,  4 Mar 2024 10:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mPnWSzu8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E09510FF0C;
 Mon,  4 Mar 2024 10:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709546533; x=1741082533;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iUqPh1pMBK/NumXGT0GOAHtRQL/cPploq5gEpfIRVCI=;
 b=mPnWSzu8CZ8Wvh0Zka9VB/O3fa0qlyqI8+I2hY3GtuSASm8WuN/hfOtt
 l95Uvd1MLlDE6yOeYu0OYZVkotIqRRMeiLrlMVU2zsEEJM3Glxjecfiu4
 emvzbbiUumn8NYqEwLbCrYeN2RJHGjuuCXtVJUUOrmP0HCp+JKHH9zeSb
 hhPM/rOwY8nwed/LWzaCtScYqCU66itB2aKLF4OFKgIaFjP17qKg2fnN2
 mX12me/gVdyKffOQGYS1UePt4tK+GyzfekWRVJtgeF8Rderw5v1QDpby3
 fwJ8StAXIHx/aFQjARxj80m1zC6rOIvn1Qwkibr/bF6ldtGbQzTBjzHMh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="21564780"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="21564780"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 02:02:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="13503036"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 02:02:10 -0800
Date: Mon, 4 Mar 2024 11:01:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for IGT
 documentation refactoring (rev2)
Message-ID: <20240304100152.2vagiusrfzvqganu@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240301090844.671493-1-katarzyna.piecielska@intel.com>
 <170929974711.436087.12437635583808800669@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <170929974711.436087.12437635583808800669@8e613ede5ea5>
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
On 2024-03-01 at 13:29:07 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: IGT documentation refactoring (rev2)
> URL   : https://patchwork.freedesktop.org/series/130555/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14376 -> IGTPW_10762
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10762 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10762, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/index.html
> 
> Participating hosts (42 -> 41)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10762:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gem_contexts:
>     - bat-arls-2:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14376/bat-arls-2/igt@i915_selftest@live@gem_contexts.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/bat-arls-2/igt@i915_selftest@live@gem_contexts.html
> 

This is unrelated to tests documentation, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10762 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-apl-guc:         NOTRUN -> [SKIP][3] ([fdo#109271] / [i915#4613]) +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/fi-apl-guc/igt@gem_lmem_swapping@basic.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - fi-apl-guc:         NOTRUN -> [SKIP][4] ([fdo#109271]) +17 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/fi-apl-guc/igt@kms_hdmi_inject@inject-audio.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@gt_lrc:
>     - bat-adlp-9:         [INCOMPLETE][5] ([i915#9413]) -> [PASS][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14376/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/bat-adlp-9/igt@i915_selftest@live@gt_lrc.html
> 
>   
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#9413]: https://gitlab.freedesktop.org/drm/intel/issues/9413
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7741 -> IGTPW_10762
> 
>   CI-20190529: 20190529
>   CI_DRM_14376: 320f2374b2d52629a6a52c6c3059f02efd73c0a5 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10762: 10762
>   IGT_7741: 7741
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10762/index.html
