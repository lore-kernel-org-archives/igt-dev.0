Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED99D6C299
	for <igt-dev@archiver.kernel.org>; Tue, 19 Nov 2024 20:37:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C30E610E36E;
	Tue, 19 Nov 2024 20:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fMCLW4cq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E35C10E364;
 Tue, 19 Nov 2024 20:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732048631; x=1763584631;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ISvRfC3xeHvEyBKMhMhByuQRO25OVaKqFz7lXbeZAUA=;
 b=fMCLW4cqGirvMdL58k81zmg5kC4G3muu5am9hS0L3VntinWFv6FLUgnJ
 ckSqP+9eD60XRIjX1q61t/oCVMeq3zgFObn54dljdIetJKtFg8A4YsVx/
 vOIpaYTUCCWl9HsjkhnKlUAcSF3aISLs1pXobrqFVx8qNvQ1Ldxe4ftiX
 5szRH9O5oKeuaoxYPi8izYuAn/Zpi4OvwjeU0Fr3ATk3Ntwpd9HDeORDq
 1efvqKXQTEacrw2rIaXzvdJxyCcFEAdbO8ZsZG8BmY7rUCYeBAL/+kTaC
 9AuUbIIALQZZKdbwy7X4E8Y7EcFt3IIbBCr4BTnREGCBYUZUjBgc0qe19 g==;
X-CSE-ConnectionGUID: BX3WojgrRziGXkVI921mSw==
X-CSE-MsgGUID: LBNY2JsFT8+1gTxZZIAOTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="32228765"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="32228765"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 12:37:10 -0800
X-CSE-ConnectionGUID: Txv6y8umR1CoXpUEFCRb5A==
X-CSE-MsgGUID: Srm87gBhSBaG9qH5DWqvFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="89674865"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 12:37:10 -0800
Date: Tue, 19 Nov 2024 21:36:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_tests=2Fsync?=
 =?utf-8?B?b2JqX3dhaXQ6?= Update invalid-wait-zero-handles test (rev4)
Message-ID: <20241119203653.vphqujoy3girzhkz@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241118124422.11868-1-krzysztof.niemiec@intel.com>
 <173198128113.107714.3280112099376430751@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173198128113.107714.3280112099376430751@b555e5b46a47>
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
On 2024-11-19 at 01:54:41 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/syncobj_wait: Update invalid-wait-zero-handles test (rev4)
> URL   : https://patchwork.freedesktop.org/series/140727/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8115 -> IGTPW_12127
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12127 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12127, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12127/index.html
> 
> Participating hosts (46 -> 45)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12127:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-dg2-11:         [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12127/bat-dg2-11/igt@i915_pm_rpm@module-reload.html
>     - bat-adls-6:         [PASS][3] -> [FAIL][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-adls-6/igt@i915_pm_rpm@module-reload.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12127/bat-adls-6/igt@i915_pm_rpm@module-reload.html
>     - bat-rpls-4:         [PASS][5] -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12127/bat-rpls-4/igt@i915_pm_rpm@module-reload.html
> 

These are unrelated.  Please file bug and run FULL for i915.

>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_8115 and IGTPW_12127:
> 
> ### New IGT tests (1) ###
> 
>   * igt@syncobj_wait@wait-zero-handles:
>     - Statuses : 43 pass(s) 1 skip(s)
>     - Exec time: [0.0] s
> 

Skips come from machine where all other tests also skips,
so imho this is ok.

Regards,
Kamil

>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12127 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@gem_tiled_blits@basic:
>     - fi-pnv-d510:        [PASS][7] -> [SKIP][8] +2 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/fi-pnv-d510/igt@gem_tiled_blits@basic.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12127/fi-pnv-d510/igt@gem_tiled_blits@basic.html
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>     - bat-dg2-11:         [PASS][9] -> [SKIP][10] ([i915#9197]) +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12127/bat-dg2-11/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
> 
>   * igt@runner@aborted:
>     - bat-dg2-13:         NOTRUN -> [FAIL][11] ([i915#12658])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12127/bat-dg2-13/igt@runner@aborted.html
> 
>   * {igt@syncobj_wait@wait-zero-handles} (NEW):
>     - fi-kbl-8809g:       NOTRUN -> [SKIP][12]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12127/fi-kbl-8809g/igt@syncobj_wait@wait-zero-handles.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - bat-dg1-7:          [FAIL][13] -> [PASS][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12127/bat-dg1-7/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live:
>     - bat-mtlp-6:         [ABORT][15] ([i915#12829]) -> [PASS][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-mtlp-6/igt@i915_selftest@live.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12127/bat-mtlp-6/igt@i915_selftest@live.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - bat-mtlp-6:         [ABORT][17] -> [PASS][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8115/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12127/bat-mtlp-6/igt@i915_selftest@live@workarounds.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12658
>   [i915#12829]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12829
>   [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8115 -> IGTPW_12127
>   * Linux: CI_DRM_15716 -> CI_DRM_15717
> 
>   CI-20190529: 20190529
>   CI_DRM_15716: 6abefc8e3bf638090d5277bc3e6fd02bb25579a4 @ git://anongit.freedesktop.org/gfx-ci/linux
>   CI_DRM_15717: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12127: 12127
>   IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12127/index.html
