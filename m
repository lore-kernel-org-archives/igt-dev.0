Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9ABC10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 14:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC2B10EB2A;
	Thu,  9 May 2024 14:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GA6MqDoo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A15A10E654;
 Thu,  9 May 2024 14:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715266599; x=1746802599;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v04Uf4OvgTZ4/Ra6ikawLEeEy1K2Ptlw50cljcuniCc=;
 b=GA6MqDooinGe0odzXFvTwDKQnReNYi5YgfWbMN5GdtKI3soWLWmQthSJ
 0+nr8bN+kXoIX/DvAYqr+vYdJ0Szg7H4lL5T77SPcgpRWuLI5hplZb2UR
 BYqHHqHAPfSG1W6AkFPhOZqsHc1d3zSEGeZVfhBg9UefGs2QyJagrjeIm
 +nMOZPdVBI3oqOGKMQRlK+rCCZ5rn0y5ME9eFiZl9090FWjnxOCY9/exZ
 vvikhYsF0Oos9f4CdYBghMjx+KQZbiFa3rX3Olj7Xz6zwExBVuD55y2GD
 /3rmV9Gx9ypY3Kv1y3VgS3wh8+SI/rSJOjVNzr5j5lo35G3SFHrC9ykD3 w==;
X-CSE-ConnectionGUID: awkaZoNBR7G0TBqf9t7VqQ==
X-CSE-MsgGUID: 4gFaOpgARjeoDScYWqf+FA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="28677043"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="28677043"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 07:56:38 -0700
X-CSE-ConnectionGUID: 50mL9zQaR7CqknfnKZb7cw==
X-CSE-MsgGUID: m2y5pmdiSWOzL550JnLHZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="60446386"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 07:56:36 -0700
Date: Thu, 9 May 2024 16:56:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/device_reset: move later skips into subtests (rev5)
Message-ID: <20240509145634.x6hng3tnaf6yuhby@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20240508164550.52434-1-kamil.konieczny@linux.intel.com>
 <171524423428.2037202.4642534138274017427@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171524423428.2037202.4642534138274017427@8e613ede5ea5>
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
On 2024-05-09 at 08:43:54 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/device_reset: move later skips into subtests (rev5)
> URL   : https://patchwork.freedesktop.org/series/132040/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7843_full -> IGTPW_11114_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11114_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11114_full, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11114_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-tglu:         NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-6/igt@device_reset@unbind-cold-reset-rebind.html
> 

It is correct.

