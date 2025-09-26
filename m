Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03994CAC5AC
	for <igt-dev@archiver.kernel.org>; Fri, 26 Sep 2025 08:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907D610E9FC;
	Fri, 26 Sep 2025 08:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIEIwkQx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480D910E9F7;
 Fri, 26 Sep 2025 08:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758874300; x=1790410300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E2Cy5zbWTGYmz8VdoByBGzkSYKE6Kc9PENT6s5uyylk=;
 b=HIEIwkQxgk1r5pfUj0x7fvu7inM4QZUzpuINJN80nglxVMHWAgnp5IMc
 W+S1vXU013cF7pHSjsm60TNDjBTeJPTEUqeob371Otc+n4+lw6qwouIvV
 IoyRLwLVPzlXk8qxRK7zSaukqH131g5uE9fe6ICdDeMu/7YXWyjZKmvG+
 2pPMnKY90kNL8TpcHXCPN2y+gLdeuExJ+7ZQ90llv72tcMUPmlpV7Syq+
 HaQ1pQ5UvtyyQX7FqzAeISt3zaYlbLxHJeXLMO1FvsQ7szZ2AvFaU6m8b
 aTReUsUKc2tKIFY+onP+Pvdn7uXK1plj7E5WH3o6pw5KtGdd4h3wUT7gL Q==;
X-CSE-ConnectionGUID: ceVxmMAnRiqDPuc444Bl1A==
X-CSE-MsgGUID: higVyT9iQdeEPopQnefU9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61314343"
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="61314343"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 01:11:39 -0700
X-CSE-ConnectionGUID: IS4ZxYeOTUixT9UrL9Nb6w==
X-CSE-MsgGUID: e0Y4yCTfTLii3GZqHiRHMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; d="scan'208";a="181952216"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.246])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 01:11:37 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= i915.CI.Full: failure for tests/syncobj_timeline:
 Exercise signaling of awaited points (rev2)
Date: Fri, 26 Sep 2025 10:11:34 +0200
Message-ID: <2875806.BEx9A2HvPv@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <175881901419.367773.4101603616099993095@1538d3639d33>
References: <20250925095806.1967580-2-janusz.krzysztofik@linux.intel.com>
 <175881901419.367773.4101603616099993095@1538d3639d33>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi I915-ci-infra@lists.freedesktop.org,

