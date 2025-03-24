Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17F2C36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 13:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C12510E3C1;
	Mon, 24 Mar 2025 13:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bj2rOBB8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AD710E3C1
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 13:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742823181; x=1774359181;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=tXEYcuh6sok1g/R1/pS5G+pCDgN9LC9fSKnHduBunmk=;
 b=bj2rOBB8iZTagzy5wWhncqscefrr5DSakqyfSnK3J3YTR9WfJT4g52fy
 Ww7hzsEllNTeo1mgpaV5KSLIggOpWCTE//7x9Hw3xe4k9mTxvkQtYfU9J
 B0X1vX535tlEe4I1gxpzGl/YS6EUy0FxMxtF0SnxkNXDMnFDp65TbfoJF
 NlyIjBnGJKUuPlv1uGQ/RXgq0cDlLa2XOHBenWutQJR+SR3Svf7LHR5Id
 ul6hJfT9cx7SLybMe/ziJF6Q4y+9AL5xLbR/utI2ww/E2DAqOcMRb7/ZN
 hGgRSfeIKW2OzXkysySFWHqLwb7YfUNbm7/wPbQT9IC+/SVmHdKK3zjMf w==;
X-CSE-ConnectionGUID: TUJi8jkNSh6SW+19xlXPeA==
X-CSE-MsgGUID: NZCfiNLqSdWadP3fwoOvSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55401416"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="55401416"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:33:00 -0700
X-CSE-ConnectionGUID: eIF2qHGRTNCCn0VXxFvb1g==
X-CSE-MsgGUID: Sweo2KsLREqcg08BNqa6OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="124003053"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.80.52])
 ([10.245.80.52])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:32:58 -0700
Message-ID: <551520e2-801b-4f73-9e4a-f422cf8dfda8@linux.intel.com>
Date: Mon, 24 Mar 2025 14:32:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/int?=
 =?UTF-8?Q?el/xe=5Ffault=5Finjection=3A_Injection_list_clear_at_exit?=
To: igt-dev@lists.freedesktop.org
References: <20250321095306.798153-1-marcin.bernatowicz@linux.intel.com>
 <174258343379.65891.8194406834392391015@18a75f3d1eae>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <174258343379.65891.8194406834392391015@18a75f3d1eae>
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



