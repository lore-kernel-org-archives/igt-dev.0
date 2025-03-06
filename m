Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFE3C282EC
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 14:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E54710E9C8;
	Thu,  6 Mar 2025 14:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHgc6TkY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227AF10E9C8
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 14:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741272527; x=1772808527;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=u60Ainex6TGK1rjt6ZKwivcOD3Zl6KNC80ctbgdMYa8=;
 b=EHgc6TkYWJhg5eRS3jz0G0Nhw1CPQ3ZveZbiEUcFwm07Xw4ZjuLlwL11
 TnHn4qFammmqFbQrZtkx1Gesb+bs+gO7ujnmldtRAT82uS+rbRsVURNt5
 QwXYxE81LHv5HbTA1ZvAvmUAH9AQVq/PsKmC2tCw1f7ZgstOOnI3m2p2G
 mvOYVruA+gtN/Y+POdZ9ATCHfBXcLFN/VlSQ4ycp/QJF5srnQ8tdavuXg
 ztmd7jPkEjiPlMxv9dfVHPN/tFW3/bf/aqYB/LRcg3E/ra8z+kJCzjigf
 eYO2DcClgrSCj6WF6lpeXmEISPCnc4tA/z1uwTn7lLHixdBvPZ3vR5mxS A==;
X-CSE-ConnectionGUID: o2ZRQk+RSAm6OFTL8u1HDg==
X-CSE-MsgGUID: m2nA+PGFSm+jPNSRsiE+4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41535326"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="41535326"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 06:48:47 -0800
X-CSE-ConnectionGUID: ipBnmHKQQi2qE1ecdJNdSA==
X-CSE-MsgGUID: qP7kjeNWRvCAA5C6sNC4OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="119231875"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.116.143])
 ([10.245.116.143])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 06:48:46 -0800
Message-ID: <b678fd68-5a76-4c53-b636-1a527aa6e0d1@linux.intel.com>
Date: Thu, 6 Mar 2025 15:48:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/int?=
 =?UTF-8?Q?el/kms=5Fdp=5Flink=5Ftraining=3A_Restrict_to_Intel_GPUs?=
To: igt-dev@lists.freedesktop.org
References: <20250305094307.1349154-1-marcin.bernatowicz@linux.intel.com>
 <174124112112.65863.15277341848063866262@64e06c682a23>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <174124112112.65863.15277341848063866262@64e06c682a23>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 3/6/2025 7:05 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/kms_dp_link_training: Restrict to Intel GPUs
