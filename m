Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C6FC02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 08:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A2910E4C5;
	Mon, 10 Feb 2025 08:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWRhxHou";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31AC10E4C9;
 Mon, 10 Feb 2025 08:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739176063; x=1770712063;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=+PXge0pj5sWvLF817Q8MUbnNpevBTTgtKKv9b/UBmso=;
 b=AWRhxHous7d7+dqb+Iwn6g9Jl3gWLvbNHdz3LfBTeYt0fVFQkx/gNxbe
 xZtNokOccvmdGhAvCJFVAxMfggr9WejgRiF3Ue6R3OGTf8+k99J+eDuyk
 Rs+YJ6g1ZB2bVG4M+hYW7AXaccRi7dw7t7xsjRQYfR7bd6msmo9Oo92bw
 LTYMWqCiHSe8Qa8QscIabBdBUYKTU+ijarTa8HpOERssFbutsFzAEkSzh
 NBWOKDxKIGSa6bdq+IM55pFn6OOZo9IhhYkELETUBxHXj3aPYNzewdu+7
 cKSsVevKWnEQbw9eETQHjyPUnrJ7P3Rm9NR5Zk5alf88SmqJ5CAdWC2/W g==;
X-CSE-ConnectionGUID: C2RPQl0rQN6eR+Vm2vWaHw==
X-CSE-MsgGUID: z4MOL6MGQRapdfwpZYCTXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="27350924"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="27350924"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 00:27:05 -0800
X-CSE-ConnectionGUID: QxclrbCBTrKlSZOQODx5rg==
X-CSE-MsgGUID: ntbifsOsSpydMeqxOf+Vqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="111955740"
Received: from cristina-mobl3.ger.corp.intel.com (HELO [10.246.18.37])
 ([10.246.18.37])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 00:27:04 -0800
Message-ID: <e6642b8e-cfb1-4f0a-a82a-cd9e30d7b8cf@linux.intel.com>
Date: Mon, 10 Feb 2025 09:26:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Bump_abor?=
 =?UTF-8?Q?ting_on_network_failure_deadline_to_40_seconds?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250206152147.209277-1-peter.senna@linux.intel.com>
 <173917129953.152544.2381462515090576682@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173917129953.152544.2381462515090576682@b555e5b46a47>
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

Dear I915,

On 10.02.2025 08:08, Patchwork wrote:
> == Series Details ==
> 
> Series: Bump aborting on network failure deadline to 40 seconds
> URL   : https://patchwork.freedesktop.org/series/144424/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16081_full -> IGTPW_12556_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12556_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12556_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12556/index.html
> 
> Participating hosts (12 -> 10)
> ------------------------------
> 
>   Missing    (2): shard-snb-0 shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12556_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@hibernate:
>     - shard-glk:          NOTRUN -> [ABORT][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12556/shard-glk2/igt@gem_eio@hibernate.html
> 
>   * igt@gem_exec_fence@basic-await@ccs0:
>     - shard-mtlp:         [PASS][2] -> [ABORT][3] +1 other test abort
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16081/shard-mtlp-4/igt@gem_exec_fence@basic-await@ccs0.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12556/shard-mtlp-2/igt@gem_exec_fence@basic-await@ccs0.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
>     - shard-rkl:          [PASS][4] -> [SKIP][5] +14 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16081/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12556/shard-rkl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_setmode@basic:
>     - shard-dg2:          [PASS][6] -> [FAIL][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16081/shard-dg2-6/igt@kms_setmode@basic.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12556/shard-dg2-4/igt@kms_setmode@basic.html
> 
>   * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [FAIL][8] +1 other test fail
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12556/shard-dg2-4/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>     - shard-rkl:          [SKIP][9] ([i915#12313]) -> [SKIP][10]
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16081/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12556/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>     - shard-rkl:          [SKIP][11] ([i915#6095]) -> [SKIP][12] +1 other test skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16081/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12556/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0:
>     - shard-rkl:          [SKIP][13] ([i915#3116]) -> [SKIP][14]
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16081/shard-rkl-1/igt@kms_content_protection@dp-mst-lic-type-0.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12556/shard-rkl-8/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms:
>     - shard-rkl:          [DMESG-WARN][15] ([i915#12964]) -> [SKIP][16]
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16081/shard-rkl-1/igt@kms_flip@basic-flip-vs-dpms.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12556/shard-rkl-8/igt@kms_flip@basic-flip-vs-dpms.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-rkl:          [SKIP][17] ([i915#9906]) -> [SKIP][18] +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16081/shard-rkl-6/igt@kms_vrr@seamless-rr-switch-vrr.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12556/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-vrr.html
> 

These regressions and warnings are unrelated to my change. Please fix and rerun.

Thank you,

Peter