On 3/21/2025 7:57 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_fault_injection: Injection list clear at exit
> URL   : https://patchwork.freedesktop.org/series/146575/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16299_full -> IGTPW_12810_full
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with IGTPW_12810_full absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_12810_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>    Additional (1): shard-dg2-set2
>    Missing    (1): shard-snb-0
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in IGTPW_12810_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@kms_flip@blocking-wf_vblank@a-vga1:
>      - shard-snb:          [PASS][1] -> [FAIL][2] +1 other test fail
>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb7/igt@kms_flip@blocking-wf_vblank@a-vga1.html
>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb1/igt@kms_flip@blocking-wf_vblank@a-vga1.html
> 
>    * igt@kms_flip@blocking-wf_vblank@c-hdmi-a1:
>      - shard-tglu:         [PASS][3] -> [FAIL][4] +5 other tests fail
>     [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-tglu-7/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html
>     [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-10/igt@kms_flip@blocking-wf_vblank@c-hdmi-a1.html
> 
>    * igt@kms_flip@blocking-wf_vblank@c-hdmi-a3:
>      - shard-dg2:          [PASS][5] -> [FAIL][6] +4 other tests fail
>     [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg2-3/igt@kms_flip@blocking-wf_vblank@c-hdmi-a3.html
>     [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-6/igt@kms_flip@blocking-wf_vblank@c-hdmi-a3.html
> 
>    * igt@kms_flip@plain-flip-fb-recreate-interruptible:
>      - shard-rkl:          [PASS][7] -> [FAIL][8]
>     [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
>     [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
>      - shard-dg2:          [PASS][9] -> [INCOMPLETE][10] +1 other test incomplete
>     [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg2-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
>     [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
> 

Not related to the change.
--
marcin

>    
> Known issues
> ------------
> 
>    Here are the changes found in IGTPW_12810_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@api_intel_bb@object-reloc-purge-cache:
>      - shard-dg2-9:        NOTRUN -> [SKIP][11] ([i915#8411])
>     [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>    * igt@device_reset@unbind-cold-reset-rebind:
>      - shard-mtlp:         NOTRUN -> [SKIP][12] ([i915#11078])
>     [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-1/igt@device_reset@unbind-cold-reset-rebind.html
> 
>    * igt@drm_fdinfo@most-busy-idle-check-all@bcs0:
>      - shard-dg1:          NOTRUN -> [SKIP][13] ([i915#8414]) +5 other tests skip
>     [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-12/igt@drm_fdinfo@most-busy-idle-check-all@bcs0.html
> 
>    * igt@drm_fdinfo@most-busy-idle-check-all@ccs0:
>      - shard-mtlp:         NOTRUN -> [SKIP][14] ([i915#8414]) +7 other tests skip
>     [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-3/igt@drm_fdinfo@most-busy-idle-check-all@ccs0.html
> 
>    * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
>      - shard-dg2:          NOTRUN -> [SKIP][15] ([i915#8414]) +15 other tests skip
>     [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-5/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html
> 
>    * igt@gem_caching@reads:
>      - shard-rkl:          [PASS][16] -> [DMESG-WARN][17] ([i915#12964]) +30 other tests dmesg-warn
>     [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-8/igt@gem_caching@reads.html
>     [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-7/igt@gem_caching@reads.html
> 
>    * igt@gem_ccs@large-ctrl-surf-copy:
>      - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#13008])
>     [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-1/igt@gem_ccs@large-ctrl-surf-copy.html
>      - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#13008])
>     [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-6/igt@gem_ccs@large-ctrl-surf-copy.html
> 
>    * igt@gem_ccs@suspend-resume:
>      - shard-rkl:          NOTRUN -> [SKIP][20] ([i915#9323]) +1 other test skip
>     [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-4/igt@gem_ccs@suspend-resume.html
>      - shard-dg1:          NOTRUN -> [SKIP][21] ([i915#9323])
>     [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-15/igt@gem_ccs@suspend-resume.html
>      - shard-tglu:         NOTRUN -> [SKIP][22] ([i915#9323])
>     [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-10/igt@gem_ccs@suspend-resume.html
>      - shard-mtlp:         NOTRUN -> [SKIP][23] ([i915#9323])
>     [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-8/igt@gem_ccs@suspend-resume.html
> 
>    * igt@gem_compute@compute-square:
>      - shard-dg2:          NOTRUN -> [FAIL][24] ([i915#13665])
>     [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-10/igt@gem_compute@compute-square.html
> 
>    * igt@gem_create@create-ext-cpu-access-big:
>      - shard-tglu:         NOTRUN -> [SKIP][25] ([i915#6335])
>     [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-10/igt@gem_create@create-ext-cpu-access-big.html
> 
>    * igt@gem_create@create-ext-set-pat:
>      - shard-tglu:         NOTRUN -> [SKIP][26] ([i915#8562])
>     [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-10/igt@gem_create@create-ext-set-pat.html
> 
>    * igt@gem_ctx_exec@basic-norecovery:
>      - shard-mtlp:         [PASS][27] -> [ABORT][28] ([i915#13193]) +2 other tests abort
>     [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-mtlp-8/igt@gem_ctx_exec@basic-norecovery.html
>     [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-7/igt@gem_ctx_exec@basic-norecovery.html
> 
>    * igt@gem_ctx_isolation@preservation-s3@bcs0:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][29] ([i915#12353]) +1 other test incomplete
>     [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk1/igt@gem_ctx_isolation@preservation-s3@bcs0.html
> 
>    * igt@gem_ctx_persistence@heartbeat-many:
>      - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#8555])
>     [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-19/igt@gem_ctx_persistence@heartbeat-many.html
>      - shard-mtlp:         NOTRUN -> [SKIP][31] ([i915#8555])
>     [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-2/igt@gem_ctx_persistence@heartbeat-many.html
> 
>    * igt@gem_ctx_persistence@legacy-engines-hostile:
>      - shard-snb:          NOTRUN -> [SKIP][32] ([i915#1099])
>     [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb6/igt@gem_ctx_persistence@legacy-engines-hostile.html
> 
>    * igt@gem_ctx_sseu@engines:
>      - shard-dg2-9:        NOTRUN -> [SKIP][33] ([i915#280])
>     [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@gem_ctx_sseu@engines.html
> 
>    * igt@gem_eio@hibernate:
>      - shard-tglu-1:       NOTRUN -> [ABORT][34] ([i915#7975])
>     [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@gem_eio@hibernate.html
> 
>    * igt@gem_eio@in-flight-suspend:
>      - shard-rkl:          NOTRUN -> [DMESG-WARN][35] ([i915#12964]) +8 other tests dmesg-warn
>     [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-5/igt@gem_eio@in-flight-suspend.html
> 
>    * igt@gem_eio@kms:
>      - shard-dg1:          [PASS][36] -> [FAIL][37] ([i915#5784])
>     [36]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg1-18/igt@gem_eio@kms.html
>     [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-13/igt@gem_eio@kms.html
> 
>    * igt@gem_eio@unwedge-stress:
>      - shard-snb:          NOTRUN -> [FAIL][38] ([i915#8898])
>     [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb6/igt@gem_eio@unwedge-stress.html
>      - shard-dg1:          [PASS][39] -> [FAIL][40] ([i915#12714] / [i915#5784])
>     [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg1-19/igt@gem_eio@unwedge-stress.html
>     [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-12/igt@gem_eio@unwedge-stress.html
> 
>    * igt@gem_exec_balancer@bonded-true-hang:
>      - shard-dg2:          NOTRUN -> [SKIP][41] ([i915#4812])
>     [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-4/igt@gem_exec_balancer@bonded-true-hang.html
> 
>    * igt@gem_exec_balancer@noheartbeat:
>      - shard-dg2:          NOTRUN -> [SKIP][42] ([i915#8555]) +1 other test skip
>     [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-7/igt@gem_exec_balancer@noheartbeat.html
> 
>    * igt@gem_exec_balancer@parallel:
>      - shard-tglu:         NOTRUN -> [SKIP][43] ([i915#4525])
>     [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-3/igt@gem_exec_balancer@parallel.html
> 
>    * igt@gem_exec_balancer@parallel-keep-submit-fence:
>      - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#4525])
>     [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-4/igt@gem_exec_balancer@parallel-keep-submit-fence.html
> 
>    * igt@gem_exec_capture@capture@vecs0-lmem0:
>      - shard-dg2-9:        NOTRUN -> [FAIL][45] ([i915#11965]) +4 other tests fail
>     [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@gem_exec_capture@capture@vecs0-lmem0.html
> 
>    * igt@gem_exec_endless@dispatch@vcs1:
>      - shard-dg2:          NOTRUN -> [TIMEOUT][46] ([i915#3778] / [i915#7016]) +1 other test timeout
>     [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-11/igt@gem_exec_endless@dispatch@vcs1.html
> 
>    * igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>      - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#3539] / [i915#4852]) +3 other tests skip
>     [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-2/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html
> 
>    * igt@gem_exec_flush@basic-batch-kernel-default-uc:
>      - shard-dg2-9:        NOTRUN -> [SKIP][48] ([i915#3539] / [i915#4852])
>     [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@gem_exec_flush@basic-batch-kernel-default-uc.html
> 
>    * igt@gem_exec_flush@basic-uc-ro-default:
>      - shard-dg1:          NOTRUN -> [SKIP][49] ([i915#3539] / [i915#4852]) +1 other test skip
>     [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-15/igt@gem_exec_flush@basic-uc-ro-default.html
> 
>    * igt@gem_exec_params@secure-non-root:
>      - shard-dg2-9:        NOTRUN -> [SKIP][50] +10 other tests skip
>     [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@gem_exec_params@secure-non-root.html
> 
>    * igt@gem_exec_reloc@basic-cpu-wc-active:
>      - shard-dg2-9:        NOTRUN -> [SKIP][51] ([i915#3281]) +3 other tests skip
>     [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@gem_exec_reloc@basic-cpu-wc-active.html
> 
>    * igt@gem_exec_reloc@basic-gtt-wc-active:
>      - shard-rkl:          NOTRUN -> [SKIP][52] ([i915#3281]) +6 other tests skip
>     [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-8/igt@gem_exec_reloc@basic-gtt-wc-active.html
> 
>    * igt@gem_exec_reloc@basic-wc-gtt-noreloc:
>      - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#3281]) +5 other tests skip
>     [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-15/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html
>      - shard-mtlp:         NOTRUN -> [SKIP][54] ([i915#3281]) +4 other tests skip
>     [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-3/igt@gem_exec_reloc@basic-wc-gtt-noreloc.html
> 
>    * igt@gem_exec_reloc@basic-write-read-active:
>      - shard-dg2:          NOTRUN -> [SKIP][55] ([i915#3281]) +11 other tests skip
>     [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html
> 
>    * igt@gem_exec_suspend@basic-s0@smem:
>      - shard-dg2-9:        NOTRUN -> [INCOMPLETE][56] ([i915#11441] / [i915#13304]) +1 other test incomplete
>     [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@gem_exec_suspend@basic-s0@smem.html
> 
>    * igt@gem_exec_suspend@basic-s3-devices:
>      - shard-dg1:          [PASS][57] -> [DMESG-WARN][58] ([i915#4423]) +2 other tests dmesg-warn
>     [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg1-17/igt@gem_exec_suspend@basic-s3-devices.html
>     [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-14/igt@gem_exec_suspend@basic-s3-devices.html
> 
>    * igt@gem_fence_thrash@bo-copy:
>      - shard-dg2-9:        NOTRUN -> [SKIP][59] ([i915#4860])
>     [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@gem_fence_thrash@bo-copy.html
> 
>    * igt@gem_fenced_exec_thrash@no-spare-fences:
>      - shard-dg1:          NOTRUN -> [SKIP][60] ([i915#4860]) +1 other test skip
>     [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-13/igt@gem_fenced_exec_thrash@no-spare-fences.html
>      - shard-mtlp:         NOTRUN -> [SKIP][61] ([i915#4860]) +2 other tests skip
>     [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-spare-fences.html
>      - shard-dg2:          NOTRUN -> [SKIP][62] ([i915#4860]) +1 other test skip
>     [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-1/igt@gem_fenced_exec_thrash@no-spare-fences.html
> 
>    * igt@gem_lmem_swapping@parallel-multi:
>      - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#4613]) +4 other tests skip
>     [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-8/igt@gem_lmem_swapping@parallel-multi.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][64] ([i915#4613]) +1 other test skip
>     [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@gem_lmem_swapping@parallel-multi.html
> 
>    * igt@gem_lmem_swapping@parallel-random:
>      - shard-glk:          NOTRUN -> [SKIP][65] ([i915#4613]) +5 other tests skip
>     [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk4/igt@gem_lmem_swapping@parallel-random.html
> 
>    * igt@gem_lmem_swapping@smem-oom@lmem0:
>      - shard-dg2:          [PASS][66] -> [TIMEOUT][67] ([i915#5493]) +1 other test timeout
>     [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg2-6/igt@gem_lmem_swapping@smem-oom@lmem0.html
>     [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-10/igt@gem_lmem_swapping@smem-oom@lmem0.html
>      - shard-dg1:          [PASS][68] -> [TIMEOUT][69] ([i915#5493]) +1 other test timeout
>     [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html
>     [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-19/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>    * igt@gem_lmem_swapping@verify-ccs:
>      - shard-dg1:          NOTRUN -> [SKIP][70] ([i915#12193])
>     [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs.html
>      - shard-tglu:         NOTRUN -> [SKIP][71] ([i915#4613]) +1 other test skip
>     [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-3/igt@gem_lmem_swapping@verify-ccs.html
>      - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#4613]) +1 other test skip
>     [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-2/igt@gem_lmem_swapping@verify-ccs.html
> 
>    * igt@gem_lmem_swapping@verify-ccs@lmem0:
>      - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4565])
>     [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-18/igt@gem_lmem_swapping@verify-ccs@lmem0.html
> 
>    * igt@gem_mmap@bad-offset:
>      - shard-dg1:          NOTRUN -> [SKIP][74] ([i915#4083]) +1 other test skip
>     [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-15/igt@gem_mmap@bad-offset.html
> 
>    * igt@gem_mmap_gtt@basic-write-cpu-read-gtt:
>      - shard-dg2-9:        NOTRUN -> [SKIP][75] ([i915#4077]) +2 other tests skip
>     [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@gem_mmap_gtt@basic-write-cpu-read-gtt.html
> 
>    * igt@gem_mmap_wc@bad-offset:
>      - shard-dg2-9:        NOTRUN -> [SKIP][76] ([i915#4083]) +1 other test skip
>     [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@gem_mmap_wc@bad-offset.html
> 
>    * igt@gem_mmap_wc@invalid-flags:
>      - shard-dg2:          NOTRUN -> [SKIP][77] ([i915#4083]) +1 other test skip
>     [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-6/igt@gem_mmap_wc@invalid-flags.html
> 
>    * igt@gem_mmap_wc@read-write:
>      - shard-mtlp:         NOTRUN -> [SKIP][78] ([i915#4083]) +2 other tests skip
>     [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-1/igt@gem_mmap_wc@read-write.html
> 
>    * igt@gem_partial_pwrite_pread@reads-display:
>      - shard-mtlp:         NOTRUN -> [SKIP][79] ([i915#3282]) +1 other test skip
>     [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-2/igt@gem_partial_pwrite_pread@reads-display.html
> 
>    * igt@gem_partial_pwrite_pread@write-display:
>      - shard-dg2:          NOTRUN -> [SKIP][80] ([i915#3282]) +2 other tests skip
>     [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-8/igt@gem_partial_pwrite_pread@write-display.html
> 
>    * igt@gem_partial_pwrite_pread@write-uncached:
>      - shard-dg2-9:        NOTRUN -> [SKIP][81] ([i915#3282]) +3 other tests skip
>     [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@gem_partial_pwrite_pread@write-uncached.html
> 
>    * igt@gem_pread@exhaustion:
>      - shard-snb:          NOTRUN -> [WARN][82] ([i915#2658])
>     [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb7/igt@gem_pread@exhaustion.html
> 
>    * igt@gem_pwrite@basic-exhaustion:
>      - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#3282]) +3 other tests skip
>     [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-7/igt@gem_pwrite@basic-exhaustion.html
>      - shard-dg1:          NOTRUN -> [SKIP][84] ([i915#3282]) +1 other test skip
>     [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-18/igt@gem_pwrite@basic-exhaustion.html
>      - shard-tglu:         NOTRUN -> [WARN][85] ([i915#2658])
>     [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-2/igt@gem_pwrite@basic-exhaustion.html
> 
>    * igt@gem_pxp@display-protected-crc:
>      - shard-dg1:          NOTRUN -> [SKIP][86] ([i915#4270]) +2 other tests skip
>     [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-18/igt@gem_pxp@display-protected-crc.html
> 
>    * igt@gem_pxp@hw-rejects-pxp-buffer:
>      - shard-rkl:          NOTRUN -> [TIMEOUT][87] ([i915#12917] / [i915#12964]) +2 other tests timeout
>     [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-1/igt@gem_pxp@hw-rejects-pxp-buffer.html
>      - shard-tglu:         NOTRUN -> [SKIP][88] ([i915#13398]) +1 other test skip
>     [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-5/igt@gem_pxp@hw-rejects-pxp-buffer.html
>      - shard-mtlp:         NOTRUN -> [SKIP][89] ([i915#13398])
>     [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-2/igt@gem_pxp@hw-rejects-pxp-buffer.html
> 
>    * igt@gem_pxp@reject-modify-context-protection-off-1:
>      - shard-rkl:          [PASS][90] -> [TIMEOUT][91] ([i915#12917] / [i915#12964]) +1 other test timeout
>     [90]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-1.html
>     [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-5/igt@gem_pxp@reject-modify-context-protection-off-1.html
> 
>    * igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>      - shard-dg2:          NOTRUN -> [SKIP][92] ([i915#4270]) +2 other tests skip
>     [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-5/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html
> 
>    * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>      - shard-dg2-9:        NOTRUN -> [SKIP][93] ([i915#4270])
>     [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> 
>    * igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
>      - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#8428]) +3 other tests skip
>     [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-8/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html
> 
>    * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
>      - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#5190] / [i915#8428]) +4 other tests skip
>     [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-10/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html
> 
>    * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
>      - shard-dg2-9:        NOTRUN -> [SKIP][96] ([i915#5190] / [i915#8428]) +1 other test skip
>     [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html
> 
>    * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>      - shard-rkl:          NOTRUN -> [SKIP][97] ([i915#8411])
>     [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-5/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
> 
>    * igt@gem_softpin@evict-snoop:
>      - shard-mtlp:         NOTRUN -> [SKIP][98] ([i915#4885])
>     [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-7/igt@gem_softpin@evict-snoop.html
> 
>    * igt@gem_softpin@noreloc-s3:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][99] ([i915#13809])
>     [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk7/igt@gem_softpin@noreloc-s3.html
> 
>    * igt@gem_tiled_pread_pwrite:
>      - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#4079])
>     [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-11/igt@gem_tiled_pread_pwrite.html
> 
>    * igt@gem_tiled_swapping@non-threaded:
>      - shard-mtlp:         NOTRUN -> [SKIP][101] ([i915#4077]) +4 other tests skip
>     [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-4/igt@gem_tiled_swapping@non-threaded.html
> 
>    * igt@gem_tiling_max_stride:
>      - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#4077]) +12 other tests skip
>     [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-2/igt@gem_tiling_max_stride.html
>      - shard-dg1:          NOTRUN -> [SKIP][103] ([i915#4077]) +3 other tests skip
>     [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-18/igt@gem_tiling_max_stride.html
> 
>    * igt@gem_userptr_blits@coherency-unsync:
>      - shard-dg2:          NOTRUN -> [SKIP][104] ([i915#3297])
>     [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-3/igt@gem_userptr_blits@coherency-unsync.html
>      - shard-rkl:          NOTRUN -> [SKIP][105] ([i915#3297])
>     [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-3/igt@gem_userptr_blits@coherency-unsync.html
>      - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#3297])
>     [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-12/igt@gem_userptr_blits@coherency-unsync.html
>      - shard-mtlp:         NOTRUN -> [SKIP][107] ([i915#3297]) +1 other test skip
>     [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-3/igt@gem_userptr_blits@coherency-unsync.html
> 
>    * igt@gem_userptr_blits@create-destroy-unsync:
>      - shard-tglu-1:       NOTRUN -> [SKIP][108] ([i915#3297]) +3 other tests skip
>     [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>    * igt@gem_userptr_blits@dmabuf-sync:
>      - shard-rkl:          NOTRUN -> [SKIP][109] ([i915#3297] / [i915#3323])
>     [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-3/igt@gem_userptr_blits@dmabuf-sync.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][110] ([i915#3297] / [i915#3323])
>     [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@gem_userptr_blits@dmabuf-sync.html
> 
>    * igt@gem_userptr_blits@relocations:
>      - shard-dg2:          NOTRUN -> [SKIP][111] ([i915#3281] / [i915#3297])
>     [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-5/igt@gem_userptr_blits@relocations.html
>      - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#3281] / [i915#3297])
>     [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-6/igt@gem_userptr_blits@relocations.html
>      - shard-dg1:          NOTRUN -> [SKIP][113] ([i915#3281] / [i915#3297])
>     [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-12/igt@gem_userptr_blits@relocations.html
>      - shard-mtlp:         NOTRUN -> [SKIP][114] ([i915#3281] / [i915#3297])
>     [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-3/igt@gem_userptr_blits@relocations.html
> 
>    * igt@gen9_exec_parse@bb-start-cmd:
>      - shard-tglu-1:       NOTRUN -> [SKIP][115] ([i915#2527] / [i915#2856]) +2 other tests skip
>     [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@gen9_exec_parse@bb-start-cmd.html
> 
>    * igt@gen9_exec_parse@bb-start-far:
>      - shard-dg2-9:        NOTRUN -> [SKIP][116] ([i915#2856])
>     [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@gen9_exec_parse@bb-start-far.html
> 
>    * igt@gen9_exec_parse@valid-registers:
>      - shard-dg2:          NOTRUN -> [SKIP][117] ([i915#2856]) +2 other tests skip
>     [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-6/igt@gen9_exec_parse@valid-registers.html
>      - shard-rkl:          NOTRUN -> [SKIP][118] ([i915#2527]) +1 other test skip
>     [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-4/igt@gen9_exec_parse@valid-registers.html
>      - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#2527])
>     [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-15/igt@gen9_exec_parse@valid-registers.html
>      - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#2527] / [i915#2856])
>     [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-10/igt@gen9_exec_parse@valid-registers.html
>      - shard-mtlp:         NOTRUN -> [SKIP][121] ([i915#2856])
>     [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-8/igt@gen9_exec_parse@valid-registers.html
> 
>    * igt@i915_module_load@reload:
>      - shard-snb:          [PASS][122] -> [ABORT][123] ([i915#11703])
>     [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb5/igt@i915_module_load@reload.html
>     [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb4/igt@i915_module_load@reload.html
> 
>    * igt@i915_pm_freq_api@freq-basic-api:
>      - shard-tglu:         NOTRUN -> [SKIP][124] ([i915#8399])
>     [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-3/igt@i915_pm_freq_api@freq-basic-api.html
> 
>    * igt@i915_pm_freq_api@freq-reset-multiple:
>      - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#8399]) +1 other test skip
>     [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-7/igt@i915_pm_freq_api@freq-reset-multiple.html
> 
>    * igt@i915_pm_freq_mult@media-freq@gt0:
>      - shard-tglu-1:       NOTRUN -> [SKIP][126] ([i915#6590]) +1 other test skip
>     [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html
> 
>    * igt@i915_pm_rc6_residency@rc6-idle:
>      - shard-tglu:         NOTRUN -> [WARN][127] ([i915#13790] / [i915#2681]) +4 other tests warn
>     [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-9/igt@i915_pm_rc6_residency@rc6-idle.html
> 
>    * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
>      - shard-dg1:          [PASS][128] -> [FAIL][129] ([i915#3591])
>     [128]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
>     [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
> 
>    * igt@i915_pm_rps@min-max-config-idle:
>      - shard-dg2:          NOTRUN -> [SKIP][130] ([i915#11681] / [i915#6621])
>     [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-4/igt@i915_pm_rps@min-max-config-idle.html
>      - shard-dg1:          NOTRUN -> [SKIP][131] ([i915#11681] / [i915#6621])
>     [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-16/igt@i915_pm_rps@min-max-config-idle.html
>      - shard-mtlp:         NOTRUN -> [SKIP][132] ([i915#11681] / [i915#6621])
>     [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-7/igt@i915_pm_rps@min-max-config-idle.html
> 
>    * igt@i915_pm_rps@min-max-config-loaded:
>      - shard-dg2-9:        NOTRUN -> [SKIP][133] ([i915#11681] / [i915#6621])
>     [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@i915_pm_rps@min-max-config-loaded.html
> 
>    * igt@i915_pm_rps@reset:
>      - shard-mtlp:         NOTRUN -> [FAIL][134] ([i915#8346])
>     [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-3/igt@i915_pm_rps@reset.html
> 
>    * igt@i915_pm_rps@thresholds-idle:
>      - shard-mtlp:         NOTRUN -> [SKIP][135] ([i915#11681])
>     [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-2/igt@i915_pm_rps@thresholds-idle.html
>      - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#11681])
>     [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-2/igt@i915_pm_rps@thresholds-idle.html
>      - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#11681])
>     [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-18/igt@i915_pm_rps@thresholds-idle.html
> 
>    * igt@i915_pm_sseu@full-enable:
>      - shard-mtlp:         NOTRUN -> [SKIP][138] ([i915#8437])
>     [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-8/igt@i915_pm_sseu@full-enable.html
> 
>    * igt@i915_selftest@mock@memory_region:
>      - shard-glk:          NOTRUN -> [DMESG-WARN][139] ([i915#9311]) +1 other test dmesg-warn
>     [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk3/igt@i915_selftest@mock@memory_region.html
>      - shard-dg2:          NOTRUN -> [DMESG-WARN][140] ([i915#9311]) +1 other test dmesg-warn
>     [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-8/igt@i915_selftest@mock@memory_region.html
> 
>    * igt@i915_suspend@basic-s3-without-i915:
>      - shard-rkl:          [PASS][141] -> [INCOMPLETE][142] ([i915#4817])
>     [141]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-1/igt@i915_suspend@basic-s3-without-i915.html
>     [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-3/igt@i915_suspend@basic-s3-without-i915.html
> 
>    * igt@kms_addfb_basic@tile-pitch-mismatch:
>      - shard-dg2:          NOTRUN -> [SKIP][143] ([i915#4212])
>     [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-10/igt@kms_addfb_basic@tile-pitch-mismatch.html
> 
>    * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
>      - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#8709]) +1 other test skip
>     [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html
> 
>    * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
>      - shard-dg2:          NOTRUN -> [SKIP][145] ([i915#8709]) +15 other tests skip
>     [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html
> 
>    * igt@kms_async_flips@invalid-async-flip:
>      - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#12967] / [i915#6228])
>     [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-10/igt@kms_async_flips@invalid-async-flip.html
> 
>    * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>      - shard-dg2:          [PASS][147] -> [FAIL][148] ([i915#5956]) +1 other test fail
>     [147]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
>     [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
> 
>    * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>      - shard-glk:          NOTRUN -> [SKIP][149] ([i915#1769])
>     [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][150] ([i915#1769] / [i915#3555])
>     [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
> 
>    * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>      - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#5286]) +6 other tests skip
>     [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-8/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
> 
>    * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>      - shard-rkl:          NOTRUN -> [SKIP][152] ([i915#5286]) +3 other tests skip
>     [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
>      - shard-dg1:          NOTRUN -> [SKIP][153] ([i915#4538] / [i915#5286]) +3 other tests skip
>     [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-18/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>    * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>      - shard-tglu-1:       NOTRUN -> [SKIP][154] ([i915#5286]) +1 other test skip
>     [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>    * igt@kms_big_fb@linear-64bpp-rotate-270:
>      - shard-mtlp:         NOTRUN -> [SKIP][155] +16 other tests skip
>     [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-8/igt@kms_big_fb@linear-64bpp-rotate-270.html
> 
>    * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>      - shard-rkl:          NOTRUN -> [SKIP][156] ([i915#3638]) +4 other tests skip
>     [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
>      - shard-dg1:          NOTRUN -> [SKIP][157] ([i915#3638]) +1 other test skip
>     [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-18/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
> 
>    * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>      - shard-dg2:          NOTRUN -> [SKIP][158] ([i915#4538] / [i915#5190]) +10 other tests skip
>     [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>    * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>      - shard-dg2-9:        NOTRUN -> [SKIP][159] ([i915#4538] / [i915#5190]) +4 other tests skip
>     [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
> 
>    * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
>      - shard-dg1:          NOTRUN -> [SKIP][160] ([i915#4538]) +2 other tests skip
>     [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-19/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> 
>    * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>      - shard-dg2:          NOTRUN -> [SKIP][161] ([i915#5190])
>     [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-1/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>    * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>      - shard-dg2-9:        NOTRUN -> [SKIP][162] ([i915#10307] / [i915#6095]) +34 other tests skip
>     [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
> 
>    * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
>      - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#10307] / [i915#10434] / [i915#6095]) +1 other test skip
>     [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html
> 
>    * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>      - shard-dg2:          NOTRUN -> [SKIP][164] ([i915#12313]) +1 other test skip
>     [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>      - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#12313]) +2 other tests skip
>     [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>      - shard-dg1:          NOTRUN -> [SKIP][166] ([i915#12313]) +1 other test skip
>     [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-18/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>      - shard-tglu:         NOTRUN -> [SKIP][167] ([i915#12313]) +2 other tests skip
>     [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
>      - shard-mtlp:         NOTRUN -> [SKIP][168] ([i915#12313]) +1 other test skip
>     [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
> 
>    * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
>      - shard-tglu:         NOTRUN -> [SKIP][169] ([i915#6095]) +54 other tests skip
>     [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-10/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1.html
> 
>    * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4:
>      - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#6095]) +116 other tests skip
>     [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-16/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-4.html
> 
>    * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#6095]) +44 other tests skip
>     [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-5/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs@pipe-d-edp-1.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>      - shard-tglu-1:       NOTRUN -> [SKIP][172] ([i915#12313])
>     [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-c-dp-3:
>      - shard-dg2:          NOTRUN -> [SKIP][173] ([i915#10307] / [i915#6095]) +184 other tests skip
>     [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-11/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-c-dp-3.html
> 
>    * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>      - shard-mtlp:         NOTRUN -> [SKIP][174] ([i915#12805])
>     [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
>      - shard-glk:          [PASS][175] -> [INCOMPLETE][176] ([i915#12796])
>     [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-glk9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html
>     [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk8/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
>      - shard-dg2:          NOTRUN -> [SKIP][177] ([i915#6095]) +20 other tests skip
>     [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>    * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][178] ([i915#12796]) +1 other test incomplete
>     [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2:
>      - shard-rkl:          NOTRUN -> [SKIP][179] ([i915#6095]) +86 other tests skip
>     [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-a-hdmi-a-2.html
> 
>    * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1:
>      - shard-tglu-1:       NOTRUN -> [SKIP][180] ([i915#6095]) +39 other tests skip
>     [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_cdclk@mode-transition-all-outputs:
>      - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#13784])
>     [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-2/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>    * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
>      - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#13781]) +3 other tests skip
>     [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html
> 
>    * igt@kms_cdclk@plane-scaling:
>      - shard-tglu-1:       NOTRUN -> [SKIP][183] ([i915#3742])
>     [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_cdclk@plane-scaling.html
> 
>    * igt@kms_chamelium_audio@dp-audio-edid:
>      - shard-dg2-9:        NOTRUN -> [SKIP][184] ([i915#11151] / [i915#7828]) +2 other tests skip
>     [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_chamelium_audio@dp-audio-edid.html
> 
>    * igt@kms_chamelium_color@ctm-green-to-red:
>      - shard-dg2:          NOTRUN -> [SKIP][185] +11 other tests skip
>     [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-5/igt@kms_chamelium_color@ctm-green-to-red.html
> 
>    * igt@kms_chamelium_edid@hdmi-edid-read:
>      - shard-tglu-1:       NOTRUN -> [SKIP][186] ([i915#11151] / [i915#7828]) +7 other tests skip
>     [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>    * igt@kms_chamelium_edid@vga-edid-read:
>      - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#11151] / [i915#7828]) +3 other tests skip
>     [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-12/igt@kms_chamelium_edid@vga-edid-read.html
> 
>    * igt@kms_chamelium_frames@dp-crc-single:
>      - shard-tglu:         NOTRUN -> [SKIP][188] ([i915#11151] / [i915#7828]) +6 other tests skip
>     [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-6/igt@kms_chamelium_frames@dp-crc-single.html
> 
>    * igt@kms_chamelium_frames@hdmi-crc-fast:
>      - shard-dg2:          NOTRUN -> [SKIP][189] ([i915#11151] / [i915#7828]) +5 other tests skip
>     [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-10/igt@kms_chamelium_frames@hdmi-crc-fast.html
> 
>    * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>      - shard-rkl:          NOTRUN -> [SKIP][190] ([i915#11151] / [i915#7828]) +5 other tests skip
>     [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-5/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html
> 
>    * igt@kms_chamelium_hpd@vga-hpd:
>      - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#11151] / [i915#7828]) +3 other tests skip
>     [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-6/igt@kms_chamelium_hpd@vga-hpd.html
> 
>    * igt@kms_content_protection@atomic@pipe-a-dp-4:
>      - shard-dg2:          NOTRUN -> [FAIL][192] ([i915#7173])
>     [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-10/igt@kms_content_protection@atomic@pipe-a-dp-4.html
> 
>    * igt@kms_content_protection@dp-mst-lic-type-0:
>      - shard-dg2:          NOTRUN -> [SKIP][193] ([i915#3299])
>     [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-6/igt@kms_content_protection@dp-mst-lic-type-0.html
> 
>    * igt@kms_content_protection@dp-mst-type-0:
>      - shard-tglu-1:       NOTRUN -> [SKIP][194] ([i915#3116] / [i915#3299])
>     [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_content_protection@dp-mst-type-0.html
> 
>    * igt@kms_content_protection@legacy:
>      - shard-dg2:          NOTRUN -> [SKIP][195] ([i915#7118] / [i915#9424])
>     [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-1/igt@kms_content_protection@legacy.html
>      - shard-tglu:         NOTRUN -> [SKIP][196] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
>     [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-3/igt@kms_content_protection@legacy.html
> 
>    * igt@kms_content_protection@type1:
>      - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424])
>     [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_content_protection@type1.html
> 
>    * igt@kms_cursor_crc@cursor-offscreen-32x10:
>      - shard-dg2-9:        NOTRUN -> [SKIP][198] ([i915#3555])
>     [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_cursor_crc@cursor-offscreen-32x10.html
> 
>    * igt@kms_cursor_crc@cursor-offscreen-512x512:
>      - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#13049])
>     [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-11/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-128x42:
>      - shard-mtlp:         NOTRUN -> [SKIP][200] ([i915#8814])
>     [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-256x85:
>      - shard-tglu:         [PASS][201] -> [FAIL][202] ([i915#13566]) +5 other tests fail
>     [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-tglu-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html
>     [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html
> 
>    * igt@kms_cursor_crc@cursor-onscreen-512x512:
>      - shard-tglu-1:       NOTRUN -> [SKIP][203] ([i915#13049])
>     [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>    * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2:
>      - shard-rkl:          NOTRUN -> [FAIL][204] ([i915#13566]) +1 other test fail
>     [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-8/igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-2.html
> 
>    * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>      - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#3555]) +5 other tests skip
>     [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][206] ([i915#3555]) +1 other test skip
>     [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
>      - shard-mtlp:         NOTRUN -> [SKIP][207] ([i915#3555] / [i915#8814])
>     [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
> 
>    * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
>      - shard-rkl:          NOTRUN -> [SKIP][208] ([i915#13049])
>     [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-256x85:
>      - shard-tglu:         NOTRUN -> [FAIL][209] ([i915#13566]) +1 other test fail
>     [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-256x85.html
> 
>    * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2:
>      - shard-rkl:          [PASS][210] -> [FAIL][211] ([i915#13566]) +5 other tests fail
>     [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-1/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html
>     [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-2.html
> 
>    * igt@kms_cursor_crc@cursor-suspend:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][212] ([i915#12358] / [i915#7882])
>     [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk2/igt@kms_cursor_crc@cursor-suspend.html
> 
>    * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][213] ([i915#12358])
>     [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk2/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>      - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#4103])
>     [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>      - shard-dg2:          NOTRUN -> [SKIP][215] ([i915#4103] / [i915#4213])
>     [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>    * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
>      - shard-glk:          NOTRUN -> [DMESG-WARN][216] ([i915#118])
>     [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk8/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
> 
>    * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
>      - shard-dg2-9:        NOTRUN -> [SKIP][217] ([i915#13046] / [i915#5354]) +1 other test skip
>     [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>      - shard-dg2:          NOTRUN -> [SKIP][218] ([i915#13046] / [i915#5354]) +4 other tests skip
>     [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>      - shard-mtlp:         NOTRUN -> [SKIP][219] ([i915#9809]) +3 other tests skip
>     [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>    * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
>      - shard-rkl:          NOTRUN -> [SKIP][220] +13 other tests skip
>     [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
> 
>    * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>      - shard-dg2:          [PASS][221] -> [SKIP][222] ([i915#3555])
>     [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
>     [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
> 
>    * igt@kms_dp_link_training@non-uhbr-mst:
>      - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#13749])
>     [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-8/igt@kms_dp_link_training@non-uhbr-mst.html
> 
>    * igt@kms_dp_linktrain_fallback@dsc-fallback:
>      - shard-dg2:          NOTRUN -> [SKIP][224] ([i915#13707])
>     [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>    * igt@kms_draw_crc@draw-method-mmap-gtt:
>      - shard-dg2-9:        NOTRUN -> [SKIP][225] ([i915#8812])
>     [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_draw_crc@draw-method-mmap-gtt.html
> 
>    * igt@kms_dsc@dsc-fractional-bpp:
>      - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#3840] / [i915#9688])
>     [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-8/igt@kms_dsc@dsc-fractional-bpp.html
>      - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#3840])
>     [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-5/igt@kms_dsc@dsc-fractional-bpp.html
>      - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#3840])
>     [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-16/igt@kms_dsc@dsc-fractional-bpp.html
>      - shard-tglu:         NOTRUN -> [SKIP][229] ([i915#3840])
>     [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-9/igt@kms_dsc@dsc-fractional-bpp.html
>      - shard-mtlp:         NOTRUN -> [SKIP][230] ([i915#3840] / [i915#9688])
>     [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-1/igt@kms_dsc@dsc-fractional-bpp.html
> 
>    * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>      - shard-dg2-9:        NOTRUN -> [SKIP][231] ([i915#3840])
>     [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>    * igt@kms_dsc@dsc-with-bpc:
>      - shard-tglu:         NOTRUN -> [SKIP][232] ([i915#3555] / [i915#3840])
>     [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-2/igt@kms_dsc@dsc-with-bpc.html
> 
>    * igt@kms_dsc@dsc-with-formats:
>      - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#3555] / [i915#3840])
>     [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-4/igt@kms_dsc@dsc-with-formats.html
> 
>    * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>      - shard-dg2:          NOTRUN -> [SKIP][234] ([i915#13798])
>     [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
> 
>    * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>      - shard-dg2-9:        NOTRUN -> [SKIP][235] ([i915#13798])
>     [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
> 
>    * igt@kms_fbcon_fbt@fbc-suspend:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][236] ([i915#9878])
>     [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk5/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>    * igt@kms_feature_discovery@chamelium:
>      - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#2065] / [i915#4854])
>     [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-9/igt@kms_feature_discovery@chamelium.html
> 
>    * igt@kms_feature_discovery@psr2:
>      - shard-dg2-9:        NOTRUN -> [SKIP][238] ([i915#658])
>     [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_feature_discovery@psr2.html
> 
>    * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>      - shard-dg2-9:        NOTRUN -> [SKIP][239] ([i915#9934]) +1 other test skip
>     [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
> 
>    * igt@kms_flip@2x-flip-vs-fences-interruptible:
>      - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#8381]) +1 other test skip
>     [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-8/igt@kms_flip@2x-flip-vs-fences-interruptible.html
> 
>    * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>      - shard-tglu-1:       NOTRUN -> [SKIP][241] ([i915#3637]) +4 other tests skip
>     [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>    * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>      - shard-mtlp:         NOTRUN -> [SKIP][242] ([i915#3637])
>     [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>      - shard-dg1:          NOTRUN -> [SKIP][243] ([i915#9934])
>     [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-12/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>    * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
>      - shard-dg2:          NOTRUN -> [SKIP][244] ([i915#9934]) +2 other tests skip
>     [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-3/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
> 
>    * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>      - shard-tglu:         NOTRUN -> [SKIP][245] ([i915#3637]) +3 other tests skip
>     [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>    * igt@kms_flip@2x-plain-flip-interruptible:
>      - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#9934]) +6 other tests skip
>     [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-7/igt@kms_flip@2x-plain-flip-interruptible.html
> 
>    * igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a1:
>      - shard-rkl:          NOTRUN -> [DMESG-WARN][247] ([i915#12917] / [i915#12964]) +2 other tests dmesg-warn
>     [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-7/igt@kms_flip@absolute-wf_vblank-interruptible@b-hdmi-a1.html
> 
>    * igt@kms_flip@flip-vs-fences-interruptible:
>      - shard-dg1:          NOTRUN -> [SKIP][248] ([i915#8381])
>     [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-16/igt@kms_flip@flip-vs-fences-interruptible.html
> 
>    * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2:
>      - shard-rkl:          [PASS][249] -> [DMESG-FAIL][250] ([i915#12964]) +1 other test dmesg-fail
>     [249]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-3/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html
>     [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-6/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a2.html
> 
>    * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a2:
>      - shard-rkl:          [PASS][251] -> [FAIL][252] ([i915#13734])
>     [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a2.html
>     [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a2.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>      - shard-tglu-1:       NOTRUN -> [SKIP][253] ([i915#2587] / [i915#2672]) +3 other tests skip
>     [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>      - shard-rkl:          NOTRUN -> [SKIP][254] ([i915#2672] / [i915#3555]) +4 other tests skip
>     [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>      - shard-mtlp:         NOTRUN -> [SKIP][255] ([i915#2672] / [i915#3555] / [i915#8813]) +3 other tests skip
>     [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>      - shard-dg1:          NOTRUN -> [SKIP][256] ([i915#2587] / [i915#2672] / [i915#3555])
>     [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
>      - shard-tglu:         NOTRUN -> [SKIP][257] ([i915#2587] / [i915#2672] / [i915#3555])
>     [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
>      - shard-mtlp:         NOTRUN -> [SKIP][258] ([i915#2672] / [i915#8813]) +3 other tests skip
>     [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-7/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
>      - shard-dg2:          NOTRUN -> [SKIP][259] ([i915#2672]) +4 other tests skip
>     [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
>      - shard-rkl:          NOTRUN -> [SKIP][260] ([i915#2672]) +4 other tests skip
>     [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
>      - shard-dg1:          NOTRUN -> [SKIP][261] ([i915#2587] / [i915#2672]) +1 other test skip
>     [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
>      - shard-tglu:         NOTRUN -> [SKIP][262] ([i915#2587] / [i915#2672]) +3 other tests skip
>     [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>      - shard-tglu-1:       NOTRUN -> [SKIP][263] ([i915#2672] / [i915#3555]) +3 other tests skip
>     [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>      - shard-dg2:          NOTRUN -> [SKIP][264] ([i915#2672] / [i915#3555]) +1 other test skip
>     [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
>      - shard-dg1:          NOTRUN -> [SKIP][265] ([i915#2672] / [i915#3555])
>     [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
>      - shard-tglu:         NOTRUN -> [SKIP][266] ([i915#2672] / [i915#3555]) +2 other tests skip
>     [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>      - shard-dg2:          NOTRUN -> [SKIP][267] ([i915#2672] / [i915#3555] / [i915#5190]) +2 other tests skip
>     [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
>      - shard-dg2:          NOTRUN -> [FAIL][268] ([i915#6880])
>     [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
>      - shard-dg2-9:        NOTRUN -> [SKIP][269] ([i915#8708]) +6 other tests skip
>     [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
>      - shard-mtlp:         NOTRUN -> [SKIP][270] ([i915#1825]) +20 other tests skip
>     [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>      - shard-snb:          [PASS][271] -> [SKIP][272] +3 other tests skip
>     [271]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
>     [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt:
>      - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#8708]) +8 other tests skip
>     [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-gtt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt:
>      - shard-dg2-9:        NOTRUN -> [SKIP][274] ([i915#5354]) +7 other tests skip
>     [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-msflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>      - shard-dg2:          NOTRUN -> [SKIP][275] ([i915#8708]) +17 other tests skip
>     [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
>      - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#1825]) +29 other tests skip
>     [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
>      - shard-dg1:          NOTRUN -> [SKIP][277] +19 other tests skip
>     [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-12/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
>      - shard-tglu-1:       NOTRUN -> [SKIP][278] +54 other tests skip
>     [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>      - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#9766])
>     [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][280] ([i915#9766])
>     [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>      - shard-rkl:          NOTRUN -> [SKIP][281] ([i915#3023]) +14 other tests skip
>     [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
>      - shard-dg1:          NOTRUN -> [SKIP][282] ([i915#3458]) +7 other tests skip
>     [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-rte:
>      - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#3458]) +11 other tests skip
>     [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-rte.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
>      - shard-dg2:          NOTRUN -> [SKIP][284] ([i915#5354]) +33 other tests skip
>     [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>      - shard-mtlp:         NOTRUN -> [SKIP][285] ([i915#8708]) +3 other tests skip
>     [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html
> 
>    * igt@kms_frontbuffer_tracking@psr-slowdraw:
>      - shard-dg2-9:        NOTRUN -> [SKIP][286] ([i915#3458]) +4 other tests skip
>     [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-slowdraw.html
> 
>    * igt@kms_hdr@bpc-switch:
>      - shard-tglu:         NOTRUN -> [SKIP][287] ([i915#3555] / [i915#8228]) +1 other test skip
>     [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-4/igt@kms_hdr@bpc-switch.html
> 
>    * igt@kms_hdr@bpc-switch-dpms:
>      - shard-dg2:          NOTRUN -> [SKIP][288] ([i915#3555] / [i915#8228]) +1 other test skip
>     [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-7/igt@kms_hdr@bpc-switch-dpms.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][289] ([i915#3555] / [i915#8228])
>     [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_hdr@bpc-switch-dpms.html
> 
>    * igt@kms_hdr@static-toggle:
>      - shard-dg1:          NOTRUN -> [SKIP][290] ([i915#3555] / [i915#8228])
>     [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-12/igt@kms_hdr@static-toggle.html
>      - shard-dg2-9:        NOTRUN -> [SKIP][291] ([i915#3555] / [i915#8228])
>     [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_hdr@static-toggle.html
> 
>    * igt@kms_joiner@basic-big-joiner:
>      - shard-dg2-9:        NOTRUN -> [SKIP][292] ([i915#10656])
>     [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_joiner@basic-big-joiner.html
> 
>    * igt@kms_joiner@basic-force-ultra-joiner:
>      - shard-dg2:          NOTRUN -> [SKIP][293] ([i915#10656])
>     [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-5/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>    * igt@kms_joiner@basic-max-non-joiner:
>      - shard-dg2:          NOTRUN -> [SKIP][294] ([i915#13688])
>     [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-4/igt@kms_joiner@basic-max-non-joiner.html
> 
>    * igt@kms_joiner@basic-ultra-joiner:
>      - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#12339])
>     [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-3/igt@kms_joiner@basic-ultra-joiner.html
>      - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#12339])
>     [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-3/igt@kms_joiner@basic-ultra-joiner.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][297] ([i915#12339])
>     [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_joiner@basic-ultra-joiner.html
>      - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#12339])
>     [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-12/igt@kms_joiner@basic-ultra-joiner.html
>      - shard-mtlp:         NOTRUN -> [SKIP][299] ([i915#12339])
>     [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-3/igt@kms_joiner@basic-ultra-joiner.html
> 
>    * igt@kms_joiner@invalid-modeset-big-joiner:
>      - shard-tglu:         NOTRUN -> [SKIP][300] ([i915#10656])
>     [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-6/igt@kms_joiner@invalid-modeset-big-joiner.html
> 
>    * igt@kms_panel_fitting@legacy:
>      - shard-rkl:          NOTRUN -> [SKIP][301] ([i915#6301])
>     [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-1/igt@kms_panel_fitting@legacy.html
> 
>    * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][302] ([i915#13026]) +1 other test incomplete
>     [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk4/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 
>    * igt@kms_plane_alpha_blend@alpha-basic:
>      - shard-glk:          NOTRUN -> [FAIL][303] ([i915#12178])
>     [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk6/igt@kms_plane_alpha_blend@alpha-basic.html
> 
>    * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
>      - shard-glk:          NOTRUN -> [FAIL][304] ([i915#7862]) +1 other test fail
>     [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk6/igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1.html
> 
>    * igt@kms_plane_multiple@tiling-yf:
>      - shard-dg1:          NOTRUN -> [SKIP][305] ([i915#3555]) +4 other tests skip
>     [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-17/igt@kms_plane_multiple@tiling-yf.html
>      - shard-mtlp:         NOTRUN -> [SKIP][306] ([i915#3555] / [i915#8806])
>     [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-6/igt@kms_plane_multiple@tiling-yf.html
>      - shard-dg2:          NOTRUN -> [SKIP][307] ([i915#3555] / [i915#8806])
>     [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-3/igt@kms_plane_multiple@tiling-yf.html
> 
>    * igt@kms_plane_scaling@intel-max-src-size:
>      - shard-dg2:          [PASS][308] -> [SKIP][309] ([i915#6953] / [i915#9423])
>     [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size.html
>     [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-6/igt@kms_plane_scaling@intel-max-src-size.html
> 
>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>      - shard-dg2:          NOTRUN -> [SKIP][310] ([i915#12247] / [i915#9423]) +1 other test skip
>     [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
> 
>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
>      - shard-dg2-9:        NOTRUN -> [SKIP][311] ([i915#12247] / [i915#9423])
>     [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
> 
>    * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
>      - shard-dg2-9:        NOTRUN -> [SKIP][312] ([i915#12247]) +3 other tests skip
>     [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html
> 
>    * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:
>      - shard-mtlp:         NOTRUN -> [SKIP][313] ([i915#12247]) +8 other tests skip
>     [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html
> 
>    * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
>      - shard-tglu-1:       NOTRUN -> [SKIP][314] ([i915#12247]) +13 other tests skip
>     [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
> 
>    * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
>      - shard-tglu:         NOTRUN -> [SKIP][315] ([i915#12247]) +4 other tests skip
>     [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
>      - shard-dg2:          NOTRUN -> [SKIP][316] ([i915#12247]) +11 other tests skip
>     [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-5/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html
> 
>    * igt@kms_plane_scaling@planes-downscale-factor-0-75:
>      - shard-mtlp:         NOTRUN -> [SKIP][317] ([i915#12247] / [i915#3555] / [i915#6953])
>     [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
> 
>    * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
>      - shard-tglu-1:       NOTRUN -> [SKIP][318] ([i915#12247] / [i915#6953])
>     [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
> 
>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>      - shard-rkl:          NOTRUN -> [SKIP][319] ([i915#12247] / [i915#3555])
>     [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
> 
>    * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a:
>      - shard-rkl:          NOTRUN -> [SKIP][320] ([i915#12247]) +6 other tests skip
>     [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-a.html
> 
>    * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>      - shard-dg2:          NOTRUN -> [SKIP][321] ([i915#12247] / [i915#6953] / [i915#9423])
>     [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
> 
>    * igt@kms_pm_backlight@bad-brightness:
>      - shard-rkl:          NOTRUN -> [SKIP][322] ([i915#5354])
>     [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-8/igt@kms_pm_backlight@bad-brightness.html
>      - shard-dg1:          NOTRUN -> [SKIP][323] ([i915#5354])
>     [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-19/igt@kms_pm_backlight@bad-brightness.html
> 
>    * igt@kms_pm_backlight@fade-with-suspend:
>      - shard-tglu-1:       NOTRUN -> [SKIP][324] ([i915#9812]) +1 other test skip
>     [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_pm_backlight@fade-with-suspend.html
> 
>    * igt@kms_pm_dc@dc3co-vpb-simulation:
>      - shard-rkl:          NOTRUN -> [SKIP][325] ([i915#9685])
>     [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>    * igt@kms_pm_dc@dc5-dpms-negative:
>      - shard-mtlp:         NOTRUN -> [SKIP][326] ([i915#13441])
>     [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-1/igt@kms_pm_dc@dc5-dpms-negative.html
> 
>    * igt@kms_pm_dc@dc6-dpms:
>      - shard-dg2:          NOTRUN -> [SKIP][327] ([i915#5978])
>     [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-11/igt@kms_pm_dc@dc6-dpms.html
> 
>    * igt@kms_pm_dc@dc6-psr:
>      - shard-tglu:         NOTRUN -> [SKIP][328] ([i915#9685])
>     [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-10/igt@kms_pm_dc@dc6-psr.html
> 
>    * igt@kms_pm_lpsp@kms-lpsp:
>      - shard-dg2:          [PASS][329] -> [SKIP][330] ([i915#9340])
>     [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html
>     [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-5/igt@kms_pm_lpsp@kms-lpsp.html
>      - shard-tglu-1:       NOTRUN -> [SKIP][331] ([i915#3828])
>     [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html
> 
>    * igt@kms_pm_lpsp@screens-disabled:
>      - shard-dg2:          NOTRUN -> [SKIP][332] ([i915#8430])
>     [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-11/igt@kms_pm_lpsp@screens-disabled.html
> 
>    * igt@kms_pm_rpm@dpms-lpsp:
>      - shard-dg2-9:        NOTRUN -> [SKIP][333] ([i915#9519])
>     [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_pm_rpm@dpms-lpsp.html
> 
>    * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>      - shard-rkl:          [PASS][334] -> [SKIP][335] ([i915#9519])
>     [334]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
>     [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>    * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>      - shard-dg2:          [PASS][336] -> [SKIP][337] ([i915#9519])
>     [336]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
>     [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> 
>    * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>      - shard-mtlp:         NOTRUN -> [SKIP][338] ([i915#9519])
>     [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>    * igt@kms_prime@d3hot:
>      - shard-tglu-1:       NOTRUN -> [SKIP][339] ([i915#6524])
>     [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_prime@d3hot.html
> 
>    * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>      - shard-snb:          NOTRUN -> [SKIP][340] ([i915#11520]) +4 other tests skip
>     [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
>      - shard-dg1:          NOTRUN -> [SKIP][341] ([i915#11520]) +6 other tests skip
>     [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-15/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
>      - shard-tglu:         NOTRUN -> [SKIP][342] ([i915#11520]) +8 other tests skip
>     [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
> 
>    * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
>      - shard-dg2-9:        NOTRUN -> [SKIP][343] ([i915#11520]) +2 other tests skip
>     [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html
> 
>    * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
>      - shard-tglu-1:       NOTRUN -> [SKIP][344] ([i915#11520]) +5 other tests skip
>     [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][345] ([i915#9808])
>     [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html
> 
>    * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
>      - shard-mtlp:         NOTRUN -> [SKIP][346] ([i915#12316]) +5 other tests skip
>     [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html
> 
>    * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
>      - shard-dg2:          NOTRUN -> [SKIP][347] ([i915#11520]) +10 other tests skip
>     [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
>      - shard-rkl:          NOTRUN -> [SKIP][348] ([i915#11520]) +7 other tests skip
>     [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-3/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
> 
>    * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
>      - shard-glk:          NOTRUN -> [SKIP][349] ([i915#11520]) +16 other tests skip
>     [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk2/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
> 
>    * igt@kms_psr2_su@page_flip-p010:
>      - shard-rkl:          NOTRUN -> [SKIP][350] ([i915#9683])
>     [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-7/igt@kms_psr2_su@page_flip-p010.html
> 
>    * igt@kms_psr@fbc-pr-primary-mmap-gtt:
>      - shard-dg2-9:        NOTRUN -> [SKIP][351] ([i915#1072] / [i915#9732]) +8 other tests skip
>     [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_psr@fbc-pr-primary-mmap-gtt.html
> 
>    * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>      - shard-rkl:          NOTRUN -> [SKIP][352] ([i915#1072] / [i915#9732]) +14 other tests skip
>     [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-1/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
>      - shard-dg1:          NOTRUN -> [SKIP][353] ([i915#1072] / [i915#9732]) +8 other tests skip
>     [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-12/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
>      - shard-mtlp:         NOTRUN -> [SKIP][354] ([i915#9688]) +8 other tests skip
>     [354]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-4/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
> 
>    * igt@kms_psr@fbc-psr-primary-page-flip:
>      - shard-dg2:          NOTRUN -> [SKIP][355] ([i915#1072] / [i915#9732]) +21 other tests skip
>     [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-3/igt@kms_psr@fbc-psr-primary-page-flip.html
> 
>    * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
>      - shard-glk:          NOTRUN -> [SKIP][356] +424 other tests skip
>     [356]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk9/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html
> 
>    * igt@kms_psr@psr-sprite-mmap-cpu:
>      - shard-tglu-1:       NOTRUN -> [SKIP][357] ([i915#9732]) +11 other tests skip
>     [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html
> 
>    * igt@kms_psr@psr2-cursor-plane-onoff:
>      - shard-tglu:         NOTRUN -> [SKIP][358] ([i915#9732]) +20 other tests skip
>     [358]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-6/igt@kms_psr@psr2-cursor-plane-onoff.html
> 
>    * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>      - shard-dg2-9:        NOTRUN -> [SKIP][359] ([i915#9685])
>     [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>    * igt@kms_rotation_crc@primary-rotation-270:
>      - shard-dg2:          NOTRUN -> [SKIP][360] ([i915#12755]) +1 other test skip
>     [360]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-2/igt@kms_rotation_crc@primary-rotation-270.html
>      - shard-mtlp:         NOTRUN -> [SKIP][361] ([i915#12755]) +2 other tests skip
>     [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-1/igt@kms_rotation_crc@primary-rotation-270.html
> 
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>      - shard-tglu:         NOTRUN -> [SKIP][362] ([i915#5289]) +2 other tests skip
>     [362]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> 
>    * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>      - shard-dg2:          NOTRUN -> [SKIP][363] ([i915#12755] / [i915#5190]) +1 other test skip
>     [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>      - shard-rkl:          NOTRUN -> [SKIP][364] ([i915#5289])
>     [364]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>      - shard-dg1:          NOTRUN -> [SKIP][365] ([i915#5289])
>     [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-13/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>    * igt@kms_scaling_modes@scaling-mode-full-aspect:
>      - shard-tglu:         NOTRUN -> [SKIP][366] ([i915#3555]) +7 other tests skip
>     [366]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html
> 
>    * igt@kms_selftest@drm_framebuffer:
>      - shard-tglu:         NOTRUN -> [ABORT][367] ([i915#13179]) +1 other test abort
>     [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-9/igt@kms_selftest@drm_framebuffer.html
> 
>    * igt@kms_setmode@basic:
>      - shard-tglu:         NOTRUN -> [FAIL][368] ([i915#5465]) +2 other tests fail
>     [368]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-10/igt@kms_setmode@basic.html
> 
>    * igt@kms_setmode@invalid-clone-exclusive-crtc:
>      - shard-mtlp:         NOTRUN -> [SKIP][369] ([i915#3555] / [i915#8809] / [i915#8823])
>     [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>    * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2:
>      - shard-glk:          NOTRUN -> [INCOMPLETE][370] ([i915#12276])
>     [370]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-2.html
> 
>    * igt@kms_vrr@flip-basic:
>      - shard-dg2:          NOTRUN -> [SKIP][371] ([i915#3555]) +7 other tests skip
>     [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-3/igt@kms_vrr@flip-basic.html
> 
>    * igt@kms_vrr@seamless-rr-switch-vrr:
>      - shard-dg2:          NOTRUN -> [SKIP][372] ([i915#9906])
>     [372]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-6/igt@kms_vrr@seamless-rr-switch-vrr.html
>      - shard-tglu:         NOTRUN -> [SKIP][373] ([i915#9906]) +1 other test skip
>     [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-10/igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>    * igt@kms_writeback@writeback-check-output-xrgb2101010:
>      - shard-tglu-1:       NOTRUN -> [SKIP][374] ([i915#2437] / [i915#9412])
>     [374]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>    * igt@kms_writeback@writeback-fb-id:
>      - shard-glk:          NOTRUN -> [SKIP][375] ([i915#2437]) +2 other tests skip
>     [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk3/igt@kms_writeback@writeback-fb-id.html
> 
>    * igt@kms_writeback@writeback-fb-id-xrgb2101010:
>      - shard-dg2:          NOTRUN -> [SKIP][376] ([i915#2437] / [i915#9412])
>     [376]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>      - shard-rkl:          NOTRUN -> [SKIP][377] ([i915#2437] / [i915#9412]) +1 other test skip
>     [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>      - shard-dg1:          NOTRUN -> [SKIP][378] ([i915#2437] / [i915#9412])
>     [378]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-16/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>      - shard-tglu:         NOTRUN -> [SKIP][379] ([i915#2437] / [i915#9412])
>     [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
>      - shard-mtlp:         NOTRUN -> [SKIP][380] ([i915#2437] / [i915#9412])
>     [380]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
> 
>    * igt@kms_writeback@writeback-invalid-parameters:
>      - shard-tglu-1:       NOTRUN -> [SKIP][381] ([i915#2437])
>     [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@kms_writeback@writeback-invalid-parameters.html
> 
>    * igt@perf_pmu@busy-accuracy-98:
>      - shard-snb:          NOTRUN -> [SKIP][382] +122 other tests skip
>     [382]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb4/igt@perf_pmu@busy-accuracy-98.html
> 
>    * igt@perf_pmu@busy-idle@vecs1:
>      - shard-dg2:          [PASS][383] -> [FAIL][384] ([i915#4349]) +2 other tests fail
>     [383]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg2-5/igt@perf_pmu@busy-idle@vecs1.html
>     [384]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-10/igt@perf_pmu@busy-idle@vecs1.html
> 
>    * igt@perf_pmu@module-unload:
>      - shard-snb:          [PASS][385] -> [INCOMPLETE][386] ([i915#13520])
>     [385]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb7/igt@perf_pmu@module-unload.html
>     [386]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb6/igt@perf_pmu@module-unload.html
> 
>    * igt@perf_pmu@rc6-all-gts:
>      - shard-rkl:          NOTRUN -> [SKIP][387] ([i915#8516])
>     [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-7/igt@perf_pmu@rc6-all-gts.html
>      - shard-dg1:          NOTRUN -> [SKIP][388] ([i915#8516])
>     [388]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-18/igt@perf_pmu@rc6-all-gts.html
>      - shard-tglu:         NOTRUN -> [SKIP][389] ([i915#8516])
>     [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-2/igt@perf_pmu@rc6-all-gts.html
>      - shard-dg2-9:        NOTRUN -> [SKIP][390] ([i915#8516])
>     [390]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-9/igt@perf_pmu@rc6-all-gts.html
> 
>    * igt@perf_pmu@render-node-busy-idle:
>      - shard-mtlp:         [PASS][391] -> [FAIL][392] ([i915#4349]) +3 other tests fail
>     [391]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-mtlp-2/igt@perf_pmu@render-node-busy-idle.html
>     [392]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-4/igt@perf_pmu@render-node-busy-idle.html
> 
>    * igt@prime_vgem@basic-fence-read:
>      - shard-dg2:          NOTRUN -> [SKIP][393] ([i915#3291] / [i915#3708]) +1 other test skip
>     [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-4/igt@prime_vgem@basic-fence-read.html
> 
>    * igt@prime_vgem@fence-read-hang:
>      - shard-rkl:          NOTRUN -> [SKIP][394] ([i915#3708]) +1 other test skip
>     [394]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-8/igt@prime_vgem@fence-read-hang.html
> 
>    * igt@prime_vgem@fence-write-hang:
>      - shard-tglu:         NOTRUN -> [SKIP][395] +63 other tests skip
>     [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-3/igt@prime_vgem@fence-write-hang.html
> 
>    * igt@sriov_basic@enable-vfs-autoprobe-on:
>      - shard-tglu:         NOTRUN -> [FAIL][396] ([i915#12910]) +9 other tests fail
>     [396]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-4/igt@sriov_basic@enable-vfs-autoprobe-on.html
>      - shard-mtlp:         NOTRUN -> [FAIL][397] ([i915#12910]) +18 other tests fail
>     [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-5/igt@sriov_basic@enable-vfs-autoprobe-on.html
>      - shard-dg2:          NOTRUN -> [SKIP][398] ([i915#9917])
>     [398]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-5/igt@sriov_basic@enable-vfs-autoprobe-on.html
>      - shard-rkl:          NOTRUN -> [SKIP][399] ([i915#9917])
>     [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-5/igt@sriov_basic@enable-vfs-autoprobe-on.html
>      - shard-dg1:          NOTRUN -> [SKIP][400] ([i915#9917])
>     [400]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-19/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>    * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:
>      - shard-tglu-1:       NOTRUN -> [FAIL][401] ([i915#12910]) +8 other tests fail
>     [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-1/igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html
> 
>    
> #### Possible fixes ####
> 
>    * igt@core_setmaster@master-drop-set-user:
>      - shard-tglu:         [ABORT][402] -> [PASS][403]
>     [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-tglu-6/igt@core_setmaster@master-drop-set-user.html
>     [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-tglu-5/igt@core_setmaster@master-drop-set-user.html
> 
>    * igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pessimistic:
>      - shard-rkl:          [DMESG-WARN][404] ([i915#12964]) -> [PASS][405] +16 other tests pass
>     [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-5/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pessimistic.html
>     [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-6/igt@drm_buddy@drm_buddy@drm_test_buddy_alloc_pessimistic.html
> 
>    * igt@gem_eio@wait-immediate:
>      - shard-mtlp:         [ABORT][406] ([i915#13193]) -> [PASS][407] +1 other test pass
>     [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-mtlp-7/igt@gem_eio@wait-immediate.html
>     [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-4/igt@gem_eio@wait-immediate.html
> 
>    * igt@gem_pxp@regular-baseline-src-copy-readible:
>      - shard-rkl:          [TIMEOUT][408] ([i915#12964]) -> [PASS][409] +1 other test pass
>     [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-7/igt@gem_pxp@regular-baseline-src-copy-readible.html
>     [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-8/igt@gem_pxp@regular-baseline-src-copy-readible.html
> 
>    * igt@gem_pxp@verify-pxp-stale-buf-optout-execution:
>      - shard-rkl:          [TIMEOUT][410] ([i915#12917] / [i915#12964]) -> [PASS][411]
>     [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-7/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
>     [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-8/igt@gem_pxp@verify-pxp-stale-buf-optout-execution.html
> 
>    * igt@i915_module_load@load:
>      - shard-snb:          ([PASS][412], [PASS][413], [SKIP][414], [PASS][415], [PASS][416], [PASS][417], [PASS][418], [PASS][419], [PASS][420], [PASS][421], [PASS][422], [PASS][423], [PASS][424], [PASS][425], [PASS][426], [PASS][427], [PASS][428], [PASS][429], [PASS][430], [PASS][431], [PASS][432], [PASS][433], [PASS][434], [PASS][435], [PASS][436]) -> ([PASS][437], [PASS][438], [PASS][439], [PASS][440], [PASS][441], [PASS][442], [PASS][443], [PASS][444], [PASS][445], [PASS][446], [PASS][447], [PASS][448], [PASS][449], [PASS][450], [PASS][451], [PASS][452], [PASS][453], [PASS][454], [PASS][455], [PASS][456], [PASS][457], [PASS][458], [PASS][459], [PASS][460], [PASS][461])
>     [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb2/igt@i915_module_load@load.html
>     [413]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb2/igt@i915_module_load@load.html
>     [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb7/igt@i915_module_load@load.html
>     [415]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb2/igt@i915_module_load@load.html
>     [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb7/igt@i915_module_load@load.html
>     [417]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb2/igt@i915_module_load@load.html
>     [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb7/igt@i915_module_load@load.html
>     [419]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb2/igt@i915_module_load@load.html
>     [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb7/igt@i915_module_load@load.html
>     [421]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb7/igt@i915_module_load@load.html
>     [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb4/igt@i915_module_load@load.html
>     [423]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb6/igt@i915_module_load@load.html
>     [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb4/igt@i915_module_load@load.html
>     [425]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb6/igt@i915_module_load@load.html
>     [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb4/igt@i915_module_load@load.html
>     [427]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb6/igt@i915_module_load@load.html
>     [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb4/igt@i915_module_load@load.html
>     [429]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb6/igt@i915_module_load@load.html
>     [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb4/igt@i915_module_load@load.html
>     [431]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb6/igt@i915_module_load@load.html
>     [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb5/igt@i915_module_load@load.html
>     [433]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb5/igt@i915_module_load@load.html
>     [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb5/igt@i915_module_load@load.html
>     [435]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb5/igt@i915_module_load@load.html
>     [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb5/igt@i915_module_load@load.html
>     [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb7/igt@i915_module_load@load.html
>     [438]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb1/igt@i915_module_load@load.html
>     [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb6/igt@i915_module_load@load.html
>     [440]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb1/igt@i915_module_load@load.html
>     [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb7/igt@i915_module_load@load.html
>     [442]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb1/igt@i915_module_load@load.html
>     [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb6/igt@i915_module_load@load.html
>     [444]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb1/igt@i915_module_load@load.html
>     [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb2/igt@i915_module_load@load.html
>     [446]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb2/igt@i915_module_load@load.html
>     [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb6/igt@i915_module_load@load.html
>     [448]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb7/igt@i915_module_load@load.html
>     [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb2/igt@i915_module_load@load.html
>     [450]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb7/igt@i915_module_load@load.html
>     [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb2/igt@i915_module_load@load.html
>     [452]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb6/igt@i915_module_load@load.html
>     [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb4/igt@i915_module_load@load.html
>     [454]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb4/igt@i915_module_load@load.html
>     [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb6/igt@i915_module_load@load.html
>     [456]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb4/igt@i915_module_load@load.html
>     [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb4/igt@i915_module_load@load.html
>     [458]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb5/igt@i915_module_load@load.html
>     [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb5/igt@i915_module_load@load.html
>     [460]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb5/igt@i915_module_load@load.html
>     [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb5/igt@i915_module_load@load.html
> 
>    * igt@i915_module_load@reload-with-fault-injection:
>      - shard-rkl:          [ABORT][462] ([i915#13592]) -> [PASS][463]
>     [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
>     [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html
> 
>    * igt@i915_pm_rc6_residency@rc6-accuracy:
>      - shard-rkl:          [FAIL][464] ([i915#12942]) -> [PASS][465] +1 other test pass
>     [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-6/igt@i915_pm_rc6_residency@rc6-accuracy.html
>     [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-8/igt@i915_pm_rc6_residency@rc6-accuracy.html
> 
>    * igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0:
>      - shard-dg1:          [FAIL][466] ([i915#3591]) -> [PASS][467]
>     [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg1-16/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
>     [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-vecs0.html
> 
>    * igt@i915_pm_rps@reset:
>      - shard-snb:          [INCOMPLETE][468] ([i915#13729] / [i915#13821]) -> [PASS][469]
>     [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb5/igt@i915_pm_rps@reset.html
>     [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb6/igt@i915_pm_rps@reset.html
> 
>    * igt@i915_power@sanity:
>      - shard-mtlp:         [SKIP][470] ([i915#7984]) -> [PASS][471]
>     [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-mtlp-6/igt@i915_power@sanity.html
>     [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-3/igt@i915_power@sanity.html
> 
>    * igt@i915_selftest@live@gt_pm:
>      - shard-rkl:          [DMESG-FAIL][472] ([i915#13550]) -> [PASS][473] +1 other test pass
>     [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-6/igt@i915_selftest@live@gt_pm.html
>     [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-7/igt@i915_selftest@live@gt_pm.html
> 
>    * igt@i915_selftest@live@workarounds:
>      - shard-mtlp:         [DMESG-FAIL][474] ([i915#12061]) -> [PASS][475] +1 other test pass
>     [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-mtlp-1/igt@i915_selftest@live@workarounds.html
>     [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-mtlp-6/igt@i915_selftest@live@workarounds.html
> 
>    * igt@i915_suspend@debugfs-reader:
>      - shard-glk:          [INCOMPLETE][476] ([i915#4817]) -> [PASS][477]
>     [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-glk3/igt@i915_suspend@debugfs-reader.html
>     [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk3/igt@i915_suspend@debugfs-reader.html
> 
>    * igt@kms_cursor_crc@cursor-random-128x42:
>      - shard-rkl:          [FAIL][478] ([i915#13566]) -> [PASS][479]
>     [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-7/igt@kms_cursor_crc@cursor-random-128x42.html
>     [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-5/igt@kms_cursor_crc@cursor-random-128x42.html
> 
>    * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>      - shard-snb:          [FAIL][480] ([i915#11832] / [i915#13734]) -> [PASS][481]
>     [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>     [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
> 
>    * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1:
>      - shard-snb:          [FAIL][482] ([i915#11832]) -> [PASS][483] +4 other tests pass
>     [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1.html
>     [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ab-vga1-hdmi-a1.html
> 
>    * igt@kms_flip@flip-vs-suspend:
>      - shard-dg1:          [DMESG-WARN][484] ([i915#4423]) -> [PASS][485] +2 other tests pass
>     [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg1-16/igt@kms_flip@flip-vs-suspend.html
>     [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-16/igt@kms_flip@flip-vs-suspend.html
> 
>    * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
>      - shard-dg2:          [FAIL][486] ([i915#6880]) -> [PASS][487] +1 other test pass
>     [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
>     [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
> 
>    * igt@kms_pm_rpm@modeset-lpsp:
>      - shard-rkl:          [SKIP][488] ([i915#9519]) -> [PASS][489] +1 other test pass
>     [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp.html
>     [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp.html
> 
>    * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
>      - shard-glk:          [INCOMPLETE][490] ([i915#12276]) -> [PASS][491]
>     [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-glk6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
>     [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
> 
>    * igt@perf_pmu@most-busy-check-all:
>      - shard-rkl:          [FAIL][492] ([i915#4349]) -> [PASS][493] +1 other test pass
>     [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-5/igt@perf_pmu@most-busy-check-all.html
>     [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-5/igt@perf_pmu@most-busy-check-all.html
> 
>    
> #### Warnings ####
> 
>    * igt@gem_pxp@create-valid-protected-context:
>      - shard-rkl:          [SKIP][494] ([i915#4270]) -> [TIMEOUT][495] ([i915#12964])
>     [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-6/igt@gem_pxp@create-valid-protected-context.html
>     [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-7/igt@gem_pxp@create-valid-protected-context.html
> 
>    * igt@gem_pxp@fail-invalid-protected-context:
>      - shard-rkl:          [TIMEOUT][496] ([i915#12964]) -> [SKIP][497] ([i915#4270])
>     [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-5/igt@gem_pxp@fail-invalid-protected-context.html
>     [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-4/igt@gem_pxp@fail-invalid-protected-context.html
> 
>    * igt@gem_pxp@hw-rejects-pxp-context:
>      - shard-rkl:          [TIMEOUT][498] ([i915#12917] / [i915#12964]) -> [FAIL][499] ([i915#13811])
>     [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-5/igt@gem_pxp@hw-rejects-pxp-context.html
>     [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-1/igt@gem_pxp@hw-rejects-pxp-context.html
> 
>    * igt@gem_pxp@reject-modify-context-protection-off-3:
>      - shard-rkl:          [SKIP][500] ([i915#4270]) -> [TIMEOUT][501] ([i915#12917] / [i915#12964])
>     [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-off-3.html
>     [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-6/igt@gem_pxp@reject-modify-context-protection-off-3.html
> 
>    * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-2:
>      - shard-rkl:          [FAIL][502] ([i915#11808]) -> [DMESG-WARN][503] ([i915#12964]) +1 other test dmesg-warn
>     [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-2.html
>     [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-2.html
> 
>    * igt@kms_content_protection@atomic:
>      - shard-dg2:          [SKIP][504] ([i915#7118] / [i915#9424]) -> [FAIL][505] ([i915#7173])
>     [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg2-5/igt@kms_content_protection@atomic.html
>     [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-10/igt@kms_content_protection@atomic.html
> 
>    * igt@kms_content_protection@lic-type-1:
>      - shard-snb:          [INCOMPLETE][506] ([i915#8816]) -> [SKIP][507]
>     [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-snb4/igt@kms_content_protection@lic-type-1.html
>     [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-snb4/igt@kms_content_protection@lic-type-1.html
> 
>    * igt@kms_content_protection@srm:
>      - shard-dg2:          [FAIL][508] ([i915#7173]) -> [SKIP][509] ([i915#7118])
>     [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg2-11/igt@kms_content_protection@srm.html
>     [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-3/igt@kms_content_protection@srm.html
> 
>    * igt@kms_content_protection@uevent:
>      - shard-dg2:          [FAIL][510] ([i915#1339] / [i915#7173]) -> [SKIP][511] ([i915#7118] / [i915#9424])
>     [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg2-10/igt@kms_content_protection@uevent.html
>     [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-4/igt@kms_content_protection@uevent.html
> 
>    * igt@kms_flip@2x-flip-vs-suspend:
>      - shard-glk:          [INCOMPLETE][512] ([i915#12314] / [i915#12745] / [i915#4839]) -> [INCOMPLETE][513] ([i915#12745] / [i915#4839])
>     [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-glk8/igt@kms_flip@2x-flip-vs-suspend.html
>     [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk3/igt@kms_flip@2x-flip-vs-suspend.html
> 
>    * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2:
>      - shard-glk:          [INCOMPLETE][514] ([i915#12314] / [i915#4839]) -> [INCOMPLETE][515] ([i915#4839])
>     [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-glk8/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html
>     [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-glk3/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a1-hdmi-a2.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>      - shard-dg1:          [SKIP][516] ([i915#2672] / [i915#3555] / [i915#4423]) -> [SKIP][517] ([i915#2672] / [i915#3555])
>     [516]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
>     [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
> 
>    * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
>      - shard-dg1:          [SKIP][518] ([i915#2587] / [i915#2672] / [i915#4423]) -> [SKIP][519] ([i915#2587] / [i915#2672])
>     [518]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
>     [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:
>      - shard-dg1:          [SKIP][520] -> [SKIP][521] ([i915#4423])
>     [520]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html
>     [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-14/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
>      - shard-dg2:          [SKIP][522] ([i915#10433] / [i915#3458]) -> [SKIP][523] ([i915#3458]) +1 other test skip
>     [522]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
>     [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-11/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
> 
>    * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
>      - shard-dg2:          [SKIP][524] ([i915#3458]) -> [SKIP][525] ([i915#10433] / [i915#3458]) +4 other tests skip
>     [524]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
>     [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
> 
>    * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite:
>      - shard-dg1:          [SKIP][526] ([i915#3458]) -> [SKIP][527] ([i915#3458] / [i915#4423])
>     [526]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-dg1-12/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html
>     [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-pwrite.html
> 
>    * igt@kms_pm_rpm@pc8-residency:
>      - shard-rkl:          [SKIP][528] -> [SKIP][529] ([i915#12916])
>     [528]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16299/shard-rkl-1/igt@kms_pm_rpm@pc8-residency.html
>     [529]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/shard-rkl-1/igt@kms_pm_rpm@pc8-residency.html
> 
>    
>    [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>    [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>    [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>    [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
>    [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>    [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
>    [i915#11078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078
>    [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151
>    [i915#11441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11441
>    [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520
>    [i915#11681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
>    [i915#11703]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11703
>    [i915#118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118
>    [i915#11808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11808
>    [i915#11832]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832
>    [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965
>    [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>    [i915#12178]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12178
>    [i915#12193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193
>    [i915#12247]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247
>    [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276
>    [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313
>    [i915#12314]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12314
>    [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316
>    [i915#12339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12339
>    [i915#12353]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12353
>    [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358
>    [i915#12714]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12714
>    [i915#12745]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745
>    [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755
>    [i915#12796]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796
>    [i915#12805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805
>    [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910
>    [i915#12916]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12916
>    [i915#12917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917
>    [i915#12942]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12942
>    [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964
>    [i915#12967]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12967
>    [i915#13008]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13008
>    [i915#13026]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026
>    [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046
>    [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049
>    [i915#13179]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179
>    [i915#13193]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13193
>    [i915#13304]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13304
>    [i915#1339]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1339
>    [i915#13398]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398
>    [i915#13441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13441
>    [i915#13520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13520
>    [i915#13550]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13550
>    [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566
>    [i915#13592]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13592
>    [i915#13665]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13665
>    [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688
>    [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707
>    [i915#13729]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13729
>    [i915#13734]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734
>    [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749
>    [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781
>    [i915#13784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13784
>    [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13790
>    [i915#13798]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13798
>    [i915#13809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13809
>    [i915#13811]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13811
>    [i915#13821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13821
>    [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>    [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>    [i915#2065]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065
>    [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
>    [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>    [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>    [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
>    [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>    [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
>    [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>    [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>    [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>    [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>    [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>    [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>    [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>    [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>    [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>    [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
>    [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>    [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>    [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>    [i915#3591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591
>    [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>    [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>    [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>    [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>    [i915#3778]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3778
>    [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
>    [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>    [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>    [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>    [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>    [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>    [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>    [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>    [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>    [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
>    [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>    [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>    [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>    [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
>    [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>    [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>    [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
>    [i915#4839]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839
>    [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>    [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
>    [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>    [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
>    [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>    [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>    [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>    [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>    [i915#5465]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465
>    [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
>    [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
>    [i915#5956]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956
>    [i915#5978]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5978
>    [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>    [i915#6228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6228
>    [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
>    [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
>    [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>    [i915#658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658
>    [i915#6590]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590
>    [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>    [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
>    [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
>    [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
>    [i915#7016]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7016
>    [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>    [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>    [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
>    [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>    [i915#7862]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7862
>    [i915#7882]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882
>    [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
>    [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
>    [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>    [i915#8346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8346
>    [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
>    [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>    [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>    [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
>    [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>    [i915#8430]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430
>    [i915#8437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8437
>    [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
>    [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>    [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
>    [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>    [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
>    [i915#8806]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8806
>    [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
>    [i915#8812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8812
>    [i915#8813]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813
>    [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
>    [i915#8816]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8816
>    [i915#8823]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8823
>    [i915#8898]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8898
>    [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
>    [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>    [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>    [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
>    [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
>    [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>    [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
>    [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>    [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>    [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>    [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>    [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>    [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
>    [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
>    [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
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
>    * IGT: IGT_8277 -> IGTPW_12810
>    * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_16299: b15a87713d14b1c2986f47a622c5a8c5458e2396 @ git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_12810: 12810
>    IGT_8277: 8277
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12810/index.html
> 