> URL   : https://patchwork.freedesktop.org/series/145832/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8262_full -> IGTPW_12707_full
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with IGTPW_12707_full absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_12707_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>    No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in IGTPW_12707_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@gem_compute@compute-square:
>      - shard-mtlp:         NOTRUN -> [FAIL][1]
>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@gem_compute@compute-square.html
> 
>    * igt@kms_flip@plain-flip-ts-check@c-hdmi-a1:
>      - shard-tglu:         [PASS][2] -> [FAIL][3]
>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-tglu-2/igt@kms_flip@plain-flip-ts-check@c-hdmi-a1.html
>     [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-4/igt@kms_flip@plain-flip-ts-check@c-hdmi-a1.html
> 
>    * igt@kms_prime@basic-crc-vgem@second-to-first:
>      - shard-rkl:          NOTRUN -> [ABORT][4] +1 other test abort
>     [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-8/igt@kms_prime@basic-crc-vgem@second-to-first.html

not related to the change
--
marcin

> 
>    
> #### Warnings ####
> 
>    * igt@i915_suspend@basic-s3-without-i915:
>      - shard-tglu:         [INCOMPLETE][5] ([i915#4817] / [i915#7443]) -> [INCOMPLETE][6]
>     [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-tglu-10/igt@i915_suspend@basic-s3-without-i915.html
>     [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-2/igt@i915_suspend@basic-s3-without-i915.html
> 
>    
> Known issues
> ------------
> 
>    Here are the changes found in IGTPW_12707_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@api_intel_bb@object-reloc-keep-cache:
>      - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#8411]) +1 other test skip
>     [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-5/igt@api_intel_bb@object-reloc-keep-cache.html
> 
>    * igt@drm_fdinfo@virtual-busy-hang-all:
>      - shard-mtlp:         NOTRUN -> [SKIP][8] ([i915#8414])
>     [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-3/igt@drm_fdinfo@virtual-busy-hang-all.html
> 
>    * igt@gem_bad_reloc@negative-reloc-lut:
>      - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#3281]) +14 other tests skip
>     [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-3/igt@gem_bad_reloc@negative-reloc-lut.html
> 
>    * igt@gem_basic@multigpu-create-close:
>      - shard-tglu-1:       NOTRUN -> [SKIP][10] ([i915#7697])
>     [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@gem_basic@multigpu-create-close.html
>      - shard-dg2:          NOTRUN -> [SKIP][11] ([i915#7697])
>     [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-3/igt@gem_basic@multigpu-create-close.html
> 
>    * igt@gem_ccs@block-copy-compressed:
>      - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#3555] / [i915#9323])
>     [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-4/igt@gem_ccs@block-copy-compressed.html
> 
>    * igt@gem_ccs@block-multicopy-compressed:
>      - shard-tglu:         NOTRUN -> [SKIP][13] ([i915#9323])
>     [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-4/igt@gem_ccs@block-multicopy-compressed.html
> 
>    * igt@gem_ccs@ctrl-surf-copy-new-ctx:
>      - shard-rkl:          NOTRUN -> [SKIP][14] ([i915#9323])
>     [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
>      - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#9323])
>     [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
> 
>    * igt@gem_ccs@large-ctrl-surf-copy:
>      - shard-tglu-1:       NOTRUN -> [SKIP][16] ([i915#13008])
>     [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@gem_ccs@large-ctrl-surf-copy.html
> 
>    * igt@gem_close_race@multigpu-basic-process:
>      - shard-rkl:          NOTRUN -> [SKIP][17] ([i915#7697])
>     [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-1/igt@gem_close_race@multigpu-basic-process.html
> 
>    * igt@gem_compute@compute-square:
>      - shard-dg2:          NOTRUN -> [FAIL][18] ([i915#13665])
>     [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-5/igt@gem_compute@compute-square.html
> 
>    * igt@gem_create@create-ext-cpu-access-big:
>      - shard-rkl:          NOTRUN -> [SKIP][19] ([i915#6335])
>     [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-3/igt@gem_create@create-ext-cpu-access-big.html
> 
>    * igt@gem_ctx_persistence@heartbeat-hang:
>      - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#8555])
>     [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-17/igt@gem_ctx_persistence@heartbeat-hang.html
>      - shard-mtlp:         NOTRUN -> [SKIP][21] ([i915#8555]) +1 other test skip
>     [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-1/igt@gem_ctx_persistence@heartbeat-hang.html
> 
>    * igt@gem_ctx_sseu@invalid-args:
>      - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#280])
>     [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-11/igt@gem_ctx_sseu@invalid-args.html
>      - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#280])
>     [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-16/igt@gem_ctx_sseu@invalid-args.html
>      - shard-tglu:         NOTRUN -> [SKIP][24] ([i915#280])
>     [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-4/igt@gem_ctx_sseu@invalid-args.html
> 
>    * igt@gem_ctx_sseu@mmap-args:
>      - shard-rkl:          NOTRUN -> [SKIP][25] ([i915#280]) +1 other test skip
>     [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@gem_ctx_sseu@mmap-args.html
> 
>    * igt@gem_eio@hibernate:
>      - shard-mtlp:         NOTRUN -> [ABORT][26] ([i915#7975])
>     [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-4/igt@gem_eio@hibernate.html
> 
>    * igt@gem_eio@in-flight-internal-10ms:
>      - shard-mtlp:         [PASS][27] -> [ABORT][28] ([i915#13193]) +2 other tests abort
>     [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-mtlp-2/igt@gem_eio@in-flight-internal-10ms.html
>     [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-7/igt@gem_eio@in-flight-internal-10ms.html
> 
>    * igt@gem_eio@in-flight-suspend:
>      - shard-rkl:          [PASS][29] -> [DMESG-WARN][30] ([i915#12964]) +29 other tests dmesg-warn
>     [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-rkl-8/igt@gem_eio@in-flight-suspend.html
>     [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-4/igt@gem_eio@in-flight-suspend.html
> 
>    * igt@gem_exec_balancer@bonded-dual:
>      - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#4771])
>     [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-8/igt@gem_exec_balancer@bonded-dual.html
> 
>    * igt@gem_exec_balancer@bonded-false-hang:
>      - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#4812]) +1 other test skip
>     [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-5/igt@gem_exec_balancer@bonded-false-hang.html
> 
>    * igt@gem_exec_balancer@bonded-sync:
>      - shard-dg2-9:        NOTRUN -> [SKIP][33] ([i915#4771])
>     [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@gem_exec_balancer@bonded-sync.html
> 
>    * igt@gem_exec_balancer@hog:
>      - shard-mtlp:         NOTRUN -> [SKIP][34] ([i915#4812])
>     [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@gem_exec_balancer@hog.html
> 
>    * igt@gem_exec_balancer@parallel:
>      - shard-tglu:         NOTRUN -> [SKIP][35] ([i915#4525])
>     [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-6/igt@gem_exec_balancer@parallel.html
> 
>    * igt@gem_exec_balancer@parallel-balancer:
>      - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#4525]) +2 other tests skip
>     [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-2/igt@gem_exec_balancer@parallel-balancer.html
> 
>    * igt@gem_exec_big@single:
>      - shard-tglu:         NOTRUN -> [ABORT][37] ([i915#11713])
>     [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-7/igt@gem_exec_big@single.html
> 
>    * igt@gem_exec_capture@capture-invisible@smem0:
>      - shard-tglu-1:       NOTRUN -> [SKIP][38] ([i915#6334]) +1 other test skip
>     [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>    * igt@gem_exec_capture@capture-recoverable:
>      - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#6344])
>     [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-6/igt@gem_exec_capture@capture-recoverable.html
> 
>    * igt@gem_exec_fence@submit3:
>      - shard-dg2-9:        NOTRUN -> [SKIP][40] ([i915#4812])
>     [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@gem_exec_fence@submit3.html
> 
>    * igt@gem_exec_flush@basic-uc-pro-default:
>      - shard-dg2-9:        NOTRUN -> [SKIP][41] ([i915#3539] / [i915#4852]) +1 other test skip
>     [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@gem_exec_flush@basic-uc-pro-default.html
> 
>    * igt@gem_exec_flush@basic-wb-prw-default:
>      - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#3539] / [i915#4852])
>     [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-6/igt@gem_exec_flush@basic-wb-prw-default.html
> 
>    * igt@gem_exec_reloc@basic-concurrent0:
>      - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#3281]) +5 other tests skip
>     [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-8/igt@gem_exec_reloc@basic-concurrent0.html
> 
>    * igt@gem_exec_reloc@basic-gtt-noreloc:
>      - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#3281]) +3 other tests skip
>     [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-1/igt@gem_exec_reloc@basic-gtt-noreloc.html
>      - shard-dg1:          NOTRUN -> [SKIP][45] ([i915#3281])
>     [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-17/igt@gem_exec_reloc@basic-gtt-noreloc.html
> 
>    * igt@gem_exec_reloc@basic-write-read-noreloc:
>      - shard-dg2-9:        NOTRUN -> [SKIP][46] ([i915#3281]) +3 other tests skip
>     [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@gem_exec_reloc@basic-write-read-noreloc.html
> 
>    * igt@gem_exec_schedule@preempt-queue-chain:
>      - shard-dg2-9:        NOTRUN -> [SKIP][47] ([i915#4537] / [i915#4812])
>     [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@gem_exec_schedule@preempt-queue-chain.html
> 
>    * igt@gem_exec_schedule@reorder-wide:
>      - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#4537] / [i915#4812]) +1 other test skip
>     [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-10/igt@gem_exec_schedule@reorder-wide.html
>      - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#4812])
>     [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-13/igt@gem_exec_schedule@reorder-wide.html
>      - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4537] / [i915#4812]) +1 other test skip
>     [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-8/igt@gem_exec_schedule@reorder-wide.html
> 
>    * igt@gem_exec_suspend@basic-s3:
>      - shard-glk:          [PASS][51] -> [INCOMPLETE][52] ([i915#13196]) +1 other test incomplete
>     [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-glk2/igt@gem_exec_suspend@basic-s3.html
>     [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk2/igt@gem_exec_suspend@basic-s3.html
> 
>    * igt@gem_exec_suspend@basic-s4-devices:
>      - shard-dg2:          NOTRUN -> [ABORT][53] ([i915#7975]) +1 other test abort
>     [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-11/igt@gem_exec_suspend@basic-s4-devices.html
>      - shard-rkl:          NOTRUN -> [ABORT][54] ([i915#7975]) +2 other tests abort
>     [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@gem_exec_suspend@basic-s4-devices.html
> 
>    * igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
>      - shard-mtlp:         NOTRUN -> [SKIP][55] ([i915#4860])
>     [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-8/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
>      - shard-dg2:          NOTRUN -> [SKIP][56] ([i915#4860]) +1 other test skip
>     [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
>      - shard-dg1:          NOTRUN -> [SKIP][57] ([i915#4860])
>     [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html
> 
>    * igt@gem_lmem_swapping@heavy-multi:
>      - shard-tglu-1:       NOTRUN -> [SKIP][58] ([i915#4613]) +1 other test skip
>     [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@gem_lmem_swapping@heavy-multi.html
> 
>    * igt@gem_lmem_swapping@heavy-verify-random-ccs:
>      - shard-dg1:          NOTRUN -> [SKIP][59] ([i915#12193])
>     [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
>      - shard-tglu:         NOTRUN -> [SKIP][60] ([i915#4613]) +3 other tests skip
>     [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
>      - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4613]) +2 other tests skip
>     [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-5/igt@gem_lmem_swapping@heavy-verify-random-ccs.html
> 
>    * igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
>      - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4565])
>     [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html
> 
>    * igt@gem_lmem_swapping@parallel-random-verify:
>      - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#4613]) +6 other tests skip
>     [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify.html
> 
>    * igt@gem_lmem_swapping@verify-random:
>      - shard-glk:          NOTRUN -> [SKIP][64] ([i915#4613]) +4 other tests skip
>     [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk6/igt@gem_lmem_swapping@verify-random.html
> 
>    * igt@gem_mmap@short-mmap:
>      - shard-dg2:          NOTRUN -> [SKIP][65] ([i915#4083]) +2 other tests skip
>     [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-10/igt@gem_mmap@short-mmap.html
> 
>    * igt@gem_mmap_gtt@big-bo-tiledy:
>      - shard-mtlp:         NOTRUN -> [SKIP][66] ([i915#4077]) +9 other tests skip
>     [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@gem_mmap_gtt@big-bo-tiledy.html
> 
>    * igt@gem_mmap_gtt@cpuset-big-copy:
>      - shard-dg2:          NOTRUN -> [SKIP][67] ([i915#4077]) +8 other tests skip
>     [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-10/igt@gem_mmap_gtt@cpuset-big-copy.html
> 
>    * igt@gem_mmap_wc@bad-object:
>      - shard-mtlp:         NOTRUN -> [SKIP][68] ([i915#4083]) +4 other tests skip
>     [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@gem_mmap_wc@bad-object.html
> 
>    * igt@gem_mmap_wc@invalid-flags:
>      - shard-dg2-9:        NOTRUN -> [SKIP][69] ([i915#4083])
>     [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@gem_mmap_wc@invalid-flags.html
> 
>    * igt@gem_mmap_wc@write-wc-read-gtt:
>      - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#4083]) +1 other test skip
>     [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-19/igt@gem_mmap_wc@write-wc-read-gtt.html
> 
>    * igt@gem_partial_pwrite_pread@reads-uncached:
>      - shard-dg2-9:        NOTRUN -> [SKIP][71] ([i915#3282]) +1 other test skip
>     [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@gem_partial_pwrite_pread@reads-uncached.html
> 
>    * igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
>      - shard-rkl:          NOTRUN -> [SKIP][72] ([i915#3282]) +8 other tests skip
>     [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-3/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
>      - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#3282]) +3 other tests skip
>     [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-7/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html
> 
>    * igt@gem_pxp@create-valid-protected-context:
>      - shard-rkl:          NOTRUN -> [TIMEOUT][74] ([i915#12964])
>     [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-2/igt@gem_pxp@create-valid-protected-context.html
> 
>    * igt@gem_pxp@reject-modify-context-protection-off-3:
>      - shard-rkl:          NOTRUN -> [TIMEOUT][75] ([i915#12917] / [i915#12964]) +2 other tests timeout
>     [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-off-3.html
> 
>    * igt@gem_pxp@reject-modify-context-protection-on:
>      - shard-dg2:          NOTRUN -> [SKIP][76] ([i915#4270]) +2 other tests skip
>     [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-5/igt@gem_pxp@reject-modify-context-protection-on.html
>      - shard-rkl:          [PASS][77] -> [TIMEOUT][78] ([i915#12917] / [i915#12964])
>     [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-on.html
>     [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-1/igt@gem_pxp@reject-modify-context-protection-on.html
> 
>    * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>      - shard-dg1:          NOTRUN -> [SKIP][79] ([i915#4270]) +1 other test skip
>     [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-18/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
>      - shard-dg2-9:        NOTRUN -> [SKIP][80] ([i915#4270])
>     [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>    * igt@gem_readwrite@beyond-eob:
>      - shard-dg2:          NOTRUN -> [SKIP][81] ([i915#3282]) +1 other test skip
>     [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-7/igt@gem_readwrite@beyond-eob.html
> 
>    * igt@gem_render_copy@x-tiled-to-vebox-y-tiled:
>      - shard-mtlp:         NOTRUN -> [SKIP][82] ([i915#8428]) +3 other tests skip
>     [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-3/igt@gem_render_copy@x-tiled-to-vebox-y-tiled.html
> 
>    * igt@gem_render_copy@yf-tiled-to-vebox-linear:
>      - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#5190] / [i915#8428]) +2 other tests skip
>     [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-5/igt@gem_render_copy@yf-tiled-to-vebox-linear.html
> 
>    * igt@gem_render_tiled_blits@basic:
>      - shard-mtlp:         NOTRUN -> [SKIP][84] ([i915#4079])
>     [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-7/igt@gem_render_tiled_blits@basic.html
> 
>    * igt@gem_softpin@evict-snoop:
>      - shard-mtlp:         NOTRUN -> [SKIP][85] ([i915#4885])
>     [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-3/igt@gem_softpin@evict-snoop.html
> 
>    * igt@gem_tiled_pread_basic:
>      - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#4079])
>     [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-10/igt@gem_tiled_pread_basic.html
> 
>    * igt@gem_tiled_swapping@non-threaded:
>      - shard-rkl:          NOTRUN -> [FAIL][87] ([i915#12941])
>     [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html
>      - shard-dg1:          NOTRUN -> [SKIP][88] ([i915#4077]) +3 other tests skip
>     [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-19/igt@gem_tiled_swapping@non-threaded.html
>      - shard-tglu:         NOTRUN -> [FAIL][89] ([i915#12941])
>     [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-5/igt@gem_tiled_swapping@non-threaded.html
>      - shard-glk:          NOTRUN -> [FAIL][90] ([i915#13805])
>     [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk5/igt@gem_tiled_swapping@non-threaded.html
> 
>    * igt@gem_userptr_blits@create-destroy-unsync:
>      - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#3297]) +4 other tests skip
>     [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-2/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>    * igt@gem_userptr_blits@dmabuf-unsync:
>      - shard-tglu-1:       NOTRUN -> [SKIP][92] ([i915#3297]) +1 other test skip
>     [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>    * igt@gem_userptr_blits@forbidden-operations:
>      - shard-mtlp:         NOTRUN -> [SKIP][93] ([i915#3282] / [i915#3297])
>     [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-2/igt@gem_userptr_blits@forbidden-operations.html
> 
>    * igt@gem_userptr_blits@unsync-unmap:
>      - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#3297])
>     [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-1/igt@gem_userptr_blits@unsync-unmap.html
> 
>    * igt@gen9_exec_parse@allowed-single:
>      - shard-dg2-9:        NOTRUN -> [SKIP][95] ([i915#2856])
>     [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@gen9_exec_parse@allowed-single.html
> 
>    * igt@gen9_exec_parse@batch-without-end:
>      - shard-tglu-1:       NOTRUN -> [SKIP][96] ([i915#2527] / [i915#2856]) +1 other test skip
>     [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@gen9_exec_parse@batch-without-end.html
> 
>    * igt@gen9_exec_parse@bb-oversize:
>      - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#2856]) +2 other tests skip
>     [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-5/igt@gen9_exec_parse@bb-oversize.html
> 
>    * igt@gen9_exec_parse@shadow-peek:
>      - shard-tglu:         NOTRUN -> [SKIP][98] ([i915#2527] / [i915#2856]) +2 other tests skip
>     [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-7/igt@gen9_exec_parse@shadow-peek.html
> 
>    * igt@gen9_exec_parse@valid-registers:
>      - shard-dg2:          NOTRUN -> [SKIP][99] ([i915#2856]) +2 other tests skip
>     [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-8/igt@gen9_exec_parse@valid-registers.html
>      - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#2527]) +6 other tests skip
>     [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-5/igt@gen9_exec_parse@valid-registers.html
>      - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#2527])
>     [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-18/igt@gen9_exec_parse@valid-registers.html
> 
>    * igt@i915_module_load@reload-with-fault-injection:
>      - shard-dg2:          [PASS][102] -> [ABORT][103] ([i915#10887] / [i915#9820])
>     [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg2-2/igt@i915_module_load@reload-with-fault-injection.html
>     [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-10/igt@i915_module_load@reload-with-fault-injection.html
>      - shard-snb:          [PASS][104] -> [ABORT][105] ([i915#11703])
>     [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
>     [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-snb4/igt@i915_module_load@reload-with-fault-injection.html
>      - shard-dg1:          [PASS][106] -> [ABORT][107] ([i915#9820])
>     [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg1-19/igt@i915_module_load@reload-with-fault-injection.html
>     [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-13/igt@i915_module_load@reload-with-fault-injection.html
>      - shard-tglu:         [PASS][108] -> [ABORT][109] ([i915#12817] / [i915#9820])
>     [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-tglu-3/igt@i915_module_load@reload-with-fault-injection.html
>     [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-10/igt@i915_module_load@reload-with-fault-injection.html
> 
>    * igt@i915_pm_freq_api@freq-basic-api:
>      - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#8399])
>     [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-5/igt@i915_pm_freq_api@freq-basic-api.html
>      - shard-tglu:         NOTRUN -> [SKIP][111] ([i915#8399])
>     [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-8/igt@i915_pm_freq_api@freq-basic-api.html
> 
>    * igt@i915_pm_freq_api@freq-suspend@gt0:
>      - shard-dg2:          [PASS][112] -> [INCOMPLETE][113] ([i915#12455] / [i915#13820]) +1 other test incomplete
>     [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg2-10/igt@i915_pm_freq_api@freq-suspend@gt0.html
>     [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html
> 
>    * igt@i915_pm_rpm@system-suspend:
>      - shard-glk:          [PASS][114] -> [INCOMPLETE][115] ([i915#12797])
>     [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-glk6/igt@i915_pm_rpm@system-suspend.html
>     [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk7/igt@i915_pm_rpm@system-suspend.html
> 
>    * igt@i915_pm_rps@basic-api:
>      - shard-dg2-9:        NOTRUN -> [SKIP][116] ([i915#11681] / [i915#6621])
>     [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@i915_pm_rps@basic-api.html
> 
>    * igt@i915_pm_rps@thresholds:
>      - shard-mtlp:         NOTRUN -> [SKIP][117] ([i915#11681])
>     [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-3/igt@i915_pm_rps@thresholds.html
> 
>    * igt@i915_pm_rps@thresholds-park:
>      - shard-dg2:          NOTRUN -> [SKIP][118] ([i915#11681])
>     [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-8/igt@i915_pm_rps@thresholds-park.html
> 
>    * igt@i915_pm_rps@waitboost:
>      - shard-mtlp:         NOTRUN -> [FAIL][119] ([i915#8346])
>     [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-8/igt@i915_pm_rps@waitboost.html
> 
>    * igt@i915_pm_sseu@full-enable:
>      - shard-rkl:          NOTRUN -> [SKIP][120] ([i915#4387])
>     [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@i915_pm_sseu@full-enable.html
> 
>    * igt@i915_query@test-query-geometry-subslices:
>      - shard-tglu-1:       NOTRUN -> [SKIP][121] ([i915#5723])
>     [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@i915_query@test-query-geometry-subslices.html
> 
>    * igt@i915_selftest@mock:
>      - shard-mtlp:         NOTRUN -> [DMESG-WARN][122] ([i915#9311]) +1 other test dmesg-warn
>     [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-3/igt@i915_selftest@mock.html
> 
>    * igt@i915_selftest@mock@memory_region:
>      - shard-rkl:          NOTRUN -> [DMESG-WARN][123] ([i915#9311]) +1 other test dmesg-warn
>     [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@i915_selftest@mock@memory_region.html
> 
>    * igt@i915_suspend@debugfs-reader:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][124] ([i915#4817])
>     [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk5/igt@i915_suspend@debugfs-reader.html
> 
>    * igt@intel_hwmon@hwmon-write:
>      - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#7707])
>     [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-4/igt@intel_hwmon@hwmon-write.html
> 
>    * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>      - shard-dg2-9:        NOTRUN -> [SKIP][126] ([i915#4212])
>     [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 
>    * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>      - shard-dg2:          NOTRUN -> [SKIP][127] ([i915#5190]) +1 other test skip
>     [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-5/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>      - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#5190])
>     [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>    * igt@kms_addfb_basic@clobberred-modifier:
>      - shard-mtlp:         NOTRUN -> [SKIP][129] ([i915#4212])
>     [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-2/igt@kms_addfb_basic@clobberred-modifier.html
> 
>    * igt@kms_async_flips@alternate-sync-async-flip-atomic:
>      - shard-glk:          NOTRUN -> [FAIL][130] ([i915#10991] / [i915#13335])
>     [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
> 
>    * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1:
>      - shard-glk:          NOTRUN -> [FAIL][131] ([i915#12518])
>     [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-1.html
> 
>    * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
>      - shard-rkl:          NOTRUN -> [SKIP][132] ([i915#8709]) +3 other tests skip
>     [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-5/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html
> 
>    * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>      - shard-dg2:          NOTRUN -> [SKIP][133] ([i915#9531])
>     [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>    * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>      - shard-glk:          NOTRUN -> [SKIP][134] ([i915#1769])
>     [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>    * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>      - shard-rkl:          NOTRUN -> [SKIP][135] ([i915#1769] / [i915#3555])
>     [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>    * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
>      - shard-tglu:         [PASS][136] -> [FAIL][137] ([i915#11808]) +1 other test fail
>     [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
>     [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>      - shard-dg2-9:        NOTRUN -> [SKIP][138] +1 other test skip
>     [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>    * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>      - shard-tglu-1:       NOTRUN -> [SKIP][139] ([i915#5286]) +1 other test skip
>     [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
> 
>    * igt@kms_big_fb@4-tiled-addfb:
>      - shard-rkl:          NOTRUN -> [SKIP][140] ([i915#5286]) +9 other tests skip
>     [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@kms_big_fb@4-tiled-addfb.html
> 
>    * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>      - shard-mtlp:         [PASS][141] -> [FAIL][142] ([i915#5138])
>     [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>     [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>    * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>      - shard-snb:          NOTRUN -> [SKIP][143] +27 other tests skip
>     [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-snb4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>      - shard-dg1:          NOTRUN -> [SKIP][144] ([i915#4538] / [i915#5286]) +1 other test skip
>     [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>      - shard-tglu:         NOTRUN -> [SKIP][145] ([i915#5286]) +4 other tests skip
>     [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>    * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>      - shard-mtlp:         NOTRUN -> [SKIP][146] +14 other tests skip
>     [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>    * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>      - shard-rkl:          NOTRUN -> [SKIP][147] ([i915#3638]) +3 other tests skip
>     [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
> 
>    * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>      - shard-dg2:          NOTRUN -> [SKIP][148] ([i915#4538] / [i915#5190]) +8 other tests skip
>     [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
> 
>    * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>      - shard-dg1:          NOTRUN -> [SKIP][149] ([i915#4538]) +3 other tests skip
>     [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-18/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html
> 
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>      - shard-dg2-9:        NOTRUN -> [SKIP][150] ([i915#4538] / [i915#5190]) +2 other tests skip
>     [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>      - shard-rkl:          NOTRUN -> [SKIP][151] +32 other tests skip
>     [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>    * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
>      - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#6095]) +129 other tests skip
>     [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-15/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html
> 
>    * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3:
>      - shard-dg2:          NOTRUN -> [SKIP][153] ([i915#10307] / [i915#6095]) +191 other tests skip
>     [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-3.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>      - shard-tglu:         NOTRUN -> [SKIP][154] ([i915#12313]) +2 other tests skip
>     [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-3/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
>      - shard-mtlp:         NOTRUN -> [SKIP][155] ([i915#12313]) +2 other tests skip
>     [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
>      - shard-dg2-9:        NOTRUN -> [SKIP][156] ([i915#12313])
>     [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>      - shard-rkl:          NOTRUN -> [SKIP][157] ([i915#12313]) +4 other tests skip
>     [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>      - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#12313])
>     [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-6/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
>      - shard-dg1:          NOTRUN -> [SKIP][159] ([i915#12313])
>     [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-15/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
>      - shard-tglu-1:       NOTRUN -> [SKIP][160] ([i915#6095]) +29 other tests skip
>     [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1.html
> 
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][161] ([i915#12796]) +1 other test incomplete
>     [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3:
>      - shard-dg2:          NOTRUN -> [SKIP][162] ([i915#6095]) +16 other tests skip
>     [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-3.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>      - shard-tglu-1:       NOTRUN -> [SKIP][163] ([i915#12313]) +1 other test skip
>     [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1:
>      - shard-tglu:         NOTRUN -> [SKIP][164] ([i915#6095]) +39 other tests skip
>     [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-1.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2:
>      - shard-dg2-9:        NOTRUN -> [SKIP][165] ([i915#10307] / [i915#6095]) +19 other tests skip
>     [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-2.html
> 
>    * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
>      - shard-mtlp:         NOTRUN -> [SKIP][166] ([i915#6095]) +44 other tests skip
>     [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>      - shard-rkl:          NOTRUN -> [SKIP][167] ([i915#6095]) +111 other tests skip
>     [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
> 
>    * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
>      - shard-dg2:          NOTRUN -> [SKIP][168] ([i915#10307] / [i915#10434] / [i915#6095]) +6 other tests skip
>     [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-8/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html
> 
>    * igt@kms_cdclk@mode-transition-all-outputs:
>      - shard-rkl:          NOTRUN -> [SKIP][169] ([i915#3742]) +1 other test skip
>     [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-4/igt@kms_cdclk@mode-transition-all-outputs.html
>      - shard-tglu:         NOTRUN -> [SKIP][170] ([i915#3742])
>     [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-7/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>    * igt@kms_chamelium_audio@hdmi-audio:
>      - shard-dg1:          NOTRUN -> [SKIP][171] ([i915#11151] / [i915#7828]) +1 other test skip
>     [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-12/igt@kms_chamelium_audio@hdmi-audio.html
> 
>    * igt@kms_chamelium_audio@hdmi-audio-edid:
>      - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#11151] / [i915#7828]) +8 other tests skip
>     [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-6/igt@kms_chamelium_audio@hdmi-audio-edid.html
> 
>    * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>      - shard-mtlp:         NOTRUN -> [SKIP][173] ([i915#11151] / [i915#7828]) +7 other tests skip
>     [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-8/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
> 
>    * igt@kms_chamelium_frames@hdmi-crc-multiple:
>      - shard-dg1:          NOTRUN -> [SKIP][174] ([i915#11151] / [i915#4423] / [i915#7828])
>     [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-17/igt@kms_chamelium_frames@hdmi-crc-multiple.html
> 
>    * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>      - shard-tglu-1:       NOTRUN -> [SKIP][175] ([i915#11151] / [i915#7828]) +4 other tests skip
>     [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
> 
>    * igt@kms_chamelium_hpd@dp-hpd-storm:
>      - shard-dg2:          NOTRUN -> [SKIP][176] ([i915#11151] / [i915#7828]) +3 other tests skip
>     [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-2/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>    * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>      - shard-dg2-9:        NOTRUN -> [SKIP][177] ([i915#11151] / [i915#7828]) +1 other test skip
>     [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
> 
>    * igt@kms_chamelium_hpd@vga-hpd-fast:
>      - shard-rkl:          NOTRUN -> [SKIP][178] ([i915#11151] / [i915#7828]) +13 other tests skip
>     [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@kms_chamelium_hpd@vga-hpd-fast.html
> 
>    * igt@kms_content_protection@atomic@pipe-a-dp-3:
>      - shard-dg2:          NOTRUN -> [FAIL][179] ([i915#7173])
>     [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-11/igt@kms_content_protection@atomic@pipe-a-dp-3.html
> 
>    * igt@kms_content_protection@dp-mst-lic-type-0:
>      - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#3299])
>     [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-2/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>    * igt@kms_content_protection@dp-mst-lic-type-1:
>      - shard-tglu-1:       NOTRUN -> [SKIP][181] ([i915#3116] / [i915#3299]) +1 other test skip
>     [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>    * igt@kms_content_protection@dp-mst-type-1:
>      - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#3116] / [i915#3299])
>     [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-10/igt@kms_content_protection@dp-mst-type-1.html
>      - shard-mtlp:         NOTRUN -> [SKIP][183] ([i915#3299])
>     [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-8/igt@kms_content_protection@dp-mst-type-1.html
> 
>    * igt@kms_content_protection@mei-interface:
>      - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#9424]) +2 other tests skip
>     [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-8/igt@kms_content_protection@mei-interface.html
> 
>    * igt@kms_content_protection@type1:
>      - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#7118] / [i915#9424])
>     [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-8/igt@kms_content_protection@type1.html
>      - shard-rkl:          NOTRUN -> [SKIP][186] ([i915#7118] / [i915#9424]) +1 other test skip
>     [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-5/igt@kms_content_protection@type1.html
>      - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#7116] / [i915#9424])
>     [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-18/igt@kms_content_protection@type1.html
>      - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1 other test skip
>     [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-8/igt@kms_content_protection@type1.html
>      - shard-mtlp:         NOTRUN -> [SKIP][189] ([i915#3555] / [i915#6944] / [i915#9424])
>     [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-8/igt@kms_content_protection@type1.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-128x42:
>      - shard-mtlp:         NOTRUN -> [SKIP][190] ([i915#8814]) +1 other test skip
>     [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-64x21:
>      - shard-rkl:          [PASS][191] -> [FAIL][192] ([i915#13566]) +1 other test fail
>     [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-64x21.html
>     [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-64x21.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
>      - shard-tglu:         [PASS][193] -> [FAIL][194] ([i915#13566]) +1 other test fail
>     [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html
>     [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
>      - shard-rkl:          NOTRUN -> [FAIL][195] ([i915#13566]) +1 other test fail
>     [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-4/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_cursor_crc@cursor-random-32x32:
>      - shard-tglu-1:       NOTRUN -> [SKIP][196] ([i915#3555]) +2 other tests skip
>     [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>    * igt@kms_cursor_crc@cursor-random-512x512:
>      - shard-rkl:          NOTRUN -> [SKIP][197] ([i915#13049]) +4 other tests skip
>     [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>    * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>      - shard-tglu-1:       NOTRUN -> [SKIP][198] ([i915#13049])
>     [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-512x170:
>      - shard-mtlp:         NOTRUN -> [SKIP][199] ([i915#13049])
>     [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-512x170.html
>      - shard-dg2:          NOTRUN -> [SKIP][200] ([i915#13049])
>     [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-2/igt@kms_cursor_crc@cursor-sliding-512x170.html
>      - shard-dg1:          NOTRUN -> [SKIP][201] ([i915#13049])
>     [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-19/igt@kms_cursor_crc@cursor-sliding-512x170.html
>      - shard-tglu:         NOTRUN -> [SKIP][202] ([i915#13049])
>     [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>    * igt@kms_cursor_crc@cursor-suspend:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][203] ([i915#12358] / [i915#7882])
>     [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk3/igt@kms_cursor_crc@cursor-suspend.html
> 
>    * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][204] ([i915#12358])
>     [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk3/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
>      - shard-dg2:          NOTRUN -> [SKIP][205] ([i915#13046] / [i915#5354]) +2 other tests skip
>     [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-10/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
> 
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>      - shard-dg1:          NOTRUN -> [SKIP][206] ([i915#4103] / [i915#4213]) +1 other test skip
>     [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>      - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#4103]) +1 other test skip
>     [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>      - shard-mtlp:         NOTRUN -> [SKIP][208] ([i915#4213]) +2 other tests skip
>     [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>      - shard-rkl:          NOTRUN -> [SKIP][209] ([i915#4103]) +2 other tests skip
>     [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>      - shard-dg2-9:        NOTRUN -> [SKIP][210] ([i915#4103] / [i915#4213]) +1 other test skip
>     [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>      - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#9809]) +1 other test skip
>     [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>    * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>      - shard-tglu-1:       NOTRUN -> [SKIP][212] ([i915#9067])
>     [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>    * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>      - shard-dg2:          NOTRUN -> [SKIP][213] ([i915#4103] / [i915#4213])
>     [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-11/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> 
>    * igt@kms_display_modes@extended-mode-basic:
>      - shard-dg1:          NOTRUN -> [SKIP][214] ([i915#13691])
>     [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-18/igt@kms_display_modes@extended-mode-basic.html
>      - shard-tglu:         NOTRUN -> [SKIP][215] ([i915#13691])
>     [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-8/igt@kms_display_modes@extended-mode-basic.html
>      - shard-mtlp:         NOTRUN -> [SKIP][216] ([i915#13691])
>     [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-8/igt@kms_display_modes@extended-mode-basic.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>      - shard-rkl:          NOTRUN -> [SKIP][217] ([i915#3555] / [i915#3804])
>     [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>      - shard-rkl:          NOTRUN -> [SKIP][218] ([i915#3804])
>     [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_dp_aux_dev:
>      - shard-dg2:          [PASS][219] -> [SKIP][220] ([i915#1257])
>     [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg2-10/igt@kms_dp_aux_dev.html
>     [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-1/igt@kms_dp_aux_dev.html
> 
>    * igt@kms_dp_link_training@non-uhbr-sst:
>      - shard-mtlp:         NOTRUN -> [SKIP][221] ([i915#13749])
>     [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-2/igt@kms_dp_link_training@non-uhbr-sst.html
>      - shard-rkl:          NOTRUN -> [SKIP][222] ([i915#13749])
>     [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-1/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>    * igt@kms_dp_linktrain_fallback@dp-fallback:
>      - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#13707])
>     [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>    * igt@kms_dp_linktrain_fallback@dsc-fallback:
>      - shard-rkl:          NOTRUN -> [SKIP][224] ([i915#13707])
>     [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][225] ([i915#13707])
>     [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>    * igt@kms_dsc@dsc-basic:
>      - shard-rkl:          NOTRUN -> [SKIP][226] ([i915#3555] / [i915#3840]) +1 other test skip
>     [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-6/igt@kms_dsc@dsc-basic.html
> 
>    * igt@kms_dsc@dsc-fractional-bpp:
>      - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#3840])
>     [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp.html
> 
>    * igt@kms_dsc@dsc-with-bpc:
>      - shard-dg2:          NOTRUN -> [SKIP][228] ([i915#3555] / [i915#3840])
>     [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-5/igt@kms_dsc@dsc-with-bpc.html
> 
>    * igt@kms_dsc@dsc-with-output-formats:
>      - shard-dg2-9:        NOTRUN -> [SKIP][229] ([i915#3555] / [i915#3840])
>     [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_dsc@dsc-with-output-formats.html
> 
>    * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>      - shard-tglu-1:       NOTRUN -> [SKIP][230] ([i915#2575])
>     [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
> 
>    * igt@kms_fbcon_fbt@psr:
>      - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#3469])
>     [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-6/igt@kms_fbcon_fbt@psr.html
> 
>    * igt@kms_feature_discovery@display-3x:
>      - shard-rkl:          NOTRUN -> [SKIP][232] ([i915#1839])
>     [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-2/igt@kms_feature_discovery@display-3x.html
> 
>    * igt@kms_feature_discovery@display-4x:
>      - shard-dg2-9:        NOTRUN -> [SKIP][233] ([i915#1839])
>     [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_feature_discovery@display-4x.html
> 
>    * igt@kms_feature_discovery@dp-mst:
>      - shard-tglu:         NOTRUN -> [SKIP][234] ([i915#9337])
>     [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-9/igt@kms_feature_discovery@dp-mst.html
> 
>    * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>      - shard-dg2-9:        NOTRUN -> [SKIP][235] ([i915#9934]) +1 other test skip
>     [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>    * igt@kms_flip@2x-flip-vs-dpms:
>      - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#9934]) +17 other tests skip
>     [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-8/igt@kms_flip@2x-flip-vs-dpms.html
> 
>    * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>      - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#3637]) +4 other tests skip
>     [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-2/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>    * igt@kms_flip@2x-flip-vs-suspend:
>      - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#3637]) +3 other tests skip
>     [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-3/igt@kms_flip@2x-flip-vs-suspend.html
> 
>    * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][239] ([i915#12745] / [i915#4839])
>     [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>    * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][240] ([i915#4839])
>     [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk1/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html
> 
>    * igt@kms_flip@2x-plain-flip:
>      - shard-tglu-1:       NOTRUN -> [SKIP][241] ([i915#3637]) +3 other tests skip
>     [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_flip@2x-plain-flip.html
> 
>    * igt@kms_flip@2x-plain-flip-ts-check:
>      - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#9934]) +1 other test skip
>     [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-5/igt@kms_flip@2x-plain-flip-ts-check.html
> 
>    * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
>      - shard-mtlp:         [PASS][243] -> [FAIL][244] ([i915#1522]) +1 other test fail
>     [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-mtlp-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
>     [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
> 
>    * igt@kms_flip@flip-vs-panning:
>      - shard-snb:          [PASS][245] -> [INCOMPLETE][246] ([i915#12314]) +1 other test incomplete
>     [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-snb6/igt@kms_flip@flip-vs-panning.html
>     [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-snb2/igt@kms_flip@flip-vs-panning.html
> 
>    * igt@kms_flip@plain-flip-ts-check:
>      - shard-dg2:          [PASS][247] -> [FAIL][248] ([i915#1522])
>     [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg2-10/igt@kms_flip@plain-flip-ts-check.html
>     [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-11/igt@kms_flip@plain-flip-ts-check.html
> 
>    * igt@kms_flip@plain-flip-ts-check@a-dp3:
>      - shard-dg2:          NOTRUN -> [FAIL][249] ([i915#1522])
>     [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-11/igt@kms_flip@plain-flip-ts-check@a-dp3.html
> 
>    * igt@kms_flip@plain-flip-ts-check@b-hdmi-a1:
>      - shard-tglu:         [PASS][250] -> [FAIL][251] ([i915#1522]) +2 other tests fail
>     [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-tglu-2/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html
>     [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-4/igt@kms_flip@plain-flip-ts-check@b-hdmi-a1.html
> 
>    * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2:
>      - shard-rkl:          NOTRUN -> [FAIL][252] ([i915#1522]) +4 other tests fail
>     [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-8/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a2.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>      - shard-mtlp:         NOTRUN -> [SKIP][253] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
>     [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
>      - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#8810]) +1 other test skip
>     [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>      - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#2672] / [i915#3555] / [i915#8813]) +4 other tests skip
>     [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode:
>      - shard-mtlp:         NOTRUN -> [SKIP][256] ([i915#2672] / [i915#8813]) +2 other tests skip
>     [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>      - shard-tglu-1:       NOTRUN -> [SKIP][257] ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
>     [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>      - shard-tglu-1:       NOTRUN -> [SKIP][258] ([i915#2587] / [i915#2672]) +1 other test skip
>     [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
>      - shard-tglu:         NOTRUN -> [SKIP][259] ([i915#2672] / [i915#3555]) +4 other tests skip
>     [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>      - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#2672] / [i915#3555]) +2 other tests skip
>     [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
>      - shard-rkl:          NOTRUN -> [SKIP][261] ([i915#2672] / [i915#3555]) +6 other tests skip
>     [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
>      - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#2672] / [i915#3555]) +1 other test skip
>     [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
>      - shard-rkl:          NOTRUN -> [SKIP][263] ([i915#2672]) +6 other tests skip
>     [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
>      - shard-dg1:          NOTRUN -> [SKIP][264] ([i915#2587] / [i915#2672]) +1 other test skip
>     [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
>      - shard-tglu:         NOTRUN -> [SKIP][265] ([i915#2587] / [i915#2672]) +4 other tests skip
>     [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
>      - shard-dg2:          NOTRUN -> [SKIP][266] ([i915#2672] / [i915#3555] / [i915#5190]) +1 other test skip
>     [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
>      - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#2672]) +4 other tests skip
>     [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-11/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>      - shard-dg2-9:        NOTRUN -> [SKIP][268] ([i915#2672] / [i915#3555] / [i915#5190])
>     [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
>      - shard-dg2-9:        NOTRUN -> [SKIP][269] ([i915#2672])
>     [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
>      - shard-dg2:          [PASS][270] -> [FAIL][271] ([i915#6880])
>     [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html
>     [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
>      - shard-rkl:          [PASS][272] -> [DMESG-WARN][273] ([i915#12917] / [i915#12964]) +1 other test dmesg-warn
>     [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
>     [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
>      - shard-dg2:          NOTRUN -> [SKIP][274] ([i915#8708]) +6 other tests skip
>     [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>      - shard-dg1:          NOTRUN -> [SKIP][275] ([i915#4423])
>     [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
>      - shard-mtlp:         NOTRUN -> [SKIP][276] ([i915#1825]) +21 other tests skip
>     [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
>      - shard-mtlp:         NOTRUN -> [SKIP][277] ([i915#8708]) +6 other tests skip
>     [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
>      - shard-rkl:          NOTRUN -> [DMESG-WARN][278] ([i915#12964]) +14 other tests dmesg-warn
>     [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-suspend:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][279] ([i915#10056] / [i915#13353])
>     [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk3/igt@kms_frontbuffer_tracking@fbc-suspend.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>      - shard-rkl:          NOTRUN -> [SKIP][280] ([i915#5439])
>     [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
>      - shard-dg1:          NOTRUN -> [SKIP][281] ([i915#3458]) +3 other tests skip
>     [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
>      - shard-dg2-9:        NOTRUN -> [SKIP][282] ([i915#3458]) +1 other test skip
>     [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:
>      - shard-tglu-1:       NOTRUN -> [SKIP][283] +34 other tests skip
>     [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
>      - shard-dg1:          NOTRUN -> [SKIP][284] +13 other tests skip
>     [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt:
>      - shard-dg2-9:        NOTRUN -> [SKIP][285] ([i915#5354]) +6 other tests skip
>     [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>      - shard-rkl:          NOTRUN -> [SKIP][286] ([i915#3023]) +41 other tests skip
>     [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
>      - shard-glk:          NOTRUN -> [SKIP][287] +385 other tests skip
>     [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk2/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
>      - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#3458]) +10 other tests skip
>     [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
>      - shard-dg2-9:        NOTRUN -> [SKIP][289] ([i915#8708]) +4 other tests skip
>     [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt:
>      - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#5354]) +20 other tests skip
>     [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>      - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#1825]) +61 other tests skip
>     [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>      - shard-tglu:         NOTRUN -> [SKIP][292] +67 other tests skip
>     [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>      - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#8708]) +3 other tests skip
>     [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-16/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
> 
>    * igt@kms_hdr@bpc-switch-suspend:
>      - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#3555] / [i915#8228])
>     [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-2/igt@kms_hdr@bpc-switch-suspend.html
> 
>    * igt@kms_hdr@static-toggle:
>      - shard-rkl:          NOTRUN -> [SKIP][295] ([i915#3555] / [i915#8228]) +2 other tests skip
>     [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-3/igt@kms_hdr@static-toggle.html
> 
>    * igt@kms_hdr@static-toggle-dpms:
>      - shard-mtlp:         NOTRUN -> [SKIP][296] ([i915#3555] / [i915#8228])
>     [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-1/igt@kms_hdr@static-toggle-dpms.html
>      - shard-dg2:          [PASS][297] -> [SKIP][298] ([i915#3555] / [i915#8228])
>     [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg2-11/igt@kms_hdr@static-toggle-dpms.html
>     [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-1/igt@kms_hdr@static-toggle-dpms.html
> 
>    * igt@kms_joiner@basic-big-joiner:
>      - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#10656])
>     [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-4/igt@kms_joiner@basic-big-joiner.html
>      - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#10656]) +1 other test skip
>     [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-4/igt@kms_joiner@basic-big-joiner.html
>      - shard-dg1:          NOTRUN -> [SKIP][301] ([i915#10656])
>     [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-16/igt@kms_joiner@basic-big-joiner.html
>      - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#10656])
>     [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-5/igt@kms_joiner@basic-big-joiner.html
> 
>    * igt@kms_joiner@basic-force-big-joiner:
>      - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#12388])
>     [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html
> 
>    * igt@kms_joiner@basic-force-ultra-joiner:
>      - shard-tglu-1:       NOTRUN -> [SKIP][304] ([i915#12394])
>     [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>    * igt@kms_joiner@invalid-modeset-force-big-joiner:
>      - shard-dg2:          [PASS][305] -> [SKIP][306] ([i915#12388])
>     [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg2-11/igt@kms_joiner@invalid-modeset-force-big-joiner.html
>     [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
> 
>    * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>      - shard-rkl:          NOTRUN -> [SKIP][307] ([i915#13522])
>     [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>    * igt@kms_panel_fitting@atomic-fastset:
>      - shard-dg1:          NOTRUN -> [SKIP][308] ([i915#6301])
>     [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-17/igt@kms_panel_fitting@atomic-fastset.html
>      - shard-tglu:         NOTRUN -> [SKIP][309] ([i915#6301])
>     [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-6/igt@kms_panel_fitting@atomic-fastset.html
> 
>    * igt@kms_plane_alpha_blend@alpha-opaque-fb:
>      - shard-glk:          NOTRUN -> [FAIL][310] ([i915#10647] / [i915#12169]) +1 other test fail
>     [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk5/igt@kms_plane_alpha_blend@alpha-opaque-fb.html
> 
>    * igt@kms_plane_alpha_blend@alpha-transparent-fb:
>      - shard-glk:          NOTRUN -> [FAIL][311] ([i915#10647] / [i915#12177])
>     [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk3/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
> 
>    * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
>      - shard-glk:          NOTRUN -> [FAIL][312] ([i915#10647]) +5 other tests fail
>     [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk6/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html
> 
>    * igt@kms_plane_lowres@tiling-4:
>      - shard-mtlp:         NOTRUN -> [SKIP][313] ([i915#10226] / [i915#11614] / [i915#3555] / [i915#8821])
>     [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@kms_plane_lowres@tiling-4.html
> 
>    * igt@kms_plane_lowres@tiling-4@pipe-c-edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#11614] / [i915#3582]) +3 other tests skip
>     [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@kms_plane_lowres@tiling-4@pipe-c-edp-1.html
> 
>    * igt@kms_plane_lowres@tiling-yf:
>      - shard-rkl:          NOTRUN -> [SKIP][315] ([i915#3555]) +10 other tests skip
>     [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-1/igt@kms_plane_lowres@tiling-yf.html
>      - shard-mtlp:         NOTRUN -> [SKIP][316] ([i915#3555] / [i915#8821])
>     [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@kms_plane_lowres@tiling-yf.html
> 
>    * igt@kms_plane_multiple@tiling-y:
>      - shard-dg2:          NOTRUN -> [SKIP][317] ([i915#8806])
>     [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-11/igt@kms_plane_multiple@tiling-y.html
> 
>    * igt@kms_plane_scaling@intel-max-src-size:
>      - shard-tglu-1:       NOTRUN -> [SKIP][318] ([i915#6953])
>     [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_plane_scaling@intel-max-src-size.html
> 
>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>      - shard-dg1:          NOTRUN -> [SKIP][319] ([i915#12247]) +9 other tests skip
>     [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-14/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
>      - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#12247]) +18 other tests skip
>     [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html
> 
>    * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
>      - shard-rkl:          NOTRUN -> [SKIP][321] ([i915#12247]) +12 other tests skip
>     [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25:
>      - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#12247] / [i915#6953])
>     [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-8/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][323] ([i915#12247] / [i915#6953])
>     [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>      - shard-dg2-9:        NOTRUN -> [SKIP][324] ([i915#12247] / [i915#9423])
>     [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
>      - shard-mtlp:         NOTRUN -> [SKIP][325] ([i915#12247]) +17 other tests skip
>     [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>      - shard-dg2-9:        NOTRUN -> [SKIP][326] ([i915#12247] / [i915#6953] / [i915#9423])
>     [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b:
>      - shard-dg2-9:        NOTRUN -> [SKIP][327] ([i915#12247]) +7 other tests skip
>     [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
>      - shard-tglu-1:       NOTRUN -> [SKIP][328] ([i915#12247]) +3 other tests skip
>     [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
>      - shard-mtlp:         NOTRUN -> [SKIP][329] ([i915#6953])
>     [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
> 
>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>      - shard-tglu:         NOTRUN -> [SKIP][330] ([i915#12247] / [i915#3555])
>     [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>      - shard-mtlp:         NOTRUN -> [SKIP][331] ([i915#12247] / [i915#3555])
>     [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>    * igt@kms_pm_backlight@brightness-with-dpms:
>      - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#12343])
>     [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-3/igt@kms_pm_backlight@brightness-with-dpms.html
>      - shard-rkl:          NOTRUN -> [SKIP][333] ([i915#12343])
>     [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-4/igt@kms_pm_backlight@brightness-with-dpms.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][334] ([i915#12343])
>     [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_pm_backlight@brightness-with-dpms.html
>      - shard-dg1:          NOTRUN -> [SKIP][335] ([i915#12343])
>     [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-12/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>    * igt@kms_pm_backlight@fade-with-dpms:
>      - shard-rkl:          NOTRUN -> [SKIP][336] ([i915#5354]) +1 other test skip
>     [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-2/igt@kms_pm_backlight@fade-with-dpms.html
> 
>    * igt@kms_pm_dc@dc5-psr:
>      - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#9685])
>     [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-11/igt@kms_pm_dc@dc5-psr.html
>      - shard-dg1:          NOTRUN -> [SKIP][338] ([i915#9685])
>     [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-12/igt@kms_pm_dc@dc5-psr.html
>      - shard-tglu:         NOTRUN -> [SKIP][339] ([i915#9685])
>     [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-9/igt@kms_pm_dc@dc5-psr.html
> 
>    * igt@kms_pm_dc@dc5-retention-flops:
>      - shard-dg2:          NOTRUN -> [SKIP][340] ([i915#3828])
>     [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-7/igt@kms_pm_dc@dc5-retention-flops.html
> 
>    * igt@kms_pm_dc@dc6-psr:
>      - shard-rkl:          NOTRUN -> [SKIP][341] ([i915#9685]) +1 other test skip
>     [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-8/igt@kms_pm_dc@dc6-psr.html
> 
>    * igt@kms_pm_lpsp@kms-lpsp:
>      - shard-tglu-1:       NOTRUN -> [SKIP][342] ([i915#3828])
>     [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html
> 
>    * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>      - shard-dg2:          [PASS][343] -> [SKIP][344] ([i915#9519])
>     [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg2-3/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>     [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>    * igt@kms_pm_rpm@fences-dpms:
>      - shard-dg2-9:        NOTRUN -> [SKIP][345] ([i915#4077]) +2 other tests skip
>     [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_pm_rpm@fences-dpms.html
> 
>    * igt@kms_pm_rpm@modeset-lpsp-stress:
>      - shard-dg2:          NOTRUN -> [SKIP][346] ([i915#9519])
>     [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress.html
>      - shard-rkl:          NOTRUN -> [SKIP][347] ([i915#9519]) +3 other tests skip
>     [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp-stress.html
>      - shard-dg1:          NOTRUN -> [SKIP][348] ([i915#9519])
>     [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-15/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>    * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>      - shard-rkl:          [PASS][349] -> [SKIP][350] ([i915#9519]) +1 other test skip
>     [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-rkl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>     [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>      - shard-tglu:         NOTRUN -> [SKIP][351] ([i915#9519])
>     [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>    * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>      - shard-mtlp:         NOTRUN -> [SKIP][352] ([i915#9519])
>     [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>    * igt@kms_prime@basic-crc-vgem:
>      - shard-dg1:          NOTRUN -> [SKIP][353] ([i915#6524])
>     [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-13/igt@kms_prime@basic-crc-vgem.html
> 
>    * igt@kms_prime@basic-modeset-hybrid:
>      - shard-dg2:          NOTRUN -> [SKIP][354] ([i915#6524] / [i915#6805]) +1 other test skip
>     [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-2/igt@kms_prime@basic-modeset-hybrid.html
>      - shard-rkl:          NOTRUN -> [SKIP][355] ([i915#6524])
>     [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-3/igt@kms_prime@basic-modeset-hybrid.html
>      - shard-tglu:         NOTRUN -> [SKIP][356] ([i915#6524])
>     [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-7/igt@kms_prime@basic-modeset-hybrid.html
>      - shard-mtlp:         NOTRUN -> [SKIP][357] ([i915#6524])
>     [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@kms_prime@basic-modeset-hybrid.html
> 
>    * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
>      - shard-glk:          NOTRUN -> [SKIP][358] ([i915#11520]) +13 other tests skip
>     [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk5/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
>      - shard-dg1:          NOTRUN -> [SKIP][359] ([i915#11520]) +2 other tests skip
>     [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-12/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>      - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#11520]) +2 other tests skip
>     [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>    * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>      - shard-tglu-1:       NOTRUN -> [SKIP][361] ([i915#11520]) +4 other tests skip
>     [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
> 
>    * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>      - shard-tglu:         NOTRUN -> [SKIP][362] ([i915#11520]) +4 other tests skip
>     [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-8/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
>      - shard-mtlp:         NOTRUN -> [SKIP][363] ([i915#12316]) +2 other tests skip
>     [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
>      - shard-dg2-9:        NOTRUN -> [SKIP][364] ([i915#11520]) +1 other test skip
>     [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
>      - shard-snb:          NOTRUN -> [SKIP][365] ([i915#11520])
>     [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-snb5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
> 
>    * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>      - shard-rkl:          NOTRUN -> [SKIP][366] ([i915#11520]) +13 other tests skip
>     [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
> 
>    * igt@kms_psr2_su@frontbuffer-xrgb8888:
>      - shard-rkl:          NOTRUN -> [SKIP][367] ([i915#9683]) +1 other test skip
>     [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>    * igt@kms_psr2_su@page_flip-nv12:
>      - shard-tglu-1:       NOTRUN -> [SKIP][368] ([i915#9683])
>     [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_psr2_su@page_flip-nv12.html
> 
>    * igt@kms_psr2_su@page_flip-p010:
>      - shard-dg1:          NOTRUN -> [SKIP][369] ([i915#9683])
>     [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-19/igt@kms_psr2_su@page_flip-p010.html
>      - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#9683])
>     [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-5/igt@kms_psr2_su@page_flip-p010.html
>      - shard-mtlp:         NOTRUN -> [SKIP][371] ([i915#4348])
>     [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-5/igt@kms_psr2_su@page_flip-p010.html
> 
>    * igt@kms_psr2_su@page_flip-xrgb8888:
>      - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#9683]) +1 other test skip
>     [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-5/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>    * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>      - shard-dg1:          NOTRUN -> [SKIP][373] ([i915#1072] / [i915#9732]) +7 other tests skip
>     [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-19/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
> 
>    * igt@kms_psr@fbc-psr-sprite-render:
>      - shard-mtlp:         NOTRUN -> [SKIP][374] ([i915#9688]) +14 other tests skip
>     [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-8/igt@kms_psr@fbc-psr-sprite-render.html
> 
>    * igt@kms_psr@fbc-psr2-sprite-render:
>      - shard-tglu-1:       NOTRUN -> [SKIP][375] ([i915#9732]) +9 other tests skip
>     [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_psr@fbc-psr2-sprite-render.html
> 
>    * igt@kms_psr@fbc-psr2-suspend:
>      - shard-dg2-9:        NOTRUN -> [SKIP][376] ([i915#1072] / [i915#9732]) +5 other tests skip
>     [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_psr@fbc-psr2-suspend.html
> 
>    * igt@kms_psr@psr2-cursor-blt:
>      - shard-dg2:          NOTRUN -> [SKIP][377] ([i915#1072] / [i915#9732]) +12 other tests skip
>     [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-3/igt@kms_psr@psr2-cursor-blt.html
> 
>    * igt@kms_psr@psr2-sprite-mmap-cpu:
>      - shard-rkl:          NOTRUN -> [SKIP][378] ([i915#1072] / [i915#9732]) +35 other tests skip
>     [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-1/igt@kms_psr@psr2-sprite-mmap-cpu.html
> 
>    * igt@kms_psr@psr2-sprite-mmap-gtt:
>      - shard-tglu:         NOTRUN -> [SKIP][379] ([i915#9732]) +17 other tests skip
>     [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-5/igt@kms_psr@psr2-sprite-mmap-gtt.html
> 
>    * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>      - shard-dg2-9:        NOTRUN -> [SKIP][380] ([i915#9685])
>     [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>    * igt@kms_rotation_crc@primary-rotation-90:
>      - shard-dg2:          NOTRUN -> [SKIP][381] ([i915#12755])
>     [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-5/igt@kms_rotation_crc@primary-rotation-90.html
> 
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>      - shard-rkl:          NOTRUN -> [SKIP][382] ([i915#5289]) +1 other test skip
>     [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>      - shard-dg2-9:        NOTRUN -> [SKIP][383] ([i915#12755] / [i915#5190])
>     [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>    * igt@kms_rotation_crc@sprite-rotation-270:
>      - shard-mtlp:         NOTRUN -> [SKIP][384] ([i915#12755])
>     [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-8/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>    * igt@kms_scaling_modes@scaling-mode-none:
>      - shard-dg1:          NOTRUN -> [SKIP][385] ([i915#3555]) +1 other test skip
>     [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-15/igt@kms_scaling_modes@scaling-mode-none.html
>      - shard-tglu:         NOTRUN -> [SKIP][386] ([i915#3555]) +2 other tests skip
>     [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-9/igt@kms_scaling_modes@scaling-mode-none.html
>      - shard-mtlp:         NOTRUN -> [SKIP][387] ([i915#3555] / [i915#5030] / [i915#9041])
>     [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@kms_scaling_modes@scaling-mode-none.html
> 
>    * igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][388] ([i915#5030]) +2 other tests skip
>     [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@kms_scaling_modes@scaling-mode-none@pipe-a-edp-1.html
> 
>    * igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][389] ([i915#5030] / [i915#9041])
>     [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@kms_scaling_modes@scaling-mode-none@pipe-d-edp-1.html
> 
>    * igt@kms_setmode@basic-clone-single-crtc:
>      - shard-dg2:          NOTRUN -> [SKIP][390] ([i915#3555]) +5 other tests skip
>     [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-1/igt@kms_setmode@basic-clone-single-crtc.html
> 
>    * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>      - shard-mtlp:         NOTRUN -> [SKIP][391] ([i915#3555] / [i915#8809])
>     [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>    * igt@kms_tiled_display@basic-test-pattern:
>      - shard-tglu:         NOTRUN -> [SKIP][392] ([i915#8623])
>     [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-6/igt@kms_tiled_display@basic-test-pattern.html
> 
>    * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>      - shard-rkl:          NOTRUN -> [SKIP][393] ([i915#8623])
>     [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>    * igt@kms_vrr@max-min:
>      - shard-dg2:          NOTRUN -> [SKIP][394] ([i915#9906]) +1 other test skip
>     [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-10/igt@kms_vrr@max-min.html
> 
>    * igt@kms_vrr@seamless-rr-switch-drrs:
>      - shard-rkl:          NOTRUN -> [SKIP][395] ([i915#9906])
>     [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-8/igt@kms_vrr@seamless-rr-switch-drrs.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][396] ([i915#9906])
>     [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html
>      - shard-dg1:          NOTRUN -> [SKIP][397] ([i915#9906])
>     [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-drrs.html
>      - shard-mtlp:         NOTRUN -> [SKIP][398] ([i915#8808] / [i915#9906])
>     [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-8/igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>    * igt@kms_writeback@writeback-check-output:
>      - shard-dg2-9:        NOTRUN -> [SKIP][399] ([i915#2437])
>     [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@kms_writeback@writeback-check-output.html
> 
>    * igt@kms_writeback@writeback-fb-id:
>      - shard-glk:          NOTRUN -> [SKIP][400] ([i915#2437]) +2 other tests skip
>     [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk6/igt@kms_writeback@writeback-fb-id.html
> 
>    * igt@kms_writeback@writeback-invalid-parameters:
>      - shard-tglu:         NOTRUN -> [SKIP][401] ([i915#2437])
>     [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-3/igt@kms_writeback@writeback-invalid-parameters.html
> 
>    * igt@kms_writeback@writeback-pixel-formats:
>      - shard-rkl:          NOTRUN -> [SKIP][402] ([i915#2437] / [i915#9412]) +1 other test skip
>     [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-1/igt@kms_writeback@writeback-pixel-formats.html
> 
>    * igt@perf_pmu@event-wait:
>      - shard-mtlp:         NOTRUN -> [SKIP][403] ([i915#8807])
>     [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-5/igt@perf_pmu@event-wait.html
> 
>    * igt@perf_pmu@event-wait@rcs0:
>      - shard-dg2:          NOTRUN -> [SKIP][404] +7 other tests skip
>     [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-6/igt@perf_pmu@event-wait@rcs0.html
>      - shard-mtlp:         NOTRUN -> [SKIP][405] ([i915#3555] / [i915#8807])
>     [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-5/igt@perf_pmu@event-wait@rcs0.html
> 
>    * igt@perf_pmu@invalid-init:
>      - shard-rkl:          NOTRUN -> [FAIL][406] ([i915#13663])
>     [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-3/igt@perf_pmu@invalid-init.html
>      - shard-mtlp:         NOTRUN -> [FAIL][407] ([i915#13663])
>     [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-6/igt@perf_pmu@invalid-init.html
> 
>    * igt@perf_pmu@module-unload:
>      - shard-mtlp:         [PASS][408] -> [INCOMPLETE][409] ([i915#13825])
>     [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-mtlp-2/igt@perf_pmu@module-unload.html
>     [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-7/igt@perf_pmu@module-unload.html
> 
>    * igt@perf_pmu@rc6-suspend:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][410] ([i915#13356])
>     [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk6/igt@perf_pmu@rc6-suspend.html
> 
>    * igt@prime_vgem@basic-fence-read:
>      - shard-dg2:          NOTRUN -> [SKIP][411] ([i915#3291] / [i915#3708])
>     [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-2/igt@prime_vgem@basic-fence-read.html
>      - shard-rkl:          NOTRUN -> [SKIP][412] ([i915#3291] / [i915#3708]) +1 other test skip
>     [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-3/igt@prime_vgem@basic-fence-read.html
>      - shard-dg1:          NOTRUN -> [SKIP][413] ([i915#3708])
>     [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-19/igt@prime_vgem@basic-fence-read.html
> 
>    * igt@prime_vgem@basic-read:
>      - shard-mtlp:         NOTRUN -> [SKIP][414] ([i915#3708]) +1 other test skip
>     [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-4/igt@prime_vgem@basic-read.html
> 
>    * igt@prime_vgem@coherency-gtt:
>      - shard-dg2-9:        NOTRUN -> [SKIP][415] ([i915#3708] / [i915#4077])
>     [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@prime_vgem@coherency-gtt.html
> 
>    * igt@sriov_basic@bind-unbind-vf:
>      - shard-dg2-9:        NOTRUN -> [SKIP][416] ([i915#9917])
>     [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-9/igt@sriov_basic@bind-unbind-vf.html
> 
>    * igt@sriov_basic@bind-unbind-vf@vf-5:
>      - shard-mtlp:         NOTRUN -> [FAIL][417] ([i915#12910]) +9 other tests fail
>     [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-5/igt@sriov_basic@bind-unbind-vf@vf-5.html
> 
>    * igt@syncobj_wait@reset-unsignaled:
>      - shard-dg1:          [PASS][418] -> [DMESG-WARN][419] ([i915#4423]) +9 other tests dmesg-warn
>     [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg1-16/igt@syncobj_wait@reset-unsignaled.html
>     [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-17/igt@syncobj_wait@reset-unsignaled.html
> 
>    * igt@sysfs_heartbeat_interval@nopreempt@vcs1:
>      - shard-mtlp:         [PASS][420] -> [DMESG-WARN][421] ([i915#13723])
>     [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-mtlp-1/igt@sysfs_heartbeat_interval@nopreempt@vcs1.html
>     [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt@vcs1.html
> 
>    
> #### Possible fixes ####
> 
>    * igt@gem_eio@in-flight-suspend:
>      - shard-dg1:          [DMESG-WARN][422] ([i915#4391] / [i915#4423]) -> [PASS][423]
>     [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg1-15/igt@gem_eio@in-flight-suspend.html
>     [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-12/igt@gem_eio@in-flight-suspend.html
> 
>    * igt@gem_eio@unwedge-stress:
>      - shard-dg1:          [FAIL][424] ([i915#12714] / [i915#5784]) -> [PASS][425]
>     [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg1-17/igt@gem_eio@unwedge-stress.html
>     [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-14/igt@gem_eio@unwedge-stress.html
> 
>    * igt@gem_exec_endless@dispatch@bcs0:
>      - shard-rkl:          [TIMEOUT][426] ([i915#3778]) -> [PASS][427] +1 other test pass
>     [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-rkl-5/igt@gem_exec_endless@dispatch@bcs0.html
>     [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-3/igt@gem_exec_endless@dispatch@bcs0.html
> 
>    * igt@gem_pxp@create-protected-buffer:
>      - shard-rkl:          [TIMEOUT][428] ([i915#12964]) -> [PASS][429]
>     [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-rkl-1/igt@gem_pxp@create-protected-buffer.html
>     [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-8/igt@gem_pxp@create-protected-buffer.html
> 
>    * igt@gem_workarounds@suspend-resume:
>      - shard-glk:          [INCOMPLETE][430] ([i915#13356]) -> [PASS][431]
>     [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-glk6/igt@gem_workarounds@suspend-resume.html
>     [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk7/igt@gem_workarounds@suspend-resume.html
> 
>    * igt@i915_selftest@live:
>      - shard-rkl:          [DMESG-FAIL][432] ([i915#12964] / [i915#13550]) -> [PASS][433]
>     [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-rkl-2/igt@i915_selftest@live.html
>     [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-3/igt@i915_selftest@live.html
> 
>    * igt@i915_selftest@live@gt_pm:
>      - shard-rkl:          [DMESG-FAIL][434] ([i915#13550]) -> [PASS][435]
>     [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-rkl-2/igt@i915_selftest@live@gt_pm.html
>     [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-3/igt@i915_selftest@live@gt_pm.html
> 
>    * igt@i915_suspend@basic-s2idle-without-i915:
>      - shard-rkl:          [DMESG-WARN][436] ([i915#12917] / [i915#12964]) -> [PASS][437]
>     [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-rkl-1/igt@i915_suspend@basic-s2idle-without-i915.html
>     [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-4/igt@i915_suspend@basic-s2idle-without-i915.html
> 
>    * igt@i915_suspend@sysfs-reader:
>      - shard-glk:          [INCOMPLETE][438] ([i915#4817]) -> [PASS][439]
>     [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-glk2/igt@i915_suspend@sysfs-reader.html
>     [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-glk1/igt@i915_suspend@sysfs-reader.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
>      - shard-rkl:          [DMESG-WARN][440] ([i915#12964]) -> [PASS][441] +11 other tests pass
>     [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-rkl-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
>     [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-256x85:
>      - shard-rkl:          [FAIL][442] ([i915#13566]) -> [PASS][443]
>     [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-rkl-3/igt@kms_cursor_crc@cursor-sliding-256x85.html
>     [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-256x85.html
>      - shard-tglu:         [FAIL][444] ([i915#13566]) -> [PASS][445] +1 other test pass
>     [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-256x85.html
>     [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>    * igt@kms_flip@dpms-vs-vblank-race-interruptible:
>      - shard-snb:          [INCOMPLETE][446] ([i915#12314]) -> [PASS][447] +1 other test pass
>     [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-snb5/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
>     [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-snb6/igt@kms_flip@dpms-vs-vblank-race-interruptible.html
> 
>    * igt@kms_hdr@invalid-metadata-sizes:
>      - shard-dg2:          [SKIP][448] ([i915#3555] / [i915#8228]) -> [PASS][449]
>     [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg2-4/igt@kms_hdr@invalid-metadata-sizes.html
>     [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-10/igt@kms_hdr@invalid-metadata-sizes.html
> 
>    * igt@kms_pm_lpsp@kms-lpsp:
>      - shard-dg2:          [SKIP][450] ([i915#9340]) -> [PASS][451]
>     [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html
>     [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html
> 
>    * igt@kms_pm_rpm@modeset-lpsp:
>      - shard-rkl:          [SKIP][452] ([i915#9519]) -> [PASS][453] +1 other test pass
>     [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html
>     [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html
> 
>    * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>      - shard-dg2:          [SKIP][454] ([i915#9519]) -> [PASS][455]
>     [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>     [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>    * igt@kms_rotation_crc@sprite-rotation-180:
>      - shard-tglu:         [INCOMPLETE][456] -> [PASS][457]
>     [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-tglu-6/igt@kms_rotation_crc@sprite-rotation-180.html
>     [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-5/igt@kms_rotation_crc@sprite-rotation-180.html
> 
>    * igt@perf_pmu@rc6:
>      - shard-rkl:          [DMESG-FAIL][458] ([i915#12964]) -> [PASS][459] +6 other tests pass
>     [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-rkl-2/igt@perf_pmu@rc6.html
>     [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-2/igt@perf_pmu@rc6.html
> 
>    * igt@perf_pmu@rc6@runtime-pm-gt0:
>      - shard-rkl:          [SKIP][460] -> [PASS][461]
>     [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-rkl-2/igt@perf_pmu@rc6@runtime-pm-gt0.html
>     [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-2/igt@perf_pmu@rc6@runtime-pm-gt0.html
> 
>    
> #### Warnings ####
> 
>    * igt@gem_pxp@hw-rejects-pxp-buffer:
>      - shard-rkl:          [SKIP][462] ([i915#13717]) -> [TIMEOUT][463] ([i915#12917] / [i915#12964])
>     [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html
>     [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-rkl-1/igt@gem_pxp@hw-rejects-pxp-buffer.html
> 
>    * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>      - shard-dg1:          [SKIP][464] ([i915#4538] / [i915#5286]) -> [SKIP][465] ([i915#4423] / [i915#4538] / [i915#5286])
>     [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>     [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-17/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>    * igt@kms_content_protection@atomic:
>      - shard-dg2:          [SKIP][466] ([i915#7118] / [i915#9424]) -> [FAIL][467] ([i915#7173])
>     [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg2-8/igt@kms_content_protection@atomic.html
>     [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-11/igt@kms_content_protection@atomic.html
> 
>    * igt@kms_content_protection@lic-type-0:
>      - shard-dg2:          [FAIL][468] ([i915#7173]) -> [SKIP][469] ([i915#9424])
>     [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg2-11/igt@kms_content_protection@lic-type-0.html
>     [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-3/igt@kms_content_protection@lic-type-0.html
> 
>    * igt@kms_content_protection@mei-interface:
>      - shard-dg1:          [SKIP][470] ([i915#9433]) -> [SKIP][471] ([i915#9424])
>     [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg1-13/igt@kms_content_protection@mei-interface.html
>     [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-15/igt@kms_content_protection@mei-interface.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-32x10:
>      - shard-dg1:          [SKIP][472] ([i915#3555]) -> [SKIP][473] ([i915#3555] / [i915#4423])
>     [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg1-15/igt@kms_cursor_crc@cursor-sliding-32x10.html
>     [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-16/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>      - shard-dg1:          [SKIP][474] -> [SKIP][475] ([i915#4423]) +2 other tests skip
>     [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg1-12/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
>     [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-16/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
>      - shard-dg1:          [SKIP][476] ([i915#4423] / [i915#8708]) -> [SKIP][477] ([i915#8708])
>     [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
>     [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
>      - shard-dg2:          [SKIP][478] ([i915#3458]) -> [SKIP][479] ([i915#10433] / [i915#3458]) +1 other test skip
>     [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
>     [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
>      - shard-dg2:          [SKIP][480] ([i915#10433] / [i915#3458]) -> [SKIP][481] ([i915#3458]) +5 other tests skip
>     [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
>     [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg2-10/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
> 
>    * igt@kms_hdr@brightness-with-hdr:
>      - shard-tglu:         [SKIP][482] ([i915#12713]) -> [SKIP][483] ([i915#1187] / [i915#12713])
>     [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-tglu-6/igt@kms_hdr@brightness-with-hdr.html
>     [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html
> 
>    * igt@kms_joiner@basic-max-non-joiner:
>      - shard-dg1:          [SKIP][484] ([i915#13688]) -> [SKIP][485] ([i915#13688] / [i915#4423])
>     [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8262/shard-dg1-19/igt@kms_joiner@basic-max-non-joiner.html
>     [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/shard-dg1-17/igt@kms_joiner@basic-max-non-joiner.html
> 
>    
>    [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
>    [i915#10226]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226
>    [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>    [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>    [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>    [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
>    [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
>    [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>    [i915#10887]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
>    [i915#10991]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10991
>    [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
>    [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>    [i915#11614]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614
>    [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>    [i915#11703]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11703
>    [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
>    [i915#11808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11808
>    [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
>    [i915#12169]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169
>    [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177
>    [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
>    [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
>    [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
>    [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
>    [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
>    [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
>    [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
>    [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
>    [i915#12394]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12394
>    [i915#12455]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12455
>    [i915#12518]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12518
>    [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
>    [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
>    [i915#12714]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12714
>    [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
>    [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
>    [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
>    [i915#12797]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12797
>    [i915#12817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
>    [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
>    [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
>    [i915#12941]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12941
>    [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
>    [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
>    [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
>    [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
>    [i915#13193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13193
>    [i915#13196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196
>    [i915#13335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13335
>    [i915#13353]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13353
>    [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
>    [i915#13522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522
>    [i915#13550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13550
>    [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
>    [i915#13663]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13663
>    [i915#13665]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13665
>    [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
>    [i915#13691]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691
>    [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
>    [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
>    [i915#13723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13723
>    [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
>    [i915#13805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13805
>    [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820
>    [i915#13825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13825
>    [i915#1522]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1522
>    [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>    [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>    [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
>    [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
>    [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>    [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>    [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>    [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>    [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>    [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>    [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>    [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>    [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>    [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>    [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>    [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>    [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>    [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>    [i915#3469]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469
>    [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>    [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>    [i915#3582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582
>    [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>    [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>    [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>    [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>    [i915#3778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778
>    [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>    [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
>    [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>    [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>    [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>    [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>    [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>    [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>    [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>    [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>    [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
>    [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
>    [i915#4391]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391
>    [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>    [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>    [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
>    [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>    [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
>    [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>    [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
>    [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>    [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
>    [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
>    [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>    [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>    [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
>    [i915#5030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5030
>    [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
>    [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>    [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>    [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>    [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>    [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>    [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
>    [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
>    [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>    [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
>    [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
>    [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
>    [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
>    [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>    [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>    [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
>    [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
>    [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
>    [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
>    [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>    [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>    [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
>    [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
>    [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>    [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>    [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>    [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
>    [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
>    [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>    [i915#8346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8346
>    [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>    [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>    [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
>    [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>    [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>    [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>    [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>    [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
>    [i915#8806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8806
>    [i915#8807]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8807
>    [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
>    [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
>    [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
>    [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
>    [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
>    [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
>    [i915#9041]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9041
>    [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
>    [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
>    [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>    [i915#9337]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337
>    [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>    [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
>    [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
>    [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>    [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
>    [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
>    [i915#9531]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531
>    [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>    [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>    [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>    [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>    [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
>    [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
>    [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>    [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>    [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>    * CI: CI-20190529 -> None
>    * IGT: IGT_8262 -> IGTPW_12707
> 
>    CI-20190529: 20190529
>    CI_DRM_16231: 3ccfd8016ad8283ecef0dfcf0e4f2132ade9bf4c @ git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_12707: 12707
>    IGT_8262: 8262
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12707/index.html
> 

