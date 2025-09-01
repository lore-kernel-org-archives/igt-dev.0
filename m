Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DE2CA0FF0
	for <igt-dev@archiver.kernel.org>; Mon,  1 Sep 2025 10:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD37F10E411;
	Mon,  1 Sep 2025 10:23:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvjK8YX6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EC010E411
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Sep 2025 10:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756722221; x=1788258221;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=N47/3IQCjkymIQTFzf06U06k99HGaQpF2/Ym1tggcH8=;
 b=SvjK8YX6zUV9U1/vC6gCvg33QX4503jmsDPSW8uODLkOqMZtWd3TN10i
 Ur4V3/PpK7pldeoACrWneSvCwVdaJRRVA9eu7ikI/J5Q+k5aQlFHpb2Lb
 0ukSmV9FeZdR6KBn6/7AY8egRhLfEbyn+xj8dYQYixIUoRlvb0zp31Z3g
 0gynlq3CpqfYgH1JO7ngFE+9oOrkNFvmIelF/XvXCpJ2TxFKtVj7zKugw
 QjOFcKZEvzOS4nt1xqTnjsjkPLDg1fgPEsrkP7Mkn85i1DyJ6/WclFV1Q
 wZjeq1Du8X4+APrGylCbI8TaacDwrymmSuo37E0AS6KCs2eXm0jlrdhGU g==;
X-CSE-ConnectionGUID: bToIqz0zSZqyKG/Gvmn/FQ==
X-CSE-MsgGUID: tozjMSt9Tou1BOLbWMo1qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58925801"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58925801"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 03:23:40 -0700
X-CSE-ConnectionGUID: s0e9bQ+DQt+7z8O4oSwOSQ==
X-CSE-MsgGUID: bBo7O9xOQySXkmIpkKQHxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="175353659"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.85.180])
 ([10.245.85.180])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 03:23:37 -0700
Message-ID: <99822ea1-2428-4bb1-ac1f-56a2f4df2aa5@linux.intel.com>
Date: Mon, 1 Sep 2025 12:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHhlX3NyaW92?=
 =?UTF-8?Q?=5Fflr=3A_Skip_non-MAIN_GTs_when_reading_provisioning_data?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20250829104037.649426-1-marcin.bernatowicz@linux.intel.com>
 <175649692793.286105.3375157980686640247@1538d3639d33>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <175649692793.286105.3375157980686640247@1538d3639d33>
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