On Thursday, 25 September 2025 18:50:14 CEST Patchwork wrote:
> == Series Details ==
> 
> Series: tests/syncobj_timeline: Exercise signaling of awaited points (rev2)
> URL   : https://patchwork.freedesktop.org/series/154590/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17270_full -> IGTPW_13822_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13822_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13822_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/index.html
> 
> Participating hosts (12 -> 12)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13822_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane_cursor@primary:
>     - shard-mtlp:         [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-mtlp-7/igt@kms_plane_cursor@primary.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-1/igt@kms_plane_cursor@primary.html

This potential regression has nothing to do with new subtests introduced with 
this patch, please update filters and re-report.

Thanks,
Janusz

> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_17270_full and IGTPW_13822_full:
> 
> ### New IGT tests (12) ###
> 
>   * igt@syncobj_timeline@stress-enable-all-signal-all-backward:
>     - Statuses : 6 pass(s)
>     - Exec time: [10.24, 10.59] s
> 
>   * igt@syncobj_timeline@stress-enable-all-signal-all-forward:
>     - Statuses : 7 pass(s)
>     - Exec time: [12.97, 21.68] s
> 
>   * igt@syncobj_timeline@stress-enable-all-signal-all-random:
>     - Statuses : 6 pass(s)
>     - Exec time: [10.26, 10.69] s
> 
>   * igt@syncobj_timeline@stress-enable-all-signal-backward:
>     - Statuses : 5 pass(s)
>     - Exec time: [3.58, 7.12] s
> 
>   * igt@syncobj_timeline@stress-enable-all-signal-forward:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.94, 3.99] s
> 
>   * igt@syncobj_timeline@stress-enable-all-signal-random:
>     - Statuses : 6 pass(s)
>     - Exec time: [1.06, 2.15] s
> 
>   * igt@syncobj_timeline@stress-wait-last-signal-all-backward:
>     - Statuses : 6 pass(s)
>     - Exec time: [10.21, 10.52] s
> 
>   * igt@syncobj_timeline@stress-wait-last-signal-all-forward:
>     - Statuses : 7 pass(s)
>     - Exec time: [10.18, 10.86] s
> 
>   * igt@syncobj_timeline@stress-wait-last-signal-all-random:
>     - Statuses : 6 pass(s)
>     - Exec time: [10.15, 10.64] s
> 
>   * igt@syncobj_timeline@stress-wait-last-signal-backward:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.85, 3.76] s
> 
>   * igt@syncobj_timeline@stress-wait-last-signal-forward:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.88, 1.95] s
> 
>   * igt@syncobj_timeline@stress-wait-last-signal-random:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.94, 1.92] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13822_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@crc32:
>     - shard-rkl:          NOTRUN -> [SKIP][3] ([i915#6230])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@api_intel_bb@crc32.html
> 
>   * igt@api_intel_bb@object-reloc-keep-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][4] ([i915#8411])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@api_intel_bb@object-reloc-keep-cache.html
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-tglu:         NOTRUN -> [SKIP][5] ([i915#11078])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-2/igt@device_reset@cold-reset-bound.html
> 
>   * igt@fbdev@eof:
>     - shard-rkl:          [PASS][6] -> [SKIP][7] ([i915#14544] / [i915#2582])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@fbdev@eof.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@fbdev@eof.html
> 
>   * igt@gem_basic@multigpu-create-close:
>     - shard-dg2:          NOTRUN -> [SKIP][8] ([i915#7697])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-4/igt@gem_basic@multigpu-create-close.html
> 
>   * igt@gem_ccs@block-multicopy-inplace:
>     - shard-dg1:          NOTRUN -> [SKIP][9] ([i915#3555] / [i915#9323])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-18/igt@gem_ccs@block-multicopy-inplace.html
> 
>   * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][10] ([i915#12392])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-dg2:          NOTRUN -> [ABORT][11] ([i915#13427])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-1/igt@gem_create@create-ext-cpu-access-big.html
>     - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#14544] / [i915#6335])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-dg2-9:        NOTRUN -> [SKIP][13] ([i915#8562])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@gem_create@create-ext-set-pat.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][14] ([i915#8562])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_persistence@heartbeat-close:
>     - shard-dg2-9:        NOTRUN -> [SKIP][15] ([i915#8555])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@gem_ctx_persistence@heartbeat-close.html
> 
>   * igt@gem_ctx_persistence@heartbeat-many:
>     - shard-mtlp:         NOTRUN -> [SKIP][16] ([i915#8555])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-5/igt@gem_ctx_persistence@heartbeat-many.html
> 
>   * igt@gem_ctx_persistence@heartbeat-stop:
>     - shard-dg2:          NOTRUN -> [SKIP][17] ([i915#8555])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-4/igt@gem_ctx_persistence@heartbeat-stop.html
> 
>   * igt@gem_ctx_persistence@idempotent:
>     - shard-snb:          NOTRUN -> [SKIP][18] ([i915#1099])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-snb7/igt@gem_ctx_persistence@idempotent.html
> 
>   * igt@gem_ctx_sseu@engines:
>     - shard-tglu-1:       NOTRUN -> [SKIP][19] ([i915#280])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@gem_ctx_sseu@engines.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][20] ([i915#280])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@gem_ctx_sseu@engines.html
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][21] ([i915#13390])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-glk9/igt@gem_eio@in-flight-suspend.html
> 
>   * igt@gem_exec_capture@capture-invisible@lmem0:
>     - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#6334]) +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-4/igt@gem_exec_capture@capture-invisible@lmem0.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-glk:          NOTRUN -> [SKIP][23] ([i915#6334]) +1 other test skip
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-glk6/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_fence@submit3:
>     - shard-dg2:          NOTRUN -> [SKIP][24] ([i915#4812]) +2 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-5/igt@gem_exec_fence@submit3.html
> 
>   * igt@gem_exec_fence@syncobj-backward-timeline-chain-engines:
>     - shard-snb:          NOTRUN -> [SKIP][25] +60 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-snb1/igt@gem_exec_fence@syncobj-backward-timeline-chain-engines.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>     - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#3539] / [i915#4852]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-3/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
>     - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#14544]) +13 other tests skip
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
> 
>   * igt@gem_exec_flush@basic-uc-prw-default:
>     - shard-dg2-9:        NOTRUN -> [SKIP][28] ([i915#3539])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@gem_exec_flush@basic-uc-prw-default.html
> 
>   * igt@gem_exec_flush@basic-wb-pro-default:
>     - shard-dg2-9:        NOTRUN -> [SKIP][29] ([i915#3539] / [i915#4852]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@gem_exec_flush@basic-wb-pro-default.html
> 
>   * igt@gem_exec_flush@basic-wb-prw-default:
>     - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#3539] / [i915#4852]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-16/igt@gem_exec_flush@basic-wb-prw-default.html
> 
>   * igt@gem_exec_params@rsvd2-dirt:
>     - shard-dg2-9:        NOTRUN -> [SKIP][31] ([i915#5107])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@gem_exec_params@rsvd2-dirt.html
> 
>   * igt@gem_exec_reloc@basic-concurrent0:
>     - shard-rkl:          NOTRUN -> [SKIP][32] ([i915#3281]) +1 other test skip
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@gem_exec_reloc@basic-concurrent0.html
> 
>   * igt@gem_exec_reloc@basic-cpu-wc-active:
>     - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#3281]) +2 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-4/igt@gem_exec_reloc@basic-cpu-wc-active.html
> 
>   * igt@gem_exec_reloc@basic-gtt-cpu:
>     - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#3281]) +3 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-17/igt@gem_exec_reloc@basic-gtt-cpu.html
> 
>   * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
>     - shard-dg2-9:        NOTRUN -> [SKIP][35] ([i915#3281]) +8 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-wc-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][36] ([i915#3281]) +13 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-1/igt@gem_exec_reloc@basic-wc-gtt.html
>     - shard-rkl:          NOTRUN -> [SKIP][37] ([i915#14544] / [i915#3281])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_exec_reloc@basic-wc-gtt.html
> 
>   * igt@gem_exec_schedule@preempt-queue-contexts:
>     - shard-dg1:          NOTRUN -> [SKIP][38] ([i915#4812])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-16/igt@gem_exec_schedule@preempt-queue-contexts.html
>     - shard-mtlp:         NOTRUN -> [SKIP][39] ([i915#4537] / [i915#4812])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-1/igt@gem_exec_schedule@preempt-queue-contexts.html
>     - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4537] / [i915#4812])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-7/igt@gem_exec_schedule@preempt-queue-contexts.html
> 
>   * igt@gem_exec_suspend@basic-s3-devices:
>     - shard-dg1:          [PASS][41] -> [DMESG-WARN][42] ([i915#4423]) +4 other tests dmesg-warn
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg1-19/igt@gem_exec_suspend@basic-s3-devices.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-15/igt@gem_exec_suspend@basic-s3-devices.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-x:
>     - shard-dg1:          NOTRUN -> [SKIP][43] ([i915#4860])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-18/igt@gem_fence_thrash@bo-write-verify-x.html
> 
>   * igt@gem_fenced_exec_thrash@too-many-fences:
>     - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4860]) +1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-3/igt@gem_fenced_exec_thrash@too-many-fences.html
> 
>   * igt@gem_lmem_swapping@parallel-multi:
>     - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#4613])
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@gem_lmem_swapping@parallel-multi.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][46] ([i915#4613]) +2 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_lmem_swapping@smem-oom:
>     - shard-tglu:         NOTRUN -> [SKIP][47] ([i915#4613]) +2 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-9/igt@gem_lmem_swapping@smem-oom.html
>     - shard-glk:          NOTRUN -> [SKIP][48] ([i915#4613]) +2 other tests skip
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-glk1/igt@gem_lmem_swapping@smem-oom.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg1:          NOTRUN -> [TIMEOUT][49] ([i915#5493]) +1 other test timeout
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_lmem_swapping@verify-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][50] ([i915#14544] / [i915#4613])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html
> 
>   * igt@gem_media_vme:
>     - shard-dg2:          NOTRUN -> [SKIP][51] ([i915#284])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-5/igt@gem_media_vme.html
> 
>   * igt@gem_mmap@basic-small-bo:
>     - shard-mtlp:         NOTRUN -> [SKIP][52] ([i915#4083]) +1 other test skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-6/igt@gem_mmap@basic-small-bo.html
> 
>   * igt@gem_mmap_gtt@basic-write:
>     - shard-dg2-9:        NOTRUN -> [SKIP][53] ([i915#4077]) +4 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@gem_mmap_gtt@basic-write.html
> 
>   * igt@gem_mmap_gtt@zero-extend:
>     - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4077]) +6 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-4/igt@gem_mmap_gtt@zero-extend.html
>     - shard-dg1:          NOTRUN -> [SKIP][55] ([i915#4077]) +7 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-13/igt@gem_mmap_gtt@zero-extend.html
>     - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#4077]) +2 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-3/igt@gem_mmap_gtt@zero-extend.html
> 
>   * igt@gem_mmap_wc@invalid-flags:
>     - shard-dg2-9:        NOTRUN -> [SKIP][57] ([i915#4083]) +3 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@gem_mmap_wc@invalid-flags.html
> 
>   * igt@gem_mmap_wc@read-write-distinct:
>     - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4083]) +4 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-1/igt@gem_mmap_wc@read-write-distinct.html
> 
>   * igt@gem_mmap_wc@write-read:
>     - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#4083]) +4 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-19/igt@gem_mmap_wc@write-read.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads:
>     - shard-dg2-9:        NOTRUN -> [SKIP][60] ([i915#3282]) +6 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@gem_partial_pwrite_pread@writes-after-reads.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-glk:          NOTRUN -> [WARN][61] ([i915#14702] / [i915#2658])
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-glk6/igt@gem_pwrite@basic-exhaustion.html
>     - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#3282])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-13/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pxp@create-regular-buffer:
>     - shard-rkl:          [PASS][63] -> [SKIP][64] ([i915#14544] / [i915#4270])
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@gem_pxp@create-regular-buffer.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_pxp@create-regular-buffer.html
> 
>   * igt@gem_pxp@create-regular-context-2:
>     - shard-rkl:          NOTRUN -> [TIMEOUT][65] ([i915#12917] / [i915#12964]) +1 other test timeout
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@gem_pxp@create-regular-context-2.html
> 
>   * igt@gem_pxp@display-protected-crc:
>     - shard-rkl:          [PASS][66] -> [TIMEOUT][67] ([i915#12917] / [i915#12964]) +2 other tests timeout
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@gem_pxp@display-protected-crc.html
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@gem_pxp@display-protected-crc.html
> 
>   * igt@gem_pxp@regular-baseline-src-copy-readible:
>     - shard-dg2:          NOTRUN -> [SKIP][68] ([i915#4270]) +3 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-3/igt@gem_pxp@regular-baseline-src-copy-readible.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-1:
>     - shard-dg2-9:        NOTRUN -> [SKIP][69] ([i915#4270]) +1 other test skip
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@gem_pxp@reject-modify-context-protection-off-1.html
> 
>   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>     - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4270]) +2 other tests skip
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-12/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> 
>   * igt@gem_readwrite@beyond-eob:
>     - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#3282]) +4 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-8/igt@gem_readwrite@beyond-eob.html
> 
>   * igt@gem_readwrite@write-bad-handle:
>     - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#3282]) +1 other test skip
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-2/igt@gem_readwrite@write-bad-handle.html
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-linear:
>     - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#8428])
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-1/igt@gem_render_copy@y-tiled-ccs-to-linear.html
> 
>   * igt@gem_render_copy@y-tiled-to-vebox-yf-tiled:
>     - shard-glk10:        NOTRUN -> [SKIP][74] +61 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-glk10/igt@gem_render_copy@y-tiled-to-vebox-yf-tiled.html
> 
>   * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#5190] / [i915#8428]) +5 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html
> 
>   * igt@gem_render_copy@yf-tiled-to-vebox-x-tiled:
>     - shard-dg2-9:        NOTRUN -> [SKIP][76] ([i915#5190] / [i915#8428]) +3 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@gem_render_copy@yf-tiled-to-vebox-x-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>     - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#8411]) +1 other test skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
> 
>   * igt@gem_set_tiling_vs_pwrite:
>     - shard-rkl:          NOTRUN -> [SKIP][78] ([i915#3282]) +2 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@gem_set_tiling_vs_pwrite.html
> 
>   * igt@gem_softpin@evict-snoop-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#4885])
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@gem_softpin@evict-snoop-interruptible.html
> 
>   * igt@gem_tiled_pread_basic:
>     - shard-mtlp:         NOTRUN -> [SKIP][80] ([i915#4079]) +1 other test skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-2/igt@gem_tiled_pread_basic.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][81] ([i915#4079])
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@gem_tiled_pread_basic.html
> 
>   * igt@gem_tiled_pread_pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][82] ([i915#4079]) +3 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-3/igt@gem_tiled_pread_pwrite.html
>     - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#14544] / [i915#3282])
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_tiled_pread_pwrite.html
>     - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#4079]) +2 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-12/igt@gem_tiled_pread_pwrite.html
> 
>   * igt@gem_unfence_active_buffers:
>     - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4879])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-15/igt@gem_unfence_active_buffers.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][86] ([i915#4879])
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@gem_unfence_active_buffers.html
> 
>   * igt@gem_userptr_blits@coherency-unsync:
>     - shard-tglu:         NOTRUN -> [SKIP][87] ([i915#3297])
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-4/igt@gem_userptr_blits@coherency-unsync.html
> 
>   * igt@gem_userptr_blits@create-destroy-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][88] ([i915#3297]) +4 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-4/igt@gem_userptr_blits@create-destroy-unsync.html
>     - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#3297]) +1 other test skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-6/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-glk:          NOTRUN -> [SKIP][90] ([i915#3323])
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-glk1/igt@gem_userptr_blits@dmabuf-sync.html
>     - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#14544] / [i915#3297] / [i915#3323])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@dmabuf-unsync:
>     - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#3297]) +1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-12/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>   * igt@gem_userptr_blits@forbidden-operations:
>     - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#3282] / [i915#3297])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-3/igt@gem_userptr_blits@forbidden-operations.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
>     - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#3297] / [i915#4880])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
> 
>   * igt@gem_userptr_blits@sd-probe:
>     - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#3297] / [i915#4958])
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-14/igt@gem_userptr_blits@sd-probe.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-after-close:
>     - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#3297])
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@gem_userptr_blits@unsync-unmap-after-close.html
> 
>   * igt@gem_workarounds@suspend-resume-fd:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][97] ([i915#13356] / [i915#14586])
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-glk10/igt@gem_workarounds@suspend-resume-fd.html
> 
>   * igt@gen9_exec_parse@batch-without-end:
>     - shard-dg1:          NOTRUN -> [SKIP][98] ([i915#2527]) +1 other test skip
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-13/igt@gen9_exec_parse@batch-without-end.html
> 
>   * igt@gen9_exec_parse@batch-zero-length:
>     - shard-tglu:         NOTRUN -> [SKIP][99] ([i915#2527] / [i915#2856]) +3 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-4/igt@gen9_exec_parse@batch-zero-length.html
> 
>   * igt@gen9_exec_parse@bb-oversize:
>     - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#2527]) +2 other tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@gen9_exec_parse@bb-oversize.html
> 
>   * igt@gen9_exec_parse@bb-start-far:
>     - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#2856]) +1 other test skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-4/igt@gen9_exec_parse@bb-start-far.html
> 
>   * igt@gen9_exec_parse@bb-start-param:
>     - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#2856]) +5 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-5/igt@gen9_exec_parse@bb-start-param.html
> 
>   * igt@gen9_exec_parse@shadow-peek:
>     - shard-tglu-1:       NOTRUN -> [SKIP][103] ([i915#2527] / [i915#2856]) +1 other test skip
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@gen9_exec_parse@shadow-peek.html
> 
>   * igt@gen9_exec_parse@valid-registers:
>     - shard-dg2-9:        NOTRUN -> [SKIP][104] ([i915#2856])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@gen9_exec_parse@valid-registers.html
> 
>   * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:
>     - shard-dg2:          NOTRUN -> [SKIP][105] ([i915#14073]) +15 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-3/igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1.html
> 
>   * igt@i915_drm_fdinfo@virtual-busy-hang:
>     - shard-mtlp:         NOTRUN -> [SKIP][106] ([i915#14118])
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-7/igt@i915_drm_fdinfo@virtual-busy-hang.html
> 
>   * igt@i915_drm_fdinfo@virtual-busy-hang-all:
>     - shard-dg2-9:        NOTRUN -> [SKIP][107] ([i915#14118])
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy-hang-all.html
> 
>   * igt@i915_drm_fdinfo@virtual-busy-idle-all:
>     - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#14118]) +1 other test skip
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-1/igt@i915_drm_fdinfo@virtual-busy-idle-all.html
> 
>   * igt@i915_hangman@hangcheck-unterminated:
>     - shard-rkl:          [PASS][109] -> [DMESG-WARN][110] ([i915#12964]) +34 other tests dmesg-warn
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@i915_hangman@hangcheck-unterminated.html
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@i915_hangman@hangcheck-unterminated.html
> 
>   * igt@i915_module_load@reload-no-display:
>     - shard-dg1:          [PASS][111] -> [DMESG-WARN][112] ([i915#13029] / [i915#14545])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg1-15/igt@i915_module_load@reload-no-display.html
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-18/igt@i915_module_load@reload-no-display.html
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][113] ([i915#14545])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-3/igt@i915_module_load@resize-bar.html
> 
>   * igt@i915_pm_freq_api@freq-basic-api:
>     - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#8399])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@i915_pm_freq_api@freq-basic-api.html
> 
>   * igt@i915_pm_freq_api@freq-reset:
>     - shard-tglu-1:       NOTRUN -> [SKIP][115] ([i915#8399])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@i915_pm_freq_api@freq-reset.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle:
>     - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#14498])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-4/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>   * igt@i915_pm_rps@min-max-config-loaded:
>     - shard-dg2-9:        NOTRUN -> [SKIP][117] ([i915#11681] / [i915#6621])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@i915_pm_rps@min-max-config-loaded.html
> 
>   * igt@i915_pm_rps@thresholds:
>     - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#11681])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-6/igt@i915_pm_rps@thresholds.html
> 
>   * igt@i915_pm_rps@thresholds-park:
>     - shard-dg2-9:        NOTRUN -> [SKIP][119] ([i915#11681])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@i915_pm_rps@thresholds-park.html
> 
>   * igt@i915_selftest@live@gt_pm:
>     - shard-rkl:          [PASS][120] -> [DMESG-FAIL][121] ([i915#12942]) +1 other test dmesg-fail
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@i915_selftest@live@gt_pm.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - shard-dg2:          NOTRUN -> [DMESG-FAIL][122] ([i915#12061]) +1 other test dmesg-fail
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-8/igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
>     - shard-dg2-9:        NOTRUN -> [SKIP][123] ([i915#4212])
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
> 
>   * igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>     - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#4212]) +1 other test skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-3/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-tglu:         NOTRUN -> [SKIP][125] ([i915#12454] / [i915#12712])
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-6/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume:
>     - shard-dg2:          [PASS][126] -> [FAIL][127] ([i915#14889])
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg2-7/igt@kms_async_flips@async-flip-suspend-resume.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@kms_async_flips@async-flip-suspend-resume.html
>     - shard-glk:          NOTRUN -> [INCOMPLETE][128] ([i915#12761]) +1 other test incomplete
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-glk1/igt@kms_async_flips@async-flip-suspend-resume.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-3:
>     - shard-dg2:          NOTRUN -> [FAIL][129] ([i915#14889])
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-3.html
> 
>   * igt@kms_async_flips@test-cursor:
>     - shard-mtlp:         NOTRUN -> [SKIP][130] ([i915#10333])
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-7/igt@kms_async_flips@test-cursor.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-tglu:         NOTRUN -> [SKIP][131] ([i915#1769] / [i915#3555])
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-glk:          NOTRUN -> [SKIP][132] ([i915#1769])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-glk5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3:
>     - shard-dg2:          [PASS][133] -> [FAIL][134] ([i915#5956]) +1 other test fail
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg2-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3.html
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>     - shard-dg2-9:        NOTRUN -> [SKIP][135] +6 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-addfb-size-overflow:
>     - shard-dg1:          NOTRUN -> [SKIP][136] ([i915#5286])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-17/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-tglu:         NOTRUN -> [SKIP][137] ([i915#5286]) +5 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-10/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#5286]) +3 other tests skip
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-tglu-1:       NOTRUN -> [SKIP][139] ([i915#5286]) +2 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-dg1:          NOTRUN -> [SKIP][140] ([i915#4538] / [i915#5286]) +2 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>     - shard-mtlp:         [PASS][141] -> [FAIL][142] ([i915#5138])
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][143] ([i915#3638]) +1 other test skip
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-17/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#3638]) +1 other test skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>     - shard-dg2:          NOTRUN -> [SKIP][145] +8 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#5190]) +2 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#4538] / [i915#5190]) +9 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>     - shard-mtlp:         NOTRUN -> [SKIP][148] +4 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>     - shard-dg2-9:        NOTRUN -> [SKIP][149] ([i915#5190]) +2 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-dg2-9:        NOTRUN -> [SKIP][150] ([i915#4538] / [i915#5190]) +6 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-dg1:          NOTRUN -> [SKIP][151] ([i915#4538]) +2 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-15/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_busy@basic:
>     - shard-rkl:          [PASS][152] -> [SKIP][153] ([i915#11190] / [i915#14544]) +1 other test skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-5/igt@kms_busy@basic.html
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_busy@basic.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#6095]) +74 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-9/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
>     - shard-dg2-9:        NOTRUN -> [SKIP][155] ([i915#10307] / [i915#6095]) +54 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
>     - shard-glk:          NOTRUN -> [SKIP][156] +346 other tests skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-glk5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][157] ([i915#6095]) +19 other tests skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#12313]) +2 other tests skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#10307] / [i915#6095]) +130 other tests skip
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#6095]) +24 other tests skip
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#12805])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#6095]) +16 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
>     - shard-dg2-9:        NOTRUN -> [SKIP][163] ([i915#6095]) +4 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#12313])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-16/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>     - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#12313])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>     - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#12313])
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
>     - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#12313])
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][168] ([i915#14098] / [i915#6095]) +40 other tests skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>     - shard-dg2-9:        NOTRUN -> [SKIP][169] ([i915#12313])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][170] ([i915#10307] / [i915#10434] / [i915#6095])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][171] ([i915#6095]) +38 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][172] ([i915#12964]) +1 other test dmesg-warn
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][173] ([i915#12313]) +1 other test skip
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3:
>     - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#6095]) +125 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-13/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-3.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2:          NOTRUN -> [SKIP][175] ([i915#13784])
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@kms_cdclk@mode-transition-all-outputs.html
>     - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#3742])
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-2:
>     - shard-dg2-9:        NOTRUN -> [SKIP][177] ([i915#13781]) +4 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-c-dp-3:
>     - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#13783]) +3 other tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-c-dp-3.html
> 
>   * igt@kms_chamelium_edid@dp-edid-read:
>     - shard-dg2-9:        NOTRUN -> [SKIP][179] ([i915#11151] / [i915#7828]) +4 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_chamelium_edid@dp-edid-read.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - shard-tglu-1:       NOTRUN -> [SKIP][180] ([i915#11151] / [i915#7828]) +5 other tests skip
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_chamelium_edid@vga-edid-read:
>     - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#11151] / [i915#14544] / [i915#7828]) +1 other test skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_chamelium_edid@vga-edid-read.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>     - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#11151] / [i915#7828]) +10 other tests skip
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-4/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>     - shard-dg1:          NOTRUN -> [SKIP][183] ([i915#11151] / [i915#7828]) +4 other tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
>     - shard-tglu:         NOTRUN -> [SKIP][184] ([i915#11151] / [i915#7828]) +9 other tests skip
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-3/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
>     - shard-mtlp:         NOTRUN -> [SKIP][185] ([i915#11151] / [i915#7828]) +2 other tests skip
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-6/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#11151] / [i915#7828]) +2 other tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_color@legacy-gamma-reset:
>     - shard-rkl:          [PASS][187] -> [SKIP][188] ([i915#12655] / [i915#14544])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-5/igt@kms_color@legacy-gamma-reset.html
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_color@legacy-gamma-reset.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-dg1:          NOTRUN -> [SKIP][189] ([i915#7116] / [i915#9424])
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-19/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-dg2:          NOTRUN -> [SKIP][190] ([i915#9424])
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-6/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-9:        NOTRUN -> [SKIP][191] ([i915#3299])
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-dg2:          NOTRUN -> [SKIP][192] ([i915#3299]) +1 other test skip
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#7118] / [i915#9424])
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-5/igt@kms_content_protection@legacy.html
>     - shard-rkl:          NOTRUN -> [SKIP][194] ([i915#7118] / [i915#9424])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-2/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#6944] / [i915#9424]) +1 other test skip
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-8/igt@kms_content_protection@lic-type-0.html
>     - shard-dg1:          NOTRUN -> [SKIP][196] ([i915#9424])
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-17/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#6944] / [i915#9424]) +1 other test skip
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_content_protection@mei-interface.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][198] ([i915#9424])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@uevent@pipe-a-dp-3:
>     - shard-dg2:          NOTRUN -> [FAIL][199] ([i915#1339] / [i915#7173])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@kms_content_protection@uevent@pipe-a-dp-3.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-128x42:
>     - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#8814]) +1 other test skip
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x42:
>     - shard-tglu:         [PASS][201] -> [FAIL][202] ([i915#13566]) +1 other test fail
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-tglu-10/igt@kms_cursor_crc@cursor-onscreen-128x42.html
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-rkl:          NOTRUN -> [SKIP][203] ([i915#3555]) +2 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-tglu:         NOTRUN -> [SKIP][204] ([i915#13049])
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [FAIL][205] ([i915#13566]) +1 other test fail
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-dg2:          NOTRUN -> [SKIP][206] ([i915#13049])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-3/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-random-max-size:
>     - shard-tglu-1:       NOTRUN -> [SKIP][207] ([i915#3555]) +2 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_cursor_crc@cursor-random-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>     - shard-dg2-9:        NOTRUN -> [SKIP][208] ([i915#3555]) +3 other tests skip
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x42:
>     - shard-rkl:          [PASS][209] -> [FAIL][210] ([i915#13566]) +1 other test fail
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-128x42.html
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [FAIL][211] ([i915#13566]) +1 other test fail
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-256x85:
>     - shard-tglu-1:       NOTRUN -> [FAIL][212] ([i915#13566]) +1 other test fail
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#3555]) +5 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-3/igt@kms_cursor_crc@cursor-sliding-32x10.html
>     - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#3555]) +2 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-19/igt@kms_cursor_crc@cursor-sliding-32x10.html
>     - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#3555]) +3 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-32x10.html
>     - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#3555] / [i915#8814])
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-8/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>     - shard-dg2-9:        NOTRUN -> [SKIP][217] ([i915#13046] / [i915#5354]) +1 other test skip
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#4103] / [i915#4213])
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-dg1:          NOTRUN -> [SKIP][219] ([i915#4103] / [i915#4213])
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-15/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][220] ([i915#4103] / [i915#4213])
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
>     - shard-rkl:          NOTRUN -> [SKIP][221] ([i915#11190] / [i915#14544])
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][222] +3 other tests skip
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
>     - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#9809]) +1 other test skip
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#13046] / [i915#5354]) +6 other tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>     - shard-rkl:          [PASS][225] -> [FAIL][226] ([i915#2346])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>     - shard-dg2:          NOTRUN -> [SKIP][227] ([i915#9833])
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#1257])
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-7/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-dg1:          NOTRUN -> [SKIP][229] ([i915#13748])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-16/igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_dp_link_training@uhbr-sst:
>     - shard-tglu-1:       NOTRUN -> [SKIP][230] ([i915#13748])
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][231] ([i915#13748])
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_dp_link_training@uhbr-sst.html
> 
>   * igt@kms_draw_crc@draw-method-mmap-gtt:
>     - shard-rkl:          [PASS][232] -> [SKIP][233] ([i915#14544]) +36 other tests skip
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@kms_draw_crc@draw-method-mmap-gtt.html
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_draw_crc@draw-method-mmap-gtt.html
>     - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#8812])
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-1/igt@kms_draw_crc@draw-method-mmap-gtt.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp:
>     - shard-dg2-9:        NOTRUN -> [SKIP][235] ([i915#3840] / [i915#9688])
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_dsc@dsc-fractional-bpp.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-dg2:          [PASS][236] -> [FAIL][237] ([i915#4767])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg2-3/igt@kms_fbcon_fbt@fbc-suspend.html
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-tglu:         NOTRUN -> [SKIP][238] ([i915#2065] / [i915#4854])
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-3/igt@kms_feature_discovery@chamelium.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][239] ([i915#4854])
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#1839])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-6/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@display-3x:
>     - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#1839])
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-17/igt@kms_feature_discovery@display-3x.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#14544] / [i915#658])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank:
>     - shard-tglu:         NOTRUN -> [SKIP][243] ([i915#3637] / [i915#9934]) +6 other tests skip
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-8/igt@kms_flip@2x-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>     - shard-dg1:          NOTRUN -> [SKIP][244] ([i915#9934]) +3 other tests skip
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-17/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][245] ([i915#9934]) +2 other tests skip
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_flip@2x-flip-vs-dpms.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank:
>     - shard-mtlp:         NOTRUN -> [SKIP][246] ([i915#3637] / [i915#9934]) +1 other test skip
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-8/igt@kms_flip@2x-flip-vs-expired-vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-fences-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#8381])
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-12/igt@kms_flip@2x-flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-rmfb:
>     - shard-rkl:          NOTRUN -> [SKIP][248] ([i915#14544] / [i915#9934]) +1 other test skip
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_flip@2x-flip-vs-rmfb.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][249] ([i915#12745] / [i915#4839])
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-glk5/igt@kms_flip@2x-flip-vs-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-snb:          [PASS][250] -> [TIMEOUT][251] ([i915#14033] / [i915#14350])
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
>     - shard-snb:          [PASS][252] -> [TIMEOUT][253] ([i915#14033])
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-snb7/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-snb5/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][254] ([i915#4839])
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-glk5/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check:
>     - shard-dg2:          NOTRUN -> [SKIP][255] ([i915#9934]) +8 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-1/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>   * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
>     - shard-dg2-9:        NOTRUN -> [SKIP][256] ([i915#9934]) +7 other tests skip
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check:
>     - shard-tglu-1:       NOTRUN -> [SKIP][257] ([i915#3637] / [i915#9934]) +5 other tests skip
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_flip@2x-wf_vblank-ts-check.html
> 
>   * igt@kms_flip@bo-too-big-interruptible:
>     - shard-rkl:          [PASS][258] -> [SKIP][259] ([i915#14544] / [i915#3637]) +9 other tests skip
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@kms_flip@bo-too-big-interruptible.html
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_flip@bo-too-big-interruptible.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank:
>     - shard-rkl:          [PASS][260] -> [FAIL][261] ([i915#10826]) +1 other test fail
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@flip-vs-fences-interruptible:
>     - shard-dg2-9:        NOTRUN -> [SKIP][262] ([i915#8381]) +1 other test skip
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_flip@flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
>     - shard-tglu:         NOTRUN -> [SKIP][263] ([i915#2672] / [i915#3555]) +3 other tests skip
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][264] ([i915#2587] / [i915#2672]) +3 other tests skip
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>     - shard-mtlp:         NOTRUN -> [SKIP][265] ([i915#2672] / [i915#3555] / [i915#8813])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
>     - shard-rkl:          NOTRUN -> [SKIP][266] ([i915#14544] / [i915#3555])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
>     - shard-dg1:          NOTRUN -> [SKIP][267] ([i915#2672] / [i915#3555]) +1 other test skip
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][268] ([i915#2672] / [i915#8813])
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][269] ([i915#2587] / [i915#2672]) +1 other test skip
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-12/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][270] ([i915#2672]) +5 other tests skip
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][271] ([i915#2587] / [i915#2672]) +1 other test skip
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
>     - shard-dg2-9:        NOTRUN -> [SKIP][272] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
>     - shard-dg2-9:        NOTRUN -> [SKIP][273] ([i915#2672]) +2 other tests skip
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
>     - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#2672] / [i915#3555]) +1 other test skip
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
>     - shard-tglu-1:       NOTRUN -> [SKIP][276] ([i915#2672] / [i915#3555]) +1 other test skip
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling:
>     - shard-rkl:          [PASS][277] -> [SKIP][278] ([i915#14544] / [i915#3555]) +2 other tests skip
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#2672] / [i915#3555]) +3 other tests skip
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#2672]) +3 other tests skip
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>     - shard-dg2-9:        NOTRUN -> [SKIP][281] ([i915#2672] / [i915#3555])
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-mtlp:         NOTRUN -> [SKIP][282] ([i915#1825]) +4 other tests skip
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#8708]) +15 other tests skip
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
>     - shard-rkl:          [PASS][284] -> [SKIP][285] ([i915#14544] / [i915#1849] / [i915#5354]) +3 other tests skip
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][286] ([i915#3458]) +23 other tests skip
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][287] ([i915#10433] / [i915#3458]) +1 other test skip
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][288] +20 other tests skip
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
>     - shard-tglu-1:       NOTRUN -> [SKIP][289] +47 other tests skip
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][290] ([i915#8708]) +1 other test skip
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#1825]) +13 other tests skip
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>     - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#3023]) +7 other tests skip
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
>     - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#8708]) +7 other tests skip
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>     - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#5439])
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-pwrite:
>     - shard-dg2-9:        NOTRUN -> [SKIP][295] ([i915#3458]) +11 other tests skip
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu:
>     - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#14544] / [i915#1849] / [i915#5354]) +3 other tests skip
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
>     - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#3458]) +9 other tests skip
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
>     - shard-dg2-9:        NOTRUN -> [SKIP][298] ([i915#8708]) +16 other tests skip
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#5354]) +27 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
>     - shard-dg2-9:        NOTRUN -> [SKIP][300] ([i915#5354]) +14 other tests skip
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-tglu:         NOTRUN -> [SKIP][301] +65 other tests skip
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-tglu-1:       NOTRUN -> [SKIP][302] ([i915#3555] / [i915#8228])
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-dg2-9:        NOTRUN -> [SKIP][303] ([i915#12713])
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_hdr@brightness-with-hdr.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][304] ([i915#12713])
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-tglu:         NOTRUN -> [SKIP][305] ([i915#3555] / [i915#8228]) +1 other test skip
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-7/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-dg2:          NOTRUN -> [SKIP][306] ([i915#3555] / [i915#8228]) +1 other test skip
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-6/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-dg1:          NOTRUN -> [SKIP][307] ([i915#3555] / [i915#8228])
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-15/igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_invalid_mode@clock-too-high:
>     - shard-rkl:          [PASS][308] -> [SKIP][309] ([i915#14544] / [i915#3555] / [i915#8826])
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-2/igt@kms_invalid_mode@clock-too-high.html
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_invalid_mode@clock-too-high.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#10656])
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-8/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-dg2-9:        NOTRUN -> [SKIP][311] ([i915#10656])
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-dg2:          NOTRUN -> [SKIP][312] ([i915#12339])
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-big-joiner:
>     - shard-rkl:          NOTRUN -> [SKIP][313] ([i915#12388])
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][314] ([i915#12388])
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>   * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>     - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#12394])
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-rkl:          NOTRUN -> [SKIP][316] ([i915#6301])
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_panel_fitting@atomic-fastset.html
>     - shard-dg1:          NOTRUN -> [SKIP][317] ([i915#6301])
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-14/igt@kms_panel_fitting@atomic-fastset.html
>     - shard-tglu:         NOTRUN -> [SKIP][318] ([i915#6301])
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-8/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][319] ([i915#12756] / [i915#13409] / [i915#13476])
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][320] ([i915#13409] / [i915#13476])
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-glk9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_plane@planar-pixel-format-settings:
>     - shard-rkl:          [PASS][321] -> [SKIP][322] ([i915#14544] / [i915#9581])
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@kms_plane@planar-pixel-format-settings.html
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_plane@planar-pixel-format-settings.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][323] ([i915#14412])
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-max:
>     - shard-rkl:          [PASS][324] -> [SKIP][325] ([i915#14544] / [i915#7294]) +1 other test skip
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@kms_plane_alpha_blend@constant-alpha-max.html
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-max.html
> 
>   * igt@kms_plane_cursor@primary@pipe-d-edp-1-size-64:
>     - shard-mtlp:         [PASS][326] -> [DMESG-WARN][327] ([i915#13736])
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-mtlp-7/igt@kms_plane_cursor@primary@pipe-d-edp-1-size-64.html
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-1/igt@kms_plane_cursor@primary@pipe-d-edp-1-size-64.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-dg2-9:        NOTRUN -> [SKIP][328] ([i915#8821])
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_multiple@2x-tiling-4:
>     - shard-dg1:          NOTRUN -> [SKIP][329] ([i915#13958]) +1 other test skip
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-17/igt@kms_plane_multiple@2x-tiling-4.html
> 
>   * igt@kms_plane_multiple@2x-tiling-x:
>     - shard-tglu:         NOTRUN -> [SKIP][330] ([i915#13958])
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-2/igt@kms_plane_multiple@2x-tiling-x.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-dg2:          NOTRUN -> [SKIP][331] ([i915#13958]) +1 other test skip
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-6/igt@kms_plane_multiple@2x-tiling-y.html
>     - shard-rkl:          NOTRUN -> [SKIP][332] ([i915#13958])
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@kms_plane_multiple@2x-tiling-y.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][333] ([i915#13958])
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_plane_multiple@2x-tiling-y.html
>     - shard-mtlp:         NOTRUN -> [SKIP][334] ([i915#13958])
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-1/igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_plane_multiple@tiling-yf:
>     - shard-tglu-1:       NOTRUN -> [SKIP][335] ([i915#14259])
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_plane_multiple@tiling-yf.html
>     - shard-dg2-9:        NOTRUN -> [SKIP][336] ([i915#14259])
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_plane_multiple@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#6953] / [i915#9423])
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-3/igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d:
>     - shard-tglu-1:       NOTRUN -> [SKIP][338] ([i915#12247]) +4 other tests skip
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-d.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
>     - shard-rkl:          [PASS][339] -> [SKIP][340] ([i915#14544] / [i915#3555] / [i915#8152])
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
>     - shard-rkl:          [PASS][341] -> [SKIP][342] ([i915#12247] / [i915#14544]) +5 other tests skip
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
>     - shard-rkl:          [PASS][343] -> [SKIP][344] ([i915#14544] / [i915#8152]) +1 other test skip
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
> 
>   * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b:
>     - shard-rkl:          [PASS][345] -> [SKIP][346] ([i915#12247] / [i915#14544] / [i915#8152]) +6 other tests skip
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b.html
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
>     - shard-rkl:          [PASS][347] -> [SKIP][348] ([i915#14544] / [i915#6953] / [i915#8152])
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25:
>     - shard-rkl:          [PASS][349] -> [SKIP][350] ([i915#14544] / [i915#3555] / [i915#6953] / [i915#8152]) +1 other test skip
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-5/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
>     - shard-mtlp:         NOTRUN -> [SKIP][351] ([i915#12247] / [i915#6953])
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
>     - shard-mtlp:         NOTRUN -> [SKIP][352] ([i915#12247]) +3 other tests skip
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html
> 
>   * igt@kms_pm_backlight@fade-with-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][353] ([i915#5354])
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_pm_backlight@fade-with-suspend.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][354] ([i915#9812])
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_pm_backlight@fade-with-suspend.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#9685])
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-3/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][356] ([i915#4281])
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-8/igt@kms_pm_dc@dc9-dpms.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-tglu:         NOTRUN -> [SKIP][357] ([i915#3828])
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-6/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-dg2:          NOTRUN -> [SKIP][358] ([i915#9519])
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-1/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-rkl:          NOTRUN -> [SKIP][359] ([i915#9519])
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>     - shard-dg2-9:        NOTRUN -> [SKIP][360] ([i915#9519]) +1 other test skip
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-rkl:          [PASS][361] -> [SKIP][362] ([i915#9519])
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-5/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-tglu:         NOTRUN -> [SKIP][363] ([i915#9519]) +1 other test skip
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>     - shard-mtlp:         NOTRUN -> [SKIP][364] ([i915#9519])
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_prime@basic-crc-hybrid:
>     - shard-dg2-9:        NOTRUN -> [SKIP][365] ([i915#6524] / [i915#6805])
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_prime@basic-crc-hybrid.html
> 
>   * igt@kms_prime@basic-crc-vgem:
>     - shard-rkl:          [PASS][366] -> [SKIP][367] ([i915#14544] / [i915#6524])
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@kms_prime@basic-crc-vgem.html
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_prime@basic-crc-vgem.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-dg2:          NOTRUN -> [SKIP][368] ([i915#6524] / [i915#6805])
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-1/igt@kms_prime@d3hot.html
> 
>   * igt@kms_properties@plane-properties-legacy:
>     - shard-rkl:          [PASS][369] -> [SKIP][370] ([i915#11521] / [i915#14544]) +1 other test skip
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-2/igt@kms_properties@plane-properties-legacy.html
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>     - shard-glk10:        NOTRUN -> [SKIP][371] ([i915#11520])
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-glk10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-9:        NOTRUN -> [SKIP][372] ([i915#11520]) +5 other tests skip
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][373] ([i915#9808]) +1 other test skip
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>     - shard-dg1:          NOTRUN -> [SKIP][374] ([i915#11520]) +5 other tests skip
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-12/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>     - shard-glk:          NOTRUN -> [SKIP][375] ([i915#11520]) +10 other tests skip
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-glk5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
>     - shard-dg2:          NOTRUN -> [SKIP][376] ([i915#11520]) +8 other tests skip
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-7/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
>     - shard-mtlp:         NOTRUN -> [SKIP][377] ([i915#12316]) +4 other tests skip
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-3/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>     - shard-tglu:         NOTRUN -> [SKIP][378] ([i915#11520]) +6 other tests skip
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-3/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-snb:          NOTRUN -> [SKIP][379] ([i915#11520]) +1 other test skip
>    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-snb4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][380] ([i915#11520]) +2 other tests skip
>    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][381] ([i915#11520] / [i915#14544])
>    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>     - shard-tglu-1:       NOTRUN -> [SKIP][382] ([i915#11520]) +5 other tests skip
>    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2:          NOTRUN -> [SKIP][383] ([i915#9683])
>    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-5/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-tglu:         NOTRUN -> [SKIP][384] ([i915#9683])
>    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-9/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-pr-cursor-plane-onoff:
>     - shard-rkl:          NOTRUN -> [SKIP][385] ([i915#1072] / [i915#14544] / [i915#9732]) +1 other test skip
>    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
>     - shard-mtlp:         NOTRUN -> [SKIP][386] ([i915#9688])
>    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-5/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
> 
>   * igt@kms_psr@fbc-pr-primary-page-flip:
>     - shard-dg2-9:        NOTRUN -> [SKIP][387] ([i915#1072] / [i915#9732]) +13 other tests skip
>    [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_psr@fbc-pr-primary-page-flip.html
> 
>   * igt@kms_psr@fbc-pr-sprite-render:
>     - shard-tglu-1:       NOTRUN -> [SKIP][388] ([i915#9732]) +12 other tests skip
>    [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_psr@fbc-pr-sprite-render.html
> 
>   * igt@kms_psr@fbc-psr-cursor-plane-move:
>     - shard-dg1:          NOTRUN -> [SKIP][389] ([i915#1072] / [i915#9732]) +6 other tests skip
>    [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-15/igt@kms_psr@fbc-psr-cursor-plane-move.html
> 
>   * igt@kms_psr@fbc-psr-primary-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][390] ([i915#1072] / [i915#9732]) +21 other tests skip
>    [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@kms_psr@fbc-psr-primary-blt.html
> 
>   * igt@kms_psr@pr-dpms:
>     - shard-tglu:         NOTRUN -> [SKIP][391] ([i915#9732]) +14 other tests skip
>    [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-3/igt@kms_psr@pr-dpms.html
> 
>   * igt@kms_psr@psr-sprite-plane-move:
>     - shard-rkl:          NOTRUN -> [SKIP][392] ([i915#1072] / [i915#9732]) +8 other tests skip
>    [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-2/igt@kms_psr@psr-sprite-plane-move.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-tglu:         NOTRUN -> [SKIP][393] ([i915#9685])
>    [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@bad-tiling:
>     - shard-mtlp:         NOTRUN -> [SKIP][394] ([i915#12755])
>    [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-8/igt@kms_rotation_crc@bad-tiling.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2-9:        NOTRUN -> [SKIP][395] ([i915#12755])
>    [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>     - shard-dg1:          NOTRUN -> [SKIP][396] ([i915#5289])
>    [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-tglu:         NOTRUN -> [SKIP][397] ([i915#5289]) +1 other test skip
>    [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2-9:        NOTRUN -> [SKIP][398] ([i915#12755] / [i915#5190])
>    [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-dg2:          NOTRUN -> [SKIP][399] ([i915#12755]) +2 other tests skip
>    [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_selftest@drm_framebuffer:
>     - shard-snb:          NOTRUN -> [ABORT][400] ([i915#13179]) +1 other test abort
>    [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-snb4/igt@kms_selftest@drm_framebuffer.html
> 
>   * igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free:
>     - shard-dg2:          NOTRUN -> [ABORT][401] ([i915#13179]) +1 other test abort
>    [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-5/igt@kms_selftest@drm_framebuffer@drm_test_framebuffer_free.html
> 
>   * igt@kms_setmode@basic:
>     - shard-rkl:          [PASS][402] -> [FAIL][403] ([i915#5465])
>    [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@kms_setmode@basic.html
>    [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_setmode@basic.html
> 
>   * igt@kms_setmode@basic@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [FAIL][404] ([i915#5465]) +1 other test fail
>    [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_setmode@basic@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-tglu-1:       NOTRUN -> [SKIP][405] ([i915#8623])
>    [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2:          NOTRUN -> [SKIP][406] ([i915#8623])
>    [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-mtlp:         NOTRUN -> [SKIP][407] ([i915#8808] / [i915#9906])
>    [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-1/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-dg2:          NOTRUN -> [SKIP][408] ([i915#9906]) +2 other tests skip
>    [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-6/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@kms_writeback@writeback-check-output:
>     - shard-dg2:          NOTRUN -> [SKIP][409] ([i915#2437])
>    [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-6/igt@kms_writeback@writeback-check-output.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][410] ([i915#2437])
>    [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-1/igt@kms_writeback@writeback-check-output.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-glk:          NOTRUN -> [SKIP][411] ([i915#2437]) +1 other test skip
>    [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-glk1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-dg1:          NOTRUN -> [SKIP][412] ([i915#2437] / [i915#9412])
>    [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-15/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>     - shard-tglu:         NOTRUN -> [SKIP][413] ([i915#2437] / [i915#9412])
>    [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-9/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg1:          NOTRUN -> [SKIP][414] ([i915#2437])
>    [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-14/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@perf@mi-rpc:
>     - shard-dg2:          NOTRUN -> [SKIP][415] ([i915#2434])
>    [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-5/igt@perf@mi-rpc.html
>     - shard-rkl:          NOTRUN -> [SKIP][416] ([i915#2434])
>    [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-2/igt@perf@mi-rpc.html
>     - shard-dg1:          NOTRUN -> [SKIP][417] ([i915#2434])
>    [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-14/igt@perf@mi-rpc.html
>     - shard-mtlp:         NOTRUN -> [SKIP][418] ([i915#2434])
>    [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-8/igt@perf@mi-rpc.html
> 
>   * igt@perf@polling-small-buf:
>     - shard-rkl:          [PASS][419] -> [FAIL][420] ([i915#14550])
>    [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@perf@polling-small-buf.html
>    [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@perf@polling-small-buf.html
> 
>   * igt@perf_pmu@busy-double-start@vecs1:
>     - shard-dg2:          [PASS][421] -> [FAIL][422] ([i915#4349]) +4 other tests fail
>    [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg2-11/igt@perf_pmu@busy-double-start@vecs1.html
>    [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-5/igt@perf_pmu@busy-double-start@vecs1.html
> 
>   * igt@perf_pmu@rc6-all-gts:
>     - shard-dg2:          NOTRUN -> [SKIP][423] ([i915#8516])
>    [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-1/igt@perf_pmu@rc6-all-gts.html
> 
>   * igt@perf_pmu@semaphore-busy@vcs1:
>     - shard-mtlp:         [PASS][424] -> [FAIL][425] ([i915#4349]) +4 other tests fail
>    [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-mtlp-4/igt@perf_pmu@semaphore-busy@vcs1.html
>    [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-8/igt@perf_pmu@semaphore-busy@vcs1.html
> 
>   * igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
>     - shard-dg2-9:        NOTRUN -> [SKIP][426] ([i915#14121]) +1 other test skip
>    [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html
> 
>   * igt@prime_vgem@basic-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][427] ([i915#3708] / [i915#4077])
>    [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-17/igt@prime_vgem@basic-gtt.html
> 
>   * igt@prime_vgem@basic-read:
>     - shard-dg1:          NOTRUN -> [SKIP][428] ([i915#3708])
>    [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-12/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@fence-read-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][429] ([i915#3708])
>    [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-6/igt@prime_vgem@fence-read-hang.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-dg2:          NOTRUN -> [SKIP][430] ([i915#9917])
>    [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-dg2-9:        NOTRUN -> [SKIP][431] ([i915#9917])
>    [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-9/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>     - shard-dg1:          NOTRUN -> [SKIP][432] ([i915#9917])
>    [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-15/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@fbdev@pan:
>     - shard-rkl:          [SKIP][433] ([i915#14544] / [i915#2582]) -> [PASS][434]
>    [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@fbdev@pan.html
>    [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@fbdev@pan.html
> 
>   * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
>     - shard-dg2:          [INCOMPLETE][435] ([i915#13356]) -> [PASS][436]
>    [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
>    [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-7/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html
> 
>   * igt@gem_mmap_offset@clear-via-pagefault:
>     - shard-mtlp:         [ABORT][437] ([i915#14809]) -> [PASS][438] +1 other test pass
>    [437]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-mtlp-2/igt@gem_mmap_offset@clear-via-pagefault.html
>    [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-4/igt@gem_mmap_offset@clear-via-pagefault.html
> 
>   * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>     - shard-rkl:          [TIMEOUT][439] ([i915#12964]) -> [PASS][440]
>    [439]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
>    [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-off-1:
>     - shard-rkl:          [TIMEOUT][441] ([i915#12917] / [i915#12964]) -> [PASS][442] +2 other tests pass
>    [441]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-1.html
>    [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-1.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg2:          [DMESG-WARN][443] ([i915#13447]) -> [PASS][444]
>    [443]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg2-1/igt@i915_module_load@reload-with-fault-injection.html
>    [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_suspend@basic-s2idle-without-i915:
>     - shard-rkl:          [DMESG-WARN][445] ([i915#12917] / [i915#12964]) -> [PASS][446]
>    [445]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@i915_suspend@basic-s2idle-without-i915.html
>    [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         [FAIL][447] ([i915#5138]) -> [PASS][448]
>    [447]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_color@ctm-0-50:
>     - shard-rkl:          [SKIP][449] ([i915#12655] / [i915#14544]) -> [PASS][450]
>    [449]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_color@ctm-0-50.html
>    [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@kms_color@ctm-0-50.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x256:
>     - shard-rkl:          [SKIP][451] ([i915#14544]) -> [PASS][452] +45 other tests pass
>    [451]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html
>    [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-256x256.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x85:
>     - shard-tglu:         [FAIL][453] ([i915#13566]) -> [PASS][454] +3 other tests pass
>    [453]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html
>    [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-random-64x21:
>     - shard-rkl:          [FAIL][455] ([i915#13566]) -> [PASS][456] +1 other test pass
>    [455]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@kms_cursor_crc@cursor-random-64x21.html
>    [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_cursor_crc@cursor-random-64x21.html
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
>     - shard-rkl:          [SKIP][457] ([i915#11190] / [i915#14544]) -> [PASS][458]
>    [457]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
>    [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
>     - shard-rkl:          [FAIL][459] ([i915#2346]) -> [PASS][460]
>    [459]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
>    [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
>     - shard-snb:          [TIMEOUT][461] ([i915#14033]) -> [PASS][462] +1 other test pass
>    [461]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-snb4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
>    [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-snb7/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms:
>     - shard-rkl:          [SKIP][463] ([i915#14544] / [i915#3637]) -> [PASS][464] +3 other tests pass
>    [463]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_flip@basic-flip-vs-dpms.html
>    [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@kms_flip@basic-flip-vs-dpms.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race:
>     - shard-rkl:          [FAIL][465] ([i915#10826]) -> [PASS][466] +1 other test pass
>    [465]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-5/igt@kms_flip@modeset-vs-vblank-race.html
>    [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_flip@modeset-vs-vblank-race.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a1:
>     - shard-rkl:          [DMESG-WARN][467] ([i915#12964]) -> [PASS][468] +29 other tests pass
>    [467]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a1.html
>    [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
>     - shard-rkl:          [SKIP][469] ([i915#14544] / [i915#3555]) -> [PASS][470] +2 other tests pass
>    [469]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
>    [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
>     - shard-rkl:          [SKIP][471] ([i915#14544] / [i915#1849] / [i915#5354]) -> [PASS][472] +11 other tests pass
>    [471]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
>    [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-dg2:          [SKIP][473] ([i915#3555] / [i915#8228]) -> [PASS][474] +1 other test pass
>    [473]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg2-8/igt@kms_hdr@bpc-switch.html
>    [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_invalid_mode@bad-hsync-end:
>     - shard-rkl:          [SKIP][475] ([i915#14544] / [i915#3555] / [i915#8826]) -> [PASS][476] +1 other test pass
>    [475]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_invalid_mode@bad-hsync-end.html
>    [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@kms_invalid_mode@bad-hsync-end.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers:
>     - shard-rkl:          [SKIP][477] ([i915#14544] / [i915#8152]) -> [PASS][478] +2 other tests pass
>    [477]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html
>    [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b:
>     - shard-rkl:          [SKIP][479] ([i915#12247] / [i915#14544] / [i915#8152]) -> [PASS][480] +4 other tests pass
>    [479]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b.html
>    [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format@pipe-b.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20:
>     - shard-dg1:          [DMESG-WARN][481] ([i915#4423]) -> [PASS][482] +1 other test pass
>    [481]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-20x20.html
>    [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-17/igt@kms_plane_scaling@planes-upscale-20x20.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
>     - shard-rkl:          [SKIP][483] ([i915#12247] / [i915#14544] / [i915#3555] / [i915#6953] / [i915#8152]) -> [PASS][484]
>    [483]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
>    [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
>     - shard-rkl:          [SKIP][485] ([i915#12247] / [i915#14544]) -> [PASS][486] +3 other tests pass
>    [485]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html
>    [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-dg2:          [SKIP][487] ([i915#9340]) -> [PASS][488]
>    [487]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html
>    [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-4/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@cursor:
>     - shard-rkl:          [SKIP][489] ([i915#14544] / [i915#1849]) -> [PASS][490] +1 other test pass
>    [489]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_pm_rpm@cursor.html
>    [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@kms_pm_rpm@cursor.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-rkl:          [SKIP][491] ([i915#9519]) -> [PASS][492] +2 other tests pass
>    [491]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@kms_pm_rpm@dpms-lpsp.html
>    [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-2/igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
>     - shard-mtlp:         [FAIL][493] ([i915#9196]) -> [PASS][494] +1 other test pass
>    [493]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
>    [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-mtlp:         [FAIL][495] ([i915#10393]) -> [PASS][496] +1 other test pass
>    [495]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-mtlp-5/igt@kms_vrr@negative-basic.html
>    [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-6/igt@kms_vrr@negative-basic.html
> 
>   * igt@perf@polling@0-rcs0:
>     - shard-rkl:          [FAIL][497] ([i915#10538]) -> [PASS][498] +1 other test pass
>    [497]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@perf@polling@0-rcs0.html
>    [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@perf@polling@0-rcs0.html
> 
>   * igt@perf_pmu@busy-double-start@vcs1:
>     - shard-mtlp:         [FAIL][499] ([i915#4349]) -> [PASS][500] +2 other tests pass
>    [499]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-mtlp-3/igt@perf_pmu@busy-double-start@vcs1.html
>    [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-mtlp-8/igt@perf_pmu@busy-double-start@vcs1.html
> 
>   * igt@perf_pmu@interrupts-sync:
>     - shard-rkl:          [FAIL][501] ([i915#14470]) -> [PASS][502]
>    [501]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@perf_pmu@interrupts-sync.html
>    [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@perf_pmu@interrupts-sync.html
> 
>   * igt@perf_pmu@most-busy-check-all:
>     - shard-rkl:          [FAIL][503] ([i915#4349]) -> [PASS][504] +1 other test pass
>    [503]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-2/igt@perf_pmu@most-busy-check-all.html
>    [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@perf_pmu@most-busy-check-all.html
> 
>   * igt@perf_pmu@rc6-suspend:
>     - shard-rkl:          [INCOMPLETE][505] ([i915#12964] / [i915#13520]) -> [PASS][506]
>    [505]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-5/igt@perf_pmu@rc6-suspend.html
>    [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@perf_pmu@rc6-suspend.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_ccs@block-multicopy-inplace:
>     - shard-rkl:          [SKIP][507] ([i915#3555] / [i915#9323]) -> [SKIP][508] ([i915#14544] / [i915#3555] / [i915#9323])
>    [507]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@gem_ccs@block-multicopy-inplace.html
>    [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-rkl:          [SKIP][509] ([i915#14544] / [i915#7697]) -> [SKIP][510] ([i915#7697])
>    [509]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html
>    [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-rkl:          [SKIP][511] ([i915#280]) -> [SKIP][512] ([i915#14544] / [i915#280])
>    [511]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-2/igt@gem_ctx_sseu@mmap-args.html
>    [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_exec_balancer@parallel:
>     - shard-rkl:          [SKIP][513] ([i915#4525]) -> [SKIP][514] ([i915#14544] / [i915#4525])
>    [513]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@gem_exec_balancer@parallel.html
>    [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_exec_balancer@parallel.html
> 
>   * igt@gem_exec_balancer@parallel-ordering:
>     - shard-rkl:          [SKIP][515] ([i915#14544] / [i915#4525]) -> [SKIP][516] ([i915#4525])
>    [515]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html
>    [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@gem_exec_balancer@parallel-ordering.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-rkl:          [SKIP][517] ([i915#14544] / [i915#6334]) -> [SKIP][518] ([i915#6334]) +1 other test skip
>    [517]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html
>    [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_capture@capture-recoverable:
>     - shard-rkl:          [SKIP][519] ([i915#6344]) -> [SKIP][520] ([i915#14544] / [i915#6344])
>    [519]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-5/igt@gem_exec_capture@capture-recoverable.html
>    [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html
> 
>   * igt@gem_exec_reloc@basic-concurrent16:
>     - shard-rkl:          [SKIP][521] ([i915#3281]) -> [SKIP][522] ([i915#14544] / [i915#3281]) +3 other tests skip
>    [521]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-3/igt@gem_exec_reloc@basic-concurrent16.html
>    [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_exec_reloc@basic-concurrent16.html
> 
>   * igt@gem_exec_reloc@basic-gtt-read:
>     - shard-rkl:          [SKIP][523] ([i915#14544] / [i915#3281]) -> [SKIP][524] ([i915#3281]) +10 other tests skip
>    [523]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-read.html
>    [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-read.html
> 
>   * igt@gem_exec_schedule@semaphore-power:
>     - shard-rkl:          [SKIP][525] ([i915#7276]) -> [SKIP][526] ([i915#14544] / [i915#7276])
>    [525]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html
>    [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - shard-rkl:          [SKIP][527] ([i915#2190]) -> [SKIP][528] ([i915#14544] / [i915#2190])
>    [527]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@gem_huc_copy@huc-copy.html
>    [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_evict@dontneed-evict-race:
>     - shard-rkl:          [SKIP][529] ([i915#14544] / [i915#4613] / [i915#7582]) -> [SKIP][530] ([i915#4613] / [i915#7582])
>    [529]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@gem_lmem_evict@dontneed-evict-race.html
>    [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@gem_lmem_evict@dontneed-evict-race.html
> 
>   * igt@gem_lmem_swapping@heavy-random:
>     - shard-rkl:          [SKIP][531] ([i915#4613]) -> [SKIP][532] ([i915#14544] / [i915#4613]) +1 other test skip
>    [531]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-2/igt@gem_lmem_swapping@heavy-random.html
>    [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_lmem_swapping@heavy-random.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - shard-rkl:          [SKIP][533] ([i915#14544] / [i915#4613]) -> [SKIP][534] ([i915#4613]) +1 other test skip
>    [533]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@gem_lmem_swapping@random-engines.html
>    [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@gem_media_vme:
>     - shard-rkl:          [SKIP][535] ([i915#14544] / [i915#284]) -> [SKIP][536] ([i915#284])
>    [535]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@gem_media_vme.html
>    [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@gem_media_vme.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>     - shard-rkl:          [SKIP][537] ([i915#14544] / [i915#3282]) -> [SKIP][538] ([i915#3282]) +5 other tests skip
>    [537]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
>    [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
> 
>   * igt@gem_pxp@create-protected-buffer:
>     - shard-rkl:          [SKIP][539] ([i915#4270]) -> [TIMEOUT][540] ([i915#12964])
>    [539]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-5/igt@gem_pxp@create-protected-buffer.html
>    [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@gem_pxp@create-protected-buffer.html
> 
>   * igt@gem_pxp@fail-invalid-protected-context:
>     - shard-rkl:          [TIMEOUT][541] ([i915#12964]) -> [SKIP][542] ([i915#4270])
>    [541]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@gem_pxp@fail-invalid-protected-context.html
>    [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@gem_pxp@fail-invalid-protected-context.html
> 
>   * igt@gem_pxp@protected-raw-src-copy-not-readible:
>     - shard-rkl:          [TIMEOUT][543] ([i915#12917] / [i915#12964]) -> [SKIP][544] ([i915#14544] / [i915#4270])
>    [543]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@gem_pxp@protected-raw-src-copy-not-readible.html
>    [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_pxp@protected-raw-src-copy-not-readible.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-on:
>     - shard-rkl:          [SKIP][545] ([i915#4270]) -> [TIMEOUT][546] ([i915#12917] / [i915#12964])
>    [545]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@gem_pxp@reject-modify-context-protection-on.html
>    [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-2/igt@gem_pxp@reject-modify-context-protection-on.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-tiled:
>     - shard-rkl:          [SKIP][547] ([i915#14544] / [i915#8411]) -> [SKIP][548] ([i915#8411]) +1 other test skip
>    [547]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
>    [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@gem_set_tiling_vs_blt@tiled-to-tiled.html
> 
>   * igt@gem_tiled_partial_pwrite_pread@reads:
>     - shard-rkl:          [SKIP][549] ([i915#3282]) -> [SKIP][550] ([i915#14544] / [i915#3282]) +1 other test skip
>    [549]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@gem_tiled_partial_pwrite_pread@reads.html
>    [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_tiled_partial_pwrite_pread@reads.html
> 
>   * igt@gem_userptr_blits@coherency-sync:
>     - shard-rkl:          [SKIP][551] ([i915#14544] / [i915#3297]) -> [SKIP][552] ([i915#3297]) +2 other tests skip
>    [551]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@gem_userptr_blits@coherency-sync.html
>    [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@gem_userptr_blits@coherency-sync.html
> 
>   * igt@gem_userptr_blits@dmabuf-unsync:
>     - shard-rkl:          [SKIP][553] ([i915#3297]) -> [SKIP][554] ([i915#14544] / [i915#3297]) +1 other test skip
>    [553]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@gem_userptr_blits@dmabuf-unsync.html
>    [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>   * igt@gen9_exec_parse@bb-chained:
>     - shard-rkl:          [SKIP][555] ([i915#2527]) -> [SKIP][556] ([i915#14544] / [i915#2527])
>    [555]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-5/igt@gen9_exec_parse@bb-chained.html
>    [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html
> 
>   * igt@gen9_exec_parse@shadow-peek:
>     - shard-rkl:          [SKIP][557] ([i915#14544] / [i915#2527]) -> [SKIP][558] ([i915#2527]) +3 other tests skip
>    [557]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html
>    [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@gen9_exec_parse@shadow-peek.html
> 
>   * igt@i915_pm_freq_api@freq-suspend:
>     - shard-rkl:          [SKIP][559] ([i915#8399]) -> [SKIP][560] ([i915#14544] / [i915#8399])
>    [559]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-2/igt@i915_pm_freq_api@freq-suspend.html
>    [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@i915_pm_freq_api@freq-suspend.html
> 
>   * igt@i915_pm_sseu@full-enable:
>     - shard-rkl:          [SKIP][561] ([i915#14544] / [i915#4387]) -> [SKIP][562] ([i915#4387])
>    [561]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@i915_pm_sseu@full-enable.html
>    [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@i915_pm_sseu@full-enable.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-rkl:          [SKIP][563] ([i915#6245]) -> [SKIP][564] ([i915#14544] / [i915#6245])
>    [563]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@i915_query@hwconfig_table.html
>    [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@i915_query@hwconfig_table.html
> 
>   * igt@i915_query@test-query-geometry-subslices:
>     - shard-rkl:          [SKIP][565] ([i915#5723]) -> [SKIP][566] ([i915#14544] / [i915#5723])
>    [565]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@i915_query@test-query-geometry-subslices.html
>    [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@i915_query@test-query-geometry-subslices.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled:
>     - shard-rkl:          [DMESG-WARN][567] ([i915#12964]) -> [SKIP][568] ([i915#14544])
>    [567]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@kms_async_flips@async-flip-with-page-flip-events-tiled.html
>    [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_async_flips@async-flip-with-page-flip-events-tiled.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-rkl:          [SKIP][569] ([i915#14544]) -> [SKIP][570] ([i915#9531])
>    [569]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>    [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-rkl:          [SKIP][571] ([i915#1769] / [i915#3555]) -> [SKIP][572] ([i915#14544])
>    [571]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
>    [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>     - shard-rkl:          [SKIP][573] ([i915#14544]) -> [SKIP][574] ([i915#1769] / [i915#3555])
>    [573]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>    [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-rkl:          [SKIP][575] ([i915#5286]) -> [SKIP][576] ([i915#14544]) +3 other tests skip
>    [575]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@kms_big_fb@4-tiled-addfb.html
>    [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-rkl:          [SKIP][577] ([i915#14544]) -> [SKIP][578] ([i915#5286]) +3 other tests skip
>    [577]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>    [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@linear-64bpp-rotate-90:
>     - shard-rkl:          [SKIP][579] ([i915#14544]) -> [SKIP][580] ([i915#3638]) +1 other test skip
>    [579]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html
>    [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
>     - shard-rkl:          [SKIP][581] ([i915#3638]) -> [SKIP][582] ([i915#14544]) +1 other test skip
>    [581]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
>    [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>     - shard-rkl:          [SKIP][583] -> [SKIP][584] ([i915#14544]) +8 other tests skip
>    [583]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
>    [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-rkl:          [SKIP][585] ([i915#14544]) -> [SKIP][586] +18 other tests skip
>    [585]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
>    [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>     - shard-rkl:          [SKIP][587] ([i915#14544]) -> [SKIP][588] ([i915#14098] / [i915#6095]) +8 other tests skip
>    [587]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
>    [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          [SKIP][589] ([i915#14098] / [i915#6095]) -> [SKIP][590] ([i915#6095]) +1 other test skip
>    [589]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-5/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2.html
>    [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          [SKIP][591] ([i915#6095]) -> [SKIP][592] ([i915#14098] / [i915#6095]) +7 other tests skip
>    [591]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html
>    [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>     - shard-rkl:          [SKIP][593] ([i915#14544]) -> [SKIP][594] ([i915#12313])
>    [593]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
>    [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
>     - shard-rkl:          [SKIP][595] ([i915#14098] / [i915#6095]) -> [SKIP][596] ([i915#14544]) +13 other tests skip
>    [595]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
>    [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>     - shard-rkl:          [SKIP][597] ([i915#12313]) -> [SKIP][598] ([i915#14544])
>    [597]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
>    [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-rkl:          [SKIP][599] ([i915#11151] / [i915#7828]) -> [SKIP][600] ([i915#11151] / [i915#14544] / [i915#7828]) +4 other tests skip
>    [599]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@kms_chamelium_frames@dp-crc-fast.html
>    [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-fast:
>     - shard-rkl:          [SKIP][601] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][602] ([i915#11151] / [i915#7828]) +4 other tests skip
>    [601]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html
>    [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@kms_chamelium_hpd@vga-hpd-fast.html
> 
>   * igt@kms_color@ctm-blue-to-red:
>     - shard-rkl:          [DMESG-WARN][603] ([i915#12964]) -> [SKIP][604] ([i915#12655] / [i915#14544])
>    [603]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-2/igt@kms_color@ctm-blue-to-red.html
>    [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_color@ctm-blue-to-red.html
> 
>   * igt@kms_color@deep-color:
>     - shard-rkl:          [SKIP][605] ([i915#12655] / [i915#14544] / [i915#3555]) -> [SKIP][606] ([i915#12655] / [i915#3555])
>    [605]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_color@deep-color.html
>    [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_color@deep-color.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-rkl:          [SKIP][607] ([i915#14544]) -> [SKIP][608] ([i915#3116])
>    [607]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_content_protection@dp-mst-type-1.html
>    [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-rkl:          [SKIP][609] ([i915#14544]) -> [SKIP][610] ([i915#9424])
>    [609]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_content_protection@mei-interface.html
>    [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_content_protection@mei-interface.html
>     - shard-dg1:          [SKIP][611] ([i915#9424]) -> [SKIP][612] ([i915#9433])
>    [611]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg1-19/igt@kms_content_protection@mei-interface.html
>    [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-13/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-dg2:          [SKIP][613] ([i915#7118] / [i915#7162] / [i915#9424]) -> [SKIP][614] ([i915#7118] / [i915#9424])
>    [613]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg2-11/igt@kms_content_protection@type1.html
>    [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-4/igt@kms_content_protection@type1.html
>     - shard-rkl:          [SKIP][615] ([i915#14544]) -> [SKIP][616] ([i915#7118] / [i915#9424])
>    [615]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_content_protection@type1.html
>    [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_content_protection@type1.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-dg2:          [SKIP][617] ([i915#7118] / [i915#9424]) -> [FAIL][618] ([i915#1339] / [i915#7173])
>    [617]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg2-8/igt@kms_content_protection@uevent.html
>    [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-11/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x10:
>     - shard-rkl:          [SKIP][619] ([i915#3555]) -> [SKIP][620] ([i915#14544]) +2 other tests skip
>    [619]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@kms_cursor_crc@cursor-random-32x10.html
>    [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_cursor_crc@cursor-random-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x512:
>     - shard-rkl:          [SKIP][621] ([i915#14544]) -> [SKIP][622] ([i915#13049]) +2 other tests skip
>    [621]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_cursor_crc@cursor-random-512x512.html
>    [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-2/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-rkl:          [SKIP][623] ([i915#11190] / [i915#14544]) -> [SKIP][624] ([i915#4103])
>    [623]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>    [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>     - shard-rkl:          [SKIP][625] ([i915#14544]) -> [SKIP][626] ([i915#4103])
>    [625]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>    [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-rkl:          [SKIP][627] ([i915#4103]) -> [SKIP][628] ([i915#14544]) +1 other test skip
>    [627]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-rkl:          [SKIP][629] ([i915#14544]) -> [SKIP][630] ([i915#13691])
>    [629]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_display_modes@extended-mode-basic.html
>    [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-rkl:          [SKIP][631] ([i915#1257] / [i915#14544]) -> [SKIP][632] ([i915#1257])
>    [631]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_dp_aux_dev.html
>    [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-rkl:          [SKIP][633] ([i915#13749]) -> [SKIP][634] ([i915#14544])
>    [633]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@kms_dp_link_training@non-uhbr-sst.html
>    [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-rkl:          [SKIP][635] ([i915#14544]) -> [SKIP][636] ([i915#3840])
>    [635]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
>    [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-formats:
>     - shard-rkl:          [SKIP][637] ([i915#14544]) -> [SKIP][638] ([i915#3555] / [i915#3840])
>    [637]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_dsc@dsc-with-formats.html
>    [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@kms_dsc@dsc-with-formats.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-rkl:          [SKIP][639] ([i915#14544] / [i915#1839]) -> [SKIP][640] ([i915#1839])
>    [639]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_feature_discovery@display-2x.html
>    [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-rkl:          [SKIP][641] ([i915#1839]) -> [SKIP][642] ([i915#14544] / [i915#1839])
>    [641]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-5/igt@kms_feature_discovery@display-4x.html
>    [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-rkl:          [SKIP][643] ([i915#9934]) -> [SKIP][644] ([i915#14544] / [i915#9934]) +2 other tests skip
>    [643]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@kms_flip@2x-blocking-wf_vblank.html
>    [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip@2x-plain-flip-interruptible:
>     - shard-rkl:          [SKIP][645] ([i915#14544] / [i915#9934]) -> [SKIP][646] ([i915#9934]) +6 other tests skip
>    [645]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html
>    [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>     - shard-rkl:          [SKIP][647] ([i915#2672] / [i915#3555]) -> [SKIP][648] ([i915#14544] / [i915#3555]) +1 other test skip
>    [647]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
>    [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>     - shard-rkl:          [SKIP][649] ([i915#14544] / [i915#3555]) -> [SKIP][650] ([i915#2672] / [i915#3555]) +3 other tests skip
>    [649]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
>    [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt:
>     - shard-dg1:          [SKIP][651] ([i915#8708]) -> [SKIP][652] ([i915#4423] / [i915#8708])
>    [651]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html
>    [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-15/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
>     - shard-rkl:          [SKIP][653] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][654] ([i915#3023]) +16 other tests skip
>    [653]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
>    [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
>     - shard-rkl:          [SKIP][655] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][656] ([i915#1825]) +23 other tests skip
>    [655]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
>    [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg1:          [SKIP][657] ([i915#4423] / [i915#8708]) -> [SKIP][658] ([i915#8708])
>    [657]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
>    [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
>     - shard-rkl:          [SKIP][659] -> [SKIP][660] ([i915#14544] / [i915#1849] / [i915#5354]) +1 other test skip
>    [659]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html
>    [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
>     - shard-dg2:          [SKIP][661] ([i915#10433] / [i915#3458]) -> [SKIP][662] ([i915#3458]) +1 other test skip
>    [661]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
>    [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-rkl:          [SKIP][663] ([i915#9766]) -> [SKIP][664] ([i915#14544] / [i915#1849] / [i915#5354])
>    [663]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
>    [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
>     - shard-dg2:          [SKIP][665] ([i915#3458]) -> [SKIP][666] ([i915#10433] / [i915#3458])
>    [665]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
>    [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu:
>     - shard-rkl:          [SKIP][667] ([i915#3023]) -> [SKIP][668] ([i915#14544] / [i915#1849] / [i915#5354]) +12 other tests skip
>    [667]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html
>    [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
>     - shard-rkl:          [SKIP][669] ([i915#1825]) -> [SKIP][670] ([i915#14544] / [i915#1849] / [i915#5354]) +27 other tests skip
>    [669]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
>    [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg1:          [SKIP][671] ([i915#4423]) -> [SKIP][672]
>    [671]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg1-17/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
>    [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-rkl:          [SKIP][673] ([i915#14544]) -> [SKIP][674] ([i915#3555] / [i915#8228])
>    [673]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_hdr@bpc-switch-dpms.html
>    [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-2/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-rkl:          [SKIP][675] ([i915#1187] / [i915#12713]) -> [SKIP][676] ([i915#12713])
>    [675]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-3/igt@kms_hdr@brightness-with-hdr.html
>    [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html
>     - shard-dg1:          [SKIP][677] ([i915#12713]) -> [SKIP][678] ([i915#1187] / [i915#12713])
>    [677]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-dg1-17/igt@kms_hdr@brightness-with-hdr.html
>    [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-rkl:          [SKIP][679] ([i915#3555] / [i915#8228]) -> [SKIP][680] ([i915#14544]) +1 other test skip
>    [679]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@kms_hdr@static-toggle-suspend.html
>    [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_joiner@basic-big-joiner:
>     - shard-rkl:          [SKIP][681] ([i915#10656] / [i915#14544]) -> [SKIP][682] ([i915#10656])
>    [681]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_joiner@basic-big-joiner.html
>    [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@kms_joiner@basic-big-joiner.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-rkl:          [SKIP][683] ([i915#1839] / [i915#4816]) -> [SKIP][684] ([i915#4070] / [i915#4816])
>    [683]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-rkl:          [SKIP][685] ([i915#6301]) -> [SKIP][686] ([i915#14544])
>    [685]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-2/igt@kms_panel_fitting@legacy.html
>    [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-rkl:          [SKIP][687] ([i915#14544] / [i915#8825]) -> [INCOMPLETE][688] ([i915#14412])
>    [687]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-rkl:          [SKIP][689] ([i915#14544] / [i915#5354]) -> [SKIP][690] ([i915#5354]) +1 other test skip
>    [689]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_pm_backlight@bad-brightness.html
>    [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-rkl:          [SKIP][691] ([i915#12343] / [i915#14544]) -> [SKIP][692] ([i915#12343])
>    [691]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html
>    [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-2/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-rkl:          [SKIP][693] ([i915#5354]) -> [SKIP][694] ([i915#14544] / [i915#5354])
>    [693]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-2/igt@kms_pm_backlight@fade-with-dpms.html
>    [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc5-retention-flops:
>     - shard-rkl:          [SKIP][695] ([i915#3828]) -> [SKIP][696] ([i915#14544] / [i915#3828])
>    [695]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-7/igt@kms_pm_dc@dc5-retention-flops.html
>    [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_pm_dc@dc5-retention-flops.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-rkl:          [SKIP][697] ([i915#3361]) -> [FAIL][698] ([i915#9295])
>    [697]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@kms_pm_dc@dc6-dpms.html
>    [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-2/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-rkl:          [SKIP][699] ([i915#14544] / [i915#9685]) -> [SKIP][700] ([i915#9685])
>    [699]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html
>    [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_prime@basic-crc-hybrid:
>     - shard-rkl:          [SKIP][701] ([i915#14544] / [i915#6524]) -> [SKIP][702] ([i915#6524])
>    [701]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_prime@basic-crc-hybrid.html
>    [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_prime@basic-crc-hybrid.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-rkl:          [SKIP][703] ([i915#6524]) -> [SKIP][704] ([i915#14544] / [i915#6524])
>    [703]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@kms_prime@d3hot.html
>    [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
>     - shard-rkl:          [SKIP][705] ([i915#11520]) -> [SKIP][706] ([i915#11520] / [i915#14544]) +4 other tests skip
>    [705]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
>    [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>     - shard-rkl:          [SKIP][707] ([i915#11520] / [i915#14544]) -> [SKIP][708] ([i915#11520]) +7 other tests skip
>    [707]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
>    [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-7/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-rkl:          [SKIP][709] ([i915#9683]) -> [SKIP][710] ([i915#14544] / [i915#9683]) +1 other test skip
>    [709]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>    [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>     - shard-rkl:          [SKIP][711] ([i915#1072] / [i915#9732]) -> [SKIP][712] ([i915#1072] / [i915#14544] / [i915#9732]) +14 other tests skip
>    [711]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
>    [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@pr-primary-mmap-gtt:
>     - shard-rkl:          [SKIP][713] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][714] ([i915#1072] / [i915#9732]) +18 other tests skip
>    [713]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_psr@pr-primary-mmap-gtt.html
>    [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_psr@pr-primary-mmap-gtt.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-rkl:          [SKIP][715] ([i915#9685]) -> [SKIP][716] ([i915#14544] / [i915#9685]) +2 other tests skip
>    [715]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-rkl:          [SKIP][717] ([i915#14544]) -> [SKIP][718] ([i915#5289])
>    [717]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-rkl:          [SKIP][719] ([i915#5289]) -> [SKIP][720] ([i915#14544])
>    [719]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_scaling_modes@scaling-mode-full-aspect:
>     - shard-rkl:          [SKIP][721] ([i915#14544]) -> [SKIP][722] ([i915#3555]) +1 other test skip
>    [721]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html
>    [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-rkl:          [SKIP][723] ([i915#14544] / [i915#3555]) -> [SKIP][724] ([i915#3555])
>    [723]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_setmode@invalid-clone-exclusive-crtc.html
>    [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-rkl:          [SKIP][725] ([i915#14544]) -> [SKIP][726] ([i915#8623])
>    [725]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-rkl:          [SKIP][727] ([i915#14544]) -> [SKIP][728] ([i915#9906])
>    [727]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_vrr@max-min.html
>    [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-4/igt@kms_vrr@max-min.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-rkl:          [SKIP][729] ([i915#14544] / [i915#2437]) -> [SKIP][730] ([i915#2437])
>    [729]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@kms_writeback@writeback-fb-id.html
>    [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-5/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>     - shard-rkl:          [SKIP][731] ([i915#2437] / [i915#9412]) -> [SKIP][732] ([i915#14544] / [i915#2437] / [i915#9412])
>    [731]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-5/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>    [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - shard-rkl:          [SKIP][733] ([i915#14544] / [i915#3291] / [i915#3708]) -> [SKIP][734] ([i915#3291] / [i915#3708])
>    [733]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-6/igt@prime_vgem@basic-fence-read.html
>    [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-8/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-rkl:          [SKIP][735] ([i915#9917]) -> [SKIP][736] ([i915#14544] / [i915#9917])
>    [735]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17270/shard-rkl-8/igt@sriov_basic@enable-vfs-autoprobe-off.html
>    [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10333]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10333
>   [i915#10393]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10393
>   [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
>   [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#10826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10826
>   [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
>   [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
>   [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
>   [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>   [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
>   [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>   [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>   [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
>   [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
>   [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
>   [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
>   [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
>   [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
>   [i915#12392]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392
>   [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
>   [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
>   [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
>   [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
>   [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
>   [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
>   [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
>   [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
>   [i915#12756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756
>   [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
>   [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
>   [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
>   [i915#12942]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12942
>   [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
>   [i915#13029]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029
>   [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
>   [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
>   [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
>   [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
>   [i915#1339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1339
>   [i915#13390]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390
>   [i915#13409]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13409
>   [i915#13427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13427
>   [i915#13447]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13447
>   [i915#13476]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476
>   [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
>   [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
>   [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
>   [i915#13736]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13736
>   [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
>   [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
>   [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
>   [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
>   [i915#13784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13784
>   [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
>   [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
>   [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14073
>   [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
>   [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
>   [i915#14121]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14121
>   [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
>   [i915#14350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14350
>   [i915#14412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14412
>   [i915#14470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14470
>   [i915#14498]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14498
>   [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
>   [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
>   [i915#14550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14550
>   [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14586
>   [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
>   [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
>   [i915#14809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14809
>   [i915#14889]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14889
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
>   [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
>   [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
>   [i915#2190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190
>   [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
>   [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
>   [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
>   [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>   [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>   [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>   [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
>   [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
>   [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>   [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>   [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
>   [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
>   [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
>   [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>   [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>   [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4767]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
>   [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
>   [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
>   [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
>   [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
>   [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
>   [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>   [i915#5465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465
>   [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
>   [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
>   [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
>   [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
>   [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
>   [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
>   [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
>   [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
>   [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>   [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>   [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
>   [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
>   [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
>   [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>   [i915#7162]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162
>   [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
>   [i915#7276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276
>   [i915#7294]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294
>   [i915#7582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582
>   [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
>   [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>   [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
>   [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>   [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
>   [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
>   [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
>   [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
>   [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
>   [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
>   [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
>   [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
>   [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
>   [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>   [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
>   [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>   [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
>   [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
>   [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
>   [i915#9581]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9581
>   [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>   [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>   [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
>   [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
>   [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
>   [i915#9833]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833
>   [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>   [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8552 -> IGTPW_13822
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_17270: 7644974e648c270a56954b0344b1d0330698e1fa @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_13822: 13822
>   IGT_8552: 8552
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13822/index.html
> 




