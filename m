Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6942D3B7E0
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 06:57:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC4710E135;
	Mon, 25 Nov 2024 06:57:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBfby1RA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AE910E135;
 Mon, 25 Nov 2024 06:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732517833; x=1764053833;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=qAYrYgThGHLI1vCUBsLIN39+n33tw7A6WbcZ7qgo+Ik=;
 b=eBfby1RAyY5QrDSoq0hCKbkBJxKwa55ADdq4Sb1ly27Va9KU2vxXaxPF
 MoeR8sqcM2Ts/dPDd3QwortrKRPkLKYIZNltz6svSRIN1kdYr/GMGZBgH
 TT9lBzlUspnXUoPt19SF53YMzDyCfqQ7DZ+/55AD3I1tsalQRza6RyN0b
 zhizfVCLrHHbIVPNnxll3ke5xfGEBQC/rQaR1gVCqjaSqkcuqhqEHF/Zz
 fkAcGD47YB9mOCRxQHBKSLliwSfZPObluIbB0wzPNw6s/iSlY1fXoTSZd
 RNalvWWM5GBCiZmv3K0CTPHNscRRzvgN2ceJNphOjP1o+EADfP6mwjd3M Q==;
X-CSE-ConnectionGUID: qTiZR7LhRCu+f99wem4dmA==
X-CSE-MsgGUID: gRAE46lhS6me0avng/L+kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43264694"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="43264694"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 22:57:12 -0800
X-CSE-ConnectionGUID: PD67xbBWSkyUHhXJFytObw==
X-CSE-MsgGUID: bUDHtYFrRB6SSLqeHrfopA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="122028181"
Received: from jankamin-mobl2.ger.corp.intel.com (HELO [10.213.198.33])
 ([10.213.198.33])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 22:57:12 -0800
Message-ID: <a3ff41b7-809f-4338-ac24-8507d13b16f4@linux.intel.com>
Date: Mon, 25 Nov 2024 07:57:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_igt-runne?=
 =?UTF-8?Q?r_fact_checking_=28rev8=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <173246048147.2468359.4745921189491132664@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173246048147.2468359.4745921189491132664@b555e5b46a47>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

dEAR I915,

On 24.11.2024 16:01, Patchwork wrote:
> == Series Details ==
> 
> Series: igt-runner fact checking (rev8)
> URL   : https://patchwork.freedesktop.org/series/140841/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_15726_full -> IGTPW_12163_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12163_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12163_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12163_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@reload-no-display:
>     - shard-tglu:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-tglu-9/igt@i915_module_load@reload-no-display.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-5/igt@i915_module_load@reload-no-display.html
> 
>   * igt@i915_pm_rpm@gem-idle:
>     - shard-dg2:          [PASS][3] -> [SKIP][4] +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-7/igt@i915_pm_rpm@gem-idle.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@i915_pm_rpm@gem-idle.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][5] +11 other tests dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
>     - shard-dg2:          NOTRUN -> [SKIP][6] +2 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-rkl:          [PASS][7] -> [DMESG-FAIL][8] +1 other test dmesg-fail
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-rkl-3/igt@kms_flip@flip-vs-suspend.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-2/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>     - shard-rkl:          NOTRUN -> [DMESG-FAIL][9] +1 other test dmesg-fail
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
>     - shard-rkl:          [PASS][10] -> [DMESG-WARN][11] +39 other tests dmesg-warn
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-rkl-7/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-rkl:          NOTRUN -> [SKIP][12]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-snb:          [PASS][13] -> [ABORT][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-snb4/igt@perf_pmu@module-unload.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-snb6/igt@perf_pmu@module-unload.html

These are unrelated to my change. Please fix and re-run.

> 
>   
> #### Warnings ####
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-dg2:          [SKIP][15] ([i915#11078]) -> [SKIP][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-10/igt@device_reset@unbind-cold-reset-rebind.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-11/igt@device_reset@unbind-cold-reset-rebind.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-rkl:          [ABORT][17] ([i915#9820]) -> [DMESG-WARN][18]
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-tglu:         [ABORT][19] ([i915#12817] / [i915#9820]) -> [ABORT][20]
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-tglu-5/igt@i915_module_load@reload-with-fault-injection.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-dg2:          [SKIP][21] ([i915#2575]) -> [SKIP][22] +6 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-dg2-11/igt@kms_flip@2x-modeset-vs-vblank-race.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-dg2-10/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@blocking-wf_vblank:
>     - shard-rkl:          [FAIL][23] ([i915#11989] / [i915#12840] / [i915#2122]) -> [DMESG-WARN][24]
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-rkl-5/igt@kms_flip@blocking-wf_vblank.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-5/igt@kms_flip@blocking-wf_vblank.html
> 
>   * igt@kms_flip@blocking-wf_vblank@a-hdmi-a2:
>     - shard-rkl:          [FAIL][25] ([i915#11989]) -> [DMESG-WARN][26]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-rkl-5/igt@kms_flip@blocking-wf_vblank@a-hdmi-a2.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-5/igt@kms_flip@blocking-wf_vblank@a-hdmi-a2.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-rkl:          [SKIP][27] ([i915#3361]) -> [DMESG-FAIL][28]
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-rkl-4/igt@kms_pm_dc@dc6-dpms.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-tglu:         [SKIP][29] ([i915#6524]) -> [ABORT][30]
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_15726/shard-tglu-3/igt@kms_prime@basic-modeset-hybrid.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12163/shard-tglu-10/igt@kms_prime@basic-modeset-hybrid.html

These are unrelated to my change. Please fix and re-run.

[...]

Thank you!