On 8/29/2025 9:48 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: xe_sriov_flr: Skip non-MAIN GTs when reading provisioning data
> URL   : https://patchwork.freedesktop.org/series/153709/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8515_full -> IGTPW_13660_full
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with IGTPW_13660_full absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_13660_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/index.html
> 
> Participating hosts (11 -> 12)
> ------------------------------
> 
>    Additional (1): shard-dg2-set2
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in IGTPW_13660_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@i915_suspend@fence-restore-untiled:
>      - shard-snb:          [PASS][1] -> [ABORT][2]
>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-snb1/igt@i915_suspend@fence-restore-untiled.html
>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-snb6/igt@i915_suspend@fence-restore-untiled.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][3]
>     [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk5/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html
> 
>    * igt@kms_plane_alpha_blend@coverage-7efc:
>      - shard-mtlp:         [PASS][4] -> [FAIL][5] +2 other tests fail
>     [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-mtlp-1/igt@kms_plane_alpha_blend@coverage-7efc.html
>     [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-6/igt@kms_plane_alpha_blend@coverage-7efc.html
> 

Not related to the change.
--
marcin

>    
> Known issues
> ------------
> 
>    Here are the changes found in IGTPW_13660_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@fbdev@info:
>      - shard-glk10:        NOTRUN -> [SKIP][6] ([i915#1849])
>     [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk10/igt@fbdev@info.html
> 
>    * igt@gem_basic@multigpu-create-close:
>      - shard-rkl:          NOTRUN -> [SKIP][7] ([i915#7697])
>     [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@gem_basic@multigpu-create-close.html
> 
>    * igt@gem_ccs@block-copy-compressed:
>      - shard-tglu-1:       NOTRUN -> [SKIP][8] ([i915#3555] / [i915#9323])
>     [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@gem_ccs@block-copy-compressed.html
> 
>    * igt@gem_ccs@block-multicopy-inplace:
>      - shard-rkl:          NOTRUN -> [SKIP][9] ([i915#14544] / [i915#3555] / [i915#9323])
>     [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gem_ccs@block-multicopy-inplace.html
> 
>    * igt@gem_ccs@ctrl-surf-copy:
>      - shard-dg1:          NOTRUN -> [SKIP][10] ([i915#3555] / [i915#9323])
>     [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-12/igt@gem_ccs@ctrl-surf-copy.html
>      - shard-tglu:         NOTRUN -> [SKIP][11] ([i915#3555] / [i915#9323]) +1 other test skip
>     [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-3/igt@gem_ccs@ctrl-surf-copy.html
>      - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#3555] / [i915#9323])
>     [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-7/igt@gem_ccs@ctrl-surf-copy.html
> 
>    * igt@gem_close_race@multigpu-basic-threads:
>      - shard-dg2:          NOTRUN -> [SKIP][13] ([i915#7697])
>     [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-7/igt@gem_close_race@multigpu-basic-threads.html
>      - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#7697])
>     [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-18/igt@gem_close_race@multigpu-basic-threads.html
>      - shard-tglu:         NOTRUN -> [SKIP][15] ([i915#7697])
>     [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-7/igt@gem_close_race@multigpu-basic-threads.html
> 
>    * igt@gem_create@create-ext-cpu-access-big:
>      - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#6335])
>     [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-6/igt@gem_create@create-ext-cpu-access-big.html
>      - shard-dg2-9:        NOTRUN -> [ABORT][17] ([i915#13427])
>     [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@gem_create@create-ext-cpu-access-big.html
> 
>    * igt@gem_create@create-ext-cpu-access-sanity-check:
>      - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#6335])
>     [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@gem_create@create-ext-cpu-access-sanity-check.html
> 
>    * igt@gem_ctx_freq@sysfs@gt0:
>      - shard-dg2:          [PASS][19] -> [FAIL][20] ([i915#9561]) +1 other test fail
>     [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-dg2-11/igt@gem_ctx_freq@sysfs@gt0.html
>     [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-8/igt@gem_ctx_freq@sysfs@gt0.html
> 
>    * igt@gem_ctx_isolation@preservation-s3:
>      - shard-glk10:        NOTRUN -> [INCOMPLETE][21] ([i915#12353]) +1 other test incomplete
>     [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk10/igt@gem_ctx_isolation@preservation-s3.html
> 
>    * igt@gem_ctx_persistence@heartbeat-hang:
>      - shard-dg2-9:        NOTRUN -> [SKIP][22] ([i915#8555])
>     [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@gem_ctx_persistence@heartbeat-hang.html
> 
>    * igt@gem_ctx_persistence@heartbeat-many:
>      - shard-dg2:          NOTRUN -> [SKIP][23] ([i915#8555])
>     [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-1/igt@gem_ctx_persistence@heartbeat-many.html
>      - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#8555])
>     [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-15/igt@gem_ctx_persistence@heartbeat-many.html
>      - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#8555])
>     [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-8/igt@gem_ctx_persistence@heartbeat-many.html
> 
>    * igt@gem_ctx_sseu@engines:
>      - shard-rkl:          NOTRUN -> [SKIP][26] ([i915#280])
>     [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@gem_ctx_sseu@engines.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][27] ([i915#280])
>     [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@gem_ctx_sseu@engines.html
> 
>    * igt@gem_ctx_sseu@invalid-args:
>      - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#280])
>     [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-11/igt@gem_ctx_sseu@invalid-args.html
> 
>    * igt@gem_ctx_sseu@invalid-sseu:
>      - shard-tglu:         NOTRUN -> [SKIP][29] ([i915#280]) +1 other test skip
>     [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-3/igt@gem_ctx_sseu@invalid-sseu.html
> 
>    * igt@gem_ctx_sseu@mmap-args:
>      - shard-dg2-9:        NOTRUN -> [SKIP][30] ([i915#280]) +1 other test skip
>     [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@gem_ctx_sseu@mmap-args.html
> 
>    * igt@gem_exec_balancer@bonded-dual:
>      - shard-dg2:          NOTRUN -> [SKIP][31] ([i915#4771])
>     [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@gem_exec_balancer@bonded-dual.html
> 
>    * igt@gem_exec_balancer@bonded-true-hang:
>      - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#4812])
>     [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-13/igt@gem_exec_balancer@bonded-true-hang.html
>      - shard-mtlp:         NOTRUN -> [SKIP][33] ([i915#4812])
>     [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-3/igt@gem_exec_balancer@bonded-true-hang.html
>      - shard-dg2-9:        NOTRUN -> [SKIP][34] ([i915#4812]) +1 other test skip
>     [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@gem_exec_balancer@bonded-true-hang.html
> 
>    * igt@gem_exec_balancer@invalid-bonds:
>      - shard-dg2-9:        NOTRUN -> [SKIP][35] ([i915#4036])
>     [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@gem_exec_balancer@invalid-bonds.html
> 
>    * igt@gem_exec_balancer@parallel-bb-first:
>      - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#4525])
>     [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@gem_exec_balancer@parallel-bb-first.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][37] ([i915#4525])
>     [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@gem_exec_balancer@parallel-bb-first.html
> 
>    * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
>      - shard-rkl:          NOTRUN -> [SKIP][38] ([i915#14544] / [i915#4525])
>     [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html
> 
>    * igt@gem_exec_balancer@parallel-ordering:
>      - shard-tglu:         NOTRUN -> [SKIP][39] ([i915#4525]) +1 other test skip
>     [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-8/igt@gem_exec_balancer@parallel-ordering.html
> 
>    * igt@gem_exec_big@single:
>      - shard-tglu:         [PASS][40] -> [ABORT][41] ([i915#11713] / [i915#14756])
>     [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-tglu-9/igt@gem_exec_big@single.html
>     [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-5/igt@gem_exec_big@single.html
> 
>    * igt@gem_exec_capture@capture-recoverable:
>      - shard-rkl:          NOTRUN -> [SKIP][42] ([i915#6344])
>     [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@gem_exec_capture@capture-recoverable.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][43] ([i915#6344])
>     [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@gem_exec_capture@capture-recoverable.html
> 
>    * igt@gem_exec_fence@submit3:
>      - shard-dg2:          NOTRUN -> [SKIP][44] ([i915#4812])
>     [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-3/igt@gem_exec_fence@submit3.html
> 
>    * igt@gem_exec_flush@basic-batch-kernel-default-uc:
>      - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3539] / [i915#4852]) +2 other tests skip
>     [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-1/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
> 
>    * igt@gem_exec_flush@basic-uc-prw-default:
>      - shard-dg2:          NOTRUN -> [SKIP][46] ([i915#3539])
>     [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-8/igt@gem_exec_flush@basic-uc-prw-default.html
> 
>    * igt@gem_exec_flush@basic-wb-rw-default:
>      - shard-dg2-9:        NOTRUN -> [SKIP][47] ([i915#3539] / [i915#4852]) +1 other test skip
>     [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@gem_exec_flush@basic-wb-rw-default.html
> 
>    * igt@gem_exec_params@rsvd2-dirt:
>      - shard-dg2:          NOTRUN -> [SKIP][48] ([i915#5107])
>     [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-8/igt@gem_exec_params@rsvd2-dirt.html
> 
>    * igt@gem_exec_params@secure-non-master:
>      - shard-dg2:          NOTRUN -> [SKIP][49] +11 other tests skip
>     [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-11/igt@gem_exec_params@secure-non-master.html
>      - shard-dg1:          NOTRUN -> [SKIP][50] +11 other tests skip
>     [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-19/igt@gem_exec_params@secure-non-master.html
> 
>    * igt@gem_exec_reloc@basic-concurrent0:
>      - shard-mtlp:         NOTRUN -> [SKIP][51] ([i915#3281])
>     [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-8/igt@gem_exec_reloc@basic-concurrent0.html
> 
>    * igt@gem_exec_reloc@basic-cpu-wc:
>      - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#14544] / [i915#3281])
>     [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gem_exec_reloc@basic-cpu-wc.html
> 
>    * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
>      - shard-rkl:          NOTRUN -> [SKIP][53] ([i915#3281]) +4 other tests skip
>     [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
> 
>    * igt@gem_exec_reloc@basic-wc-cpu-noreloc:
>      - shard-dg1:          NOTRUN -> [SKIP][54] ([i915#3281]) +1 other test skip
>     [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-12/igt@gem_exec_reloc@basic-wc-cpu-noreloc.html
> 
>    * igt@gem_exec_reloc@basic-wc-gtt:
>      - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3281]) +6 other tests skip
>     [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-1/igt@gem_exec_reloc@basic-wc-gtt.html
> 
>    * igt@gem_exec_reloc@basic-write-cpu-noreloc:
>      - shard-dg2-9:        NOTRUN -> [SKIP][56] ([i915#3281]) +4 other tests skip
>     [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@gem_exec_reloc@basic-write-cpu-noreloc.html
> 
>    * igt@gem_exec_schedule@preempt-queue:
>      - shard-dg2-9:        NOTRUN -> [SKIP][57] ([i915#4537] / [i915#4812])
>     [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@gem_exec_schedule@preempt-queue.html
> 
>    * igt@gem_exec_schedule@semaphore-power:
>      - shard-dg2:          NOTRUN -> [SKIP][58] ([i915#4537] / [i915#4812])
>     [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-7/igt@gem_exec_schedule@semaphore-power.html
> 
>    * igt@gem_exec_suspend@basic-s0@lmem0:
>      - shard-dg2:          NOTRUN -> [INCOMPLETE][59] ([i915#11441])
>     [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-3/igt@gem_exec_suspend@basic-s0@lmem0.html
> 
>    * igt@gem_fence_thrash@bo-write-verify-x:
>      - shard-dg2:          NOTRUN -> [SKIP][60] ([i915#4860]) +2 other tests skip
>     [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-3/igt@gem_fence_thrash@bo-write-verify-x.html
> 
>    * igt@gem_fenced_exec_thrash@2-spare-fences:
>      - shard-dg2-9:        NOTRUN -> [SKIP][61] ([i915#4860]) +1 other test skip
>     [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@gem_fenced_exec_thrash@2-spare-fences.html
> 
>    * igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
>      - shard-dg1:          NOTRUN -> [SKIP][62] ([i915#4860])
>     [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-18/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
>      - shard-mtlp:         NOTRUN -> [SKIP][63] ([i915#4860])
>     [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-5/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html
> 
>    * igt@gem_lmem_swapping@parallel-multi:
>      - shard-tglu:         NOTRUN -> [SKIP][64] ([i915#4613]) +2 other tests skip
>     [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-8/igt@gem_lmem_swapping@parallel-multi.html
> 
>    * igt@gem_lmem_swapping@parallel-random:
>      - shard-rkl:          NOTRUN -> [SKIP][65] ([i915#4613])
>     [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@gem_lmem_swapping@parallel-random.html
> 
>    * igt@gem_lmem_swapping@random-engines:
>      - shard-glk:          NOTRUN -> [SKIP][66] ([i915#4613]) +6 other tests skip
>     [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk6/igt@gem_lmem_swapping@random-engines.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][67] ([i915#4613]) +1 other test skip
>     [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@gem_lmem_swapping@random-engines.html
> 
>    * igt@gem_lmem_swapping@verify-ccs:
>      - shard-rkl:          NOTRUN -> [SKIP][68] ([i915#14544] / [i915#4613])
>     [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gem_lmem_swapping@verify-ccs.html
> 
>    * igt@gem_media_vme:
>      - shard-dg2:          NOTRUN -> [SKIP][69] ([i915#284])
>     [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-8/igt@gem_media_vme.html
> 
>    * igt@gem_mmap@short-mmap:
>      - shard-dg2-9:        NOTRUN -> [SKIP][70] ([i915#4083])
>     [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@gem_mmap@short-mmap.html
> 
>    * igt@gem_mmap_gtt@cpuset-big-copy:
>      - shard-dg2:          NOTRUN -> [SKIP][71] ([i915#4077]) +13 other tests skip
>     [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-1/igt@gem_mmap_gtt@cpuset-big-copy.html
> 
>    * igt@gem_mmap_gtt@hang:
>      - shard-dg2-9:        NOTRUN -> [SKIP][72] ([i915#4077]) +8 other tests skip
>     [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@gem_mmap_gtt@hang.html
> 
>    * igt@gem_mmap_gtt@hang-user:
>      - shard-mtlp:         NOTRUN -> [SKIP][73] ([i915#4077]) +2 other tests skip
>     [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-2/igt@gem_mmap_gtt@hang-user.html
> 
>    * igt@gem_mmap_wc@copy:
>      - shard-dg2:          NOTRUN -> [SKIP][74] ([i915#4083]) +5 other tests skip
>     [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-1/igt@gem_mmap_wc@copy.html
> 
>    * igt@gem_mmap_wc@write-cpu-read-wc-unflushed:
>      - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4083]) +2 other tests skip
>     [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-15/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html
>      - shard-mtlp:         NOTRUN -> [SKIP][76] ([i915#4083]) +1 other test skip
>     [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-5/igt@gem_mmap_wc@write-cpu-read-wc-unflushed.html
> 
>    * igt@gem_partial_pwrite_pread@write:
>      - shard-dg2-9:        NOTRUN -> [SKIP][77] ([i915#3282]) +5 other tests skip
>     [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@gem_partial_pwrite_pread@write.html
> 
>    * igt@gem_partial_pwrite_pread@write-display:
>      - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#3282]) +2 other tests skip
>     [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@gem_partial_pwrite_pread@write-display.html
> 
>    * igt@gem_pread@exhaustion:
>      - shard-glk:          NOTRUN -> [WARN][79] ([i915#2658])
>     [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk1/igt@gem_pread@exhaustion.html
> 
>    * igt@gem_pwrite@basic-exhaustion:
>      - shard-dg1:          NOTRUN -> [SKIP][80] ([i915#3282])
>     [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-19/igt@gem_pwrite@basic-exhaustion.html
>      - shard-tglu:         NOTRUN -> [WARN][81] ([i915#2658])
>     [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-4/igt@gem_pwrite@basic-exhaustion.html
>      - shard-glk10:        NOTRUN -> [WARN][82] ([i915#14702] / [i915#2658])
>     [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk10/igt@gem_pwrite@basic-exhaustion.html
> 
>    * igt@gem_pxp@create-regular-context-1:
>      - shard-dg2-9:        NOTRUN -> [SKIP][83] ([i915#4270]) +2 other tests skip
>     [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@gem_pxp@create-regular-context-1.html
> 
>    * igt@gem_pxp@hw-rejects-pxp-context:
>      - shard-rkl:          NOTRUN -> [TIMEOUT][84] ([i915#12917] / [i915#12964]) +1 other test timeout
>     [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html
>      - shard-tglu:         NOTRUN -> [SKIP][85] ([i915#13398])
>     [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-8/igt@gem_pxp@hw-rejects-pxp-context.html
>      - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#13398])
>     [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-3/igt@gem_pxp@hw-rejects-pxp-context.html
> 
>    * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>      - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4270]) +2 other tests skip
>     [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
>      - shard-rkl:          [PASS][88] -> [TIMEOUT][89] ([i915#12917] / [i915#12964]) +1 other test timeout
>     [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
>     [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>    * igt@gem_render_copy@y-tiled-ccs-to-linear:
>      - shard-dg2-9:        NOTRUN -> [SKIP][90] ([i915#5190] / [i915#8428]) +3 other tests skip
>     [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@gem_render_copy@y-tiled-ccs-to-linear.html
> 
>    * igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
>      - shard-dg2:          NOTRUN -> [SKIP][91] ([i915#5190] / [i915#8428]) +3 other tests skip
>     [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html
>      - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#8428])
>     [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-7/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html
> 
>    * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>      - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4079])
>     [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-7/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
>      - shard-rkl:          NOTRUN -> [SKIP][94] ([i915#8411]) +1 other test skip
>     [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
>      - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#4079])
>     [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-13/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
>      - shard-mtlp:         NOTRUN -> [SKIP][96] ([i915#4079])
>     [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-1/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
> 
>    * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>      - shard-dg2-9:        NOTRUN -> [SKIP][97] ([i915#4079]) +1 other test skip
>     [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
> 
>    * igt@gem_userptr_blits@create-destroy-unsync:
>      - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#3297]) +1 other test skip
>     [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-11/igt@gem_userptr_blits@create-destroy-unsync.html
>      - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#3297])
>     [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-19/igt@gem_userptr_blits@create-destroy-unsync.html
>      - shard-tglu:         NOTRUN -> [SKIP][100] ([i915#3297]) +2 other tests skip
>     [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-9/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>    * igt@gem_userptr_blits@dmabuf-unsync:
>      - shard-rkl:          NOTRUN -> [SKIP][101] ([i915#3297])
>     [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@gem_userptr_blits@dmabuf-unsync.html
> 
>    * igt@gem_userptr_blits@forbidden-operations:
>      - shard-dg2-9:        NOTRUN -> [SKIP][102] ([i915#3282] / [i915#3297])
>     [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@gem_userptr_blits@forbidden-operations.html
> 
>    * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
>      - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#3297] / [i915#4880])
>     [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-13/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
>      - shard-mtlp:         NOTRUN -> [SKIP][104] ([i915#3297])
>     [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-2/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html
> 
>    * igt@gem_userptr_blits@relocations:
>      - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#3281] / [i915#3297])
>     [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@gem_userptr_blits@relocations.html
> 
>    * igt@gem_userptr_blits@sd-probe:
>      - shard-dg2:          NOTRUN -> [SKIP][106] ([i915#3297] / [i915#4958])
>     [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-1/igt@gem_userptr_blits@sd-probe.html
> 
>    * igt@gem_userptr_blits@unsync-unmap-cycles:
>      - shard-rkl:          NOTRUN -> [SKIP][107] ([i915#14544] / [i915#3297])
>     [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gem_userptr_blits@unsync-unmap-cycles.html
> 
>    * igt@gen9_exec_parse@batch-without-end:
>      - shard-rkl:          NOTRUN -> [SKIP][108] ([i915#14544] / [i915#2527])
>     [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gen9_exec_parse@batch-without-end.html
> 
>    * igt@gen9_exec_parse@bb-large:
>      - shard-glk:          NOTRUN -> [FAIL][109] ([i915#14806])
>     [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk9/igt@gen9_exec_parse@bb-large.html
> 
>    * igt@gen9_exec_parse@bb-oversize:
>      - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#2527] / [i915#2856]) +1 other test skip
>     [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@gen9_exec_parse@bb-oversize.html
>      - shard-dg2-9:        NOTRUN -> [SKIP][111] ([i915#2856]) +2 other tests skip
>     [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@gen9_exec_parse@bb-oversize.html
> 
>    * igt@gen9_exec_parse@bb-start-far:
>      - shard-dg2:          NOTRUN -> [SKIP][112] ([i915#2856]) +4 other tests skip
>     [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-8/igt@gen9_exec_parse@bb-start-far.html
> 
>    * igt@gen9_exec_parse@bb-start-out:
>      - shard-rkl:          NOTRUN -> [SKIP][113] ([i915#2527]) +1 other test skip
>     [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@gen9_exec_parse@bb-start-out.html
>      - shard-dg1:          NOTRUN -> [SKIP][114] ([i915#2527]) +1 other test skip
>     [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-16/igt@gen9_exec_parse@bb-start-out.html
>      - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#2856]) +1 other test skip
>     [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-6/igt@gen9_exec_parse@bb-start-out.html
> 
>    * igt@gen9_exec_parse@cmd-crossing-page:
>      - shard-tglu:         NOTRUN -> [SKIP][116] ([i915#2527] / [i915#2856]) +3 other tests skip
>     [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-3/igt@gen9_exec_parse@cmd-crossing-page.html
> 
>    * igt@i915_drm_fdinfo@all-busy-check-all:
>      - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#14123])
>     [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@i915_drm_fdinfo@all-busy-check-all.html
>      - shard-dg1:          NOTRUN -> [SKIP][118] ([i915#14123])
>     [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-19/igt@i915_drm_fdinfo@all-busy-check-all.html
> 
>    * igt@i915_drm_fdinfo@virtual-busy-hang:
>      - shard-dg2-9:        NOTRUN -> [SKIP][119] ([i915#14118])
>     [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@i915_drm_fdinfo@virtual-busy-hang.html
> 
>    * igt@i915_drm_fdinfo@virtual-busy-hang-all:
>      - shard-dg2:          NOTRUN -> [SKIP][120] ([i915#14118])
>     [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-8/igt@i915_drm_fdinfo@virtual-busy-hang-all.html
> 
>    * igt@i915_module_load@resize-bar:
>      - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#6412])
>     [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-4/igt@i915_module_load@resize-bar.html
> 
>    * igt@i915_pm_freq_api@freq-reset:
>      - shard-tglu:         NOTRUN -> [SKIP][122] ([i915#8399])
>     [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-9/igt@i915_pm_freq_api@freq-reset.html
> 
>    * igt@i915_pm_freq_mult@media-freq@gt0:
>      - shard-tglu:         NOTRUN -> [SKIP][123] ([i915#6590]) +1 other test skip
>     [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-3/igt@i915_pm_freq_mult@media-freq@gt0.html
> 
>    * igt@i915_pm_rpm@gem-evict-pwrite:
>      - shard-dg1:          NOTRUN -> [SKIP][124] ([i915#4077]) +3 other tests skip
>     [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-12/igt@i915_pm_rpm@gem-evict-pwrite.html
> 
>    * igt@i915_pm_rps@thresholds-idle:
>      - shard-mtlp:         NOTRUN -> [SKIP][125] ([i915#11681])
>     [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-5/igt@i915_pm_rps@thresholds-idle.html
> 
>    * igt@i915_pm_rps@waitboost:
>      - shard-mtlp:         NOTRUN -> [FAIL][126] ([i915#8346])
>     [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-3/igt@i915_pm_rps@waitboost.html
> 
>    * igt@i915_query@hwconfig_table:
>      - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#6245])
>     [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-8/igt@i915_query@hwconfig_table.html
>      - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#6245])
>     [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@i915_query@hwconfig_table.html
> 
>    * igt@i915_selftest@live@gt_pm:
>      - shard-rkl:          [PASS][129] -> [DMESG-FAIL][130] ([i915#12942]) +1 other test dmesg-fail
>     [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@i915_selftest@live@gt_pm.html
>     [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@i915_selftest@live@gt_pm.html
> 
>    * igt@i915_selftest@live@workarounds:
>      - shard-dg2:          NOTRUN -> [DMESG-FAIL][131] ([i915#12061]) +1 other test dmesg-fail
>     [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-7/igt@i915_selftest@live@workarounds.html
> 
>    * igt@i915_selftest@perf:
>      - shard-rkl:          NOTRUN -> [DMESG-WARN][132] ([i915#12964]) +6 other tests dmesg-warn
>     [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@i915_selftest@perf.html
> 
>    * igt@i915_suspend@basic-s3-without-i915:
>      - shard-rkl:          [PASS][133] -> [INCOMPLETE][134] ([i915#4817]) +1 other test incomplete
>     [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@i915_suspend@basic-s3-without-i915.html
>     [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-4/igt@i915_suspend@basic-s3-without-i915.html
>      - shard-tglu:         NOTRUN -> [INCOMPLETE][135] ([i915#4817] / [i915#7443])
>     [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-10/igt@i915_suspend@basic-s3-without-i915.html
> 
>    * igt@i915_suspend@fence-restore-untiled:
>      - shard-glk10:        NOTRUN -> [INCOMPLETE][136] ([i915#4817])
>     [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk10/igt@i915_suspend@fence-restore-untiled.html
> 
>    * igt@i915_suspend@forcewake:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][137] ([i915#4817]) +1 other test incomplete
>     [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk6/igt@i915_suspend@forcewake.html
> 
>    * igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling:
>      - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#4212])
>     [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-6/igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling.html
> 
>    * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>      - shard-dg2-9:        NOTRUN -> [SKIP][139] ([i915#5190])
>     [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>    * igt@kms_addfb_basic@bo-too-small-due-to-tiling:
>      - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#4212])
>     [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-5/igt@kms_addfb_basic@bo-too-small-due-to-tiling.html
> 
>    * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>      - shard-tglu-1:       NOTRUN -> [SKIP][141] ([i915#12454] / [i915#12712])
>     [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>    * igt@kms_async_flips@async-flip-suspend-resume:
>      - shard-rkl:          [PASS][142] -> [INCOMPLETE][143] ([i915#12761])
>     [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-7/igt@kms_async_flips@async-flip-suspend-resume.html
>     [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-3/igt@kms_async_flips@async-flip-suspend-resume.html
> 
>    * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][144] ([i915#12761]) +1 other test incomplete
>     [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk5/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html
>      - shard-rkl:          NOTRUN -> [INCOMPLETE][145] ([i915#12761])
>     [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-3/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-2.html
> 
>    * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>      - shard-dg2-9:        NOTRUN -> [SKIP][146] ([i915#1769] / [i915#3555]) +1 other test skip
>     [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>      - shard-glk:          NOTRUN -> [SKIP][147] ([i915#1769])
>     [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][148] ([i915#1769] / [i915#3555])
>     [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>    * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
>      - shard-dg2-9:        NOTRUN -> [SKIP][149] +5 other tests skip
>     [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
> 
>    * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>      - shard-tglu:         NOTRUN -> [SKIP][150] ([i915#5286]) +6 other tests skip
>     [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-5/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
> 
>    * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>      - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#5286]) +4 other tests skip
>     [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
>      - shard-dg1:          NOTRUN -> [SKIP][152] ([i915#4538] / [i915#5286]) +1 other test skip
>     [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-16/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>    * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>      - shard-tglu-1:       NOTRUN -> [SKIP][153] ([i915#5286]) +1 other test skip
>     [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>    * igt@kms_big_fb@linear-8bpp-rotate-90:
>      - shard-rkl:          NOTRUN -> [SKIP][154] ([i915#3638])
>     [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@kms_big_fb@linear-8bpp-rotate-90.html
> 
>    * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
>      - shard-rkl:          [PASS][155] -> [SKIP][156] ([i915#14544]) +45 other tests skip
>     [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
>     [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
> 
>    * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
>      - shard-dg2-9:        NOTRUN -> [SKIP][157] ([i915#4538] / [i915#5190]) +6 other tests skip
>     [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
> 
>    * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
>      - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#4538] / [i915#5190]) +9 other tests skip
>     [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-1/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
> 
>    * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>      - shard-dg2:          NOTRUN -> [SKIP][159] ([i915#5190]) +2 other tests skip
>     [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>      - shard-rkl:          NOTRUN -> [SKIP][160] ([i915#14544]) +12 other tests skip
>     [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>      - shard-mtlp:         NOTRUN -> [SKIP][161] ([i915#6187])
>     [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>    * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
>      - shard-mtlp:         NOTRUN -> [SKIP][162] +5 other tests skip
>     [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
> 
>    * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
>      - shard-rkl:          NOTRUN -> [SKIP][163] +10 other tests skip
>     [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
> 
>    * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>      - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#4538]) +1 other test skip
>     [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>      - shard-dg2-9:        NOTRUN -> [SKIP][165] ([i915#12313])
>     [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1:
>      - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#6095]) +38 other tests skip
>     [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2:
>      - shard-dg2-9:        NOTRUN -> [SKIP][167] ([i915#10307] / [i915#6095]) +19 other tests skip
>     [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-2.html
> 
>    * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
>      - shard-snb:          NOTRUN -> [SKIP][168] +60 other tests skip
>     [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-snb7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
> 
>    * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>      - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#12313])
>     [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>    * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][170] ([i915#6095]) +9 other tests skip
>     [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-edp-1.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>      - shard-tglu-1:       NOTRUN -> [SKIP][171] ([i915#12313])
>     [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>      - shard-tglu:         NOTRUN -> [SKIP][172] ([i915#12805]) +1 other test skip
>     [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>      - shard-dg2-9:        NOTRUN -> [SKIP][173] ([i915#12805])
>     [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1:
>      - shard-tglu:         NOTRUN -> [SKIP][174] ([i915#6095]) +54 other tests skip
>     [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-1.html
> 
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>      - shard-dg2-9:        NOTRUN -> [SKIP][175] ([i915#6095]) +9 other tests skip
>     [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-hdmi-a-1:
>      - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#14098] / [i915#6095]) +34 other tests skip
>     [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-4/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-b-hdmi-a-1.html
> 
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
>      - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#6095]) +17 other tests skip
>     [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>      - shard-tglu:         NOTRUN -> [SKIP][178] ([i915#12313]) +1 other test skip
>     [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-3:
>      - shard-dg2:          NOTRUN -> [SKIP][179] ([i915#10307] / [i915#6095]) +101 other tests skip
>     [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-11/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-3.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>      - shard-tglu-1:       NOTRUN -> [SKIP][180] ([i915#6095]) +29 other tests skip
>     [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> 
>    * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3:
>      - shard-dg1:          NOTRUN -> [SKIP][181] ([i915#6095]) +134 other tests skip
>     [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-12/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-a-hdmi-a-3.html
> 
>    * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
>      - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#10307] / [i915#10434] / [i915#6095]) +4 other tests skip
>     [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1.html
> 
>    * igt@kms_cdclk@plane-scaling@pipe-c-dp-3:
>      - shard-dg2:          NOTRUN -> [SKIP][183] ([i915#13783]) +4 other tests skip
>     [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-11/igt@kms_cdclk@plane-scaling@pipe-c-dp-3.html
> 
>    * igt@kms_chamelium_frames@dp-crc-single:
>      - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#11151] / [i915#7828]) +3 other tests skip
>     [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-15/igt@kms_chamelium_frames@dp-crc-single.html
> 
>    * igt@kms_chamelium_frames@dp-frame-dump:
>      - shard-dg2:          NOTRUN -> [SKIP][185] ([i915#11151] / [i915#7828]) +10 other tests skip
>     [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@kms_chamelium_frames@dp-frame-dump.html
> 
>    * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>      - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#11151] / [i915#7828]) +3 other tests skip
>     [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
> 
>    * igt@kms_chamelium_hpd@hdmi-hpd:
>      - shard-dg2-9:        NOTRUN -> [SKIP][187] ([i915#11151] / [i915#7828]) +1 other test skip
>     [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_chamelium_hpd@hdmi-hpd.html
>      - shard-rkl:          NOTRUN -> [SKIP][188] ([i915#11151] / [i915#7828]) +4 other tests skip
>     [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@kms_chamelium_hpd@hdmi-hpd.html
> 
>    * igt@kms_chamelium_hpd@hdmi-hpd-fast:
>      - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#11151] / [i915#14544] / [i915#7828])
>     [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
> 
>    * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
>      - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#11151] / [i915#7828]) +12 other tests skip
>     [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-10/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
>      - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#11151] / [i915#7828]) +1 other test skip
>     [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-5/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
> 
>    * igt@kms_color@degamma:
>      - shard-rkl:          NOTRUN -> [SKIP][192] ([i915#12655] / [i915#14544])
>     [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_color@degamma.html
> 
>    * igt@kms_color@gamma:
>      - shard-rkl:          [PASS][193] -> [SKIP][194] ([i915#12655] / [i915#14544]) +1 other test skip
>     [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@kms_color@gamma.html
>     [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_color@gamma.html
> 
>    * igt@kms_content_protection@atomic-dpms@pipe-a-dp-3:
>      - shard-dg2:          NOTRUN -> [FAIL][195] ([i915#7173])
>     [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-11/igt@kms_content_protection@atomic-dpms@pipe-a-dp-3.html
> 
>    * igt@kms_content_protection@dp-mst-lic-type-1:
>      - shard-dg2:          NOTRUN -> [SKIP][196] ([i915#3299])
>     [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-7/igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>    * igt@kms_content_protection@dp-mst-type-0:
>      - shard-dg2-9:        NOTRUN -> [SKIP][197] ([i915#3299])
>     [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_content_protection@dp-mst-type-0.html
> 
>    * igt@kms_content_protection@dp-mst-type-1:
>      - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#3116] / [i915#3299])
>     [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-9/igt@kms_content_protection@dp-mst-type-1.html
> 
>    * igt@kms_content_protection@legacy:
>      - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#7118] / [i915#9424]) +1 other test skip
>     [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_content_protection@legacy.html
> 
>    * igt@kms_content_protection@lic-type-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#6944] / [i915#9424])
>     [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-3/igt@kms_content_protection@lic-type-1.html
>      - shard-dg2-9:        NOTRUN -> [SKIP][201] ([i915#9424])
>     [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_content_protection@lic-type-1.html
>      - shard-rkl:          NOTRUN -> [SKIP][202] ([i915#9424])
>     [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@kms_content_protection@lic-type-1.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#6944] / [i915#9424])
>     [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_content_protection@lic-type-1.html
>      - shard-dg1:          NOTRUN -> [SKIP][204] ([i915#9424])
>     [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-16/igt@kms_content_protection@lic-type-1.html
> 
>    * igt@kms_content_protection@type1:
>      - shard-tglu:         NOTRUN -> [SKIP][205] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +2 other tests skip
>     [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-5/igt@kms_content_protection@type1.html
> 
>    * igt@kms_content_protection@uevent:
>      - shard-dg2-9:        NOTRUN -> [SKIP][206] ([i915#7118] / [i915#9424])
>     [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_content_protection@uevent.html
> 
>    * igt@kms_cursor_crc@cursor-offscreen-512x512:
>      - shard-tglu:         NOTRUN -> [SKIP][207] ([i915#13049]) +1 other test skip
>     [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-max-size:
>      - shard-dg2:          NOTRUN -> [SKIP][208] ([i915#3555]) +4 other tests skip
>     [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-8/igt@kms_cursor_crc@cursor-onscreen-max-size.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][209] ([i915#3555]) +3 other tests skip
>     [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html
>      - shard-dg1:          NOTRUN -> [SKIP][210] ([i915#3555]) +2 other tests skip
>     [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-14/igt@kms_cursor_crc@cursor-onscreen-max-size.html
> 
>    * igt@kms_cursor_crc@cursor-random-128x42:
>      - shard-mtlp:         NOTRUN -> [SKIP][211] ([i915#8814])
>     [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-2/igt@kms_cursor_crc@cursor-random-128x42.html
> 
>    * igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
>      - shard-tglu:         NOTRUN -> [FAIL][212] ([i915#13566]) +1 other test fail
>     [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-6/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_cursor_crc@cursor-random-512x512:
>      - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#13049])
>     [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_cursor_crc@cursor-random-512x512.html
> 
>    * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>      - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#3555]) +2 other tests skip
>     [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-8/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>    * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>      - shard-mtlp:         NOTRUN -> [SKIP][215] ([i915#3555] / [i915#8814])
>     [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
>      - shard-tglu:         [PASS][216] -> [FAIL][217] ([i915#13566]) +1 other test fail
>     [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-tglu-8/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
>     [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-512x512:
>      - shard-tglu-1:       NOTRUN -> [SKIP][218] ([i915#13049])
>     [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_cursor_crc@cursor-sliding-512x512.html
>      - shard-dg2-9:        NOTRUN -> [SKIP][219] ([i915#13049])
>     [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-64x21:
>      - shard-rkl:          [PASS][220] -> [FAIL][221] ([i915#13566]) +1 other test fail
>     [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21.html
>     [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-64x21.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
>      - shard-rkl:          NOTRUN -> [FAIL][222] ([i915#13566]) +4 other tests fail
>     [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>      - shard-mtlp:         NOTRUN -> [SKIP][223] ([i915#9809]) +1 other test skip
>     [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>    * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>      - shard-dg2-9:        NOTRUN -> [SKIP][224] ([i915#13046] / [i915#5354]) +2 other tests skip
>     [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
> 
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>      - shard-tglu:         NOTRUN -> [SKIP][225] ([i915#4103]) +1 other test skip
>     [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>    * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
>      - shard-glk10:        NOTRUN -> [SKIP][226] ([i915#11190])
>     [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk10/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
> 
>    * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
>      - shard-rkl:          [PASS][227] -> [SKIP][228] ([i915#11190] / [i915#14544])
>     [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-5/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
>     [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
> 
>    * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
>      - shard-glk:          [PASS][229] -> [SKIP][230]
>     [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-glk9/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
>     [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>      - shard-dg2:          NOTRUN -> [SKIP][231] ([i915#13046] / [i915#5354]) +3 other tests skip
>     [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
> 
>    * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>      - shard-rkl:          [PASS][232] -> [FAIL][233] ([i915#2346]) +1 other test fail
>     [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>     [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>    * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>      - shard-rkl:          NOTRUN -> [FAIL][234] ([i915#2346])
>     [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>    * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>      - shard-tglu-1:       NOTRUN -> [SKIP][235] ([i915#4103])
>     [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>      - shard-rkl:          NOTRUN -> [SKIP][236] ([i915#3555] / [i915#3804])
>     [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][237] ([i915#1769] / [i915#3555] / [i915#3804])
>     [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>      - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#3804])
>     [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][239] ([i915#3804])
>     [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_dp_link_training@non-uhbr-mst:
>      - shard-tglu:         NOTRUN -> [SKIP][240] ([i915#13749])
>     [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-5/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>    * igt@kms_dp_link_training@uhbr-mst:
>      - shard-dg2:          NOTRUN -> [SKIP][241] ([i915#13748])
>     [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@kms_dp_link_training@uhbr-mst.html
> 
>    * igt@kms_dp_linktrain_fallback@dsc-fallback:
>      - shard-dg2:          NOTRUN -> [SKIP][242] ([i915#13707])
>     [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>    * igt@kms_dsc@dsc-basic:
>      - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#3555] / [i915#3840])
>     [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-13/igt@kms_dsc@dsc-basic.html
>      - shard-dg2-9:        NOTRUN -> [SKIP][244] ([i915#3555] / [i915#3840])
>     [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_dsc@dsc-basic.html
> 
>    * igt@kms_dsc@dsc-with-bpc:
>      - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#3555] / [i915#3840])
>     [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-3/igt@kms_dsc@dsc-with-bpc.html
> 
>    * igt@kms_dsc@dsc-with-formats:
>      - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#3555] / [i915#3840]) +1 other test skip
>     [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-8/igt@kms_dsc@dsc-with-formats.html
>      - shard-rkl:          NOTRUN -> [SKIP][247] ([i915#3555] / [i915#3840])
>     [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_dsc@dsc-with-formats.html
> 
>    * igt@kms_feature_discovery@chamelium:
>      - shard-dg2:          NOTRUN -> [SKIP][248] ([i915#4854])
>     [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@kms_feature_discovery@chamelium.html
> 
>    * igt@kms_feature_discovery@display-3x:
>      - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#1839])
>     [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_feature_discovery@display-3x.html
> 
>    * igt@kms_feature_discovery@display-4x:
>      - shard-dg2:          NOTRUN -> [SKIP][250] ([i915#1839])
>     [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-11/igt@kms_feature_discovery@display-4x.html
>      - shard-rkl:          NOTRUN -> [SKIP][251] ([i915#14544] / [i915#1839])
>     [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_feature_discovery@display-4x.html
>      - shard-dg1:          NOTRUN -> [SKIP][252] ([i915#1839])
>     [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-12/igt@kms_feature_discovery@display-4x.html
>      - shard-tglu:         NOTRUN -> [SKIP][253] ([i915#1839])
>     [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-3/igt@kms_feature_discovery@display-4x.html
>      - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#1839])
>     [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-6/igt@kms_feature_discovery@display-4x.html
> 
>    * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>      - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#14544] / [i915#9934]) +2 other tests skip
>     [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
> 
>    * igt@kms_flip@2x-flip-vs-dpms:
>      - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#9934]) +3 other tests skip
>     [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-15/igt@kms_flip@2x-flip-vs-dpms.html
> 
>    * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>      - shard-tglu-1:       NOTRUN -> [SKIP][257] ([i915#9934]) +1 other test skip
>     [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> 
>    * igt@kms_flip@2x-flip-vs-fences:
>      - shard-dg2:          NOTRUN -> [SKIP][258] ([i915#8381])
>     [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-8/igt@kms_flip@2x-flip-vs-fences.html
> 
>    * igt@kms_flip@2x-flip-vs-modeset:
>      - shard-tglu-1:       NOTRUN -> [SKIP][259] ([i915#3637] / [i915#9934]) +1 other test skip
>     [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_flip@2x-flip-vs-modeset.html
> 
>    * igt@kms_flip@2x-flip-vs-panning:
>      - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#9934]) +7 other tests skip
>     [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@kms_flip@2x-flip-vs-panning.html
> 
>    * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>      - shard-mtlp:         NOTRUN -> [SKIP][261] ([i915#3637] / [i915#9934]) +2 other tests skip
>     [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
> 
>    * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>      - shard-dg2-9:        NOTRUN -> [SKIP][262] ([i915#9934]) +2 other tests skip
>     [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>    * igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1:
>      - shard-snb:          [PASS][263] -> [TIMEOUT][264] ([i915#14033]) +1 other test timeout
>     [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-snb1/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
>     [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-snb4/igt@kms_flip@2x-flip-vs-suspend@ab-vga1-hdmi-a1.html
> 
>    * igt@kms_flip@2x-modeset-vs-vblank-race:
>      - shard-rkl:          NOTRUN -> [SKIP][265] ([i915#9934]) +3 other tests skip
>     [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>    * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>      - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#3637] / [i915#9934]) +11 other tests skip
>     [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>    * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
>      - shard-rkl:          [PASS][267] -> [SKIP][268] ([i915#14544] / [i915#3637]) +4 other tests skip
>     [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
>     [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
> 
>    * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>      - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#14544] / [i915#3637])
>     [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>    * igt@kms_flip@flip-vs-suspend-interruptible:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][270] ([i915#12745] / [i915#4839] / [i915#6113])
>     [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>    * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][271] ([i915#12745])
>     [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
> 
>    * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
>      - shard-rkl:          [PASS][272] -> [INCOMPLETE][273] ([i915#6113]) +1 other test incomplete
>     [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html
>     [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
>      - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#3555] / [i915#8810] / [i915#8813]) +1 other test skip
>     [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>      - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#2672])
>     [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>      - shard-tglu:         NOTRUN -> [SKIP][276] ([i915#2672] / [i915#3555]) +2 other tests skip
>     [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>      - shard-tglu:         NOTRUN -> [SKIP][277] ([i915#2587] / [i915#2672]) +2 other tests skip
>     [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
>      - shard-dg2-9:        NOTRUN -> [SKIP][278] ([i915#2672]) +4 other tests skip
>     [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>      - shard-dg2:          NOTRUN -> [SKIP][279] ([i915#2672] / [i915#3555] / [i915#5190])
>     [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
>      - shard-dg2:          NOTRUN -> [SKIP][280] ([i915#2672])
>     [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>      - shard-tglu-1:       NOTRUN -> [SKIP][281] ([i915#2587] / [i915#2672] / [i915#3555])
>     [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
>      - shard-tglu-1:       NOTRUN -> [SKIP][282] ([i915#2587] / [i915#2672])
>     [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>      - shard-dg2-9:        NOTRUN -> [SKIP][283] ([i915#2672] / [i915#3555] / [i915#5190]) +4 other tests skip
>     [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
>      - shard-rkl:          [PASS][284] -> [SKIP][285] ([i915#14544] / [i915#3555]) +1 other test skip
>     [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
>     [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt:
>      - shard-rkl:          [PASS][286] -> [SKIP][287] ([i915#14544] / [i915#1849] / [i915#5354]) +9 other tests skip
>     [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
>     [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
>      - shard-mtlp:         NOTRUN -> [SKIP][288] ([i915#8708])
>     [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>      - shard-dg2:          NOTRUN -> [SKIP][289] ([i915#5354]) +24 other tests skip
>     [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
>      - shard-rkl:          NOTRUN -> [SKIP][290] ([i915#1825]) +23 other tests skip
>     [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt:
>      - shard-mtlp:         NOTRUN -> [SKIP][291] ([i915#1825]) +4 other tests skip
>     [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-plflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
>      - shard-rkl:          NOTRUN -> [SKIP][292] ([i915#14544] / [i915#1849] / [i915#5354]) +11 other tests skip
>     [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>      - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#8708]) +6 other tests skip
>     [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt:
>      - shard-dg2-9:        NOTRUN -> [SKIP][294] ([i915#8708]) +11 other tests skip
>     [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-gtt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>      - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#8708]) +12 other tests skip
>     [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite:
>      - shard-tglu-1:       NOTRUN -> [SKIP][296] +38 other tests skip
>     [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-pwrite.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
>      - shard-dg2-9:        NOTRUN -> [SKIP][297] ([i915#3458]) +11 other tests skip
>     [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu:
>      - shard-dg2:          NOTRUN -> [SKIP][298] ([i915#3458]) +19 other tests skip
>     [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-cpu.html
> 
>    * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>      - shard-dg1:          NOTRUN -> [SKIP][299] ([i915#9766])
>     [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-18/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
>      - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#9766])
>     [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
>      - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#9766])
>     [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt:
>      - shard-rkl:          NOTRUN -> [SKIP][302] ([i915#3023]) +12 other tests skip
>     [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
>      - shard-dg1:          NOTRUN -> [SKIP][303] ([i915#3458]) +5 other tests skip
>     [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-pgflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu:
>      - shard-dg2-9:        NOTRUN -> [SKIP][304] ([i915#5354]) +17 other tests skip
>     [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-cpu.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
>      - shard-tglu:         NOTRUN -> [SKIP][305] +89 other tests skip
>     [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
> 
>    * igt@kms_hdr@bpc-switch-dpms:
>      - shard-dg2-9:        NOTRUN -> [SKIP][306] ([i915#3555] / [i915#8228])
>     [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_hdr@bpc-switch-dpms.html
> 
>    * igt@kms_hdr@brightness-with-hdr:
>      - shard-tglu:         NOTRUN -> [SKIP][307] ([i915#1187] / [i915#12713])
>     [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-2/igt@kms_hdr@brightness-with-hdr.html
> 
>    * igt@kms_hdr@static-swap:
>      - shard-dg2:          [PASS][308] -> [SKIP][309] ([i915#3555] / [i915#8228])
>     [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-dg2-11/igt@kms_hdr@static-swap.html
>     [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-7/igt@kms_hdr@static-swap.html
>      - shard-tglu:         NOTRUN -> [SKIP][310] ([i915#3555] / [i915#8228])
>     [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-7/igt@kms_hdr@static-swap.html
> 
>    * igt@kms_hdr@static-toggle-dpms:
>      - shard-tglu-1:       NOTRUN -> [SKIP][311] ([i915#3555] / [i915#8228])
>     [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_hdr@static-toggle-dpms.html
> 
>    * igt@kms_invalid_mode@bad-htotal:
>      - shard-rkl:          [PASS][312] -> [SKIP][313] ([i915#14544] / [i915#3555] / [i915#8826])
>     [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-7/igt@kms_invalid_mode@bad-htotal.html
>     [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_invalid_mode@bad-htotal.html
> 
>    * igt@kms_invalid_mode@clock-too-high:
>      - shard-mtlp:         NOTRUN -> [SKIP][314] ([i915#3555] / [i915#6403] / [i915#8826])
>     [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-3/igt@kms_invalid_mode@clock-too-high.html
> 
>    * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][315] ([i915#9457]) +2 other tests skip
>     [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-3/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
> 
>    * igt@kms_invalid_mode@clock-too-high@pipe-d-edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][316] ([i915#8826] / [i915#9457])
>     [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-3/igt@kms_invalid_mode@clock-too-high@pipe-d-edp-1.html
> 
>    * igt@kms_invalid_mode@overflow-vrefresh:
>      - shard-rkl:          [PASS][317] -> [SKIP][318] ([i915#14544] / [i915#8826])
>     [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-4/igt@kms_invalid_mode@overflow-vrefresh.html
>     [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_invalid_mode@overflow-vrefresh.html
> 
>    * igt@kms_joiner@basic-big-joiner:
>      - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#10656])
>     [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_joiner@basic-big-joiner.html
>      - shard-tglu:         NOTRUN -> [SKIP][320] ([i915#10656])
>     [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-5/igt@kms_joiner@basic-big-joiner.html
> 
>    * igt@kms_joiner@basic-force-big-joiner:
>      - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#12388])
>     [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-1/igt@kms_joiner@basic-force-big-joiner.html
> 
>    * igt@kms_joiner@basic-force-ultra-joiner:
>      - shard-dg2-9:        NOTRUN -> [SKIP][322] ([i915#10656])
>     [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>    * igt@kms_joiner@basic-max-non-joiner:
>      - shard-tglu:         NOTRUN -> [SKIP][323] ([i915#13688])
>     [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-8/igt@kms_joiner@basic-max-non-joiner.html
>      - shard-dg2:          NOTRUN -> [SKIP][324] ([i915#13688])
>     [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@kms_joiner@basic-max-non-joiner.html
> 
>    * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>      - shard-dg2-9:        NOTRUN -> [SKIP][325] ([i915#4816])
>     [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][326] ([i915#1839])
>     [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>    * igt@kms_panel_fitting@legacy:
>      - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#6301])
>     [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-5/igt@kms_panel_fitting@legacy.html
> 
>    * igt@kms_pipe_stress@stress-xrgb8888-untiled:
>      - shard-dg1:          [PASS][328] -> [DMESG-WARN][329] ([i915#4423]) +4 other tests dmesg-warn
>     [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-dg1-16/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
>     [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-13/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
> 
>    * igt@kms_plane@plane-panning-bottom-right-suspend:
>      - shard-rkl:          NOTRUN -> [SKIP][330] ([i915#14544] / [i915#8825])
>     [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>    * igt@kms_plane@plane-panning-top-left:
>      - shard-rkl:          [PASS][331] -> [SKIP][332] ([i915#14544] / [i915#8825])
>     [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-3/igt@kms_plane@plane-panning-top-left.html
>     [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_plane@plane-panning-top-left.html
> 
>    * igt@kms_plane_alpha_blend@alpha-7efc:
>      - shard-rkl:          [PASS][333] -> [SKIP][334] ([i915#14544] / [i915#7294]) +3 other tests skip
>     [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-7/igt@kms_plane_alpha_blend@alpha-7efc.html
>     [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_plane_alpha_blend@alpha-7efc.html
> 
>    * igt@kms_plane_alpha_blend@alpha-opaque-fb:
>      - shard-glk10:        NOTRUN -> [SKIP][335] +138 other tests skip
>     [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk10/igt@kms_plane_alpha_blend@alpha-opaque-fb.html
> 
>    * igt@kms_plane_lowres@tiling-y:
>      - shard-dg2-9:        NOTRUN -> [SKIP][336] ([i915#8821])
>     [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_plane_lowres@tiling-y.html
> 
>    * igt@kms_plane_multiple@tiling-yf:
>      - shard-dg2:          NOTRUN -> [SKIP][337] ([i915#14259])
>     [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@kms_plane_multiple@tiling-yf.html
> 
>    * igt@kms_plane_scaling@intel-max-src-size:
>      - shard-tglu-1:       NOTRUN -> [SKIP][338] ([i915#6953])
>     [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_plane_scaling@intel-max-src-size.html
> 
>    * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
>      - shard-rkl:          NOTRUN -> [SKIP][339] ([i915#12247]) +5 other tests skip
>     [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
> 
>    * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a:
>      - shard-rkl:          [PASS][340] -> [SKIP][341] ([i915#12247] / [i915#14544]) +2 other tests skip
>     [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html
>     [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a.html
> 
>    * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers:
>      - shard-rkl:          [PASS][342] -> [SKIP][343] ([i915#14544] / [i915#3555] / [i915#8152])
>     [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
>     [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers.html
> 
>    * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b:
>      - shard-rkl:          [PASS][344] -> [SKIP][345] ([i915#12247] / [i915#14544] / [i915#8152]) +2 other tests skip
>     [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html
>     [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers@pipe-b.html
> 
>    * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
>      - shard-rkl:          NOTRUN -> [SKIP][346] ([i915#3555]) +3 other tests skip
>     [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html
> 
>    * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
>      - shard-rkl:          [PASS][347] -> [SKIP][348] ([i915#14544] / [i915#8152]) +1 other test skip
>     [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-7/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
>     [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers.html
> 
>    * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
>      - shard-tglu:         NOTRUN -> [SKIP][349] ([i915#12247]) +9 other tests skip
>     [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-5/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c.html
> 
>    * igt@kms_plane_scaling@planes-upscale-factor-0-25:
>      - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#14544] / [i915#3555] / [i915#6953] / [i915#8152])
>     [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
> 
>    * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a:
>      - shard-rkl:          NOTRUN -> [SKIP][351] ([i915#12247] / [i915#14544])
>     [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-a.html
> 
>    * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b:
>      - shard-rkl:          NOTRUN -> [SKIP][352] ([i915#12247] / [i915#14544] / [i915#8152])
>     [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-b.html
> 
>    * igt@kms_pm_backlight@brightness-with-dpms:
>      - shard-dg2:          NOTRUN -> [SKIP][353] ([i915#12343])
>     [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-3/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>    * igt@kms_pm_dc@dc5-psr:
>      - shard-dg2-9:        NOTRUN -> [SKIP][354] ([i915#9685])
>     [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_pm_dc@dc5-psr.html
>      - shard-rkl:          NOTRUN -> [SKIP][355] ([i915#9685])
>     [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@kms_pm_dc@dc5-psr.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][356] ([i915#9685])
>     [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_pm_dc@dc5-psr.html
>      - shard-dg1:          NOTRUN -> [SKIP][357] ([i915#9685])
>     [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-16/igt@kms_pm_dc@dc5-psr.html
> 
>    * igt@kms_pm_dc@dc5-retention-flops:
>      - shard-dg2:          NOTRUN -> [SKIP][358] ([i915#3828])
>     [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-11/igt@kms_pm_dc@dc5-retention-flops.html
>      - shard-tglu:         NOTRUN -> [SKIP][359] ([i915#3828]) +1 other test skip
>     [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-3/igt@kms_pm_dc@dc5-retention-flops.html
> 
>    * igt@kms_pm_lpsp@screens-disabled:
>      - shard-rkl:          NOTRUN -> [SKIP][360] ([i915#8430])
>     [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_pm_lpsp@screens-disabled.html
>      - shard-tglu:         NOTRUN -> [SKIP][361] ([i915#8430])
>     [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-2/igt@kms_pm_lpsp@screens-disabled.html
> 
>    * igt@kms_pm_rpm@fences:
>      - shard-rkl:          [PASS][362] -> [SKIP][363] ([i915#14544] / [i915#1849])
>     [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-5/igt@kms_pm_rpm@fences.html
>     [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_pm_rpm@fences.html
> 
>    * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>      - shard-tglu-1:       NOTRUN -> [SKIP][364] ([i915#9519])
>     [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>    * igt@kms_prime@basic-crc-hybrid:
>      - shard-tglu:         NOTRUN -> [SKIP][365] ([i915#6524])
>     [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-2/igt@kms_prime@basic-crc-hybrid.html
> 
>    * igt@kms_prime@basic-crc-vgem:
>      - shard-dg2-9:        NOTRUN -> [SKIP][366] ([i915#6524] / [i915#6805])
>     [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_prime@basic-crc-vgem.html
> 
>    * igt@kms_prime@d3hot:
>      - shard-tglu-1:       NOTRUN -> [SKIP][367] ([i915#6524])
>     [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_prime@d3hot.html
> 
>    * igt@kms_properties@plane-properties-legacy:
>      - shard-rkl:          [PASS][368] -> [SKIP][369] ([i915#11521] / [i915#14544])
>     [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-5/igt@kms_properties@plane-properties-legacy.html
>     [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_properties@plane-properties-legacy.html
> 
>    * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
>      - shard-tglu:         NOTRUN -> [SKIP][370] ([i915#11520]) +7 other tests skip
>     [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
> 
>    * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
>      - shard-rkl:          NOTRUN -> [SKIP][371] ([i915#11520] / [i915#14544]) +2 other tests skip
>     [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
> 
>    * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
>      - shard-dg1:          NOTRUN -> [SKIP][372] ([i915#11520]) +2 other tests skip
>     [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-14/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
>      - shard-snb:          NOTRUN -> [SKIP][373] ([i915#11520]) +1 other test skip
>     [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-snb7/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
>      - shard-mtlp:         NOTRUN -> [SKIP][374] ([i915#12316]) +1 other test skip
>     [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>      - shard-rkl:          NOTRUN -> [SKIP][375] ([i915#11520]) +3 other tests skip
>     [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>    * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
>      - shard-dg2-9:        NOTRUN -> [SKIP][376] ([i915#11520]) +4 other tests skip
>     [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
> 
>    * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>      - shard-tglu-1:       NOTRUN -> [SKIP][377] ([i915#11520]) +3 other tests skip
>     [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>    * igt@kms_psr2_sf@psr2-cursor-plane-update-sf:
>      - shard-glk10:        NOTRUN -> [SKIP][378] ([i915#11520]) +4 other tests skip
>     [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk10/igt@kms_psr2_sf@psr2-cursor-plane-update-sf.html
> 
>    * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
>      - shard-dg2:          NOTRUN -> [SKIP][379] ([i915#11520]) +7 other tests skip
>     [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-7/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
>      - shard-glk:          NOTRUN -> [SKIP][380] ([i915#11520]) +17 other tests skip
>     [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
> 
>    * igt@kms_psr2_su@frontbuffer-xrgb8888:
>      - shard-rkl:          NOTRUN -> [SKIP][381] ([i915#9683]) +1 other test skip
>     [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>      - shard-tglu:         NOTRUN -> [SKIP][382] ([i915#9683])
>     [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>    * igt@kms_psr2_su@page_flip-nv12:
>      - shard-dg2:          NOTRUN -> [SKIP][383] ([i915#9683])
>     [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-5/igt@kms_psr2_su@page_flip-nv12.html
> 
>    * igt@kms_psr@fbc-psr-no-drrs:
>      - shard-tglu:         NOTRUN -> [SKIP][384] ([i915#9732]) +21 other tests skip
>     [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-7/igt@kms_psr@fbc-psr-no-drrs.html
> 
>    * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
>      - shard-glk:          NOTRUN -> [SKIP][385] +506 other tests skip
>     [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk6/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html
> 
>    * igt@kms_psr@fbc-psr2-sprite-blt:
>      - shard-dg2-9:        NOTRUN -> [SKIP][386] ([i915#1072] / [i915#9732]) +12 other tests skip
>     [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_psr@fbc-psr2-sprite-blt.html
> 
>    * igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][387] ([i915#9688]) +6 other tests skip
>     [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-3/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html
> 
>    * igt@kms_psr@pr-basic:
>      - shard-rkl:          NOTRUN -> [SKIP][388] ([i915#1072] / [i915#14544] / [i915#9732]) +2 other tests skip
>     [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_psr@pr-basic.html
> 
>    * igt@kms_psr@pr-primary-render:
>      - shard-rkl:          NOTRUN -> [SKIP][389] ([i915#1072] / [i915#9732]) +10 other tests skip
>     [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_psr@pr-primary-render.html
> 
>    * igt@kms_psr@psr-cursor-plane-onoff:
>      - shard-tglu-1:       NOTRUN -> [SKIP][390] ([i915#9732]) +8 other tests skip
>     [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_psr@psr-cursor-plane-onoff.html
>      - shard-dg1:          NOTRUN -> [SKIP][391] ([i915#1072] / [i915#9732]) +7 other tests skip
>     [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-14/igt@kms_psr@psr-cursor-plane-onoff.html
> 
>    * igt@kms_psr@psr-cursor-render:
>      - shard-dg2:          NOTRUN -> [SKIP][392] ([i915#1072] / [i915#9732]) +20 other tests skip
>     [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-3/igt@kms_psr@psr-cursor-render.html
> 
>    * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>      - shard-dg2:          NOTRUN -> [SKIP][393] ([i915#9685])
>     [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>    * igt@kms_rotation_crc@exhaust-fences:
>      - shard-dg1:          NOTRUN -> [SKIP][394] ([i915#4884])
>     [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-16/igt@kms_rotation_crc@exhaust-fences.html
>      - shard-dg2-9:        NOTRUN -> [SKIP][395] ([i915#4235])
>     [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_rotation_crc@exhaust-fences.html
> 
>    * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
>      - shard-rkl:          NOTRUN -> [SKIP][396] ([i915#5289])
>     [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
> 
>    * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>      - shard-dg2:          NOTRUN -> [SKIP][397] ([i915#12755] / [i915#5190])
>     [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>    * igt@kms_rotation_crc@sprite-rotation-270:
>      - shard-dg2:          NOTRUN -> [SKIP][398] ([i915#12755])
>     [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-5/igt@kms_rotation_crc@sprite-rotation-270.html
> 
>    * igt@kms_rotation_crc@sprite-rotation-90:
>      - shard-dg2-9:        NOTRUN -> [SKIP][399] ([i915#12755])
>     [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>    * igt@kms_selftest@drm_framebuffer:
>      - shard-glk:          NOTRUN -> [ABORT][400] ([i915#13179]) +1 other test abort
>     [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk1/igt@kms_selftest@drm_framebuffer.html
> 
>    * igt@kms_vblank@ts-continuation-suspend:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][401] ([i915#12276]) +1 other test incomplete
>     [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk8/igt@kms_vblank@ts-continuation-suspend.html
> 
>    * igt@kms_vrr@flipline:
>      - shard-dg2-9:        NOTRUN -> [SKIP][402] ([i915#3555]) +3 other tests skip
>     [402]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@kms_vrr@flipline.html
> 
>    * igt@kms_vrr@lobf:
>      - shard-tglu:         NOTRUN -> [SKIP][403] ([i915#11920])
>     [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-9/igt@kms_vrr@lobf.html
> 
>    * igt@kms_vrr@negative-basic:
>      - shard-dg2:          NOTRUN -> [SKIP][404] ([i915#3555] / [i915#9906])
>     [404]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-5/igt@kms_vrr@negative-basic.html
>      - shard-dg1:          NOTRUN -> [SKIP][405] ([i915#3555] / [i915#9906])
>     [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-17/igt@kms_vrr@negative-basic.html
>      - shard-tglu:         NOTRUN -> [SKIP][406] ([i915#3555] / [i915#9906])
>     [406]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-5/igt@kms_vrr@negative-basic.html
> 
>    * igt@kms_vrr@seamless-rr-switch-virtual:
>      - shard-dg2:          NOTRUN -> [SKIP][407] ([i915#9906])
>     [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-8/igt@kms_vrr@seamless-rr-switch-virtual.html
>      - shard-dg1:          NOTRUN -> [SKIP][408] ([i915#9906])
>     [408]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-18/igt@kms_vrr@seamless-rr-switch-virtual.html
>      - shard-tglu:         NOTRUN -> [SKIP][409] ([i915#9906])
>     [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-4/igt@kms_vrr@seamless-rr-switch-virtual.html
>      - shard-mtlp:         NOTRUN -> [SKIP][410] ([i915#8808] / [i915#9906])
>     [410]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-5/igt@kms_vrr@seamless-rr-switch-virtual.html
> 
>    * igt@kms_writeback@writeback-fb-id:
>      - shard-glk:          NOTRUN -> [SKIP][411] ([i915#2437]) +2 other tests skip
>     [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk6/igt@kms_writeback@writeback-fb-id.html
>      - shard-dg2:          NOTRUN -> [SKIP][412] ([i915#2437])
>     [412]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-8/igt@kms_writeback@writeback-fb-id.html
>      - shard-rkl:          NOTRUN -> [SKIP][413] ([i915#2437])
>     [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_writeback@writeback-fb-id.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][414] ([i915#2437])
>     [414]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@kms_writeback@writeback-fb-id.html
>      - shard-dg1:          NOTRUN -> [SKIP][415] ([i915#2437])
>     [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-14/igt@kms_writeback@writeback-fb-id.html
>      - shard-mtlp:         NOTRUN -> [SKIP][416] ([i915#2437])
>     [416]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-4/igt@kms_writeback@writeback-fb-id.html
> 
>    * igt@kms_writeback@writeback-pixel-formats:
>      - shard-rkl:          NOTRUN -> [SKIP][417] ([i915#14544] / [i915#2437] / [i915#9412])
>     [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_writeback@writeback-pixel-formats.html
>      - shard-tglu:         NOTRUN -> [SKIP][418] ([i915#2437] / [i915#9412])
>     [418]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-5/igt@kms_writeback@writeback-pixel-formats.html
> 
>    * igt@perf@gen12-group-concurrent-oa-buffer-read:
>      - shard-tglu:         NOTRUN -> [FAIL][419] ([i915#10538])
>     [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-7/igt@perf@gen12-group-concurrent-oa-buffer-read.html
> 
>    * igt@perf@global-sseu-config:
>      - shard-dg2-9:        NOTRUN -> [SKIP][420] ([i915#7387])
>     [420]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@perf@global-sseu-config.html
> 
>    * igt@perf@global-sseu-config-invalid:
>      - shard-dg2:          NOTRUN -> [SKIP][421] ([i915#7387])
>     [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-5/igt@perf@global-sseu-config-invalid.html
> 
>    * igt@perf_pmu@busy-double-start@vcs1:
>      - shard-mtlp:         [PASS][422] -> [FAIL][423] ([i915#4349]) +2 other tests fail
>     [422]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-mtlp-1/igt@perf_pmu@busy-double-start@vcs1.html
>     [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-5/igt@perf_pmu@busy-double-start@vcs1.html
> 
>    * igt@perf_pmu@rc6-suspend:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][424] ([i915#13356])
>     [424]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk8/igt@perf_pmu@rc6-suspend.html
>      - shard-rkl:          [PASS][425] -> [INCOMPLETE][426] ([i915#13520])
>     [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-3/igt@perf_pmu@rc6-suspend.html
>     [426]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-3/igt@perf_pmu@rc6-suspend.html
> 
>    * igt@perf_pmu@rc6@other-idle-gt0:
>      - shard-rkl:          NOTRUN -> [SKIP][427] ([i915#8516])
>     [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@perf_pmu@rc6@other-idle-gt0.html
> 
>    * igt@perf_pmu@semaphore-wait-idle@rcs0:
>      - shard-rkl:          [PASS][428] -> [DMESG-WARN][429] ([i915#12964]) +26 other tests dmesg-warn
>     [428]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-7/igt@perf_pmu@semaphore-wait-idle@rcs0.html
>     [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@perf_pmu@semaphore-wait-idle@rcs0.html
> 
>    * igt@prime_vgem@basic-fence-flip:
>      - shard-dg1:          NOTRUN -> [SKIP][430] ([i915#3708])
>     [430]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-12/igt@prime_vgem@basic-fence-flip.html
>      - shard-dg2:          NOTRUN -> [SKIP][431] ([i915#3708])
>     [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@prime_vgem@basic-fence-flip.html
> 
>    * igt@prime_vgem@basic-fence-mmap:
>      - shard-dg2-9:        NOTRUN -> [SKIP][432] ([i915#3708] / [i915#4077])
>     [432]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@prime_vgem@basic-fence-mmap.html
> 
>    * igt@prime_vgem@basic-read:
>      - shard-rkl:          NOTRUN -> [SKIP][433] ([i915#3291] / [i915#3708])
>     [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@prime_vgem@basic-read.html
> 
>    * igt@prime_vgem@basic-write:
>      - shard-dg2-9:        NOTRUN -> [SKIP][434] ([i915#3291] / [i915#3708])
>     [434]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@prime_vgem@basic-write.html
> 
>    * igt@prime_vgem@coherency-gtt:
>      - shard-dg2:          NOTRUN -> [SKIP][435] ([i915#3708] / [i915#4077]) +1 other test skip
>     [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-8/igt@prime_vgem@coherency-gtt.html
> 
>    * igt@prime_vgem@fence-flip-hang:
>      - shard-rkl:          NOTRUN -> [SKIP][436] ([i915#3708])
>     [436]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@prime_vgem@fence-flip-hang.html
> 
>    * igt@sriov_basic@bind-unbind-vf:
>      - shard-dg2-9:        NOTRUN -> [SKIP][437] ([i915#9917])
>     [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-9/igt@sriov_basic@bind-unbind-vf.html
> 
>    * igt@sriov_basic@bind-unbind-vf@vf-1:
>      - shard-tglu-1:       NOTRUN -> [FAIL][438] ([i915#12910]) +9 other tests fail
>     [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-1/igt@sriov_basic@bind-unbind-vf@vf-1.html
> 
>    * igt@sriov_basic@enable-vfs-autoprobe-off:
>      - shard-dg2:          NOTRUN -> [SKIP][439] ([i915#9917]) +1 other test skip
>     [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-5/igt@sriov_basic@enable-vfs-autoprobe-off.html
>      - shard-rkl:          NOTRUN -> [SKIP][440] ([i915#14544] / [i915#9917])
>     [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-off.html
>      - shard-dg1:          NOTRUN -> [SKIP][441] ([i915#9917])
>     [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-17/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>    * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
>      - shard-mtlp:         NOTRUN -> [FAIL][442] ([i915#12910]) +9 other tests fail
>     [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-1/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html
> 
>    * igt@sriov_basic@enable-vfs-autoprobe-on:
>      - shard-tglu:         NOTRUN -> [FAIL][443] ([i915#12910]) +19 other tests fail
>     [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>    
> #### Possible fixes ####
> 
>    * igt@fbdev@nullptr:
>      - shard-rkl:          [SKIP][444] ([i915#14544] / [i915#2582]) -> [PASS][445] +1 other test pass
>     [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@fbdev@nullptr.html
>     [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-4/igt@fbdev@nullptr.html
> 
>    * igt@gem_create@busy-create:
>      - shard-rkl:          [DMESG-WARN][446] ([i915#12964]) -> [PASS][447] +21 other tests pass
>     [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@gem_create@busy-create.html
>     [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gem_create@busy-create.html
> 
>    * igt@gem_eio@kms:
>      - shard-dg2:          [FAIL][448] ([i915#5784]) -> [PASS][449]
>     [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-dg2-1/igt@gem_eio@kms.html
>     [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-7/igt@gem_eio@kms.html
>      - shard-tglu:         [DMESG-WARN][450] ([i915#13363]) -> [PASS][451]
>     [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-tglu-10/igt@gem_eio@kms.html
>     [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-2/igt@gem_eio@kms.html
> 
>    * igt@gem_exec_capture@pi@vcs0:
>      - shard-dg2:          [FAIL][452] ([i915#14024]) -> [PASS][453] +1 other test pass
>     [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-dg2-11/igt@gem_exec_capture@pi@vcs0.html
>     [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-11/igt@gem_exec_capture@pi@vcs0.html
> 
>    * igt@gem_exec_suspend@basic-s0@smem:
>      - shard-dg2:          [INCOMPLETE][454] ([i915#11441] / [i915#13356]) -> [PASS][455]
>     [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-dg2-3/igt@gem_exec_suspend@basic-s0@smem.html
>     [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-3/igt@gem_exec_suspend@basic-s0@smem.html
> 
>    * igt@gem_lmem_swapping@smem-oom@lmem0:
>      - shard-dg1:          [TIMEOUT][456] ([i915#5493]) -> [PASS][457] +1 other test pass
>     [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-dg1-18/igt@gem_lmem_swapping@smem-oom@lmem0.html
>     [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>    * igt@gem_mmap_offset@clear-via-pagefault:
>      - shard-mtlp:         [ABORT][458] ([i915#14809]) -> [PASS][459] +1 other test pass
>     [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-mtlp-7/igt@gem_mmap_offset@clear-via-pagefault.html
>     [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-4/igt@gem_mmap_offset@clear-via-pagefault.html
> 
>    * igt@gem_pxp@create-protected-buffer:
>      - shard-rkl:          [TIMEOUT][460] ([i915#12964]) -> [PASS][461]
>     [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-4/igt@gem_pxp@create-protected-buffer.html
>     [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@gem_pxp@create-protected-buffer.html
> 
>    * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
>      - shard-rkl:          [SKIP][462] ([i915#4270]) -> [PASS][463]
>     [462]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-7/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
>     [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@gem_pxp@protected-encrypted-src-copy-not-readible.html
> 
>    * igt@gem_workarounds@suspend-resume:
>      - shard-rkl:          [INCOMPLETE][464] ([i915#13356]) -> [PASS][465]
>     [464]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-5/igt@gem_workarounds@suspend-resume.html
>     [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gem_workarounds@suspend-resume.html
> 
>    * igt@i915_module_load@reload-no-display:
>      - shard-snb:          [DMESG-WARN][466] ([i915#14545]) -> [PASS][467]
>     [466]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-snb5/igt@i915_module_load@reload-no-display.html
>     [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-snb1/igt@i915_module_load@reload-no-display.html
> 
>    * igt@i915_selftest@live@workarounds:
>      - shard-mtlp:         [DMESG-FAIL][468] ([i915#12061]) -> [PASS][469] +1 other test pass
>     [468]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-mtlp-5/igt@i915_selftest@live@workarounds.html
>     [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-5/igt@i915_selftest@live@workarounds.html
> 
>    * igt@i915_suspend@sysfs-reader:
>      - shard-rkl:          [INCOMPLETE][470] ([i915#4817]) -> [PASS][471]
>     [470]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-3/igt@i915_suspend@sysfs-reader.html
>     [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@i915_suspend@sysfs-reader.html
> 
>    * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>      - shard-mtlp:         [FAIL][472] ([i915#5138]) -> [PASS][473]
>     [472]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>     [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>    * igt@kms_big_fb@linear-64bpp-rotate-180:
>      - shard-dg1:          [DMESG-WARN][474] ([i915#4423]) -> [PASS][475] +1 other test pass
>     [474]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-dg1-12/igt@kms_big_fb@linear-64bpp-rotate-180.html
>     [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-16/igt@kms_big_fb@linear-64bpp-rotate-180.html
> 
>    * igt@kms_color@ctm-0-50@pipe-d-edp-1:
>      - shard-mtlp:         [FAIL][476] -> [PASS][477] +1 other test pass
>     [476]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-mtlp-3/igt@kms_color@ctm-0-50@pipe-d-edp-1.html
>     [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-7/igt@kms_color@ctm-0-50@pipe-d-edp-1.html
> 
>    * igt@kms_color@legacy-gamma-reset:
>      - shard-rkl:          [SKIP][478] ([i915#12655] / [i915#14544]) -> [PASS][479]
>     [478]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_color@legacy-gamma-reset.html
>     [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-4/igt@kms_color@legacy-gamma-reset.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-128x42:
>      - shard-tglu:         [FAIL][480] ([i915#13566]) -> [PASS][481] +1 other test pass
>     [480]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
>     [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-256x256:
>      - shard-rkl:          [SKIP][482] ([i915#14544]) -> [PASS][483] +35 other tests pass
>     [482]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-256x256.html
>     [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-256x256.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>      - shard-glk:          [SKIP][484] -> [PASS][485] +2 other tests pass
>     [484]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-glk8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>     [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-glk9/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>    * igt@kms_dp_aux_dev:
>      - shard-dg2:          [SKIP][486] ([i915#1257]) -> [PASS][487]
>     [486]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-dg2-5/igt@kms_dp_aux_dev.html
>     [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-11/igt@kms_dp_aux_dev.html
> 
>    * igt@kms_dp_link_training@non-uhbr-sst:
>      - shard-dg2:          [SKIP][488] ([i915#13749]) -> [PASS][489]
>     [488]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-dg2-6/igt@kms_dp_link_training@non-uhbr-sst.html
>     [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-11/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>    * igt@kms_fbcon_fbt@fbc-suspend:
>      - shard-rkl:          [INCOMPLETE][490] ([i915#9878]) -> [PASS][491]
>     [490]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-3/igt@kms_fbcon_fbt@fbc-suspend.html
>     [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>    * igt@kms_flip@bo-too-big-interruptible:
>      - shard-rkl:          [SKIP][492] ([i915#14544] / [i915#3637]) -> [PASS][493] +6 other tests pass
>     [492]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_flip@bo-too-big-interruptible.html
>     [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_flip@bo-too-big-interruptible.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
>      - shard-rkl:          [SKIP][494] ([i915#14544] / [i915#3555]) -> [PASS][495] +3 other tests pass
>     [494]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
>     [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu:
>      - shard-rkl:          [SKIP][496] ([i915#14544] / [i915#1849] / [i915#5354]) -> [PASS][497] +6 other tests pass
>     [496]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
>     [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-cpu.html
> 
>    * igt@kms_hdmi_inject@inject-audio:
>      - shard-snb:          [SKIP][498] -> [PASS][499]
>     [498]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-snb6/igt@kms_hdmi_inject@inject-audio.html
>     [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-snb1/igt@kms_hdmi_inject@inject-audio.html
> 
>    * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
>      - shard-rkl:          [SKIP][500] ([i915#11190] / [i915#14544]) -> [PASS][501] +1 other test pass
>     [500]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
>     [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
> 
>    * igt@kms_plane_alpha_blend@constant-alpha-mid:
>      - shard-rkl:          [SKIP][502] ([i915#14544] / [i915#7294]) -> [PASS][503]
>     [502]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_plane_alpha_blend@constant-alpha-mid.html
>     [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_plane_alpha_blend@constant-alpha-mid.html
> 
>    * igt@kms_plane_scaling@invalid-parameters:
>      - shard-rkl:          [SKIP][504] ([i915#14544] / [i915#8152]) -> [PASS][505]
>     [504]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_plane_scaling@invalid-parameters.html
>     [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_plane_scaling@invalid-parameters.html
> 
>    * igt@kms_plane_scaling@planes-scaler-unity-scaling:
>      - shard-rkl:          [SKIP][506] ([i915#14544] / [i915#3555] / [i915#8152]) -> [PASS][507] +1 other test pass
>     [506]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
>     [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_plane_scaling@planes-scaler-unity-scaling.html
> 
>    * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a:
>      - shard-rkl:          [SKIP][508] ([i915#12247] / [i915#14544]) -> [PASS][509] +4 other tests pass
>     [508]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html
>     [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-a.html
> 
>    * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
>      - shard-rkl:          [SKIP][510] ([i915#14544] / [i915#6953] / [i915#8152]) -> [PASS][511]
>     [510]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
>     [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
> 
>    * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
>      - shard-rkl:          [SKIP][512] ([i915#12247] / [i915#14544] / [i915#8152]) -> [PASS][513] +5 other tests pass
>     [512]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
>     [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
> 
>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
>      - shard-rkl:          [SKIP][514] ([i915#12247] / [i915#14544] / [i915#3555] / [i915#6953] / [i915#8152]) -> [PASS][515]
>     [514]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
>     [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-4/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
> 
>    * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>      - shard-dg2:          [SKIP][516] ([i915#9519]) -> [PASS][517]
>     [516]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>     [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>    * igt@kms_pm_rpm@dpms-non-lpsp:
>      - shard-rkl:          [SKIP][518] ([i915#14544] / [i915#9519]) -> [PASS][519]
>     [518]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_pm_rpm@dpms-non-lpsp.html
>     [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>    * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>      - shard-rkl:          [SKIP][520] ([i915#9519]) -> [PASS][521]
>     [520]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
>     [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>    * igt@kms_vblank@ts-continuation-dpms-suspend:
>      - shard-tglu:         [ABORT][522] ([i915#14850]) -> [PASS][523] +1 other test pass
>     [522]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-tglu-9/igt@kms_vblank@ts-continuation-dpms-suspend.html
>     [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-tglu-3/igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>    * igt@kms_vrr@negative-basic:
>      - shard-mtlp:         [FAIL][524] ([i915#10393]) -> [PASS][525] +1 other test pass
>     [524]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-mtlp-4/igt@kms_vrr@negative-basic.html
>     [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-1/igt@kms_vrr@negative-basic.html
> 
>    * igt@perf_pmu@busy-double-start@bcs0:
>      - shard-mtlp:         [FAIL][526] ([i915#4349]) -> [PASS][527] +3 other tests pass
>     [526]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-mtlp-1/igt@perf_pmu@busy-double-start@bcs0.html
>     [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-5/igt@perf_pmu@busy-double-start@bcs0.html
> 
>    * igt@prime_busy@hang:
>      - shard-rkl:          [DMESG-WARN][528] ([i915#12917] / [i915#12964]) -> [PASS][529] +1 other test pass
>     [528]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@prime_busy@hang.html
>     [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-4/igt@prime_busy@hang.html
> 
>    
> #### Warnings ####
> 
>    * igt@api_intel_bb@crc32:
>      - shard-rkl:          [SKIP][530] ([i915#14544] / [i915#6230]) -> [SKIP][531] ([i915#6230])
>     [530]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@api_intel_bb@crc32.html
>     [531]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@api_intel_bb@crc32.html
> 
>    * igt@api_intel_bb@object-reloc-purge-cache:
>      - shard-rkl:          [SKIP][532] ([i915#8411]) -> [SKIP][533] ([i915#14544] / [i915#8411])
>     [532]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-4/igt@api_intel_bb@object-reloc-purge-cache.html
>     [533]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>    * igt@device_reset@unbind-cold-reset-rebind:
>      - shard-rkl:          [SKIP][534] ([i915#11078]) -> [SKIP][535] ([i915#11078] / [i915#14544])
>     [534]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@device_reset@unbind-cold-reset-rebind.html
>     [535]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@device_reset@unbind-cold-reset-rebind.html
> 
>    * igt@gem_bad_reloc@negative-reloc-lut:
>      - shard-rkl:          [SKIP][536] ([i915#14544] / [i915#3281]) -> [SKIP][537] ([i915#3281]) +6 other tests skip
>     [536]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@gem_bad_reloc@negative-reloc-lut.html
>     [537]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@gem_bad_reloc@negative-reloc-lut.html
> 
>    * igt@gem_ccs@ctrl-surf-copy-new-ctx:
>      - shard-rkl:          [SKIP][538] ([i915#9323]) -> [SKIP][539] ([i915#14544] / [i915#9323])
>     [538]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-5/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
>     [539]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy-new-ctx.html
> 
>    * igt@gem_close_race@multigpu-basic-threads:
>      - shard-rkl:          [SKIP][540] ([i915#14544] / [i915#7697]) -> [SKIP][541] ([i915#7697])
>     [540]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html
>     [541]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@gem_close_race@multigpu-basic-threads.html
> 
>    * igt@gem_ctx_sseu@invalid-args:
>      - shard-rkl:          [SKIP][542] ([i915#280]) -> [SKIP][543] ([i915#14544] / [i915#280])
>     [542]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-4/igt@gem_ctx_sseu@invalid-args.html
>     [543]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html
> 
>    * igt@gem_exec_balancer@parallel:
>      - shard-rkl:          [SKIP][544] ([i915#4525]) -> [SKIP][545] ([i915#14544] / [i915#4525]) +2 other tests skip
>     [544]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@gem_exec_balancer@parallel.html
>     [545]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gem_exec_balancer@parallel.html
> 
>    * igt@gem_exec_balancer@parallel-ordering:
>      - shard-rkl:          [SKIP][546] ([i915#14544] / [i915#4525]) -> [SKIP][547] ([i915#4525])
>     [546]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@gem_exec_balancer@parallel-ordering.html
>     [547]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@gem_exec_balancer@parallel-ordering.html
> 
>    * igt@gem_exec_capture@capture-invisible@smem0:
>      - shard-rkl:          [SKIP][548] ([i915#6334]) -> [SKIP][549] ([i915#14544] / [i915#6334]) +1 other test skip
>     [548]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@gem_exec_capture@capture-invisible@smem0.html
>     [549]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>    * igt@gem_exec_reloc@basic-write-read-noreloc:
>      - shard-rkl:          [SKIP][550] ([i915#3281]) -> [SKIP][551] ([i915#14544] / [i915#3281]) +10 other tests skip
>     [550]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-4/igt@gem_exec_reloc@basic-write-read-noreloc.html
>     [551]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gem_exec_reloc@basic-write-read-noreloc.html
> 
>    * igt@gem_lmem_swapping@heavy-multi:
>      - shard-rkl:          [SKIP][552] ([i915#4613]) -> [SKIP][553] ([i915#14544] / [i915#4613])
>     [552]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@gem_lmem_swapping@heavy-multi.html
>     [553]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gem_lmem_swapping@heavy-multi.html
> 
>    * igt@gem_lmem_swapping@heavy-verify-random:
>      - shard-rkl:          [SKIP][554] ([i915#14544] / [i915#4613]) -> [SKIP][555] ([i915#4613]) +1 other test skip
>     [554]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@gem_lmem_swapping@heavy-verify-random.html
>     [555]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-4/igt@gem_lmem_swapping@heavy-verify-random.html
> 
>    * igt@gem_partial_pwrite_pread@writes-after-reads:
>      - shard-rkl:          [SKIP][556] ([i915#3282]) -> [SKIP][557] ([i915#14544] / [i915#3282]) +6 other tests skip
>     [556]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-5/igt@gem_partial_pwrite_pread@writes-after-reads.html
>     [557]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads.html
> 
>    * igt@gem_pwrite@basic-random:
>      - shard-rkl:          [SKIP][558] ([i915#14544] / [i915#3282]) -> [SKIP][559] ([i915#3282]) +3 other tests skip
>     [558]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@gem_pwrite@basic-random.html
>     [559]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@gem_pwrite@basic-random.html
> 
>    * igt@gem_pxp@create-regular-context-1:
>      - shard-rkl:          [SKIP][560] ([i915#14544] / [i915#4270]) -> [TIMEOUT][561] ([i915#12917] / [i915#12964])
>     [560]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@gem_pxp@create-regular-context-1.html
>     [561]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@gem_pxp@create-regular-context-1.html
> 
>    * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>      - shard-rkl:          [SKIP][562] ([i915#4270]) -> [TIMEOUT][563] ([i915#12964])
>     [562]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-5/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
>     [563]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html
> 
>    * igt@gem_pxp@hw-rejects-pxp-buffer:
>      - shard-rkl:          [TIMEOUT][564] ([i915#12917] / [i915#12964]) -> [SKIP][565] ([i915#13717])
>     [564]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-7/igt@gem_pxp@hw-rejects-pxp-buffer.html
>     [565]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@gem_pxp@hw-rejects-pxp-buffer.html
> 
>    * igt@gem_pxp@reject-modify-context-protection-on:
>      - shard-rkl:          [TIMEOUT][566] ([i915#12917] / [i915#12964]) -> [SKIP][567] ([i915#14544] / [i915#4270])
>     [566]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-3/igt@gem_pxp@reject-modify-context-protection-on.html
>     [567]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gem_pxp@reject-modify-context-protection-on.html
> 
>    * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
>      - shard-rkl:          [TIMEOUT][568] ([i915#12917] / [i915#12964]) -> [SKIP][569] ([i915#4270])
>     [568]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-5/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
>     [569]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-4/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
> 
>    * igt@gem_pxp@verify-pxp-stale-ctx-execution:
>      - shard-rkl:          [SKIP][570] ([i915#4270]) -> [TIMEOUT][571] ([i915#12917] / [i915#12964])
>     [570]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
>     [571]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
> 
>    * igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>      - shard-rkl:          [SKIP][572] ([i915#3297]) -> [SKIP][573] ([i915#14544] / [i915#3297]) +2 other tests skip
>     [572]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-5/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
>     [573]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html
> 
>    * igt@gem_userptr_blits@readonly-pwrite-unsync:
>      - shard-rkl:          [SKIP][574] ([i915#14544] / [i915#3297]) -> [SKIP][575] ([i915#3297])
>     [574]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@gem_userptr_blits@readonly-pwrite-unsync.html
>     [575]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-4/igt@gem_userptr_blits@readonly-pwrite-unsync.html
> 
>    * igt@gen9_exec_parse@bb-chained:
>      - shard-rkl:          [SKIP][576] ([i915#2527]) -> [SKIP][577] ([i915#14544] / [i915#2527]) +3 other tests skip
>     [576]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-7/igt@gen9_exec_parse@bb-chained.html
>     [577]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@gen9_exec_parse@bb-chained.html
> 
>    * igt@gen9_exec_parse@bb-start-param:
>      - shard-rkl:          [SKIP][578] ([i915#14544] / [i915#2527]) -> [SKIP][579] ([i915#2527])
>     [578]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@gen9_exec_parse@bb-start-param.html
>     [579]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@gen9_exec_parse@bb-start-param.html
> 
>    * igt@i915_pm_freq_mult@media-freq@gt0:
>      - shard-rkl:          [SKIP][580] ([i915#14544] / [i915#6590]) -> [SKIP][581] ([i915#6590]) +1 other test skip
>     [580]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@i915_pm_freq_mult@media-freq@gt0.html
>     [581]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@i915_pm_freq_mult@media-freq@gt0.html
> 
>    * igt@i915_pm_sseu@full-enable:
>      - shard-rkl:          [SKIP][582] ([i915#4387]) -> [SKIP][583] ([i915#14544] / [i915#4387])
>     [582]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-7/igt@i915_pm_sseu@full-enable.html
>     [583]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@i915_pm_sseu@full-enable.html
> 
>    * igt@intel_hwmon@hwmon-read:
>      - shard-rkl:          [SKIP][584] ([i915#14544] / [i915#7707]) -> [SKIP][585] ([i915#7707])
>     [584]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@intel_hwmon@hwmon-read.html
>     [585]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@intel_hwmon@hwmon-read.html
> 
>    * igt@intel_hwmon@hwmon-write:
>      - shard-rkl:          [SKIP][586] ([i915#7707]) -> [SKIP][587] ([i915#14544] / [i915#7707])
>     [586]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@intel_hwmon@hwmon-write.html
>     [587]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@intel_hwmon@hwmon-write.html
> 
>    * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
>      - shard-rkl:          [SKIP][588] ([i915#5286]) -> [SKIP][589] ([i915#14544]) +4 other tests skip
>     [588]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
>     [589]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
> 
>    * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>      - shard-rkl:          [SKIP][590] ([i915#14544]) -> [SKIP][591] ([i915#5286]) +7 other tests skip
>     [590]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
>     [591]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
> 
>    * igt@kms_big_fb@linear-64bpp-rotate-90:
>      - shard-rkl:          [SKIP][592] ([i915#14544]) -> [SKIP][593] ([i915#3638]) +4 other tests skip
>     [592]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_big_fb@linear-64bpp-rotate-90.html
>     [593]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_big_fb@linear-64bpp-rotate-90.html
> 
>    * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>      - shard-rkl:          [SKIP][594] ([i915#3638]) -> [SKIP][595] ([i915#14544]) +3 other tests skip
>     [594]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>     [595]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>    * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>      - shard-rkl:          [SKIP][596] ([i915#14544]) -> [SKIP][597] ([i915#14098] / [i915#6095]) +9 other tests skip
>     [596]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
>     [597]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
>      - shard-rkl:          [SKIP][598] ([i915#14098] / [i915#6095]) -> [SKIP][599] ([i915#14544]) +12 other tests skip
>     [598]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
>     [599]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html
> 
>    * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>      - shard-rkl:          [SKIP][600] ([i915#12313]) -> [SKIP][601] ([i915#14544]) +1 other test skip
>     [600]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
>     [601]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2:
>      - shard-rkl:          [SKIP][602] ([i915#6095]) -> [SKIP][603] ([i915#14098] / [i915#6095]) +1 other test skip
>     [602]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html
>     [603]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-2.html
> 
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2:
>      - shard-rkl:          [SKIP][604] ([i915#14098] / [i915#6095]) -> [SKIP][605] ([i915#6095])
>     [604]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html
>     [605]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-2.html
> 
>    * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>      - shard-rkl:          [SKIP][606] ([i915#14544]) -> [SKIP][607] ([i915#12313])
>     [606]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>     [607]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>    * igt@kms_cdclk@mode-transition-all-outputs:
>      - shard-rkl:          [SKIP][608] ([i915#14544] / [i915#3742]) -> [SKIP][609] ([i915#3742])
>     [608]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_cdclk@mode-transition-all-outputs.html
>     [609]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>    * igt@kms_chamelium_frames@hdmi-crc-multiple:
>      - shard-rkl:          [SKIP][610] ([i915#11151] / [i915#7828]) -> [SKIP][611] ([i915#11151] / [i915#14544] / [i915#7828]) +5 other tests skip
>     [610]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-7/igt@kms_chamelium_frames@hdmi-crc-multiple.html
>     [611]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html
> 
>    * igt@kms_chamelium_hpd@dp-hpd-storm:
>      - shard-rkl:          [SKIP][612] ([i915#11151] / [i915#14544] / [i915#7828]) -> [SKIP][613] ([i915#11151] / [i915#7828]) +4 other tests skip
>     [612]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_chamelium_hpd@dp-hpd-storm.html
>     [613]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd-storm.html
> 
>    * igt@kms_content_protection@atomic-dpms:
>      - shard-dg2:          [SKIP][614] ([i915#7118] / [i915#9424]) -> [FAIL][615] ([i915#7173])
>     [614]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-dg2-8/igt@kms_content_protection@atomic-dpms.html
>     [615]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-11/igt@kms_content_protection@atomic-dpms.html
> 
>    * igt@kms_content_protection@content-type-change:
>      - shard-rkl:          [SKIP][616] ([i915#9424]) -> [SKIP][617] ([i915#14544])
>     [616]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-7/igt@kms_content_protection@content-type-change.html
>     [617]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_content_protection@content-type-change.html
> 
>    * igt@kms_content_protection@type1:
>      - shard-rkl:          [SKIP][618] ([i915#7118] / [i915#9424]) -> [SKIP][619] ([i915#14544]) +1 other test skip
>     [618]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@kms_content_protection@type1.html
>     [619]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_content_protection@type1.html
> 
>    * igt@kms_cursor_crc@cursor-offscreen-512x170:
>      - shard-rkl:          [SKIP][620] ([i915#14544]) -> [SKIP][621] ([i915#13049])
>     [620]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html
>     [621]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-128x42:
>      - shard-rkl:          [FAIL][622] ([i915#13566]) -> [SKIP][623] ([i915#14544])
>     [622]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-7/igt@kms_cursor_crc@cursor-onscreen-128x42.html
>     [623]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-512x512:
>      - shard-rkl:          [SKIP][624] ([i915#13049]) -> [SKIP][625] ([i915#14544])
>     [624]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html
>     [625]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>    * igt@kms_cursor_crc@cursor-random-32x32:
>      - shard-dg1:          [SKIP][626] ([i915#3555]) -> [SKIP][627] ([i915#3555] / [i915#4423])
>     [626]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-dg1-15/igt@kms_cursor_crc@cursor-random-32x32.html
>     [627]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-13/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-max-size:
>      - shard-rkl:          [SKIP][628] ([i915#3555]) -> [SKIP][629] ([i915#14544]) +3 other tests skip
>     [628]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-max-size.html
>     [629]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-max-size.html
> 
>    * igt@kms_cursor_edge_walk@64x64-top-edge:
>      - shard-rkl:          [SKIP][630] ([i915#14544]) -> [DMESG-WARN][631] ([i915#12917] / [i915#12964])
>     [630]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_cursor_edge_walk@64x64-top-edge.html
>     [631]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_cursor_edge_walk@64x64-top-edge.html
> 
>    * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>      - shard-dg1:          [SKIP][632] -> [SKIP][633] ([i915#4423])
>     [632]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-dg1-16/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>     [633]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-15/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>      - shard-rkl:          [SKIP][634] ([i915#4103]) -> [SKIP][635] ([i915#11190] / [i915#14544])
>     [634]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>     [635]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>      - shard-rkl:          [SKIP][636] ([i915#4103]) -> [SKIP][637] ([i915#14544]) +1 other test skip
>     [636]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
>     [637]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>    * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>      - shard-rkl:          [SKIP][638] -> [SKIP][639] ([i915#14544]) +14 other tests skip
>     [638]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
>     [639]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>      - shard-rkl:          [SKIP][640] ([i915#14544]) -> [SKIP][641] +13 other tests skip
>     [640]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
>     [641]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>    * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>      - shard-rkl:          [SKIP][642] ([i915#14544]) -> [SKIP][643] ([i915#9723])
>     [642]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
>     [643]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
> 
>    * igt@kms_dp_aux_dev:
>      - shard-rkl:          [SKIP][644] ([i915#1257]) -> [SKIP][645] ([i915#1257] / [i915#14544])
>     [644]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@kms_dp_aux_dev.html
>     [645]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_dp_aux_dev.html
> 
>    * igt@kms_dp_link_training@non-uhbr-sst:
>      - shard-rkl:          [SKIP][646] ([i915#13749]) -> [SKIP][647] ([i915#14544])
>     [646]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-sst.html
>     [647]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>    * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>      - shard-rkl:          [SKIP][648] ([i915#3840]) -> [SKIP][649] ([i915#14544])
>     [648]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
>     [649]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>    * igt@kms_dsc@dsc-with-bpc:
>      - shard-rkl:          [SKIP][650] ([i915#3555] / [i915#3840]) -> [SKIP][651] ([i915#14544])
>     [650]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-4/igt@kms_dsc@dsc-with-bpc.html
>     [651]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_dsc@dsc-with-bpc.html
> 
>    * igt@kms_feature_discovery@chamelium:
>      - shard-rkl:          [SKIP][652] ([i915#4854]) -> [SKIP][653] ([i915#14544] / [i915#4854])
>     [652]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@kms_feature_discovery@chamelium.html
>     [653]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_feature_discovery@chamelium.html
> 
>    * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>      - shard-rkl:          [SKIP][654] ([i915#14544] / [i915#9934]) -> [SKIP][655] ([i915#9934]) +2 other tests skip
>     [654]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
>     [655]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> 
>    * igt@kms_flip@2x-plain-flip-interruptible:
>      - shard-rkl:          [SKIP][656] ([i915#9934]) -> [SKIP][657] ([i915#14544] / [i915#9934]) +6 other tests skip
>     [656]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@kms_flip@2x-plain-flip-interruptible.html
>     [657]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>      - shard-rkl:          [SKIP][658] ([i915#14544] / [i915#3555]) -> [SKIP][659] ([i915#2672] / [i915#3555])
>     [658]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
>     [659]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
>      - shard-rkl:          [SKIP][660] ([i915#2672] / [i915#3555]) -> [SKIP][661] ([i915#14544] / [i915#3555]) +5 other tests skip
>     [660]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
>     [661]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
>      - shard-rkl:          [SKIP][662] ([i915#1825]) -> [SKIP][663] ([i915#14544] / [i915#1849] / [i915#5354]) +29 other tests skip
>     [662]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
>     [663]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
>      - shard-rkl:          [SKIP][664] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][665] ([i915#1825]) +23 other tests skip
>     [664]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
>     [665]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite:
>      - shard-dg1:          [SKIP][666] ([i915#4423]) -> [SKIP][667] +1 other test skip
>     [666]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html
>     [667]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-pwrite.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
>      - shard-rkl:          [SKIP][668] ([i915#3023]) -> [SKIP][669] ([i915#14544] / [i915#1849] / [i915#5354]) +21 other tests skip
>     [668]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
>     [669]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
>      - shard-rkl:          [SKIP][670] ([i915#14544] / [i915#1849] / [i915#5354]) -> [SKIP][671] ([i915#3023]) +14 other tests skip
>     [670]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
>     [671]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-slowdraw:
>      - shard-dg2:          [SKIP][672] ([i915#3458]) -> [SKIP][673] ([i915#10433] / [i915#3458])
>     [672]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-slowdraw.html
>     [673]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>    * igt@kms_hdr@brightness-with-hdr:
>      - shard-mtlp:         [SKIP][674] ([i915#12713]) -> [SKIP][675] ([i915#1187] / [i915#12713])
>     [674]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-mtlp-3/igt@kms_hdr@brightness-with-hdr.html
>     [675]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
>      - shard-dg1:          [SKIP][676] ([i915#12713]) -> [SKIP][677] ([i915#1187] / [i915#12713])
>     [676]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-dg1-12/igt@kms_hdr@brightness-with-hdr.html
>     [677]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-dg1-13/igt@kms_hdr@brightness-with-hdr.html
> 
>    * igt@kms_hdr@invalid-hdr:
>      - shard-rkl:          [SKIP][678] ([i915#3555] / [i915#8228]) -> [SKIP][679] ([i915#14544])
>     [678]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@kms_hdr@invalid-hdr.html
>     [679]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_hdr@invalid-hdr.html
> 
>    * igt@kms_hdr@invalid-metadata-sizes:
>      - shard-rkl:          [SKIP][680] ([i915#14544]) -> [SKIP][681] ([i915#3555] / [i915#8228])
>     [680]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_hdr@invalid-metadata-sizes.html
>     [681]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_hdr@invalid-metadata-sizes.html
> 
>    * igt@kms_joiner@basic-ultra-joiner:
>      - shard-rkl:          [SKIP][682] ([i915#12339] / [i915#14544]) -> [SKIP][683] ([i915#12339])
>     [682]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_joiner@basic-ultra-joiner.html
>     [683]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-4/igt@kms_joiner@basic-ultra-joiner.html
> 
>    * igt@kms_joiner@invalid-modeset-big-joiner:
>      - shard-rkl:          [SKIP][684] ([i915#10656]) -> [SKIP][685] ([i915#10656] / [i915#14544])
>     [684]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@kms_joiner@invalid-modeset-big-joiner.html
>     [685]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>    * igt@kms_joiner@invalid-modeset-ultra-joiner:
>      - shard-rkl:          [SKIP][686] ([i915#12339]) -> [SKIP][687] ([i915#12339] / [i915#14544])
>     [686]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html
>     [687]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html
> 
>    * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>      - shard-rkl:          [SKIP][688] ([i915#4070] / [i915#4816]) -> [SKIP][689] ([i915#4816])
>     [688]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>     [689]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>    * igt@kms_panel_fitting@legacy:
>      - shard-rkl:          [SKIP][690] ([i915#6301]) -> [SKIP][691] ([i915#14544])
>     [690]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@kms_panel_fitting@legacy.html
>     [691]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_panel_fitting@legacy.html
> 
>    * igt@kms_plane_multiple@2x-tiling-none:
>      - shard-rkl:          [SKIP][692] ([i915#13958]) -> [SKIP][693] ([i915#14544])
>     [692]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-none.html
>     [693]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-none.html
> 
>    * igt@kms_plane_multiple@2x-tiling-yf:
>      - shard-rkl:          [SKIP][694] ([i915#14544]) -> [SKIP][695] ([i915#13958])
>     [694]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-yf.html
>     [695]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>    * igt@kms_plane_multiple@tiling-4:
>      - shard-rkl:          [SKIP][696] ([i915#14544]) -> [SKIP][697] ([i915#14259])
>     [696]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_plane_multiple@tiling-4.html
>     [697]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_plane_multiple@tiling-4.html
> 
>    * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
>      - shard-rkl:          [SKIP][698] ([i915#12247]) -> [SKIP][699] ([i915#12247] / [i915#14544])
>     [698]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
>     [699]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
> 
>    * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b:
>      - shard-rkl:          [SKIP][700] ([i915#12247]) -> [SKIP][701] ([i915#12247] / [i915#14544] / [i915#8152]) +1 other test skip
>     [700]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html
>     [701]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-b.html
> 
>    * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
>      - shard-rkl:          [SKIP][702] ([i915#12247] / [i915#14544] / [i915#8152]) -> [SKIP][703] ([i915#12247]) +1 other test skip
>     [702]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
>     [703]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
> 
>    * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:
>      - shard-rkl:          [SKIP][704] ([i915#12247] / [i915#14544]) -> [SKIP][705] ([i915#12247])
>     [704]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a.html
>     [705]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a.html
> 
>    * igt@kms_pm_backlight@brightness-with-dpms:
>      - shard-rkl:          [SKIP][706] ([i915#12343]) -> [SKIP][707] ([i915#12343] / [i915#14544])
>     [706]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-5/igt@kms_pm_backlight@brightness-with-dpms.html
>     [707]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_pm_backlight@brightness-with-dpms.html
> 
>    * igt@kms_pm_dc@dc6-psr:
>      - shard-rkl:          [SKIP][708] ([i915#9685]) -> [SKIP][709] ([i915#14544] / [i915#9685]) +1 other test skip
>     [708]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@kms_pm_dc@dc6-psr.html
>     [709]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_pm_dc@dc6-psr.html
> 
>    * igt@kms_pm_dc@dc9-dpms:
>      - shard-rkl:          [SKIP][710] ([i915#14544] / [i915#4281]) -> [SKIP][711] ([i915#4281])
>     [710]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html
>     [711]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@kms_pm_dc@dc9-dpms.html
> 
>    * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>      - shard-rkl:          [SKIP][712] ([i915#14544] / [i915#9519]) -> [SKIP][713] ([i915#9519])
>     [712]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>     [713]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>    * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
>      - shard-rkl:          [SKIP][714] ([i915#11520] / [i915#14544]) -> [SKIP][715] ([i915#11520]) +5 other tests skip
>     [714]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
>     [715]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>    * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
>      - shard-rkl:          [SKIP][716] ([i915#11520]) -> [SKIP][717] ([i915#11520] / [i915#14544]) +5 other tests skip
>     [716]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-7/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
>     [717]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
> 
>    * igt@kms_psr2_su@page_flip-nv12:
>      - shard-rkl:          [SKIP][718] ([i915#9683]) -> [SKIP][719] ([i915#14544] / [i915#9683])
>     [718]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@kms_psr2_su@page_flip-nv12.html
>     [719]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_psr2_su@page_flip-nv12.html
> 
>    * igt@kms_psr@pr-primary-mmap-gtt:
>      - shard-rkl:          [SKIP][720] ([i915#1072] / [i915#14544] / [i915#9732]) -> [SKIP][721] ([i915#1072] / [i915#9732]) +15 other tests skip
>     [720]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_psr@pr-primary-mmap-gtt.html
>     [721]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@kms_psr@pr-primary-mmap-gtt.html
> 
>    * igt@kms_psr@psr-sprite-plane-move:
>      - shard-rkl:          [SKIP][722] ([i915#1072] / [i915#9732]) -> [SKIP][723] ([i915#1072] / [i915#14544] / [i915#9732]) +19 other tests skip
>     [722]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-4/igt@kms_psr@psr-sprite-plane-move.html
>     [723]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html
> 
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>      - shard-rkl:          [SKIP][724] ([i915#5289]) -> [SKIP][725] ([i915#14544])
>     [724]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
>     [725]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>      - shard-rkl:          [SKIP][726] ([i915#14544]) -> [SKIP][727] ([i915#5289])
>     [726]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>     [727]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>    * igt@kms_rotation_crc@sprite-rotation-180:
>      - shard-rkl:          [DMESG-WARN][728] ([i915#12964]) -> [SKIP][729] ([i915#14544])
>     [728]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-4/igt@kms_rotation_crc@sprite-rotation-180.html
>     [729]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_rotation_crc@sprite-rotation-180.html
> 
>    * igt@kms_scaling_modes@scaling-mode-none:
>      - shard-rkl:          [SKIP][730] ([i915#14544]) -> [SKIP][731] ([i915#3555]) +1 other test skip
>     [730]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@kms_scaling_modes@scaling-mode-none.html
>     [731]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-2/igt@kms_scaling_modes@scaling-mode-none.html
> 
>    * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>      - shard-rkl:          [SKIP][732] ([i915#8623]) -> [SKIP][733] ([i915#14544])
>     [732]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>     [733]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>    * igt@perf@gen8-unprivileged-single-ctx-counters:
>      - shard-rkl:          [SKIP][734] ([i915#14544] / [i915#2436]) -> [SKIP][735] ([i915#2436])
>     [734]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@perf@gen8-unprivileged-single-ctx-counters.html
>     [735]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@perf@gen8-unprivileged-single-ctx-counters.html
> 
>    * igt@perf_pmu@rc6-all-gts:
>      - shard-rkl:          [SKIP][736] ([i915#14544] / [i915#8516]) -> [SKIP][737] ([i915#8516])
>     [736]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@perf_pmu@rc6-all-gts.html
>     [737]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-5/igt@perf_pmu@rc6-all-gts.html
> 
>    * igt@prime_vgem@basic-write:
>      - shard-rkl:          [SKIP][738] ([i915#14544] / [i915#3291] / [i915#3708]) -> [SKIP][739] ([i915#3291] / [i915#3708])
>     [738]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-6/igt@prime_vgem@basic-write.html
>     [739]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-7/igt@prime_vgem@basic-write.html
> 
>    * igt@prime_vgem@fence-read-hang:
>      - shard-rkl:          [SKIP][740] ([i915#3708]) -> [SKIP][741] ([i915#14544] / [i915#3708])
>     [740]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8515/shard-rkl-8/igt@prime_vgem@fence-read-hang.html
>     [741]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/shard-rkl-6/igt@prime_vgem@fence-read-hang.html
> 
>    
>    {name}: This element is suppressed. This means it is ignored when computing
>            the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>    [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>    [i915#10393]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10393
>    [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>    [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>    [i915#10538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538
>    [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
>    [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>    [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
>    [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
>    [i915#11190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11190
>    [i915#11441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11441
>    [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>    [i915#11521]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11521
>    [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>    [i915#11713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713
>    [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
>    [i915#11920]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920
>    [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>    [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
>    [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
>    [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
>    [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
>    [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
>    [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343
>    [i915#12353]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12353
>    [i915#12388]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12388
>    [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454
>    [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
>    [i915#12655]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12655
>    [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712
>    [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713
>    [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
>    [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
>    [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12761
>    [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
>    [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
>    [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
>    [i915#12942]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12942
>    [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
>    [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
>    [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
>    [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
>    [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356
>    [i915#13363]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13363
>    [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
>    [i915#13427]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13427
>    [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
>    [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
>    [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
>    [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
>    [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13717
>    [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748
>    [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
>    [i915#13783]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13783
>    [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958
>    [i915#14024]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14024
>    [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14033
>    [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098
>    [i915#14118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118
>    [i915#14123]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123
>    [i915#14259]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259
>    [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544
>    [i915#14545]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14545
>    [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14702
>    [i915#14712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712
>    [i915#14756]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14756
>    [i915#14806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14806
>    [i915#14809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14809
>    [i915#14850]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14850
>    [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>    [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>    [i915#1839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839
>    [i915#1849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1849
>    [i915#2346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346
>    [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
>    [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
>    [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>    [i915#2582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2582
>    [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>    [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
>    [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>    [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>    [i915#284]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/284
>    [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>    [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>    [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>    [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>    [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>    [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>    [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>    [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>    [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>    [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>    [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>    [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>    [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>    [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>    [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>    [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>    [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
>    [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>    [i915#4036]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036
>    [i915#4070]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4070
>    [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>    [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>    [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>    [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>    [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>    [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
>    [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>    [i915#4281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281
>    [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
>    [i915#4387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387
>    [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>    [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>    [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
>    [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>    [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>    [i915#4771]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771
>    [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>    [i915#4816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4816
>    [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
>    [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
>    [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>    [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
>    [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>    [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
>    [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
>    [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
>    [i915#5107]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5107
>    [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
>    [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>    [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>    [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>    [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>    [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
>    [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
>    [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>    [i915#6113]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113
>    [i915#6187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6187
>    [i915#6230]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230
>    [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
>    [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
>    [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
>    [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
>    [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
>    [i915#6403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6403
>    [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
>    [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>    [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
>    [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
>    [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
>    [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
>    [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>    [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>    [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
>    [i915#7294]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7294
>    [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
>    [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
>    [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>    [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>    [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>    [i915#8152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8152
>    [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>    [i915#8346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8346
>    [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
>    [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>    [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>    [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>    [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
>    [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
>    [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>    [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>    [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>    [i915#8808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808
>    [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
>    [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
>    [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
>    [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
>    [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
>    [i915#8826]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8826
>    [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>    [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
>    [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>    [i915#9457]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9457
>    [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
>    [i915#9561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561
>    [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>    [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>    [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>    [i915#9723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723
>    [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>    [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>    [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
>    [i915#9878]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9878
>    [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>    [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>    [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>    * CI: CI-20190529 -> None
>    * IGT: IGT_8515 -> IGTPW_13660
> 
>    CI-20190529: 20190529
>    CI_DRM_17087: a6266a4e06191737946de23e04597c13834cce70 @ git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_13660: 3f0089c8a4af50a67d1b69d34d36e01a519bdc04 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_8515: 8515
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13660/index.html
> 