>   * igt@gem_mmap_wc@close:
>     - shard-snb:          [PASS][2] -> [ABORT][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-snb6/igt@gem_mmap_wc@close.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-snb2/igt@gem_mmap_wc@close.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
>     - shard-mtlp:         [PASS][4] -> [FAIL][5] +1 other test fail
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-mtlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
> 

Above are unrelated.

>   
> #### Warnings ####
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-tglu:         [SKIP][6] ([i915#7701]) -> [SKIP][7]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-tglu-8/igt@device_reset@cold-reset-bound.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-3/igt@device_reset@cold-reset-bound.html
>     - shard-mtlp:         [SKIP][8] ([i915#7701]) -> [SKIP][9] +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-mtlp-4/igt@device_reset@cold-reset-bound.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-2/igt@device_reset@cold-reset-bound.html
> 
>   * igt@device_reset@unbind-cold-reset-rebind:
>     - shard-dg1:          [SKIP][10] ([i915#7701]) -> [SKIP][11]
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg1-16/igt@device_reset@unbind-cold-reset-rebind.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-13/igt@device_reset@unbind-cold-reset-rebind.html
>     - shard-dg2:          [SKIP][12] ([i915#7701]) -> [SKIP][13]
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg2-6/igt@device_reset@unbind-cold-reset-rebind.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-8/igt@device_reset@unbind-cold-reset-rebind.html
> 

And this is also correct, if test skipped before it should do it
also in this runs.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11114_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@blit-reloc-purge-cache:
>     - shard-dg1:          NOTRUN -> [SKIP][14] ([i915#8411])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@api_intel_bb@blit-reloc-purge-cache.html
>     - shard-mtlp:         NOTRUN -> [SKIP][15] ([i915#8411])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-8/igt@api_intel_bb@blit-reloc-purge-cache.html
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-rkl:          NOTRUN -> [SKIP][16] ([i915#8411]) +2 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-6/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>   * igt@drm_fdinfo@busy-check-all@bcs0:
>     - shard-dg1:          NOTRUN -> [SKIP][17] ([i915#8414]) +19 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-16/igt@drm_fdinfo@busy-check-all@bcs0.html
> 
>   * igt@drm_fdinfo@busy-idle@vecs0:
>     - shard-mtlp:         NOTRUN -> [SKIP][18] ([i915#8414]) +6 other tests skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-3/igt@drm_fdinfo@busy-idle@vecs0.html
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all@vecs1:
>     - shard-dg2:          NOTRUN -> [SKIP][19] ([i915#8414]) +13 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-5/igt@drm_fdinfo@most-busy-idle-check-all@vecs1.html
> 
>   * igt@gem_ccs@block-copy-compressed:
>     - shard-dg1:          NOTRUN -> [SKIP][20] ([i915#3555] / [i915#9323]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-16/igt@gem_ccs@block-copy-compressed.html
>     - shard-rkl:          NOTRUN -> [SKIP][21] ([i915#3555] / [i915#9323])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-2/igt@gem_ccs@block-copy-compressed.html
> 
>   * igt@gem_ccs@block-multicopy-compressed:
>     - shard-mtlp:         NOTRUN -> [SKIP][22] ([i915#9323])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-7/igt@gem_ccs@block-multicopy-compressed.html
> 
>   * igt@gem_ccs@ctrl-surf-copy:
>     - shard-tglu:         NOTRUN -> [SKIP][23] ([i915#3555] / [i915#9323])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-6/igt@gem_ccs@ctrl-surf-copy.html
> 
>   * igt@gem_ccs@suspend-resume:
>     - shard-dg1:          NOTRUN -> [SKIP][24] ([i915#9323]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-13/igt@gem_ccs@suspend-resume.html
> 
>   * igt@gem_close_race@multigpu-basic-threads:
>     - shard-mtlp:         NOTRUN -> [SKIP][25] ([i915#7697])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-1/igt@gem_close_race@multigpu-basic-threads.html
> 
>   * igt@gem_create@create-ext-cpu-access-big:
>     - shard-dg2:          [PASS][26] -> [ABORT][27] ([i915#9846])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg2-11/igt@gem_create@create-ext-cpu-access-big.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-8/igt@gem_create@create-ext-cpu-access-big.html
> 
>   * igt@gem_create@create-ext-set-pat:
>     - shard-dg2:          NOTRUN -> [SKIP][28] ([i915#8562])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-4/igt@gem_create@create-ext-set-pat.html
>     - shard-rkl:          NOTRUN -> [SKIP][29] ([i915#8562])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-2/igt@gem_create@create-ext-set-pat.html
>     - shard-dg1:          NOTRUN -> [SKIP][30] ([i915#8562])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-16/igt@gem_create@create-ext-set-pat.html
>     - shard-tglu:         NOTRUN -> [SKIP][31] ([i915#8562])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-7/igt@gem_create@create-ext-set-pat.html
> 
>   * igt@gem_ctx_persistence@hang:
>     - shard-dg1:          NOTRUN -> [SKIP][32] ([i915#8555])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@gem_ctx_persistence@hang.html
> 
>   * igt@gem_ctx_sseu@invalid-args:
>     - shard-dg2:          NOTRUN -> [SKIP][33] ([i915#280])
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-3/igt@gem_ctx_sseu@invalid-args.html
>     - shard-dg1:          NOTRUN -> [SKIP][34] ([i915#280])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@gem_ctx_sseu@invalid-args.html
> 
>   * igt@gem_eio@hibernate:
>     - shard-dg2:          NOTRUN -> [ABORT][35] ([i915#10030] / [i915#7975] / [i915#8213])
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-5/igt@gem_eio@hibernate.html
> 
>   * igt@gem_eio@kms:
>     - shard-tglu:         [PASS][36] -> [INCOMPLETE][37] ([i915#10513])
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-tglu-6/igt@gem_eio@kms.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-4/igt@gem_eio@kms.html
> 
>   * igt@gem_exec_balancer@noheartbeat:
>     - shard-mtlp:         NOTRUN -> [SKIP][38] ([i915#8555])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-2/igt@gem_exec_balancer@noheartbeat.html
> 
>   * igt@gem_exec_balancer@parallel-keep-submit-fence:
>     - shard-rkl:          NOTRUN -> [SKIP][39] ([i915#4525]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-5/igt@gem_exec_balancer@parallel-keep-submit-fence.html
> 
>   * igt@gem_exec_capture@capture-invisible@smem0:
>     - shard-glk:          NOTRUN -> [SKIP][40] ([i915#6334])
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-glk5/igt@gem_exec_capture@capture-invisible@smem0.html
> 
>   * igt@gem_exec_capture@capture-recoverable:
>     - shard-rkl:          NOTRUN -> [SKIP][41] ([i915#6344])
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-5/igt@gem_exec_capture@capture-recoverable.html
> 
>   * igt@gem_exec_capture@many-4k-incremental:
>     - shard-mtlp:         NOTRUN -> [FAIL][42] ([i915#9606])
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-5/igt@gem_exec_capture@many-4k-incremental.html
> 
>   * igt@gem_exec_capture@many-4k-zero:
>     - shard-dg1:          NOTRUN -> [FAIL][43] ([i915#9606])
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-17/igt@gem_exec_capture@many-4k-zero.html
> 
>   * igt@gem_exec_fair@basic-none-solo:
>     - shard-mtlp:         NOTRUN -> [SKIP][44] ([i915#4473])
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-3/igt@gem_exec_fair@basic-none-solo.html
> 
>   * igt@gem_exec_fair@basic-none-vip:
>     - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#3539] / [i915#4852]) +2 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-3/igt@gem_exec_fair@basic-none-vip.html
> 
>   * igt@gem_exec_fair@basic-none-vip@rcs0:
>     - shard-rkl:          NOTRUN -> [FAIL][46] ([i915#2842])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-5/igt@gem_exec_fair@basic-none-vip@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace-solo@rcs0:
>     - shard-glk:          NOTRUN -> [FAIL][47] ([i915#2842])
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-glk2/igt@gem_exec_fair@basic-pace-solo@rcs0.html
> 
>   * igt@gem_exec_fair@basic-pace@vecs0:
>     - shard-rkl:          [PASS][48] -> [FAIL][49] ([i915#2842]) +1 other test fail
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-rkl-2/igt@gem_exec_fair@basic-pace@vecs0.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@gem_exec_fair@basic-pace@vecs0.html
> 
>   * igt@gem_exec_fence@concurrent:
>     - shard-mtlp:         NOTRUN -> [SKIP][50] ([i915#4812])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-8/igt@gem_exec_fence@concurrent.html
> 
>   * igt@gem_exec_fence@submit:
>     - shard-dg1:          NOTRUN -> [SKIP][51] ([i915#4812])
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-17/igt@gem_exec_fence@submit.html
>     - shard-dg2:          NOTRUN -> [SKIP][52] ([i915#4812])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-11/igt@gem_exec_fence@submit.html
> 
>   * igt@gem_exec_flush@basic-batch-kernel-default-wb:
>     - shard-dg1:          NOTRUN -> [SKIP][53] ([i915#3539] / [i915#4852]) +3 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-16/igt@gem_exec_flush@basic-batch-kernel-default-wb.html
> 
>   * igt@gem_exec_params@secure-non-root:
>     - shard-dg2:          NOTRUN -> [SKIP][54] +12 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-4/igt@gem_exec_params@secure-non-root.html
> 
>   * igt@gem_exec_reloc@basic-cpu-read:
>     - shard-rkl:          NOTRUN -> [SKIP][55] ([i915#3281]) +6 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-5/igt@gem_exec_reloc@basic-cpu-read.html
> 
>   * igt@gem_exec_reloc@basic-wc-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][56] ([i915#3281]) +5 other tests skip
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-2/igt@gem_exec_reloc@basic-wc-gtt.html
> 
>   * igt@gem_exec_reloc@basic-write-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][57] ([i915#3281]) +6 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-2/igt@gem_exec_reloc@basic-write-gtt.html
> 
>   * igt@gem_exec_reloc@basic-write-gtt-active:
>     - shard-dg1:          NOTRUN -> [SKIP][58] ([i915#3281]) +7 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-14/igt@gem_exec_reloc@basic-write-gtt-active.html
> 
>   * igt@gem_fence_thrash@bo-write-verify-x:
>     - shard-dg2:          NOTRUN -> [SKIP][59] ([i915#4860]) +2 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-1/igt@gem_fence_thrash@bo-write-verify-x.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences:
>     - shard-mtlp:         NOTRUN -> [SKIP][60] ([i915#4860])
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-8/igt@gem_fenced_exec_thrash@no-spare-fences.html
> 
>   * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
>     - shard-dg1:          NOTRUN -> [SKIP][61] ([i915#4860]) +2 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-16/igt@gem_fenced_exec_thrash@no-spare-fences-busy.html
> 
>   * igt@gem_lmem_swapping@heavy-multi@lmem0:
>     - shard-dg1:          [PASS][62] -> [FAIL][63] ([i915#10378])
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg1-15/igt@gem_lmem_swapping@heavy-multi@lmem0.html
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-18/igt@gem_lmem_swapping@heavy-multi@lmem0.html
> 
>   * igt@gem_lmem_swapping@heavy-random:
>     - shard-mtlp:         NOTRUN -> [SKIP][64] ([i915#4613])
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-1/igt@gem_lmem_swapping@heavy-random.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>     - shard-glk:          NOTRUN -> [SKIP][65] ([i915#4613]) +2 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-glk2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi@lmem0:
>     - shard-dg1:          NOTRUN -> [FAIL][66] ([i915#10378])
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-16/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs:
>     - shard-rkl:          NOTRUN -> [SKIP][67] ([i915#4613]) +2 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-5/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
>     - shard-tglu:         NOTRUN -> [SKIP][68] ([i915#4613]) +2 other tests skip
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html
> 
>   * igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
>     - shard-dg1:          NOTRUN -> [SKIP][69] ([i915#4565])
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-13/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html
> 
>   * igt@gem_lmem_swapping@smem-oom@lmem0:
>     - shard-dg2:          [PASS][70] -> [DMESG-WARN][71] ([i915#4936] / [i915#5493])
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-11/igt@gem_lmem_swapping@smem-oom@lmem0.html
> 
>   * igt@gem_media_fill@media-fill:
>     - shard-mtlp:         NOTRUN -> [SKIP][72] ([i915#8289])
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-8/igt@gem_media_fill@media-fill.html
> 
>   * igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
>     - shard-dg1:          NOTRUN -> [SKIP][73] ([i915#4077]) +10 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html
> 
>   * igt@gem_mmap_gtt@flink-race:
>     - shard-mtlp:         NOTRUN -> [SKIP][74] ([i915#4077]) +6 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-4/igt@gem_mmap_gtt@flink-race.html
> 
>   * igt@gem_mmap_gtt@pf-nonblock:
>     - shard-dg2:          NOTRUN -> [SKIP][75] ([i915#4077]) +2 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-4/igt@gem_mmap_gtt@pf-nonblock.html
> 
>   * igt@gem_mmap_wc@read:
>     - shard-dg1:          NOTRUN -> [SKIP][76] ([i915#4083]) +2 other tests skip
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-16/igt@gem_mmap_wc@read.html
> 
>   * igt@gem_mmap_wc@write:
>     - shard-mtlp:         NOTRUN -> [SKIP][77] ([i915#4083]) +1 other test skip
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-6/igt@gem_mmap_wc@write.html
> 
>   * igt@gem_mmap_wc@write-cpu-read-wc:
>     - shard-dg2:          NOTRUN -> [SKIP][78] ([i915#4083]) +2 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-11/igt@gem_mmap_wc@write-cpu-read-wc.html
> 
>   * igt@gem_partial_pwrite_pread@write-uncached:
>     - shard-dg2:          NOTRUN -> [SKIP][79] ([i915#3282]) +2 other tests skip
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-5/igt@gem_partial_pwrite_pread@write-uncached.html
> 
>   * igt@gem_pwrite@basic-exhaustion:
>     - shard-rkl:          NOTRUN -> [SKIP][80] ([i915#3282]) +7 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-2/igt@gem_pwrite@basic-exhaustion.html
>     - shard-dg1:          NOTRUN -> [SKIP][81] ([i915#3282]) +6 other tests skip
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@gem_pwrite@basic-exhaustion.html
>     - shard-tglu:         NOTRUN -> [WARN][82] ([i915#2658])
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-10/igt@gem_pwrite@basic-exhaustion.html
> 
>   * igt@gem_pxp@create-regular-context-1:
>     - shard-dg2:          NOTRUN -> [SKIP][83] ([i915#4270]) +2 other tests skip
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-5/igt@gem_pxp@create-regular-context-1.html
> 
>   * igt@gem_pxp@create-valid-protected-context:
>     - shard-rkl:          NOTRUN -> [SKIP][84] ([i915#4270])
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@gem_pxp@create-valid-protected-context.html
> 
>   * igt@gem_pxp@reject-modify-context-protection-on:
>     - shard-dg1:          NOTRUN -> [SKIP][85] ([i915#4270]) +3 other tests skip
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-17/igt@gem_pxp@reject-modify-context-protection-on.html
> 
>   * igt@gem_pxp@verify-pxp-stale-ctx-execution:
>     - shard-mtlp:         NOTRUN -> [SKIP][86] ([i915#4270]) +1 other test skip
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-6/igt@gem_pxp@verify-pxp-stale-ctx-execution.html
> 
>   * igt@gem_readwrite@new-obj:
>     - shard-mtlp:         NOTRUN -> [SKIP][87] ([i915#3282]) +2 other tests skip
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-8/igt@gem_readwrite@new-obj.html
> 
>   * igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
>     - shard-mtlp:         NOTRUN -> [SKIP][88] ([i915#8428]) +2 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-4/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html
> 
>   * igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][89] ([i915#5190] / [i915#8428]) +4 other tests skip
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-3/igt@gem_render_copy@yf-tiled-to-vebox-yf-tiled.html
> 
>   * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
>     - shard-dg2:          NOTRUN -> [SKIP][90] ([i915#4079]) +1 other test skip
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-11/igt@gem_set_tiling_vs_blt@untiled-to-tiled.html
> 
>   * igt@gem_set_tiling_vs_gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][91] ([i915#4079]) +1 other test skip
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-1/igt@gem_set_tiling_vs_gtt.html
> 
>   * igt@gem_softpin@evict-snoop:
>     - shard-dg1:          NOTRUN -> [SKIP][92] ([i915#4885])
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@gem_softpin@evict-snoop.html
>     - shard-dg2:          NOTRUN -> [SKIP][93] ([i915#4885])
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-7/igt@gem_softpin@evict-snoop.html
> 
>   * igt@gem_unfence_active_buffers:
>     - shard-mtlp:         NOTRUN -> [SKIP][94] ([i915#4879])
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-5/igt@gem_unfence_active_buffers.html
> 
>   * igt@gem_userptr_blits@create-destroy-unsync:
>     - shard-dg2:          NOTRUN -> [SKIP][95] ([i915#3297]) +1 other test skip
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-8/igt@gem_userptr_blits@create-destroy-unsync.html
>     - shard-rkl:          NOTRUN -> [SKIP][96] ([i915#3297]) +1 other test skip
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-6/igt@gem_userptr_blits@create-destroy-unsync.html
> 
>   * igt@gem_userptr_blits@dmabuf-sync:
>     - shard-mtlp:         NOTRUN -> [SKIP][97] ([i915#3297]) +2 other tests skip
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-6/igt@gem_userptr_blits@dmabuf-sync.html
>     - shard-rkl:          NOTRUN -> [SKIP][98] ([i915#3323])
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-2/igt@gem_userptr_blits@dmabuf-sync.html
> 
>   * igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>     - shard-dg1:          NOTRUN -> [SKIP][99] ([i915#3297] / [i915#4880]) +2 other tests skip
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-16/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html
> 
>   * igt@gem_userptr_blits@sd-probe:
>     - shard-dg2:          NOTRUN -> [SKIP][100] ([i915#3297] / [i915#4958])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-4/igt@gem_userptr_blits@sd-probe.html
>     - shard-dg1:          NOTRUN -> [SKIP][101] ([i915#3297] / [i915#4958])
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-16/igt@gem_userptr_blits@sd-probe.html
> 
>   * igt@gem_userptr_blits@unsync-unmap-after-close:
>     - shard-dg1:          NOTRUN -> [SKIP][102] ([i915#3297]) +2 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-16/igt@gem_userptr_blits@unsync-unmap-after-close.html
> 
>   * igt@gen9_exec_parse@allowed-all:
>     - shard-glk:          NOTRUN -> [ABORT][103] ([i915#5566])
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-glk3/igt@gen9_exec_parse@allowed-all.html
> 
>   * igt@gen9_exec_parse@allowed-single:
>     - shard-rkl:          NOTRUN -> [SKIP][104] ([i915#2527]) +2 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-6/igt@gen9_exec_parse@allowed-single.html
> 
>   * igt@gen9_exec_parse@batch-invalid-length:
>     - shard-mtlp:         NOTRUN -> [SKIP][105] ([i915#2856]) +1 other test skip
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-4/igt@gen9_exec_parse@batch-invalid-length.html
> 
>   * igt@gen9_exec_parse@bb-large:
>     - shard-dg1:          NOTRUN -> [SKIP][106] ([i915#2527]) +3 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-13/igt@gen9_exec_parse@bb-large.html
> 
>   * igt@gen9_exec_parse@bb-start-param:
>     - shard-dg2:          NOTRUN -> [SKIP][107] ([i915#2856]) +1 other test skip
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-3/igt@gen9_exec_parse@bb-start-param.html
>     - shard-tglu:         NOTRUN -> [SKIP][108] ([i915#2527] / [i915#2856]) +1 other test skip
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-2/igt@gen9_exec_parse@bb-start-param.html
> 
>   * igt@i915_fb_tiling:
>     - shard-mtlp:         NOTRUN -> [SKIP][109] ([i915#4881])
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-8/igt@i915_fb_tiling.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-dg2:          [PASS][110] -> [ABORT][111] ([i915#9820])
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg2-8/igt@i915_module_load@reload-with-fault-injection.html
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-7/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@i915_module_load@resize-bar:
>     - shard-tglu:         NOTRUN -> [SKIP][112] ([i915#6412])
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-2/igt@i915_module_load@resize-bar.html
> 
>   * igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0:
>     - shard-dg1:          [PASS][113] -> [FAIL][114] ([i915#3591])
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg1-18/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@gt0-bcs0.html
> 
>   * igt@i915_pm_rps@min-max-config-idle:
>     - shard-mtlp:         NOTRUN -> [SKIP][115] ([i915#6621])
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-7/igt@i915_pm_rps@min-max-config-idle.html
> 
>   * igt@i915_pm_rps@thresholds-park@gt0:
>     - shard-dg2:          NOTRUN -> [SKIP][116] ([i915#8925])
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-11/igt@i915_pm_rps@thresholds-park@gt0.html
> 
>   * igt@i915_pm_rps@thresholds@gt0:
>     - shard-dg1:          NOTRUN -> [SKIP][117] ([i915#8925])
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@i915_pm_rps@thresholds@gt0.html
> 
>   * igt@i915_power@sanity:
>     - shard-mtlp:         NOTRUN -> [SKIP][118] ([i915#7984])
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-2/igt@i915_power@sanity.html
> 
>   * igt@i915_query@hwconfig_table:
>     - shard-dg1:          NOTRUN -> [SKIP][119] ([i915#6245])
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-17/igt@i915_query@hwconfig_table.html
>     - shard-tglu:         NOTRUN -> [SKIP][120] ([i915#6245])
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-6/igt@i915_query@hwconfig_table.html
>     - shard-rkl:          NOTRUN -> [SKIP][121] ([i915#6245])
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@i915_query@hwconfig_table.html
> 
>   * igt@i915_selftest@mock@memory_region:
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][122] ([i915#9311])
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-2/igt@i915_selftest@mock@memory_region.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][123] ([i915#4212]) +1 other test skip
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-4/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@clobberred-modifier:
>     - shard-dg2:          NOTRUN -> [SKIP][124] ([i915#4212]) +1 other test skip
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-11/igt@kms_addfb_basic@clobberred-modifier.html
> 
>   * igt@kms_addfb_basic@tile-pitch-mismatch:
>     - shard-dg1:          NOTRUN -> [SKIP][125] ([i915#4212]) +1 other test skip
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-17/igt@kms_addfb_basic@tile-pitch-mismatch.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
>     - shard-rkl:          NOTRUN -> [SKIP][126] ([i915#8709]) +3 other tests skip
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html
> 
>   * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>     - shard-dg1:          NOTRUN -> [SKIP][127] ([i915#1769] / [i915#3555])
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
> 
>   * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
>     - shard-rkl:          NOTRUN -> [SKIP][128] ([i915#5286]) +5 other tests skip
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
>     - shard-dg1:          NOTRUN -> [SKIP][129] ([i915#4538] / [i915#5286]) +2 other tests skip
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-tglu:         NOTRUN -> [SKIP][130] ([i915#5286]) +3 other tests skip
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-rkl:          NOTRUN -> [SKIP][131] ([i915#3638]) +3 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-2/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-mtlp:         NOTRUN -> [SKIP][132] +12 other tests skip
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-2/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-dg1:          NOTRUN -> [SKIP][133] ([i915#3638]) +3 other tests skip
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
>     - shard-dg2:          NOTRUN -> [SKIP][134] ([i915#4538] / [i915#5190]) +6 other tests skip
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-11/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
>     - shard-tglu:         NOTRUN -> [SKIP][135] +55 other tests skip
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2:          NOTRUN -> [SKIP][136] ([i915#5190])
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>     - shard-dg1:          NOTRUN -> [SKIP][137] ([i915#4538]) +4 other tests skip
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-16/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_joiner@invalid-modeset:
>     - shard-dg1:          NOTRUN -> [SKIP][138] ([i915#10656])
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-18/igt@kms_big_joiner@invalid-modeset.html
> 
>   * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][139] ([i915#6095]) +91 other tests skip
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-16/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][140] ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][141] ([i915#6095]) +19 other tests skip
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-edp-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][142] ([i915#6095]) +55 other tests skip
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
>     - shard-mtlp:         NOTRUN -> [SKIP][143] ([i915#10278])
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
>     - shard-dg2:          NOTRUN -> [SKIP][144] ([i915#10278]) +1 other test skip
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
>     - shard-rkl:          NOTRUN -> [SKIP][145] ([i915#10278]) +2 other tests skip
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][146] ([i915#10307] / [i915#6095]) +135 other tests skip
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-2.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][147] ([i915#6095]) +27 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-dg1:          NOTRUN -> [SKIP][148] ([i915#10278]) +3 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-17/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-a-dp-4:
>     - shard-dg2:          NOTRUN -> [SKIP][149] ([i915#7213]) +3 other tests skip
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-11/igt@kms_cdclk@mode-transition@pipe-a-dp-4.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-c-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][150] ([i915#4087]) +3 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-5/igt@kms_cdclk@plane-scaling@pipe-c-edp-1.html
> 
>   * igt@kms_chamelium_audio@dp-audio:
>     - shard-tglu:         NOTRUN -> [SKIP][151] ([i915#7828]) +5 other tests skip
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-3/igt@kms_chamelium_audio@dp-audio.html
> 
>   * igt@kms_chamelium_edid@dp-edid-read:
>     - shard-dg2:          NOTRUN -> [SKIP][152] ([i915#7828]) +4 other tests skip
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-3/igt@kms_chamelium_edid@dp-edid-read.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
>     - shard-mtlp:         NOTRUN -> [SKIP][153] ([i915#7828]) +3 other tests skip
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-6/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>     - shard-dg1:          NOTRUN -> [SKIP][154] ([i915#7828]) +9 other tests skip
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-14/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-fast:
>     - shard-rkl:          NOTRUN -> [SKIP][155] ([i915#7828]) +5 other tests skip
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-6/igt@kms_chamelium_hpd@vga-hpd-fast.html
> 
>   * igt@kms_content_protection@atomic:
>     - shard-mtlp:         NOTRUN -> [SKIP][156] ([i915#6944] / [i915#9424])
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-2/igt@kms_content_protection@atomic.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-tglu:         NOTRUN -> [SKIP][157] ([i915#6944] / [i915#9424]) +1 other test skip
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-10/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg1:          NOTRUN -> [SKIP][158] ([i915#3299])
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-14/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_content_protection@dp-mst-type-1:
>     - shard-rkl:          NOTRUN -> [SKIP][159] ([i915#3116])
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@kms_content_protection@dp-mst-type-1.html
> 
>   * igt@kms_content_protection@lic-type-0:
>     - shard-dg2:          NOTRUN -> [SKIP][160] ([i915#9424])
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-5/igt@kms_content_protection@lic-type-0.html
> 
>   * igt@kms_content_protection@mei-interface:
>     - shard-rkl:          NOTRUN -> [SKIP][161] ([i915#9424])
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@kms_content_protection@mei-interface.html
>     - shard-dg1:          NOTRUN -> [SKIP][162] ([i915#9433])
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-17/igt@kms_content_protection@mei-interface.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2:          NOTRUN -> [SKIP][163] ([i915#7118])
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-8/igt@kms_content_protection@srm.html
>     - shard-dg1:          NOTRUN -> [SKIP][164] ([i915#7116])
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-18/igt@kms_content_protection@srm.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-rkl:          NOTRUN -> [SKIP][165] ([i915#7118] / [i915#9424])
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-6/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-32x32:
>     - shard-rkl:          NOTRUN -> [SKIP][166] ([i915#3555]) +2 other tests skip
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-32x32.html
>     - shard-dg1:          NOTRUN -> [SKIP][167] ([i915#3555]) +5 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-32x32.html
>     - shard-tglu:         NOTRUN -> [SKIP][168] ([i915#3555]) +1 other test skip
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-9/igt@kms_cursor_crc@cursor-onscreen-32x32.html
>     - shard-dg2:          NOTRUN -> [SKIP][169] ([i915#3555])
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-11/igt@kms_cursor_crc@cursor-onscreen-32x32.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x170:
>     - shard-dg1:          NOTRUN -> [SKIP][170] ([i915#3359]) +3 other tests skip
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-16/igt@kms_cursor_crc@cursor-onscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-512x512:
>     - shard-mtlp:         NOTRUN -> [SKIP][171] ([i915#3359]) +2 other tests skip
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x170:
>     - shard-rkl:          NOTRUN -> [SKIP][172] ([i915#3359]) +1 other test skip
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x170.html
>     - shard-tglu:         NOTRUN -> [SKIP][173] ([i915#3359])
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-4/igt@kms_cursor_crc@cursor-sliding-512x170.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-rkl:          NOTRUN -> [SKIP][174] +34 other tests skip
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - shard-mtlp:         NOTRUN -> [SKIP][175] ([i915#4213]) +1 other test skip
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-2/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
>     - shard-mtlp:         NOTRUN -> [SKIP][176] ([i915#9809]) +3 other tests skip
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
> 
>   * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>     - shard-dg1:          NOTRUN -> [SKIP][177] ([i915#9067])
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-16/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html
> 
>   * igt@kms_cursor_legacy@torture-move@pipe-a:
>     - shard-snb:          [PASS][178] -> [DMESG-WARN][179] ([i915#10166])
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-snb2/igt@kms_cursor_legacy@torture-move@pipe-a.html
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-snb4/igt@kms_cursor_legacy@torture-move@pipe-a.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [SKIP][180] ([i915#9227])
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-5/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-3.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][181] ([i915#3804])
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
>     - shard-tglu:         NOTRUN -> [SKIP][182] ([i915#3804])
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_dp_aux_dev:
>     - shard-rkl:          NOTRUN -> [SKIP][183] ([i915#1257])
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@kms_dp_aux_dev.html
>     - shard-dg1:          NOTRUN -> [SKIP][184] ([i915#1257])
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-17/igt@kms_dp_aux_dev.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - shard-tglu:         NOTRUN -> [SKIP][185] ([i915#3555] / [i915#3840])
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-2/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg1:          NOTRUN -> [SKIP][186] ([i915#3840] / [i915#9053])
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-18/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg1:          NOTRUN -> [SKIP][187] ([i915#4854])
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1:
>     - shard-snb:          [PASS][188] -> [FAIL][189] ([i915#2122]) +3 other tests fail
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-snb6/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-snb7/igt@kms_flip@2x-blocking-wf_vblank@ab-vga1-hdmi-a1.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>     - shard-tglu:         NOTRUN -> [SKIP][190] ([i915#3637]) +3 other tests skip
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][191] ([i915#9934]) +4 other tests skip
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-14/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
>     - shard-mtlp:         NOTRUN -> [SKIP][192] ([i915#3637]) +4 other tests skip
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a2:
>     - shard-dg2:          NOTRUN -> [FAIL][193] ([i915#2122]) +2 other tests fail
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-2/igt@kms_flip@flip-vs-blocking-wf-vblank@b-hdmi-a2.html
> 
>   * igt@kms_flip@flip-vs-fences-interruptible:
>     - shard-dg1:          NOTRUN -> [SKIP][194] ([i915#8381])
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@kms_flip@flip-vs-fences-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
>     - shard-tglu:         NOTRUN -> [SKIP][195] ([i915#2587] / [i915#2672]) +2 other tests skip
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][196] ([i915#2672]) +2 other tests skip
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>     - shard-dg2:          NOTRUN -> [SKIP][197] ([i915#2672]) +2 other tests skip
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-mtlp:         NOTRUN -> [SKIP][198] ([i915#8810])
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
>     - shard-rkl:          NOTRUN -> [SKIP][199] ([i915#2672]) +1 other test skip
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
>     - shard-dg1:          NOTRUN -> [SKIP][200] ([i915#2587] / [i915#2672]) +5 other tests skip
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-18/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-rkl:          NOTRUN -> [SKIP][201] ([i915#1825]) +27 other tests skip
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>     - shard-dg2:          NOTRUN -> [SKIP][202] ([i915#8708]) +9 other tests skip
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>     - shard-dg1:          NOTRUN -> [SKIP][203] +56 other tests skip
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
>     - shard-mtlp:         NOTRUN -> [SKIP][204] ([i915#1825]) +13 other tests skip
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-4:
>     - shard-dg1:          NOTRUN -> [SKIP][205] ([i915#5439])
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-17/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt:
>     - shard-mtlp:         NOTRUN -> [SKIP][206] ([i915#8708]) +5 other tests skip
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-gtt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
>     - shard-rkl:          NOTRUN -> [SKIP][207] ([i915#3023]) +18 other tests skip
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html
> 
>   * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>     - shard-dg1:          NOTRUN -> [SKIP][208] ([i915#9766])
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-18/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg1:          NOTRUN -> [SKIP][209] ([i915#8708]) +19 other tests skip
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
>     - shard-dg2:          NOTRUN -> [SKIP][210] ([i915#3458]) +6 other tests skip
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
>     - shard-dg2:          NOTRUN -> [SKIP][211] ([i915#5354]) +21 other tests skip
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
>     - shard-dg1:          NOTRUN -> [SKIP][212] ([i915#3458]) +21 other tests skip
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg1:          NOTRUN -> [SKIP][213] ([i915#433])
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_hdr@bpc-switch:
>     - shard-tglu:         NOTRUN -> [SKIP][214] ([i915#3555] / [i915#8228]) +1 other test skip
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-4/igt@kms_hdr@bpc-switch.html
> 
>   * igt@kms_hdr@bpc-switch-dpms:
>     - shard-rkl:          NOTRUN -> [SKIP][215] ([i915#3555] / [i915#8228]) +2 other tests skip
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@kms_hdr@bpc-switch-dpms.html
>     - shard-dg1:          NOTRUN -> [SKIP][216] ([i915#3555] / [i915#8228]) +1 other test skip
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-17/igt@kms_hdr@bpc-switch-dpms.html
> 
>   * igt@kms_hdr@invalid-metadata-sizes:
>     - shard-dg2:          NOTRUN -> [SKIP][217] ([i915#3555] / [i915#8228])
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-3/igt@kms_hdr@invalid-metadata-sizes.html
> 
>   * igt@kms_hdr@static-toggle-suspend:
>     - shard-mtlp:         NOTRUN -> [SKIP][218] ([i915#3555] / [i915#8228])
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-5/igt@kms_hdr@static-toggle-suspend.html
> 
>   * igt@kms_panel_fitting@atomic-fastset:
>     - shard-tglu:         NOTRUN -> [SKIP][219] ([i915#6301])
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-10/igt@kms_panel_fitting@atomic-fastset.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-dg1:          NOTRUN -> [SKIP][220] ([i915#6301])
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-18/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
>     - shard-glk:          NOTRUN -> [FAIL][221] ([i915#10647]) +1 other test fail
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-glk8/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_plane_lowres@tiling-y:
>     - shard-dg2:          NOTRUN -> [SKIP][222] ([i915#8821])
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-7/igt@kms_plane_lowres@tiling-y.html
> 
>   * igt@kms_plane_lowres@tiling-yf:
>     - shard-dg2:          NOTRUN -> [SKIP][223] ([i915#3555] / [i915#8821])
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-3/igt@kms_plane_lowres@tiling-yf.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [FAIL][224] ([i915#8292])
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [FAIL][225] ([i915#8292])
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][226] ([i915#9423]) +3 other tests skip
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][227] ([i915#9423]) +3 other tests skip
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][228] ([i915#9423]) +11 other tests skip
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-17/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-d-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1:
>     - shard-rkl:          NOTRUN -> [SKIP][229] ([i915#5176] / [i915#9423]) +1 other test skip
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-2:
>     - shard-dg2:          NOTRUN -> [SKIP][230] ([i915#5235] / [i915#9423] / [i915#9728]) +3 other tests skip
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-c-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
>     - shard-tglu:         NOTRUN -> [SKIP][231] ([i915#5235]) +3 other tests skip
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-9/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-1:
>     - shard-dg2:          NOTRUN -> [SKIP][232] ([i915#5235] / [i915#9423]) +11 other tests skip
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-4/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4:
>     - shard-dg1:          NOTRUN -> [SKIP][233] ([i915#5235]) +15 other tests skip
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-18/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2:
>     - shard-rkl:          NOTRUN -> [SKIP][234] ([i915#5235]) +9 other tests skip
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-2.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][235] ([i915#5235]) +2 other tests skip
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][236] ([i915#3555] / [i915#5235])
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-d-edp-1.html
> 
>   * igt@kms_pm_backlight@bad-brightness:
>     - shard-tglu:         NOTRUN -> [SKIP][237] ([i915#9812]) +1 other test skip
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-6/igt@kms_pm_backlight@bad-brightness.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - shard-rkl:          NOTRUN -> [SKIP][238] ([i915#5354])
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg1:          NOTRUN -> [SKIP][239] ([i915#5354]) +1 other test skip
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-14/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-dg2:          NOTRUN -> [SKIP][240] ([i915#9340])
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-3/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>     - shard-dg1:          NOTRUN -> [SKIP][241] ([i915#9519])
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-13/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
> 
>   * igt@kms_pm_rpm@dpms-non-lpsp:
>     - shard-rkl:          NOTRUN -> [SKIP][242] ([i915#9519])
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@kms_pm_rpm@dpms-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-rkl:          [PASS][243] -> [SKIP][244] ([i915#9519])
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-rkl-1/igt@kms_pm_rpm@modeset-non-lpsp.html
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_prime@basic-crc-vgem:
>     - shard-dg2:          NOTRUN -> [SKIP][245] ([i915#6524] / [i915#6805]) +1 other test skip
>    [245]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-4/igt@kms_prime@basic-crc-vgem.html
> 
>   * igt@kms_prime@basic-modeset-hybrid:
>     - shard-rkl:          NOTRUN -> [SKIP][246] ([i915#6524]) +1 other test skip
>    [246]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-6/igt@kms_prime@basic-modeset-hybrid.html
>     - shard-dg1:          NOTRUN -> [SKIP][247] ([i915#6524]) +1 other test skip
>    [247]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-18/igt@kms_prime@basic-modeset-hybrid.html
>     - shard-tglu:         NOTRUN -> [SKIP][248] ([i915#6524])
>    [248]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-4/igt@kms_prime@basic-modeset-hybrid.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf@psr2-pipe-b-edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][249] ([i915#9808]) +1 other test skip
>    [249]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-2/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf@psr2-pipe-b-edp-1.html
> 
>   * igt@kms_psr2_su@page_flip-xrgb8888:
>     - shard-mtlp:         NOTRUN -> [SKIP][250] ([i915#4348])
>    [250]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html
> 
>   * igt@kms_psr@fbc-pr-cursor-render:
>     - shard-dg2:          NOTRUN -> [SKIP][251] ([i915#1072] / [i915#9673] / [i915#9732]) +3 other tests skip
>    [251]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-11/igt@kms_psr@fbc-pr-cursor-render.html
> 
>   * igt@kms_psr@fbc-pr-primary-render:
>     - shard-dg2:          NOTRUN -> [SKIP][252] ([i915#1072] / [i915#9732]) +7 other tests skip
>    [252]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-5/igt@kms_psr@fbc-pr-primary-render.html
> 
>   * igt@kms_psr@fbc-psr-primary-render:
>     - shard-dg1:          NOTRUN -> [SKIP][253] ([i915#1072] / [i915#9732]) +27 other tests skip
>    [253]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-16/igt@kms_psr@fbc-psr-primary-render.html
> 
>   * igt@kms_psr@pr-cursor-plane-move:
>     - shard-mtlp:         NOTRUN -> [SKIP][254] ([i915#9688]) +6 other tests skip
>    [254]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-7/igt@kms_psr@pr-cursor-plane-move.html
> 
>   * igt@kms_psr@psr-sprite-plane-move:
>     - shard-rkl:          NOTRUN -> [SKIP][255] ([i915#1072] / [i915#9732]) +18 other tests skip
>    [255]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-6/igt@kms_psr@psr-sprite-plane-move.html
> 
>   * igt@kms_psr@psr2-cursor-plane-onoff:
>     - shard-tglu:         NOTRUN -> [SKIP][256] ([i915#9732]) +12 other tests skip
>    [256]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-10/igt@kms_psr@psr2-cursor-plane-onoff.html
> 
>   * igt@kms_psr@psr2-sprite-mmap-gtt@edp-1:
>     - shard-mtlp:         NOTRUN -> [SKIP][257] ([i915#4077] / [i915#9688])
>    [257]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-6/igt@kms_psr@psr2-sprite-mmap-gtt@edp-1.html
> 
>   * igt@kms_psr@psr2-sprite-plane-onoff:
>     - shard-glk:          NOTRUN -> [SKIP][258] +285 other tests skip
>    [258]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-glk1/igt@kms_psr@psr2-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@exhaust-fences:
>     - shard-dg1:          NOTRUN -> [SKIP][259] ([i915#4884])
>    [259]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-17/igt@kms_rotation_crc@exhaust-fences.html
>     - shard-dg2:          NOTRUN -> [SKIP][260] ([i915#4235])
>    [260]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-5/igt@kms_rotation_crc@exhaust-fences.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>     - shard-dg2:          NOTRUN -> [SKIP][261] ([i915#4235] / [i915#5190])
>    [261]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg1:          NOTRUN -> [SKIP][262] ([i915#5289])
>    [262]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-18/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-mtlp:         NOTRUN -> [SKIP][263] ([i915#4235])
>    [263]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-mtlp:         NOTRUN -> [SKIP][264] ([i915#3555] / [i915#8809])
>    [264]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-1/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_sysfs_edid_timing:
>     - shard-snb:          [PASS][265] -> [FAIL][266] ([IGT#2] / [i915#6493])
>    [265]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-snb2/igt@kms_sysfs_edid_timing.html
>    [266]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-snb7/igt@kms_sysfs_edid_timing.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-glk:          NOTRUN -> [FAIL][267] ([i915#10959])
>    [267]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-glk3/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-3:
>     - shard-dg2:          NOTRUN -> [FAIL][268] ([i915#9196])
>    [268]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-7/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-3.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>     - shard-tglu:         [PASS][269] -> [FAIL][270] ([i915#9196])
>    [269]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>    [270]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
>     - shard-mtlp:         [PASS][271] -> [FAIL][272] ([i915#9196]) +1 other test fail
>    [271]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
>    [272]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-tglu:         NOTRUN -> [SKIP][273] ([i915#2437] / [i915#9412])
>    [273]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-mtlp:         NOTRUN -> [SKIP][274] ([i915#2437]) +1 other test skip
>    [274]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-7/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-glk:          NOTRUN -> [SKIP][275] ([i915#2437])
>    [275]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-glk8/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@kms_writeback@writeback-pixel-formats:
>     - shard-rkl:          NOTRUN -> [SKIP][276] ([i915#2437] / [i915#9412])
>    [276]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-6/igt@kms_writeback@writeback-pixel-formats.html
> 
>   * igt@perf@global-sseu-config-invalid:
>     - shard-dg2:          NOTRUN -> [SKIP][277] ([i915#7387])
>    [277]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-11/igt@perf@global-sseu-config-invalid.html
> 
>   * igt@perf@mi-rpc:
>     - shard-dg1:          NOTRUN -> [SKIP][278] ([i915#2434])
>    [278]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-13/igt@perf@mi-rpc.html
> 
>   * igt@perf@unprivileged-single-ctx-counters:
>     - shard-rkl:          NOTRUN -> [SKIP][279] ([i915#2433])
>    [279]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-5/igt@perf@unprivileged-single-ctx-counters.html
>     - shard-dg1:          NOTRUN -> [SKIP][280] ([i915#2433])
>    [280]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-13/igt@perf@unprivileged-single-ctx-counters.html
> 
>   * igt@perf_pmu@busy-double-start@bcs0:
>     - shard-mtlp:         [PASS][281] -> [FAIL][282] ([i915#4349])
>    [281]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-mtlp-3/igt@perf_pmu@busy-double-start@bcs0.html
>    [282]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-8/igt@perf_pmu@busy-double-start@bcs0.html
> 
>   * igt@perf_pmu@cpu-hotplug:
>     - shard-dg2:          NOTRUN -> [SKIP][283] ([i915#8850])
>    [283]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-8/igt@perf_pmu@cpu-hotplug.html
>     - shard-rkl:          NOTRUN -> [SKIP][284] ([i915#8850])
>    [284]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-6/igt@perf_pmu@cpu-hotplug.html
>     - shard-dg1:          NOTRUN -> [SKIP][285] ([i915#8850])
>    [285]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-18/igt@perf_pmu@cpu-hotplug.html
>     - shard-tglu:         NOTRUN -> [SKIP][286] ([i915#8850])
>    [286]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-4/igt@perf_pmu@cpu-hotplug.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-snb:          [PASS][287] -> [INCOMPLETE][288] ([i915#9853])
>    [287]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-snb7/igt@perf_pmu@module-unload.html
>    [288]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-snb4/igt@perf_pmu@module-unload.html
> 
>   * igt@perf_pmu@rc6@other-idle-gt0:
>     - shard-dg1:          NOTRUN -> [SKIP][289] ([i915#8516])
>    [289]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@perf_pmu@rc6@other-idle-gt0.html
> 
>   * igt@prime_vgem@fence-read-hang:
>     - shard-dg2:          NOTRUN -> [SKIP][290] ([i915#3708]) +1 other test skip
>    [290]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-11/igt@prime_vgem@fence-read-hang.html
>     - shard-rkl:          NOTRUN -> [SKIP][291] ([i915#3708])
>    [291]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@prime_vgem@fence-read-hang.html
>     - shard-dg1:          NOTRUN -> [SKIP][292] ([i915#3708])
>    [292]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-17/igt@prime_vgem@fence-read-hang.html
> 
>   * igt@sriov_basic@bind-unbind-vf:
>     - shard-dg1:          NOTRUN -> [SKIP][293] ([i915#9917]) +1 other test skip
>    [293]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-16/igt@sriov_basic@bind-unbind-vf.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-off:
>     - shard-rkl:          NOTRUN -> [SKIP][294] ([i915#9917]) +1 other test skip
>    [294]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
> 
>   * igt@sriov_basic@enable-vfs-autoprobe-on:
>     - shard-dg2:          NOTRUN -> [SKIP][295] ([i915#9917])
>    [295]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-5/igt@sriov_basic@enable-vfs-autoprobe-on.html
> 
>   * igt@syncobj_wait@invalid-wait-zero-handles:
>     - shard-glk:          NOTRUN -> [FAIL][296] ([i915#9779])
>    [296]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-glk3/igt@syncobj_wait@invalid-wait-zero-handles.html
> 
>   * igt@v3d/v3d_perfmon@get-values-invalid-perfmon:
>     - shard-dg1:          NOTRUN -> [SKIP][297] ([i915#2575]) +11 other tests skip
>    [297]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@v3d/v3d_perfmon@get-values-invalid-perfmon.html
> 
>   * igt@v3d/v3d_submit_cl@bad-multisync-pad:
>     - shard-tglu:         NOTRUN -> [SKIP][298] ([i915#2575]) +11 other tests skip
>    [298]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-6/igt@v3d/v3d_submit_cl@bad-multisync-pad.html
> 
>   * igt@v3d/v3d_submit_csd@bad-flag:
>     - shard-dg2:          NOTRUN -> [SKIP][299] ([i915#2575]) +7 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-7/igt@v3d/v3d_submit_csd@bad-flag.html
> 
>   * igt@v3d/v3d_submit_csd@bad-pad:
>     - shard-mtlp:         NOTRUN -> [SKIP][300] ([i915#2575]) +5 other tests skip
>    [300]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-3/igt@v3d/v3d_submit_csd@bad-pad.html
> 
>   * igt@vc4/vc4_mmap@mmap-bo:
>     - shard-dg2:          NOTRUN -> [SKIP][301] ([i915#7711]) +3 other tests skip
>    [301]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-11/igt@vc4/vc4_mmap@mmap-bo.html
> 
>   * igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged:
>     - shard-mtlp:         NOTRUN -> [SKIP][302] ([i915#7711]) +4 other tests skip
>    [302]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-1/igt@vc4/vc4_purgeable_bo@mark-unpurgeable-purged.html
> 
>   * igt@vc4/vc4_tiling@set-bad-modifier:
>     - shard-rkl:          NOTRUN -> [SKIP][303] ([i915#7711]) +5 other tests skip
>    [303]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@vc4/vc4_tiling@set-bad-modifier.html
> 
>   * igt@vc4/vc4_wait_bo@used-bo-0ns:
>     - shard-dg1:          NOTRUN -> [SKIP][304] ([i915#7711]) +13 other tests skip
>    [304]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@vc4/vc4_wait_bo@used-bo-0ns.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_eio@unwedge-stress:
>     - shard-dg1:          [FAIL][305] ([i915#5784]) -> [PASS][306]
>    [305]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg1-14/igt@gem_eio@unwedge-stress.html
>    [306]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@gem_eio@unwedge-stress.html
> 
>   * igt@gem_exec_fair@basic-pace@rcs0:
>     - shard-rkl:          [FAIL][307] ([i915#2842]) -> [PASS][308]
>    [307]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-rkl-2/igt@gem_exec_fair@basic-pace@rcs0.html
>    [308]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@gem_exec_fair@basic-pace@rcs0.html
> 
>   * igt@gem_lmem_swapping@heavy-verify-multi@lmem0:
>     - shard-dg2:          [FAIL][309] ([i915#10378]) -> [PASS][310]
>    [309]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg2-8/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html
>    [310]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-4/igt@gem_lmem_swapping@heavy-verify-multi@lmem0.html
> 
>   * igt@gem_workarounds@suspend-resume:
>     - shard-rkl:          [INCOMPLETE][311] -> [PASS][312]
>    [311]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-rkl-3/igt@gem_workarounds@suspend-resume.html
>    [312]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@gem_workarounds@suspend-resume.html
> 
>   * igt@i915_module_load@reload-with-fault-injection:
>     - shard-rkl:          [INCOMPLETE][313] ([i915#9820] / [i915#9849]) -> [PASS][314]
>    [313]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-rkl-1/igt@i915_module_load@reload-with-fault-injection.html
>    [314]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-2/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-dg1:          [INCOMPLETE][315] ([i915#1982] / [i915#9820] / [i915#9849]) -> [PASS][316]
>    [315]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg1-16/igt@i915_module_load@reload-with-fault-injection.html
>    [316]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@i915_module_load@reload-with-fault-injection.html
>     - shard-tglu:         [INCOMPLETE][317] ([i915#10047] / [i915#9820]) -> [PASS][318]
>    [317]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-tglu-10/igt@i915_module_load@reload-with-fault-injection.html
>    [318]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-10/igt@i915_module_load@reload-with-fault-injection.html
> 
>   * igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a4:
>     - shard-dg1:          [FAIL][319] ([i915#2122]) -> [PASS][320]
>    [319]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg1-17/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a4.html
>    [320]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-16/igt@kms_flip@flip-vs-blocking-wf-vblank@a-hdmi-a4.html
> 
>   * igt@kms_flip@modeset-vs-vblank-race@a-edp1:
>     - shard-mtlp:         [INCOMPLETE][321] ([i915#10056]) -> [PASS][322]
>    [321]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-mtlp-2/igt@kms_flip@modeset-vs-vblank-race@a-edp1.html
>    [322]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-1/igt@kms_flip@modeset-vs-vblank-race@a-edp1.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu:
>     - shard-snb:          [SKIP][323] -> [PASS][324] +1 other test pass
>    [323]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
>    [324]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-cpu.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite:
>     - shard-dg2:          [FAIL][325] ([i915#6880]) -> [PASS][326]
>    [325]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
>    [326]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-pwrite.html
> 
>   * igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-4:
>     - shard-dg1:          [INCOMPLETE][327] -> [PASS][328]
>    [327]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg1-17/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-4.html
>    [328]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-15/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-4.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-tglu:         [FAIL][329] ([i915#9295]) -> [PASS][330]
>    [329]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-tglu-9/igt@kms_pm_dc@dc6-dpms.html
>    [330]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-10/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>     - shard-dg2:          [SKIP][331] ([i915#9519]) -> [PASS][332]
>    [331]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg2-4/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
>    [332]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-11/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>     - shard-rkl:          [SKIP][333] ([i915#9519]) -> [PASS][334] +1 other test pass
>    [333]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-rkl-1/igt@kms_pm_rpm@modeset-lpsp-stress.html
>    [334]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1:
>     - shard-mtlp:         [FAIL][335] ([i915#9196]) -> [PASS][336]
>    [335]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-mtlp-7/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
>    [336]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-mtlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-d-edp-1.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
>     - shard-tglu:         [FAIL][337] ([i915#9196]) -> [PASS][338] +1 other test pass
>    [337]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-tglu-4/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
>    [338]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-tglu-10/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
> 
>   * igt@sysfs_heartbeat_interval@mixed@bcs0:
>     - shard-dg2:          [INCOMPLETE][339] -> [PASS][340]
>    [339]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg2-10/igt@sysfs_heartbeat_interval@mixed@bcs0.html
>    [340]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-2/igt@sysfs_heartbeat_interval@mixed@bcs0.html
> 
>   
> #### Warnings ####
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - shard-dg1:          [ABORT][341] ([i915#9618]) -> [INCOMPLETE][342] ([i915#9408] / [i915#9618])
>    [341]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg1-13/igt@device_reset@unbind-reset-rebind.html
>    [342]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg1-17/igt@device_reset@unbind-reset-rebind.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
>     - shard-dg2:          [SKIP][343] ([i915#3458]) -> [SKIP][344] ([i915#10433] / [i915#3458]) +3 other tests skip
>    [343]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
>    [344]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
>     - shard-dg2:          [SKIP][345] ([i915#10433] / [i915#3458]) -> [SKIP][346] ([i915#3458]) +2 other tests skip
>    [345]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
>    [346]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-rkl:          [FAIL][347] ([i915#9295]) -> [SKIP][348] ([i915#3361])
>    [347]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-rkl-5/igt@kms_pm_dc@dc6-dpms.html
>    [348]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-rkl-6/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_psr@fbc-psr-primary-page-flip:
>     - shard-dg2:          [SKIP][349] ([i915#1072] / [i915#9673] / [i915#9732]) -> [SKIP][350] ([i915#1072] / [i915#9732]) +4 other tests skip
>    [349]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg2-11/igt@kms_psr@fbc-psr-primary-page-flip.html
>    [350]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-2/igt@kms_psr@fbc-psr-primary-page-flip.html
> 
>   * igt@kms_psr@psr2-cursor-blt:
>     - shard-dg2:          [SKIP][351] ([i915#1072] / [i915#9732]) -> [SKIP][352] ([i915#1072] / [i915#9673] / [i915#9732]) +13 other tests skip
>    [351]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7843/shard-dg2-4/igt@kms_psr@psr2-cursor-blt.html
>    [352]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/shard-dg2-11/igt@kms_psr@psr2-cursor-blt.html
> 
>   
>   [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
>   [i915#10030]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10030
>   [i915#10047]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10047
>   [i915#10056]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056
>   [i915#10166]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10166
>   [i915#10278]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10278
>   [i915#10307]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307
>   [i915#10378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378
>   [i915#10433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433
>   [i915#10434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434
>   [i915#10513]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10513
>   [i915#10647]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647
>   [i915#10656]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#10959]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10959
>   [i915#1257]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1257
>   [i915#1769]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769
>   [i915#1825]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825
>   [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
>   [i915#2122]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2122
>   [i915#2433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433
>   [i915#2434]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434
>   [i915#2437]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437
>   [i915#2527]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#2587]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587
>   [i915#2658]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658
>   [i915#2672]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672
>   [i915#280]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280
>   [i915#2842]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2842
>   [i915#2856]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856
>   [i915#3023]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023
>   [i915#3116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116
>   [i915#3281]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281
>   [i915#3282]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282
>   [i915#3297]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297
>   [i915#3299]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299
>   [i915#3323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323
>   [i915#3359]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3359
>   [i915#3361]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361
>   [i915#3458]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458
>   [i915#3539]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3591]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3591
>   [i915#3637]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637
>   [i915#3638]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4087]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4087
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4235
>   [i915#4270]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270
>   [i915#433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/433
>   [i915#4348]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348
>   [i915#4349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349
>   [i915#4473]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4473
>   [i915#4525]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525
>   [i915#4538]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538
>   [i915#4565]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565
>   [i915#4613]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613
>   [i915#4812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812
>   [i915#4852]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852
>   [i915#4854]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854
>   [i915#4860]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860
>   [i915#4879]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4879
>   [i915#4880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880
>   [i915#4881]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881
>   [i915#4884]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4884
>   [i915#4885]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885
>   [i915#4936]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4936
>   [i915#4958]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958
>   [i915#5176]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5176
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5235]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5235
>   [i915#5286]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286
>   [i915#5289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#5439]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439
>   [i915#5493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493
>   [i915#5566]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5566
>   [i915#5784]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784
>   [i915#6095]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095
>   [i915#6245]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245
>   [i915#6301]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301
>   [i915#6334]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334
>   [i915#6344]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6344
>   [i915#6412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412
>   [i915#6493]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6493
>   [i915#6524]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>   [i915#6805]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6805
>   [i915#6880]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880
>   [i915#6944]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944
>   [i915#7116]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116
>   [i915#7118]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118
>   [i915#7213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7213
>   [i915#7387]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387
>   [i915#7697]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697
>   [i915#7701]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7701
>   [i915#7711]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7711
>   [i915#7828]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828
>   [i915#7975]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975
>   [i915#7984]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984
>   [i915#8213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8213
>   [i915#8228]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228
>   [i915#8289]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8289
>   [i915#8292]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8292
>   [i915#8381]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381
>   [i915#8411]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411
>   [i915#8414]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414
>   [i915#8428]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428
>   [i915#8516]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516
>   [i915#8555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555
>   [i915#8562]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8562
>   [i915#8708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708
>   [i915#8709]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709
>   [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
>   [i915#8810]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8810
>   [i915#8821]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821
>   [i915#8850]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8850
>   [i915#8925]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8925
>   [i915#9053]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053
>   [i915#9067]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067
>   [i915#9196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
>   [i915#9227]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9227
>   [i915#9295]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9295
>   [i915#9311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311
>   [i915#9323]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323
>   [i915#9340]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340
>   [i915#9408]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9408
>   [i915#9412]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412
>   [i915#9423]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423
>   [i915#9424]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424
>   [i915#9433]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9433
>   [i915#9519]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519
>   [i915#9606]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9606
>   [i915#9618]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9618
>   [i915#9673]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9673
>   [i915#9688]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688
>   [i915#9728]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9728
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9766]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766
>   [i915#9779]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9779
>   [i915#9808]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808
>   [i915#9809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809
>   [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
>   [i915#9820]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
>   [i915#9846]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9846
>   [i915#9849]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9849
>   [i915#9853]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9853
>   [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7843 -> IGTPW_11114
> 
>   CI-20190529: 20190529
>   CI_DRM_14731: 34d52122a69076639d526b035c8edd5b43201f84 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11114: feaeed4804c4e3f9ad789458b44e4f3e722ba21b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7843: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11114/index.html
