Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB23E7E0C0
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 10:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899B510E3C0;
	Mon,  9 Feb 2026 10:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RBSxSlbx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7770510E3C0;
 Mon,  9 Feb 2026 10:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770632712; x=1802168712;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hl5ZGNLXWE+svj2oFg4nhN9HqYxb0p6AbXSHHS8g500=;
 b=RBSxSlbxCjw+d2GXhEEnmH8NttAXtXfM5kbK3prYybXCHr4XPBnHRrYC
 eZY/g/wJrTp0nxSljsGavD0G14c7AclR13XeI3Lo5E0QQp3xbDS/3PRa2
 YAqkwMyrMunH1V5Op7C3ZikGl0vVyAjNzvxPtXw/hX9Ymsr8IykHVZ5q4
 NY9xR7YqkHptmLcd9wi8asGVyiwYBrZ8w3bs1+NF4EQ1z2NvWEZD2cBvN
 9Bi9ZKt0D2/2aLIypwenZN+3C5zcrUQWajuEMTkpIsOfdYS/V1YLTyvNW
 kbU3Xmsy8vSLrFDRWa7Uu4iGexqyZ/mI9tysslnQq5WtALB7lM6/2SuY4 w==;
X-CSE-ConnectionGUID: r9OXFU3DRnmc72uEFAQxNQ==
X-CSE-MsgGUID: lBwwfQJwRSe1VGioaPSY9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="71805724"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="71805724"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:25:11 -0800
X-CSE-ConnectionGUID: 3gOTwoIGT4uIifl7I2/ClA==
X-CSE-MsgGUID: KdBBFBWfR/6sr3GIngBdqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="211610562"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:25:10 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= i915.CI.Full: failure for lsgpu: Report upstream
 port link bandwidth (rev8)
Date: Mon, 09 Feb 2026 11:25:07 +0100
Message-ID: <1804961.yIU609i1g2@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <177038803004.232293.2642409616691680607@a3b018990fe9>
References: <20260205145427.1338534-8-janusz.krzysztofik@linux.intel.com>
 <177038803004.232293.2642409616691680607@a3b018990fe9>
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

On Friday, 6 February 2026 15:27:10 CET Patchwork wrote:
> == Series Details ==
> 
> Series: lsgpu: Report upstream port link bandwidth (rev8)
> URL   : https://patchwork.freedesktop.org/series/160415/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17940_full -> IGTPW_14507_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14507_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14507_full, please notify your bug team (I915-ci-
infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in 
CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/
index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in 
IGTPW_14507_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane@pixel-format-4-tiled-modifier:
>     - shard-mtlp:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-
warn
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-mtlp-1/
igt@kms_plane@pixel-format-4-tiled-modifier.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-4/
igt@kms_plane@pixel-format-4-tiled-modifier.html

While my patches modify lib/igt_device_scan.c source file which provides code 
more or less involved in every test, only processing paths which are not used 
by the tests, only by an lsgpu tool, are affected.  Then, the above reported 
issue is not related.  Please update filters and re-report.

Thanks,
Janusz

> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_17940_full and 
IGTPW_14507_full:
> 
> ### New IGT tests (2) ###
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x64@pipe-a-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [4.41] s
> 
>   * igt@kms_universal_plane@disable-primary-vs-flip@pipe-a-dp-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.56] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_14507_full that come from known 
issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@drm_buddy@drm_buddy:
>     - shard-dg2:          NOTRUN -> [DMESG-WARN][3] ([i915#15095]) +1 other 
test dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-1/
igt@drm_buddy@drm_buddy.html
> 
>   * igt@gem_basic@multigpu-create-close:
>     - shard-rkl:          NOTRUN -> [SKIP][4] ([i915#7697]) +1 other test 
skip
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-5/
igt@gem_basic@multigpu-create-close.html
> 
>   * igt@gem_ccs@block-multicopy-inplace:
>     - shard-tglu:         NOTRUN -> [SKIP][5] ([i915#3555] / [i915#9323])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-10/
igt@gem_ccs@block-multicopy-inplace.html
> 
>   * igt@gem_ccs@ctrl-surf-copy-new-ctx:
>     - shard-tglu-1:       NOTRUN -> [SKIP][6] ([i915#9323])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@gem_ccs@ctrl-surf-copy-new-ctx.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-tglu-1:       NOTRUN -> [SKIP][7] ([i915#7697])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-rkl:          NOTRUN -> [SKIP][8] ([i915#6335])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-5/
igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_ctx_isolation@preservation-s3:
>     - shard-glk10:        NOTRUN -> [INCOMPLETE][9] ([i915#13356]) +1 other 
test incomplete
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-glk10/
igt@gem_ctx_isolation@preservation-s3.html
> 
>   * igt@gem_ctx_persistence@heartbeat-hostile:
>     - shard-dg2:          NOTRUN -> [SKIP][10] ([i915#8555])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-7/
igt@gem_ctx_persistence@heartbeat-hostile.html
> 
>   * igt@gem_ctx_persistence@legacy-engines-mixed-process:
>     - shard-snb:          NOTRUN -> [SKIP][11] ([i915#1099])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-snb1/
igt@gem_ctx_persistence@legacy-engines-mixed-process.html
> 
>   * igt@gem_ctx_sseu@invalid-sseu:
>     - shard-rkl:          NOTRUN -> [SKIP][12] ([i915#280]) +1 other test 
skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-4/
igt@gem_ctx_sseu@invalid-sseu.html
> 
>   * igt@gem_ctx_sseu@mmap-args:
>     - shard-tglu:         NOTRUN -> [SKIP][13] ([i915#280])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-10/
igt@gem_ctx_sseu@mmap-args.html
> 
>   * igt@gem_exec_balancer@parallel-balancer:
>     - shard-tglu-1:       NOTRUN -> [SKIP][14] ([i915#4525]) +1 other test 
skip
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@gem_exec_balancer@parallel-balancer.html
> 
>   * igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
>     - shard-rkl:          NOTRUN -> [SKIP][15] ([i915#4525])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html
> 
>   * igt@gem_exec_balancer@parallel-keep-submit-fence:
>     - shard-tglu:         NOTRUN -> [SKIP][16] ([i915#4525])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-10/
igt@gem_exec_balancer@parallel-keep-submit-fence.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-tglu-1:       NOTRUN -> [SKIP][17] ([i915#6334]) +1 other test 
skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_capture@capture-recoverable:
>     - shard-rkl:          NOTRUN -> [SKIP][18] ([i915#6344])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-5/
igt@gem_exec_capture@capture-recoverable.html
>     - shard-tglu:         NOTRUN -> [SKIP][19] ([i915#6344])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-3/
igt@gem_exec_capture@capture-recoverable.html
> 
>   * igt@gem_exec_capture@capture@vecs0-lmem0:
>     - shard-dg2:          NOTRUN -> [FAIL][20] ([i915#11965]) +4 other tests 
fail
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-11/
igt@gem_exec_capture@capture@vecs0-lmem0.html
> 
>   * igt@gem_exec_flush@basic-uc-prw-default:
>     - shard-dg2:          NOTRUN -> [SKIP][21] ([i915#3539])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@gem_exec_flush@basic-uc-prw-default.html
> 
>   * igt@gem_exec_flush@basic-wb-set-default:
>     - shard-dg2:          NOTRUN -> [SKIP][22] ([i915#3539] / [i915#4852]) 
+1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-11/
igt@gem_exec_flush@basic-wb-set-default.html
>     - shard-dg1:          NOTRUN -> [SKIP][23] ([i915#3539] / [i915#4852])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-13/
igt@gem_exec_flush@basic-wb-set-default.html
> 
>   * igt@gem_exec_reloc@basic-cpu-noreloc:
>     - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#3281])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-14/
igt@gem_exec_reloc@basic-cpu-noreloc.html
>     - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#3281])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-6/
igt@gem_exec_reloc@basic-cpu-noreloc.html
> 
>   * igt@gem_exec_reloc@basic-gtt-cpu-active:
>     - shard-dg2:          NOTRUN -> [SKIP][26] ([i915#3281]) +5 other tests 
skip
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-6/
igt@gem_exec_reloc@basic-gtt-cpu-active.html
> 
>   * igt@gem_exec_reloc@basic-softpin:
>     - shard-rkl:          NOTRUN -> [SKIP][27] ([i915#14544] / [i915#3281]) 
+1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@gem_exec_reloc@basic-softpin.html
> 
>   * igt@gem_exec_reloc@basic-write-read-noreloc:
>     - shard-rkl:          NOTRUN -> [SKIP][28] ([i915#3281]) +14 other tests 
skip
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@gem_exec_reloc@basic-write-read-noreloc.html
> 
>   * igt@gem_exec_schedule@semaphore-power:
>     - shard-dg2:          NOTRUN -> [SKIP][29] ([i915#4537] / [i915#4812])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-11/
igt@gem_exec_schedule@semaphore-power.html
> 
>   * igt@gem_exec_suspend@basic-s0@smem:
>     - shard-dg2:          [PASS][30] -> [INCOMPLETE][31] ([i915#13356])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-7/
igt@gem_exec_suspend@basic-s0@smem.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-6/
igt@gem_exec_suspend@basic-s0@smem.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
>     - shard-dg2:          NOTRUN -> [SKIP][32] ([i915#4860])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-8/
igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - shard-tglu-1:       NOTRUN -> [SKIP][33] ([i915#4613])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@parallel-multi:
>     - shard-tglu:         NOTRUN -> [SKIP][34] ([i915#4613])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-2/
igt@gem_lmem_swapping@parallel-multi.html
>     - shard-mtlp:         NOTRUN -> [SKIP][35] ([i915#4613])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-3/
igt@gem_lmem_swapping@parallel-multi.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][36] ([i915#4613]) +3 other tests 
skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-5/
igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_lmem_swapping@smem-oom:
>     - shard-glk:          NOTRUN -> [SKIP][37] ([i915#4613]) +1 other test 
skip
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-glk1/
igt@gem_lmem_swapping@smem-oom.html
> 
>   * igt@gem_mmap_gtt@hang-busy:
>     - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#4077])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-1/
igt@gem_mmap_gtt@hang-busy.html
>     - shard-dg1:          NOTRUN -> [SKIP][39] ([i915#4077])
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-15/
igt@gem_mmap_gtt@hang-busy.html
> 
>   * igt@gem_mmap_gtt@zero-extend:
>     - shard-dg2:          NOTRUN -> [SKIP][40] ([i915#4077]) +8 other tests 
skip
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@gem_mmap_gtt@zero-extend.html
> 
>   * igt@gem_mmap_offset@clear-via-pagefault:
>     - shard-mtlp:         [PASS][41] -> [ABORT][42] ([i915#14809]) +1 other 
test abort
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-mtlp-4/
igt@gem_mmap_offset@clear-via-pagefault.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-7/
igt@gem_mmap_offset@clear-via-pagefault.html
> 
>   * igt@gem_mmap_wc@coherency:
>     - shard-dg2:          NOTRUN -> [SKIP][43] ([i915#4083]) +3 other tests 
skip
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-6/
igt@gem_mmap_wc@coherency.html
> 
>   * igt@gem_partial_pwrite_pread@reads:
>     - shard-rkl:          NOTRUN -> [SKIP][44] ([i915#14544] / [i915#3282]) 
+1 other test skip
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@gem_partial_pwrite_pread@reads.html
> 
>   * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
>     - shard-rkl:          NOTRUN -> [SKIP][45] ([i915#3282]) +5 other tests 
skip
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-4/
igt@gem_partial_pwrite_pread@writes-after-reads-uncached.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-glk:          NOTRUN -> [WARN][46] ([i915#14702] / [i915#2658])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-glk3/
igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pxp@display-protected-crc:
>     - shard-dg2:          NOTRUN -> [SKIP][47] ([i915#4270]) +3 other tests 
skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-1/
igt@gem_pxp@display-protected-crc.html
>     - shard-dg1:          NOTRUN -> [SKIP][48] ([i915#4270])
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-14/
igt@gem_pxp@display-protected-crc.html
> 
>   * igt@gem_pxp@hw-rejects-pxp-context:
>     - shard-rkl:          NOTRUN -> [SKIP][49] ([i915#13717])
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@gem_pxp@hw-rejects-pxp-context.html
> 
>   * igt@gem_pxp@verify-pxp-key-change-after-suspend-resume:
>     - shard-rkl:          [PASS][50] -> [SKIP][51] ([i915#4270])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-7/
igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@gem_pxp@verify-pxp-key-change-after-suspend-resume.html
> 
>   * igt@gem_readwrite@read-write:
>     - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#3282]) +2 other tests 
skip
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@gem_readwrite@read-write.html
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs:
>     - shard-dg2:          NOTRUN -> [SKIP][53] ([i915#5190] / [i915#8428])
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@gem_render_copy@y-tiled-ccs-to-yf-tiled-mc-ccs.html
> 
>   * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>     - shard-dg2:          NOTRUN -> [SKIP][54] ([i915#4079]) +1 other test 
skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-1/
igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
>     - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#8411]) +2 other tests 
skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-5/
igt@gem_set_tiling_vs_blt@tiled-to-untiled.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-glk:          NOTRUN -> [SKIP][56] ([i915#3323])
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-glk1/
igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@unsync-overlap:
>     - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3297]) +1 other test 
skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@gem_userptr_blits@unsync-overlap.html
>     - shard-rkl:          NOTRUN -> [SKIP][58] ([i915#3297]) +1 other test 
skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@gem_userptr_blits@unsync-overlap.html
> 
>   * igt@gem_workarounds@suspend-resume:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][59] ([i915#13356] / 
[i915#14586])
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-glk6/
igt@gem_workarounds@suspend-resume.html
> 
>   * igt@gem_workarounds@suspend-resume-fd:
>     - shard-rkl:          [PASS][60] -> [INCOMPLETE][61] ([i915#13356]) +1 
other test incomplete
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-8/
igt@gem_workarounds@suspend-resume-fd.html
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@gem_workarounds@suspend-resume-fd.html
> 
>   * igt@gen7_exec_parse@basic-rejected:
>     - shard-dg2:          NOTRUN -> [SKIP][62] +13 other tests skip
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@gen7_exec_parse@basic-rejected.html
> 
>   * igt@gen9_exec_parse@bb-oversize:
>     - shard-rkl:          NOTRUN -> [SKIP][63] ([i915#2527]) +2 other tests 
skip
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-4/
igt@gen9_exec_parse@bb-oversize.html
> 
>   * igt@gen9_exec_parse@bb-start-param:
>     - shard-dg2:          NOTRUN -> [SKIP][64] ([i915#2856])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-8/
igt@gen9_exec_parse@bb-start-param.html
> 
>   * igt@gen9_exec_parse@shadow-peek:
>     - shard-tglu-1:       NOTRUN -> [SKIP][65] ([i915#2527] / [i915#2856]) 
+1 other test skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@gen9_exec_parse@shadow-peek.html
> 
>   * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:
>     - shard-dg2:          NOTRUN -> [SKIP][66] ([i915#14073]) +15 other 
tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-11/
igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1.html
> 
>   * igt@i915_pm_freq_api@freq-reset-multiple:
>     - shard-tglu:         NOTRUN -> [SKIP][67] ([i915#8399])
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-6/
igt@i915_pm_freq_api@freq-reset-multiple.html
> 
>   * igt@i915_pm_rc6_residency@media-rc6-accuracy:
>     - shard-rkl:          NOTRUN -> [SKIP][68] +16 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-2/
igt@i915_pm_rc6_residency@media-rc6-accuracy.html
> 
>   * igt@i915_query@test-query-geometry-subslices:
>     - shard-rkl:          NOTRUN -> [SKIP][69] ([i915#5723])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-4/
igt@i915_query@test-query-geometry-subslices.html
> 
>   * igt@i915_suspend@basic-s3-without-i915:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][70] ([i915#4817] / 
[i915#7443])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-4/
igt@i915_suspend@basic-s3-without-i915.html
> 
>   * igt@intel_hwmon@hwmon-read:
>     - shard-rkl:          NOTRUN -> [SKIP][71] ([i915#7707])
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-5/
igt@intel_hwmon@hwmon-read.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - shard-dg2:          NOTRUN -> [SKIP][72] ([i915#4215] / [i915#5190])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-7/
igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_async_flips@async-flip-suspend-resume:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][73] ([i915#12761]) +1 other 
test incomplete
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-glk1/
igt@kms_async_flips@async-flip-suspend-resume.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-
panels:
>     - shard-rkl:          NOTRUN -> [SKIP][74] ([i915#1769] / [i915#3555])
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-8/
igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-
panels.html
> 
>   * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][75] ([i915#4538] / [i915#5286])
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-13/
igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
>     - shard-mtlp:         NOTRUN -> [SKIP][76]
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-7/
igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][77] ([i915#14544] / [i915#5286])
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>     - shard-tglu:         NOTRUN -> [SKIP][78] ([i915#5286]) +4 other tests 
skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-10/
igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-rkl:          NOTRUN -> [SKIP][79] ([i915#5286]) +5 other tests 
skip
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-4/
igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-mtlp:         [PASS][80] -> [FAIL][81] ([i915#5138])
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-mtlp-7/
igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-3/
igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-tglu-1:       NOTRUN -> [SKIP][82] ([i915#5286]) +2 other tests 
skip
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][83] ([i915#3638]) +3 other tests 
skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
>     - shard-dg2:          NOTRUN -> [SKIP][84] ([i915#3828])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-7/
igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-rkl:          NOTRUN -> [SKIP][85] ([i915#14544] / [i915#3638])
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][86] ([i915#5190]) +1 other test 
skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-1/
igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
>     - shard-dg2:          NOTRUN -> [SKIP][87] ([i915#4538] / [i915#5190]) 
+6 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-8/
igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-tglu-1:       NOTRUN -> [SKIP][88] +28 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][89] ([i915#6095]) +34 other tests 
skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-3/
igt@kms_ccs@bad-aux-stride-yf-tiled-ccs@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][90] ([i915#14098] / [i915#6095]) 
+52 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-5/
igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][91] ([i915#12313])
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-8/
igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][92] ([i915#6095]) +4 other tests 
skip
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-4/
igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-b-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][93] ([i915#12313]) +1 other test 
skip
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][94] ([i915#10307] / [i915#6095]) 
+131 other tests skip
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-5/
igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-
a-1:
>     - shard-dg1:          NOTRUN -> [SKIP][95] ([i915#6095]) +197 other 
tests skip
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-14/
igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-
a-1.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#14098] / [i915#14544] 
/ [i915#6095]) +2 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][97] ([i915#15582]) +1 other 
test incomplete
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-glk9/
igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][98] ([i915#6095]) +51 other tests 
skip
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-1/
igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-3.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][99] ([i915#14544] / [i915#6095]) 
+4 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][100] ([i915#6095]) +72 other 
tests skip
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-4/
igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-1:
>     - shard-tglu-1:       NOTRUN -> [SKIP][101] ([i915#6095]) +19 other 
tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-1.html
>     - shard-dg2:          NOTRUN -> [SKIP][102] ([i915#10307] / [i915#10434] 
/ [i915#6095])
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-4/
igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][103] ([i915#13781]) +3 other 
tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-5/
igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html
> 
>   * igt@kms_chamelium_audio@hdmi-audio-edid:
>     - shard-dg1:          NOTRUN -> [SKIP][104] ([i915#11151] / [i915#7828])
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-16/
igt@kms_chamelium_audio@hdmi-audio-edid.html
>     - shard-tglu:         NOTRUN -> [SKIP][105] ([i915#11151] / [i915#7828]) 
+4 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-2/
igt@kms_chamelium_audio@hdmi-audio-edid.html
> 
>   * igt@kms_chamelium_frames@dp-crc-fast:
>     - shard-rkl:          NOTRUN -> [SKIP][106] ([i915#11151] / [i915#7828]) 
+5 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-8/
igt@kms_chamelium_frames@dp-crc-fast.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-multiple:
>     - shard-tglu-1:       NOTRUN -> [SKIP][107] ([i915#11151] / [i915#7828]) 
+2 other tests skip
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_chamelium_frames@hdmi-crc-multiple.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][108] ([i915#11151] / [i915#7828]) 
+5 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-6/
igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][109] ([i915#6944] / [i915#7118] / 
[i915#9424])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-6/
igt@kms_content_protection@atomic.html
>     - shard-rkl:          NOTRUN -> [SKIP][110] ([i915#14544] / [i915#6944] 
/ [i915#7118] / [i915#9424])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@atomic-dpms-hdcp14:
>     - shard-tglu-1:       NOTRUN -> [SKIP][111] ([i915#6944])
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_content_protection@atomic-dpms-hdcp14.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
>     - shard-rkl:          NOTRUN -> [SKIP][112] ([i915#15330])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
>     - shard-tglu:         NOTRUN -> [SKIP][113] ([i915#15330])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-9/
igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
> 
>   * igt@kms_content_protection@dp-mst-lic-type-1:
>     - shard-rkl:          NOTRUN -> [SKIP][114] ([i915#15330] / [i915#3116])
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-5/
igt@kms_content_protection@dp-mst-lic-type-1.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-hdcp14:
>     - shard-dg2:          NOTRUN -> [SKIP][115] ([i915#15330])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@kms_content_protection@dp-mst-type-0-hdcp14.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
>     - shard-tglu-1:       NOTRUN -> [SKIP][116] ([i915#15330])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
> 
>   * igt@kms_content_protection@legacy-hdcp14:
>     - shard-rkl:          NOTRUN -> [SKIP][117] ([i915#6944]) +1 other test 
skip
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-2/
igt@kms_content_protection@legacy-hdcp14.html
> 
>   * igt@kms_content_protection@type1:
>     - shard-tglu:         NOTRUN -> [SKIP][118] ([i915#6944] / [i915#7116] / 
[i915#7118] / [i915#9424])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-8/
igt@kms_content_protection@type1.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-32x10:
>     - shard-rkl:          NOTRUN -> [SKIP][119] ([i915#14544] / [i915#3555])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_cursor_crc@cursor-offscreen-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-64x21:
>     - shard-rkl:          [PASS][120] -> [FAIL][121] ([i915#13566]) +1 other 
test fail
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-7/
igt@kms_cursor_crc@cursor-onscreen-64x21.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-4/
igt@kms_cursor_crc@cursor-onscreen-64x21.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [FAIL][122] ([i915#13566]) +1 other test 
fail
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-6/
igt@kms_cursor_crc@cursor-onscreen-64x21@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-random-512x170:
>     - shard-dg2:          NOTRUN -> [SKIP][123] ([i915#13049]) +1 other test 
skip
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-1/
igt@kms_cursor_crc@cursor-random-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>     - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#3555]) +1 other test 
skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
>     - shard-rkl:          NOTRUN -> [SKIP][125] ([i915#3555]) +5 other tests 
skip
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
>     - shard-dg1:          NOTRUN -> [SKIP][126] ([i915#3555]) +1 other test 
skip
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-13/
igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
>     - shard-tglu:         NOTRUN -> [SKIP][127] ([i915#3555]) +4 other tests 
skip
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-2/
igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
>     - shard-mtlp:         NOTRUN -> [SKIP][128] ([i915#3555] / [i915#8814]) 
+1 other test skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-2/
igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-tglu-1:       NOTRUN -> [SKIP][129] ([i915#3555]) +2 other tests 
skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
>     - shard-tglu:         [PASS][130] -> [FAIL][131] ([i915#13566]) +1 other 
test fail
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-7/
igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-rkl:          [PASS][132] -> [INCOMPLETE][133] ([i915#12358] / 
[i915#14152])
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-5/
igt@kms_cursor_crc@cursor-suspend.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][134] ([i915#12358] / 
[i915#14152])
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-dg2:          NOTRUN -> [SKIP][135] ([i915#4103] / [i915#4213]) 
+1 other test skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-7/
igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>     - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#13046] / [i915#5354]) 
+3 other tests skip
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][137] ([i915#14544]) +1 other test 
skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>     - shard-rkl:          NOTRUN -> [SKIP][138] ([i915#14544] / [i915#9067])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][139] ([i915#3804])
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-dg2:          [PASS][140] -> [SKIP][141] ([i915#1257])
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-11/igt@kms_dp_aux_dev.html
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-6/
igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#13749])
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-5/
igt@kms_dp_link_training@non-uhbr-sst.html
>     - shard-tglu:         NOTRUN -> [SKIP][143] ([i915#13749])
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-3/
igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_dp_link_training@uhbr-mst:
>     - shard-rkl:          NOTRUN -> [SKIP][144] ([i915#13748])
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@kms_dp_link_training@uhbr-mst.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#13707])
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-2/
igt@kms_dp_linktrain_fallback@dp-fallback.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][146] ([i915#13707])
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_dp_linktrain_fallback@dsc-fallback:
>     - shard-dg2:          NOTRUN -> [SKIP][147] ([i915#13707])
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@kms_dp_linktrain_fallback@dsc-fallback.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-rkl:          NOTRUN -> [SKIP][148] ([i915#3555] / [i915#3840]) 
+1 other test skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-8/
igt@kms_dsc@dsc-basic.html
>     - shard-tglu:         NOTRUN -> [SKIP][149] ([i915#3555] / [i915#3840])
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-8/
igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-dg2:          NOTRUN -> [SKIP][150] ([i915#3840])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-7/
igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
>     - shard-rkl:          NOTRUN -> [SKIP][151] ([i915#3840])
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-8/
igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#3840] / [i915#9053])
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-4/
igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][153] ([i915#3840] / [i915#9053])
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fence_pin_leak:
>     - shard-dg2:          NOTRUN -> [SKIP][154] ([i915#4881])
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-4/
igt@kms_fence_pin_leak.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank:
>     - shard-tglu:         NOTRUN -> [SKIP][155] ([i915#3637] / [i915#9934]) 
+4 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-2/
igt@kms_flip@2x-blocking-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][156] ([i915#9934]) +3 other tests 
skip
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-fences-interruptible:
>     - shard-dg2:          NOTRUN -> [SKIP][157] ([i915#8381])
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-1/
igt@kms_flip@2x-flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-panning-vs-hang:
>     - shard-rkl:          NOTRUN -> [SKIP][158] ([i915#9934]) +6 other tests 
skip
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-4/
igt@kms_flip@2x-flip-vs-panning-vs-hang.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-snb:          [PASS][159] -> [TIMEOUT][160] ([i915#14033] / 
[i915#14350])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-snb7/
igt@kms_flip@2x-flip-vs-suspend-interruptible.html
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-snb6/
igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1:
>     - shard-snb:          [PASS][161] -> [TIMEOUT][162] ([i915#14033])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-snb7/
igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-snb6/
igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>     - shard-rkl:          NOTRUN -> [SKIP][163] ([i915#14544] / [i915#9934])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
downscaling:
>     - shard-tglu-1:       NOTRUN -> [SKIP][164] ([i915#15643])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-
downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-
downscaling:
>     - shard-tglu:         NOTRUN -> [SKIP][165] ([i915#15643]) +3 other 
tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-8/
igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>     - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#15643]) +5 other 
tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-5/
igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][167] ([i915#15643] / [i915#5190]) 
+2 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-11/
igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
>     - shard-dg1:          NOTRUN -> [SKIP][168] ([i915#15643]) +1 other test 
skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-13/
igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
>     - shard-mtlp:         NOTRUN -> [SKIP][169] ([i915#15643]) +1 other test 
skip
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-7/
igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-
upscaling:
>     - shard-rkl:          NOTRUN -> [SKIP][170] ([i915#14544] / 
[i915#15643])
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>     - shard-dg2:          NOTRUN -> [SKIP][171] ([i915#15643]) +1 other test 
skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-11/
igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite:
>     - shard-dg2:          [PASS][172] -> [FAIL][173] ([i915#15389])
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-5/
igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite.html
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu:
>     - shard-dg2:          [PASS][174] -> [FAIL][175] ([i915#15389] / 
[i915#6880])
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-8/
igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-11/
igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
>     - shard-rkl:          NOTRUN -> [SKIP][176] ([i915#1825]) +31 other 
tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-4/
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
>     - shard-rkl:          NOTRUN -> [SKIP][177] ([i915#14544] / [i915#1825]) 
+5 other tests skip
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][178] ([i915#5354]) +20 other 
tests skip
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
>     - shard-dg1:          NOTRUN -> [SKIP][179] +4 other tests skip
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-16/
igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][180] ([i915#8708])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-16/
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][181] ([i915#15102] / [i915#3458]) 
+7 other tests skip
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-1/
igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
>     - shard-dg2:          NOTRUN -> [SKIP][182] ([i915#10433] / [i915#15102] 
/ [i915#3458])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-4/
igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
>     - shard-tglu:         NOTRUN -> [SKIP][183] ([i915#15102]) +11 other 
tests skip
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-8/
igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-rkl:          NOTRUN -> [SKIP][184] ([i915#9766])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
>     - shard-rkl:          NOTRUN -> [SKIP][185] ([i915#15102]) +1 other test 
skip
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][186] ([i915#15104]) +2 other 
tests skip
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-8/
igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:
>     - shard-dg2:          NOTRUN -> [SKIP][187] ([i915#15102]) +1 other test 
skip
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][188] ([i915#8708]) +11 other 
tests skip
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-rte:
>     - shard-rkl:          NOTRUN -> [SKIP][189] ([i915#14544] / [i915#15102] 
/ [i915#3023]) +1 other test skip
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_frontbuffer_tracking@psr-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
>     - shard-tglu:         NOTRUN -> [SKIP][190] +23 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-2/
igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
>     - shard-mtlp:         NOTRUN -> [SKIP][191] ([i915#1825]) +3 other tests 
skip
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-2/
igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>     - shard-tglu-1:       NOTRUN -> [SKIP][192] ([i915#15102]) +8 other 
tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-suspend:
>     - shard-rkl:          NOTRUN -> [SKIP][193] ([i915#15102] / [i915#3023]) 
+18 other tests skip
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_frontbuffer_tracking@psr-suspend.html
>     - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#15102] / [i915#3458]) 
+1 other test skip
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-17/
igt@kms_frontbuffer_tracking@psr-suspend.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-rkl:          [PASS][195] -> [SKIP][196] ([i915#3555] / 
[i915#8228]) +1 other test skip
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-1/
igt@kms_hdr@invalid-metadata-sizes.html
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_hdr@invalid-metadata-sizes.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][197] ([i915#3555] / [i915#8228]) 
+2 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_hdr@static-toggle:
>     - shard-tglu:         NOTRUN -> [SKIP][198] ([i915#3555] / [i915#8228])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-2/
igt@kms_hdr@static-toggle.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-dg2:          NOTRUN -> [SKIP][199] ([i915#3555] / [i915#8228])
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-6/
igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [INCOMPLETE][200] ([i915#15436])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_joiner@basic-max-non-joiner:
>     - shard-dg2:          NOTRUN -> [SKIP][201] ([i915#13688])
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-5/
igt@kms_joiner@basic-max-non-joiner.html
> 
>   * igt@kms_lease@lease-get:
>     - shard-dg1:          [PASS][202] -> [DMESG-WARN][203] ([i915#4423])
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg1-13/igt@kms_lease@lease-get.html
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-14/
igt@kms_lease@lease-get.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-dg2:          NOTRUN -> [SKIP][204] ([i915#6301])
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-5/
igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][205] ([i915#6301])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-rkl:          [PASS][206] -> [ABORT][207] ([i915#15132])
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-2/
igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-1/
igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [ABORT][208] ([i915#15132])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-1/
igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
>     - shard-glk10:        NOTRUN -> [SKIP][209] +114 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-glk10/
igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-3:
>     - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#15608]) +9 other 
tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-7/
igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier@pipe-a-plane-3.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-
clamping@pipe-b-plane-0:
>     - shard-rkl:          NOTRUN -> [SKIP][211] ([i915#15608]) +26 other 
tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-
plane-0.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-
clamping@pipe-b-plane-5:
>     - shard-rkl:          NOTRUN -> [SKIP][212] ([i915#15609] / [i915#8825]) 
+2 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping@pipe-b-
plane-5.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
>     - shard-rkl:          NOTRUN -> [SKIP][213] ([i915#15608] / [i915#8825]) 
+5 other tests skip
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-1/
igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
>     - shard-dg2:          NOTRUN -> [SKIP][214] ([i915#15608] / [i915#8825]) 
+3 other tests skip
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-5/
igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
>     - shard-dg1:          NOTRUN -> [SKIP][215] ([i915#15608] / [i915#8825]) 
+1 other test skip
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-18/
igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier@pipe-a-
plane-0:
>     - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#15608]) +6 other 
tests skip
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-18/
igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier@pipe-a-plane-0.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier@pipe-a-
plane-5:
>     - shard-mtlp:         NOTRUN -> [SKIP][217] ([i915#15608]) +1 other test 
skip
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-4/
igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier@pipe-a-plane-5.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier@pipe-b-
plane-3:
>     - shard-tglu:         NOTRUN -> [SKIP][218] ([i915#15608]) +15 other 
tests skip
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-8/
igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier@pipe-b-plane-3.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier@pipe-b-
plane-7:
>     - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#15608] / [i915#8825]) 
+3 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-8/
igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier@pipe-b-plane-7.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
>     - shard-rkl:          NOTRUN -> [SKIP][220] ([i915#15608] / [i915#15609] 
/ [i915#8825]) +2 other tests skip
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-
plane-5:
>     - shard-dg2:          NOTRUN -> [SKIP][221] ([i915#15609]) +1 other test 
skip
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-5.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
>     - shard-tglu-1:       NOTRUN -> [SKIP][222] ([i915#15608] / [i915#15609] 
/ [i915#8825])
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-
plane-5:
>     - shard-rkl:          NOTRUN -> [SKIP][223] ([i915#15609]) +2 other 
tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-2/
igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-
plane-5.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][224] ([i915#15608]) +5 other 
tests skip
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-
plane-5.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-
plane-7:
>     - shard-tglu-1:       NOTRUN -> [SKIP][225] ([i915#15609])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-a-
plane-7.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-
plane-7:
>     - shard-tglu-1:       NOTRUN -> [SKIP][226] ([i915#15609] / [i915#8825])
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping@pipe-b-
plane-7.html
> 
>   * igt@kms_plane_alpha_blend@alpha-transparent-fb:
>     - shard-glk:          NOTRUN -> [FAIL][227] ([i915#10647] / 
[i915#12177])
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-glk3/
igt@kms_plane_alpha_blend@alpha-transparent-fb.html
> 
>   * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [FAIL][228] ([i915#10647]) +1 other test 
fail
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-glk3/
igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_multiple@2x-tiling-y:
>     - shard-dg2:          NOTRUN -> [SKIP][229] ([i915#13958])
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-5/
igt@kms_plane_multiple@2x-tiling-y.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-tglu:         NOTRUN -> [SKIP][230] ([i915#13958]) +1 other test 
skip
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-3/
igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size:
>     - shard-dg2:          [PASS][231] -> [SKIP][232] ([i915#6953] / 
[i915#9423])
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-11/igt@kms_plane_scaling@intel-max-src-size.html
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-8/
igt@kms_plane_scaling@intel-max-src-size.html
> 
>   * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
>     - shard-rkl:          NOTRUN -> [SKIP][233] ([i915#15329]) +3 other 
tests skip
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
>     - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#14544] / 
[i915#15329]) +3 other tests skip
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html
> 
>   * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
>     - shard-tglu:         NOTRUN -> [SKIP][235] ([i915#15329]) +4 other 
tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-10/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
>     - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#15329] / [i915#3555] 
/ [i915#6953])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-2/
igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
>     - shard-snb:          NOTRUN -> [SKIP][237] +30 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-snb7/
igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html
>     - shard-mtlp:         NOTRUN -> [SKIP][238] ([i915#15329]) +3 other 
tests skip
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-2/
igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html
> 
>   * igt@kms_pm_backlight@brightness-with-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][239] ([i915#12343])
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-2/
igt@kms_pm_backlight@brightness-with-dpms.html
>     - shard-tglu-1:       NOTRUN -> [SKIP][240] ([i915#12343])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_pm_backlight@brightness-with-dpms.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][241] ([i915#5354])
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-5/
igt@kms_pm_backlight@fade-with-dpms.html
>     - shard-tglu:         NOTRUN -> [SKIP][242] ([i915#9812])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-9/
igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc5-dpms-negative:
>     - shard-mtlp:         NOTRUN -> [SKIP][243] ([i915#13441])
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-7/
igt@kms_pm_dc@dc5-dpms-negative.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-rkl:          NOTRUN -> [SKIP][244] ([i915#9685]) +1 other test 
skip
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#14104])
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-5/
igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@dc6-psr:
>     - shard-tglu:         NOTRUN -> [SKIP][246] ([i915#9685])
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-3/
igt@kms_pm_dc@dc6-psr.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-dg2:          [PASS][247] -> [SKIP][248] ([i915#9340])
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-4/
igt@kms_pm_lpsp@kms-lpsp.html
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@kms_pm_lpsp@kms-lpsp.html
>     - shard-rkl:          NOTRUN -> [SKIP][249] ([i915#14544] / [i915#9340])
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-lpsp:
>     - shard-rkl:          NOTRUN -> [SKIP][250] ([i915#15073]) +1 other test 
skip
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_pm_rpm@dpms-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-dg1:          [PASS][251] -> [SKIP][252] ([i915#15073]) +1 other 
test skip
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-16/
igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-dg2:          [PASS][253] -> [SKIP][254] ([i915#15073])
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-4/
igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-11/
igt@kms_pm_rpm@modeset-lpsp-stress.html
>     - shard-rkl:          [PASS][255] -> [SKIP][256] ([i915#15073]) +1 other 
test skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-5/
igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>     - shard-tglu-1:       NOTRUN -> [SKIP][257] ([i915#15073])
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
> 
>   * igt@kms_pm_rpm@system-suspend-idle:
>     - shard-dg2:          NOTRUN -> [INCOMPLETE][258] ([i915#14419])
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-4/
igt@kms_pm_rpm@system-suspend-idle.html
> 
>   * igt@kms_prime@d3hot:
>     - shard-rkl:          NOTRUN -> [SKIP][259] ([i915#6524])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_prime@d3hot.html
> 
>   * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>     - shard-tglu-1:       NOTRUN -> [SKIP][260] ([i915#11520]) +2 other 
tests skip
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>     - shard-glk10:        NOTRUN -> [SKIP][261] ([i915#11520]) +1 other test 
skip
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-glk10/
igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>     - shard-glk:          NOTRUN -> [SKIP][262] ([i915#11520]) +12 other 
tests skip
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-glk9/
igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
>     - shard-dg2:          NOTRUN -> [SKIP][263] ([i915#11520]) +5 other 
tests skip
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-1/
igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
>     - shard-rkl:          NOTRUN -> [SKIP][264] ([i915#11520] / 
[i915#14544]) +1 other test skip
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
>     - shard-snb:          NOTRUN -> [SKIP][265] ([i915#11520])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-snb1/
igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
>     - shard-dg1:          NOTRUN -> [SKIP][266] ([i915#11520])
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-17/
igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
>     - shard-mtlp:         NOTRUN -> [SKIP][267] ([i915#12316])
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-2/
igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
>     - shard-tglu:         NOTRUN -> [SKIP][268] ([i915#11520]) +4 other 
tests skip
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-3/
igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
>     - shard-rkl:          NOTRUN -> [SKIP][269] ([i915#11520]) +7 other 
tests skip
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-5/
igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-tglu-1:       NOTRUN -> [SKIP][270] ([i915#9683])
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-dg2:          NOTRUN -> [SKIP][271] ([i915#9683]) +1 other test 
skip
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-6/
igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-cursor-mmap-gtt:
>     - shard-tglu-1:       NOTRUN -> [SKIP][272] ([i915#9732]) +8 other tests 
skip
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_psr@fbc-pr-cursor-mmap-gtt.html
> 
>   * igt@kms_psr@fbc-pr-sprite-mmap-gtt:
>     - shard-dg1:          NOTRUN -> [SKIP][273] ([i915#1072] / [i915#9732])
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-13/
igt@kms_psr@fbc-pr-sprite-mmap-gtt.html
>     - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#9688])
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-7/
igt@kms_psr@fbc-pr-sprite-mmap-gtt.html
> 
>   * igt@kms_psr@fbc-pr-sprite-plane-move:
>     - shard-rkl:          NOTRUN -> [SKIP][275] ([i915#1072] / [i915#14544] 
/ [i915#9732]) +1 other test skip
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_psr@fbc-pr-sprite-plane-move.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
>     - shard-glk:          NOTRUN -> [SKIP][276] +336 other tests skip
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-glk5/
igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-render:
>     - shard-rkl:          NOTRUN -> [SKIP][277] ([i915#1072] / [i915#9732]) 
+20 other tests skip
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_psr@fbc-psr2-sprite-render.html
> 
>   * igt@kms_psr@pr-primary-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][278] ([i915#1072] / [i915#9732]) 
+13 other tests skip
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-1/
igt@kms_psr@pr-primary-mmap-gtt.html
> 
>   * igt@kms_psr@pr-sprite-plane-move:
>     - shard-tglu:         NOTRUN -> [SKIP][279] ([i915#9732]) +8 other tests 
skip
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-7/
igt@kms_psr@pr-sprite-plane-move.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-tglu-1:       NOTRUN -> [SKIP][280] ([i915#9685])
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][281] ([i915#15492])
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-glk5/
igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
> 
>   * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
>     - shard-rkl:          NOTRUN -> [SKIP][282] ([i915#5289])
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-5/
igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-rotation-270:
>     - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#12755])
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-5/
igt@kms_rotation_crc@primary-rotation-270.html
>     - shard-mtlp:         NOTRUN -> [SKIP][284] ([i915#12755])
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-4/
igt@kms_rotation_crc@primary-rotation-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-rkl:          NOTRUN -> [SKIP][285] ([i915#14544] / [i915#5289])
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_setmode@basic:
>     - shard-tglu:         [PASS][286] -> [FAIL][287] ([i915#15106]) +2 other 
tests fail
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-5/igt@kms_setmode@basic.html
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-5/
igt@kms_setmode@basic.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-tglu:         NOTRUN -> [SKIP][288] ([i915#8623])
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-7/
igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-rkl:          NOTRUN -> [SKIP][289] ([i915#8623])
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][290] ([i915#12276]) +3 
other tests incomplete
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-glk6/
igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_vrr@flip-basic:
>     - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#15243] / [i915#3555])
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-5/
igt@kms_vrr@flip-basic.html
> 
>   * igt@kms_vrr@flipline:
>     - shard-dg2:          NOTRUN -> [SKIP][292] ([i915#15243] / [i915#3555])
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-6/
igt@kms_vrr@flipline.html
> 
>   * igt@kms_vrr@max-min:
>     - shard-rkl:          NOTRUN -> [SKIP][293] ([i915#9906])
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@kms_vrr@max-min.html
> 
>   * igt@kms_vrr@seamless-rr-switch-drrs:
>     - shard-tglu-1:       NOTRUN -> [SKIP][294] ([i915#9906])
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@kms_vrr@seamless-rr-switch-drrs.html
> 
>   * igt@kms_vrr@seamless-rr-switch-vrr:
>     - shard-tglu:         NOTRUN -> [SKIP][295] ([i915#9906]) +1 other test 
skip
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-5/
igt@kms_vrr@seamless-rr-switch-vrr.html
> 
>   * igt@perf@gen8-unprivileged-single-ctx-counters:
>     - shard-rkl:          NOTRUN -> [SKIP][296] ([i915#2436])
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-8/
igt@perf@gen8-unprivileged-single-ctx-counters.html
> 
>   * igt@perf@mi-rpc:
>     - shard-dg2:          NOTRUN -> [SKIP][297] ([i915#2434])
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-8/
igt@perf@mi-rpc.html
> 
>   * igt@prime_vgem@basic-fence-flip:
>     - shard-dg1:          NOTRUN -> [SKIP][298] ([i915#3708])
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-17/
igt@prime_vgem@basic-fence-flip.html
> 
>   * igt@prime_vgem@fence-read-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#3708]) +1 other test 
skip
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-11/
igt@prime_vgem@fence-read-hang.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-rkl:          NOTRUN -> [SKIP][300] ([i915#9917]) +1 other test 
skip
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-8/
igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2:
>     - shard-tglu-1:       NOTRUN -> [FAIL][301] ([i915#12910]) +9 other 
tests fail
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-1/
igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-2.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_freq@sysfs@gt0:
>     - shard-dg2:          [FAIL][302] ([i915#9561]) -> [PASS][303] +1 other 
test pass
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-3/
igt@gem_ctx_freq@sysfs@gt0.html
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-6/
igt@gem_ctx_freq@sysfs@gt0.html
> 
>   * igt@gem_ctx_isolation@preservation-s3:
>     - shard-rkl:          [INCOMPLETE][304] ([i915#13356]) -> [PASS][305] +2 
other tests pass
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-3/
igt@gem_ctx_isolation@preservation-s3.html
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-8/
igt@gem_ctx_isolation@preservation-s3.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices:
>     - shard-rkl:          [ABORT][306] ([i915#7975]) -> [PASS][307] +1 other 
test pass
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-1/
igt@gem_exec_suspend@basic-s4-devices.html
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@gem_exec_suspend@basic-s4-devices.html
> 
>   * igt@i915_module_load@load:
>     - shard-tglu:         ([PASS][308], [PASS][309], [PASS][310], [PASS]
[311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS]
[317], [PASS][318], [SKIP][319], [PASS][320], [PASS][321], [PASS][322], [PASS]
[323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS]
[329], [PASS][330]) ([i915#14785]) -> ([PASS][331], [PASS][332], [PASS][333], 
[PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], 
[PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], 
[PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], 
[PASS][352], [PASS][353])
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-2/igt@i915_module_load@load.html
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-7/igt@i915_module_load@load.html
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-9/igt@i915_module_load@load.html
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-5/igt@i915_module_load@load.html
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-6/igt@i915_module_load@load.html
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-9/igt@i915_module_load@load.html
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-2/igt@i915_module_load@load.html
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-3/igt@i915_module_load@load.html
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-6/igt@i915_module_load@load.html
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-10/igt@i915_module_load@load.html
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-4/igt@i915_module_load@load.html
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-2/igt@i915_module_load@load.html
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-8/igt@i915_module_load@load.html
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-10/igt@i915_module_load@load.html
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-5/igt@i915_module_load@load.html
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-4/igt@i915_module_load@load.html
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-8/igt@i915_module_load@load.html
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-10/igt@i915_module_load@load.html
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-9/igt@i915_module_load@load.html
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-3/igt@i915_module_load@load.html
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-5/igt@i915_module_load@load.html
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-7/igt@i915_module_load@load.html
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-3/igt@i915_module_load@load.html
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-6/
igt@i915_module_load@load.html
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-5/
igt@i915_module_load@load.html
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-8/
igt@i915_module_load@load.html
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-7/
igt@i915_module_load@load.html
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-4/
igt@i915_module_load@load.html
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-9/
igt@i915_module_load@load.html
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-2/
igt@i915_module_load@load.html
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-10/igt@i915_module_load@load.html
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-2/
igt@i915_module_load@load.html
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-4/
igt@i915_module_load@load.html
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-7/
igt@i915_module_load@load.html
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-3/
igt@i915_module_load@load.html
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-3/
igt@i915_module_load@load.html
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-10/igt@i915_module_load@load.html
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-2/
igt@i915_module_load@load.html
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-9/
igt@i915_module_load@load.html
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-3/
igt@i915_module_load@load.html
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-10/igt@i915_module_load@load.html
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-7/
igt@i915_module_load@load.html
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-8/
igt@i915_module_load@load.html
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-5/
igt@i915_module_load@load.html
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-6/
igt@i915_module_load@load.html
>    [353]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-8/
igt@i915_module_load@load.html
> 
>   * igt@i915_pm_freq_api@freq-suspend@gt0:
>     - shard-dg2:          [INCOMPLETE][354] ([i915#13356] / [i915#13820]) -> 
[PASS][355] +1 other test pass
>    [354]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-6/
igt@i915_pm_freq_api@freq-suspend@gt0.html
>    [355]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-8/
igt@i915_pm_freq_api@freq-suspend@gt0.html
> 
>   * igt@i915_pm_rc6_residency@rc6-accuracy:
>     - shard-dg2:          [FAIL][356] ([i915#12964]) -> [PASS][357] +1 other 
test pass
>    [356]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-3/
igt@i915_pm_rc6_residency@rc6-accuracy.html
>    [357]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-5/
igt@i915_pm_rc6_residency@rc6-accuracy.html
> 
>   * igt@i915_pm_rc6_residency@rc6-fence:
>     - shard-tglu:         [WARN][358] ([i915#13790] / [i915#2681]) -> [PASS]
[359] +1 other test pass
>    [358]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-3/igt@i915_pm_rc6_residency@rc6-fence.html
>    [359]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-6/
igt@i915_pm_rc6_residency@rc6-fence.html
> 
>   * igt@i915_selftest@live@workarounds:
>     - shard-dg2:          [DMESG-FAIL][360] ([i915#12061]) -> [PASS][361] +1 
other test pass
>    [360]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-1/
igt@i915_selftest@live@workarounds.html
>    [361]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-6/
igt@i915_selftest@live@workarounds.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2:
>     - shard-rkl:          [INCOMPLETE][362] ([i915#15582]) -> [PASS][363] +1 
other test pass
>    [362]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
>    [363]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-128x42:
>     - shard-rkl:          [FAIL][364] ([i915#13566]) -> [PASS][365] +3 other 
tests pass
>    [364]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-8/
igt@kms_cursor_crc@cursor-onscreen-128x42.html
>    [365]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-4/
igt@kms_cursor_crc@cursor-onscreen-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
>     - shard-tglu:         [FAIL][366] ([i915#13566]) -> [PASS][367] +1 other 
test pass
>    [366]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-10/igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
>    [367]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-5/
igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_flip@plain-flip-ts-check:
>     - shard-tglu:         [FAIL][368] ([i915#14600]) -> [PASS][369] +1 other 
test pass
>    [368]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-10/igt@kms_flip@plain-flip-ts-check.html
>    [369]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-10/igt@kms_flip@plain-flip-ts-check.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
>     - shard-dg2:          [FAIL][370] ([i915#15389] / [i915#6880]) -> [PASS]
[371]
>    [370]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-1/
igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
>    [371]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-3/
igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-dg2:          [SKIP][372] ([i915#3555] / [i915#8228]) -> [PASS]
[373]
>    [372]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-1/
igt@kms_hdr@bpc-switch.html
>    [373]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-11/
igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_pm_rpm@basic-pci-d3-state:
>     - shard-dg1:          [DMESG-WARN][374] ([i915#4423]) -> [PASS][375] +2 
other tests pass
>    [374]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg1-12/igt@kms_pm_rpm@basic-pci-d3-state.html
>    [375]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-16/
igt@kms_pm_rpm@basic-pci-d3-state.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-dg1:          [SKIP][376] ([i915#15073]) -> [PASS][377]
>    [376]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [377]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-17/
igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_pm_rpm@system-suspend-idle:
>     - shard-rkl:          [INCOMPLETE][378] ([i915#14419]) -> [PASS][379]
>    [378]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-3/
igt@kms_pm_rpm@system-suspend-idle.html
>    [379]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-2/
igt@kms_pm_rpm@system-suspend-idle.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-rpm:
>     - shard-dg2:          [WARN][380] -> [PASS][381]
>    [380]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-1/
igt@kms_vblank@ts-continuation-dpms-rpm.html
>    [381]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-5/
igt@kms_vblank@ts-continuation-dpms-rpm.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3:
>     - shard-dg2:          [SKIP][382] ([i915#1311]) -> [PASS][383]
>    [382]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-1/
igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3.html
>    [383]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-5/
igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend:
>     - shard-rkl:          [INCOMPLETE][384] ([i915#12276]) -> [PASS][385] +1 
other test pass
>    [384]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_vblank@ts-continuation-dpms-suspend.html
>    [385]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@kms_vblank@ts-continuation-dpms-suspend.html
> 
>   * igt@perf_pmu@all-busy-idle-check-all:
>     - shard-mtlp:         [FAIL][386] ([i915#15453]) -> [PASS][387]
>    [386]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-mtlp-3/igt@perf_pmu@all-busy-idle-check-all.html
>    [387]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-2/
igt@perf_pmu@all-busy-idle-check-all.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_ccs@block-copy-compressed:
>     - shard-rkl:          [SKIP][388] ([i915#14544] / [i915#3555] / 
[i915#9323]) -> [SKIP][389] ([i915#3555] / [i915#9323])
>    [388]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@gem_ccs@block-copy-compressed.html
>    [389]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@gem_ccs@block-copy-compressed.html
> 
>   * igt@gem_ccs@block-multicopy-inplace:
>     - shard-rkl:          [SKIP][390] ([i915#3555] / [i915#9323]) -> [SKIP]
[391] ([i915#14544] / [i915#3555] / [i915#9323])
>    [390]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-7/
igt@gem_ccs@block-multicopy-inplace.html
>    [391]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@gem_ccs@block-multicopy-inplace.html
> 
>   * igt@gem_create@create-ext-cpu-access-sanity-check:
>     - shard-rkl:          [SKIP][392] ([i915#14544] / [i915#6335]) -> [SKIP]
[393] ([i915#6335])
>    [392]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@gem_create@create-ext-cpu-access-sanity-check.html
>    [393]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-2/
igt@gem_create@create-ext-cpu-access-sanity-check.html
> 
>   * igt@gem_exec_reloc@basic-wc:
>     - shard-rkl:          [SKIP][394] ([i915#14544] / [i915#3281]) -> [SKIP]
[395] ([i915#3281]) +1 other test skip
>    [394]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@gem_exec_reloc@basic-wc.html
>    [395]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@gem_exec_reloc@basic-wc.html
> 
>   * igt@gem_exec_reloc@basic-write-wc-active:
>     - shard-rkl:          [SKIP][396] ([i915#3281]) -> [SKIP][397] 
([i915#14544] / [i915#3281]) +1 other test skip
>    [396]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-2/
igt@gem_exec_reloc@basic-write-wc-active.html
>    [397]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@gem_exec_reloc@basic-write-wc-active.html
> 
>   * igt@gem_lmem_swapping@heavy-multi:
>     - shard-rkl:          [SKIP][398] ([i915#14544] / [i915#4613]) -> [SKIP]
[399] ([i915#4613]) +1 other test skip
>    [398]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@gem_lmem_swapping@heavy-multi.html
>    [399]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@gem_lmem_swapping@heavy-multi.html
> 
>   * igt@gem_tiled_pread_pwrite:
>     - shard-rkl:          [SKIP][400] ([i915#3282]) -> [SKIP][401] 
([i915#14544] / [i915#3282])
>    [400]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-4/
igt@gem_tiled_pread_pwrite.html
>    [401]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@gem_tiled_pread_pwrite.html
> 
>   * igt@gem_userptr_blits@coherency-unsync:
>     - shard-rkl:          [SKIP][402] ([i915#3297]) -> [SKIP][403] 
([i915#14544] / [i915#3297])
>    [402]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-2/
igt@gem_userptr_blits@coherency-unsync.html
>    [403]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@gem_userptr_blits@coherency-unsync.html
> 
>   * igt@gem_userptr_blits@create-destroy-unsync:
>     - shard-rkl:          [SKIP][404] ([i915#14544] / [i915#3297]) -> [SKIP]
[405] ([i915#3297])
>    [404]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@gem_userptr_blits@create-destroy-unsync.html
>    [405]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@gem_userptr_blits@create-destroy-unsync.html
> 
>   * igt@gen9_exec_parse@bb-start-param:
>     - shard-rkl:          [SKIP][406] ([i915#2527]) -> [SKIP][407] 
([i915#14544] / [i915#2527])
>    [406]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-5/
igt@gen9_exec_parse@bb-start-param.html
>    [407]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@gen9_exec_parse@bb-start-param.html
> 
>   * igt@gen9_exec_parse@cmd-crossing-page:
>     - shard-rkl:          [SKIP][408] ([i915#14544] / [i915#2527]) -> [SKIP]
[409] ([i915#2527])
>    [408]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@gen9_exec_parse@cmd-crossing-page.html
>    [409]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-4/
igt@gen9_exec_parse@cmd-crossing-page.html
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-rkl:          [SKIP][410] ([i915#6412]) -> [SKIP][411] 
([i915#14544] / [i915#6412])
>    [410]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-8/
igt@i915_module_load@resize-bar.html
>    [411]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@i915_module_load@resize-bar.html
> 
>   * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>     - shard-rkl:          [SKIP][412] ([i915#12454] / [i915#12712]) -> 
[SKIP][413] ([i915#12454] / [i915#12712] / [i915#14544])
>    [412]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-7/
igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
>    [413]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
> 
>   * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>     - shard-rkl:          [SKIP][414] ([i915#14544] / [i915#5286]) -> [SKIP]
[415] ([i915#5286])
>    [414]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
>    [415]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-2/
igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-rkl:          [SKIP][416] ([i915#3828]) -> [SKIP][417] 
([i915#14544] / [i915#3828])
>    [416]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-3/
igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
>    [417]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>     - shard-rkl:          [SKIP][418] ([i915#14098] / [i915#6095]) -> [SKIP]
[419] ([i915#14098] / [i915#14544] / [i915#6095]) +6 other tests skip
>    [418]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-4/
igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
>    [419]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
>     - shard-rkl:          [SKIP][420] ([i915#6095]) -> [SKIP][421] 
([i915#14544] / [i915#6095]) +3 other tests skip
>    [420]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-4/
igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
>    [421]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-2:
>     - shard-rkl:          [SKIP][422] ([i915#14544] / [i915#6095]) -> [SKIP]
[423] ([i915#6095]) +1 other test skip
>    [422]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-2.html
>    [423]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-4/
igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
>     - shard-rkl:          [SKIP][424] ([i915#14098] / [i915#14544] / 
[i915#6095]) -> [SKIP][425] ([i915#14098] / [i915#6095]) +4 other tests skip
>    [424]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
>    [425]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-8/
igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>     - shard-rkl:          [SKIP][426] ([i915#12313] / [i915#14544]) -> 
[SKIP][427] ([i915#12313])
>    [426]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
>    [427]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-1/
igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-rkl:          [SKIP][428] ([i915#14544] / [i915#3742]) -> [SKIP]
[429] ([i915#3742])
>    [428]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_cdclk@mode-transition-all-outputs.html
>    [429]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-rkl:          [SKIP][430] ([i915#14544]) -> [SKIP][431] +2 other 
tests skip
>    [430]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_chamelium_color@degamma.html
>    [431]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-4/
igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
>     - shard-rkl:          [SKIP][432] ([i915#11151] / [i915#7828]) -> [SKIP]
[433] ([i915#11151] / [i915#14544] / [i915#7828]) +2 other tests skip
>    [432]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-8/
igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
>    [433]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
> 
>   * igt@kms_chamelium_frames@dp-frame-dump:
>     - shard-rkl:          [SKIP][434] ([i915#11151] / [i915#14544] / 
[i915#7828]) -> [SKIP][435] ([i915#11151] / [i915#7828]) +3 other tests skip
>    [434]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_chamelium_frames@dp-frame-dump.html
>    [435]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-8/
igt@kms_chamelium_frames@dp-frame-dump.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-dg1:          [SKIP][436] ([i915#4423] / [i915#6944] / 
[i915#7116] / [i915#9424]) -> [SKIP][437] ([i915#6944] / [i915#7116] / 
[i915#9424])
>    [436]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg1-12/igt@kms_content_protection@atomic.html
>    [437]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-15/
igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@atomic-dpms:
>     - shard-rkl:          [SKIP][438] ([i915#14544] / [i915#6944] / 
[i915#7118] / [i915#9424]) -> [SKIP][439] ([i915#6944] / [i915#7118] / 
[i915#9424]) +1 other test skip
>    [438]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_content_protection@atomic-dpms.html
>    [439]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-8/
igt@kms_content_protection@atomic-dpms.html
> 
>   * igt@kms_content_protection@atomic-hdcp14:
>     - shard-dg2:          [FAIL][440] ([i915#7173]) -> [SKIP][441] 
([i915#6944])
>    [440]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-11/igt@kms_content_protection@atomic-hdcp14.html
>    [441]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-8/
igt@kms_content_protection@atomic-hdcp14.html
> 
>   * igt@kms_content_protection@dp-mst-type-0-hdcp14:
>     - shard-rkl:          [SKIP][442] ([i915#15330]) -> [SKIP][443] 
([i915#14544] / [i915#15330])
>    [442]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-7/
igt@kms_content_protection@dp-mst-type-0-hdcp14.html
>    [443]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_content_protection@dp-mst-type-0-hdcp14.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-rkl:          [SKIP][444] ([i915#6944] / [i915#7118]) -> [SKIP]
[445] ([i915#14544] / [i915#6944] / [i915#7118])
>    [444]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-5/
igt@kms_content_protection@srm.html
>    [445]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x10:
>     - shard-rkl:          [SKIP][446] ([i915#14544] / [i915#3555]) -> [SKIP]
[447] ([i915#3555]) +1 other test skip
>    [446]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_cursor_crc@cursor-onscreen-32x10.html
>    [447]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-4/
igt@kms_cursor_crc@cursor-onscreen-32x10.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-rkl:          [SKIP][448] -> [SKIP][449] ([i915#14544]) +6 other 
tests skip
>    [448]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-8/
igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>    [449]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-rkl:          [SKIP][450] ([i915#14544] / [i915#4103]) -> [SKIP]
[451] ([i915#4103])
>    [450]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [451]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-2/
igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_dsc@dsc-with-bpc:
>     - shard-rkl:          [SKIP][452] ([i915#14544] / [i915#3555] / 
[i915#3840]) -> [SKIP][453] ([i915#3555] / [i915#3840])
>    [452]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_dsc@dsc-with-bpc.html
>    [453]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_dsc@dsc-with-bpc.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-rkl:          [SKIP][454] ([i915#4854]) -> [SKIP][455] 
([i915#14544] / [i915#4854])
>    [454]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-2/
igt@kms_feature_discovery@chamelium.html
>    [455]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
>     - shard-rkl:          [SKIP][456] ([i915#14544] / [i915#9934]) -> [SKIP]
[457] ([i915#9934]) +1 other test skip
>    [456]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
>    [457]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-5/
igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-plain-flip-fb-recreate:
>     - shard-rkl:          [SKIP][458] ([i915#9934]) -> [SKIP][459] 
([i915#14544] / [i915#9934])
>    [458]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-7/
igt@kms_flip@2x-plain-flip-fb-recreate.html
>    [459]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_flip@2x-plain-flip-fb-recreate.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
>     - shard-rkl:          [SKIP][460] ([i915#15643]) -> [SKIP][461] 
([i915#14544] / [i915#15643]) +1 other test skip
>    [460]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-2/
igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
>    [461]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-rkl:          [SKIP][462] ([i915#1825]) -> [SKIP][463] 
([i915#14544] / [i915#1825]) +10 other tests skip
>    [462]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-3/
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
>    [463]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-
gtt:
>     - shard-rkl:          [SKIP][464] ([i915#15102]) -> [SKIP][465] 
([i915#14544] / [i915#15102]) +1 other test skip
>    [464]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-7/
igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
>    [465]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
>     - shard-dg2:          [SKIP][466] ([i915#10433] / [i915#15102] / 
[i915#3458]) -> [SKIP][467] ([i915#15102] / [i915#3458])
>    [466]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-4/
igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
>    [467]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-11/
igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
>     - shard-dg2:          [SKIP][468] ([i915#15102] / [i915#3458]) -> [SKIP]
[469] ([i915#10433] / [i915#15102] / [i915#3458])
>    [468]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-5/
igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
>    [469]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-4/
igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
>     - shard-rkl:          [SKIP][470] ([i915#14544] / [i915#15102]) -> 
[SKIP][471] ([i915#15102])
>    [470]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html
>    [471]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-4/
igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite:
>     - shard-dg1:          [SKIP][472] ([i915#15102] / [i915#4423]) -> [SKIP]
[473] ([i915#15102])
>    [472]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg1-18/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html
>    [473]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-13/
igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-pwrite.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render:
>     - shard-rkl:          [SKIP][474] ([i915#14544] / [i915#1825]) -> [SKIP]
[475] ([i915#1825]) +10 other tests skip
>    [474]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html
>    [475]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-2/
igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
>     - shard-rkl:          [SKIP][476] ([i915#15102] / [i915#3023]) -> [SKIP]
[477] ([i915#14544] / [i915#15102] / [i915#3023]) +5 other tests skip
>    [476]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-3/
igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
>    [477]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
>     - shard-rkl:          [SKIP][478] ([i915#14544] / [i915#15102] / 
[i915#3023]) -> [SKIP][479] ([i915#15102] / [i915#3023]) +6 other tests skip
>    [478]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
>    [479]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@kms_frontbuffer_tracking@psr-rgb565-draw-render.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-rkl:          [INCOMPLETE][480] ([i915#15436]) -> [SKIP][481] 
([i915#3555] / [i915#8228])
>    [480]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_hdr@bpc-switch-suspend.html
>    [481]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-mtlp:         [SKIP][482] ([i915#1187] / [i915#12713]) -> [SKIP]
[483] ([i915#12713])
>    [482]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html
>    [483]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-mtlp-3/
igt@kms_hdr@brightness-with-hdr.html
>     - shard-dg2:          [SKIP][484] ([i915#13331]) -> [SKIP][485] 
([i915#12713])
>    [484]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg2-11/igt@kms_hdr@brightness-with-hdr.html
>    [485]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg2-8/
igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-rkl:          [SKIP][486] ([i915#3555] / [i915#8228]) -> 
[INCOMPLETE][487] ([i915#15436])
>    [486]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-7/
igt@kms_hdr@static-toggle-suspend.html
>    [487]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_joiner@basic-ultra-joiner:
>     - shard-rkl:          [SKIP][488] ([i915#15458]) -> [SKIP][489] 
([i915#14544] / [i915#15458])
>    [488]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-8/
igt@kms_joiner@basic-ultra-joiner.html
>    [489]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_joiner@basic-ultra-joiner.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-dg1:          [SKIP][490] ([i915#15638]) -> [SKIP][491] 
([i915#15638] / [i915#4423])
>    [490]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg1-12/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
>    [491]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-16/
igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
>     - shard-rkl:          [SKIP][492] ([i915#15608] / [i915#15609] / 
[i915#8825]) -> [SKIP][493] ([i915#14544] / [i915#15608] / [i915#15609] / 
[i915#8825])
>    [492]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-8/
igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html
>    [493]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-
clamping@pipe-a-plane-0:
>     - shard-rkl:          [SKIP][494] ([i915#15608]) -> [SKIP][495] 
([i915#14544] / [i915#15608])
>    [494]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-8/
igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-
plane-0.html
>    [495]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-a-
plane-0.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-
clamping@pipe-b-plane-5:
>     - shard-rkl:          [SKIP][496] ([i915#15609] / [i915#8825]) -> [SKIP]
[497] ([i915#14544] / [i915#15609] / [i915#8825])
>    [496]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-8/
igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-
plane-5.html
>    [497]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping@pipe-b-
plane-5.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-modifier:
>     - shard-rkl:          [SKIP][498] ([i915#14544] / [i915#15608] / 
[i915#8825]) -> [SKIP][499] ([i915#15608] / [i915#8825]) +1 other test skip
>    [498]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_plane@pixel-format-yf-tiled-modifier.html
>    [499]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_plane@pixel-format-yf-tiled-modifier.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-0:
>     - shard-rkl:          [SKIP][500] ([i915#14544] / [i915#15608]) -> 
[SKIP][501] ([i915#15608])
>    [500]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-0.html
>    [501]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-7/
igt@kms_plane@pixel-format-yf-tiled-modifier@pipe-a-plane-0.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-rkl:          [SKIP][502] ([i915#13958] / [i915#14544]) -> 
[SKIP][503] ([i915#13958])
>    [502]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_plane_multiple@2x-tiling-yf.html
>    [503]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-5/
igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-rkl:          [SKIP][504] ([i915#14544] / [i915#5354]) -> [SKIP]
[505] ([i915#5354])
>    [504]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_pm_backlight@basic-brightness.html
>    [505]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-4/
igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-tglu:         [SKIP][506] ([i915#15128]) -> [FAIL][507] 
([i915#9295])
>    [506]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-tglu-6/igt@kms_pm_dc@dc6-dpms.html
>    [507]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-tglu-8/
igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-dg1:          [SKIP][508] ([i915#3828]) -> [SKIP][509] 
([i915#9340])
>    [508]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-dg1-15/igt@kms_pm_lpsp@kms-lpsp.html
>    [509]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-dg1-17/
igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@package-g7:
>     - shard-rkl:          [SKIP][510] ([i915#15403]) -> [SKIP][511] 
([i915#14544] / [i915#15403])
>    [510]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-5/
igt@kms_pm_rpm@package-g7.html
>    [511]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_pm_rpm@package-g7.html
> 
>   * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-rkl:          [SKIP][512] ([i915#11520] / [i915#14544]) -> 
[SKIP][513] ([i915#11520])
>    [512]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
>    [513]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-5/
igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>     - shard-rkl:          [SKIP][514] ([i915#11520]) -> [SKIP][515] 
([i915#11520] / [i915#14544])
>    [514]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-2/
igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
>    [515]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
> 
>   * igt@kms_psr@pr-cursor-plane-onoff:
>     - shard-rkl:          [SKIP][516] ([i915#1072] / [i915#14544] / 
[i915#9732]) -> [SKIP][517] ([i915#1072] / [i915#9732]) +7 other tests skip
>    [516]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@kms_psr@pr-cursor-plane-onoff.html
>    [517]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-3/
igt@kms_psr@pr-cursor-plane-onoff.html
> 
>   * igt@kms_psr@psr-sprite-plane-move:
>     - shard-rkl:          [SKIP][518] ([i915#1072] / [i915#9732]) -> [SKIP]
[519] ([i915#1072] / [i915#14544] / [i915#9732]) +6 other tests skip
>    [518]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-5/
igt@kms_psr@psr-sprite-plane-move.html
>    [519]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_psr@psr-sprite-plane-move.html
> 
>   * igt@kms_setmode@invalid-clone-exclusive-crtc:
>     - shard-rkl:          [SKIP][520] ([i915#3555]) -> [SKIP][521] 
([i915#14544] / [i915#3555])
>    [520]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-4/
igt@kms_setmode@invalid-clone-exclusive-crtc.html
>    [521]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@kms_setmode@invalid-clone-exclusive-crtc.html
> 
>   * igt@perf@mi-rpc:
>     - shard-rkl:          [SKIP][522] ([i915#2434]) -> [SKIP][523] 
([i915#14544] / [i915#2434])
>    [522]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-5/
igt@perf@mi-rpc.html
>    [523]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@perf@mi-rpc.html
> 
>   * igt@prime_vgem@coherency-gtt:
>     - shard-rkl:          [SKIP][524] ([i915#3708]) -> [SKIP][525] 
([i915#14544] / [i915#3708]) +1 other test skip
>    [524]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-8/
igt@prime_vgem@coherency-gtt.html
>    [525]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-6/
igt@prime_vgem@coherency-gtt.html
> 
>   * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>     - shard-rkl:          [SKIP][526] ([i915#14544] / [i915#9917]) -> [SKIP]
[527] ([i915#9917])
>    [526]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17940/shard-rkl-6/
igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
>    [527]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/shard-rkl-2/
igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> 
>   
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
10307
>   [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
10433
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
10434
>   [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
10647
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#1099]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099
>   [i915#11151]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
11151
>   [i915#11520]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
11520
>   [i915#1187]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187
>   [i915#11965]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
11965
>   [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
12061
>   [i915#12177]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
12177
>   [i915#12276]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
12276
>   [i915#12313]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
12313
>   [i915#12316]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
12316
>   [i915#12343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
12343
>   [i915#12358]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
12358
>   [i915#12454]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
12454
>   [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
>   [i915#12712]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
12712
>   [i915#12713]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
12713
>   [i915#12755]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
12755
>   [i915#12761]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
12761
>   [i915#12910]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
12910
>   [i915#12964]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
12964
>   [i915#13046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
13046
>   [i915#13049]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
13049
>   [i915#1311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1311
>   [i915#13331]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
13331
>   [i915#13356]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
13356
>   [i915#13441]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
13441
>   [i915#13566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
13566
>   [i915#13688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
13688
>   [i915#13707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
13707
>   [i915#13717]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
13717
>   [i915#13748]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
13748
>   [i915#13749]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
13749
>   [i915#13781]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
13781
>   [i915#13790]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
13790
>   [i915#13820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
13820
>   [i915#13958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
13958
>   [i915#14033]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
14033
>   [i915#14073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
14073
>   [i915#14098]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
14098
>   [i915#14104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
14104
>   [i915#14152]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
14152
>   [i915#14350]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
14350
>   [i915#14419]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
14419
>   [i915#14544]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
14544
>   [i915#14586]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
14586
>   [i915#14600]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
14600
>   [i915#14702]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
14702
>   [i915#14785]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
14785
>   [i915#14809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
14809
>   [i915#15073]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15073
>   [i915#15095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15095
>   [i915#15102]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15102
>   [i915#15104]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15104
>   [i915#15106]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15106
>   [i915#15128]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15128
>   [i915#15132]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15132
>   [i915#15243]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15243
>   [i915#15329]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15329
>   [i915#15330]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15330
>   [i915#15389]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15389
>   [i915#15403]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15403
>   [i915#15436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15436
>   [i915#15453]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15453
>   [i915#15458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15458
>   [i915#15492]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15492
>   [i915#15582]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15582
>   [i915#15608]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15608
>   [i915#15609]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15609
>   [i915#15638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15638
>   [i915#15643]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/
15643
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
>   [i915#2436]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
>   [i915#2681]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2681
>   [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
>   [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3742]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>   [i915#3828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
>   [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>   [i915#4423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423
>   [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>   [i915#4537]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4817]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
>   [i915#5138]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5723]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
>   [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
>   [i915#6335]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335
>   [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
>   [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
>   [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>   [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
>   [i915#6953]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953
>   [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>   [i915#7173]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173
>   [i915#7443]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7443
>   [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>   [i915#7707]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
>   [i915#8399]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>   [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>   [i915#8623]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#8814]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814
>   [i915#8825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8825
>   [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
>   [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
>   [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>   [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>   [i915#9561]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9561
>   [i915#9683]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683
>   [i915#9685]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685
>   [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>   [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
>   [i915#9906]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906
>   [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8739 -> IGTPW_14507
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_17940: 7fc41c69853312d5cb58afe7efd7943b6dfb092f @ git://
anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_14507: 14507
>   IGT_8739: 8739
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://
anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14507/
index.html
> 




