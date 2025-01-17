Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8740C02185
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 13:36:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8600310EAF2;
	Fri, 17 Jan 2025 13:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQViIt8N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5E510EAF1;
 Fri, 17 Jan 2025 13:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737120960; x=1768656960;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ENvAFEfJWPMtmBDbUr+kAf+GEFGKhIQnn/PmzV4Z1Xc=;
 b=VQViIt8NoijUvCbrbqyIUrBWMaddc1B2SOeULZ06cTAVmCXElqRom5vV
 kO1Ii0viYPXO3h+qDxn86m6C86/mOr/aqvTrbj+0eTe53mqWxd93iTPK1
 GIWI+gJzEiluEPCVe1GD2QoRJJFf4UQ9f6AKXD71b/F12gJwB5vfK9ojF
 dZTOgApJG8PZWgkPUpIrlIx+9/EJouf0UX/7iW8V1t6MH+o0AYetv1VdL
 BmVY5BuKd+3DyGqo1ZAg5ml8oeM6AtWLs3xemKzSckoeWYsmJWjCsQuA+
 mgAFyrR0ChN/63NFTbNUeMhjECnkQcbvfZDHgyVdmL9nFyfX23CdvJQ3u Q==;
X-CSE-ConnectionGUID: pfkruVQIR6CP8Ap977rSGw==
X-CSE-MsgGUID: WRl8TwfgSJmHiKqZDCoaGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="36831412"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="36831412"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 05:36:00 -0800
X-CSE-ConnectionGUID: RI0dGd9VSa+KnjpoQWPCew==
X-CSE-MsgGUID: 2laIopKSQOyjquOH43IYZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="129067700"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 05:35:59 -0800
Date: Fri, 17 Jan 2025 14:35:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Clint Taylor <clinton.a.taylor@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 Initial PTL support (rev6)
Message-ID: <20250117133546.5fmux5gfxxr76vyp@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Clint Taylor <clinton.a.taylor@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
 <173711511404.701978.14192991678396183767@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173711511404.701978.14192991678396183767@b555e5b46a47>
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
On 2025-01-17 at 11:58:34 -0000, Patchwork wrote:

below regressions are unrelated,

Regards,
Kamil

> == Series Details ==
> 
> Series: Initial PTL support (rev6)
> URL   : https://patchwork.freedesktop.org/series/141325/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8183_full -> IGTPW_12418_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12418_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12418_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/index.html
> 
> Participating hosts (12 -> 12)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12418_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_exec_schedule@wide@vcs1:
>     - shard-tglu:         NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-6/igt@gem_exec_schedule@wide@vcs1.html
> 
>   * igt@i915_module_load@load:
>     - shard-dg2:          ([PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18]) -> ([PASS][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [PASS][25], [PASS][26], [PASS][27], [PASS][28], [PASS][29], [PASS][30], [DMESG-WARN][31], [PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36]) ([i915#13368])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-11/igt@i915_module_load@load.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-11/igt@i915_module_load@load.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-4/igt@i915_module_load@load.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-8/igt@i915_module_load@load.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-4/igt@i915_module_load@load.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-3/igt@i915_module_load@load.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-7/igt@i915_module_load@load.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-4/igt@i915_module_load@load.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-8/igt@i915_module_load@load.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-1/igt@i915_module_load@load.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-5/igt@i915_module_load@load.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-1/igt@i915_module_load@load.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-7/igt@i915_module_load@load.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-5/igt@i915_module_load@load.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-3/igt@i915_module_load@load.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-10/igt@i915_module_load@load.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-dg2-10/igt@i915_module_load@load.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@i915_module_load@load.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-11/igt@i915_module_load@load.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-11/igt@i915_module_load@load.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-11/igt@i915_module_load@load.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-11/igt@i915_module_load@load.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-11/igt@i915_module_load@load.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@i915_module_load@load.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@i915_module_load@load.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@i915_module_load@load.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-7/igt@i915_module_load@load.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-4/igt@i915_module_load@load.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-10/igt@i915_module_load@load.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@i915_module_load@load.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@i915_module_load@load.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@i915_module_load@load.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-5/igt@i915_module_load@load.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-8/igt@i915_module_load@load.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-3/igt@i915_module_load@load.html
> 
>   * igt@perf_pmu@module-unload:
>     - shard-rkl:          [PASS][37] -> [INCOMPLETE][38]
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-rkl-1/igt@perf_pmu@module-unload.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-6/igt@perf_pmu@module-unload.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_tiled_swapping@non-threaded:
>     - shard-rkl:          [FAIL][39] ([i915#12941]) -> [FAIL][40]
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-rkl-7/igt@gem_tiled_swapping@non-threaded.html
>     - shard-tglu:         [FAIL][41] ([i915#12941]) -> [FAIL][42]
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-tglu-9/igt@gem_tiled_swapping@non-threaded.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-10/igt@gem_tiled_swapping@non-threaded.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1:
>     - shard-mtlp:         [FAIL][43] ([i915#11989]) -> [FAIL][44]
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8183/shard-mtlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-edp1.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between IGT_8183_full and IGTPW_12418_full:
> 
> ### New IGT tests (77) ###
> 
>   * igt@gem_ctx_engines@independent@bcs0:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.05, 0.21] s
> 
>   * igt@gem_ctx_engines@independent@rcs0:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.05, 0.19] s
> 
>   * igt@gem_ctx_engines@independent@vcs0:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.05, 0.17] s
> 
>   * igt@gem_ctx_engines@independent@vcs1:
>     - Statuses : 4 pass(s)
>     - Exec time: [0.06, 0.16] s
> 
>   * igt@gem_ctx_engines@independent@vecs0:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.05, 0.17] s
> 
>   * igt@gem_exec_async@forked-writes:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 0.33] s
> 
>   * igt@gem_exec_async@forked-writes@bcs0:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.02, 0.07] s
> 
>   * igt@gem_exec_async@forked-writes@rcs0:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.02, 0.07] s
> 
>   * igt@gem_exec_async@forked-writes@vcs0:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.02, 0.07] s
> 
>   * igt@gem_exec_async@forked-writes@vcs1:
>     - Statuses : 3 pass(s)
>     - Exec time: [0.03, 0.04] s
> 
>   * igt@gem_exec_async@forked-writes@vecs0:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.02, 0.08] s
> 
>   * igt@gem_exec_balancer@fairslice:
>     - Statuses : 4 pass(s) 1 skip(s)
>     - Exec time: [0.0, 5.23] s
> 
>   * igt@gem_exec_balancer@nohangcheck:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.0, 3.91] s
> 
>   * igt@gem_exec_balancer@noheartbeat:
>     - Statuses : 2 pass(s) 2 skip(s)
>     - Exec time: [0.0, 1.08] s
> 
>   * igt@gem_exec_balancer@persistence:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.0, 3.70] s
> 
>   * igt@gem_exec_balancer@sequential:
>     - Statuses : 4 pass(s) 1 skip(s)
>     - Exec time: [0.0, 3.82] s
> 
>   * igt@gem_exec_create@legacy:
>     - Statuses : 6 pass(s)
>     - Exec time: [2.06, 4.20] s
> 
>   * igt@gem_exec_schedule@fairslice:
>     - Statuses : 4 pass(s) 1 skip(s)
>     - Exec time: [0.0, 14.14] s
> 
>   * igt@gem_exec_schedule@fairslice-all:
>     - Statuses : 3 pass(s)
>     - Exec time: [2.04, 2.11] s
> 
>   * igt@gem_exec_schedule@fairslice@bcs0:
>     - Statuses : 4 pass(s)
>     - Exec time: [2.01, 2.02] s
> 
>   * igt@gem_exec_schedule@fairslice@rcs0:
>     - Statuses : 4 pass(s)
>     - Exec time: [2.01, 2.04] s
> 
>   * igt@gem_exec_schedule@fairslice@vcs0:
>     - Statuses : 4 pass(s)
>     - Exec time: [2.01, 2.02] s
> 
>   * igt@gem_exec_schedule@fairslice@vcs1:
>     - Statuses : 4 pass(s)
>     - Exec time: [2.01, 2.02] s
> 
>   * igt@gem_exec_schedule@fairslice@vecs0:
>     - Statuses : 4 pass(s)
>     - Exec time: [2.01, 2.02] s
> 
>   * igt@gem_exec_schedule@preempt-user:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.24] s
> 
>   * igt@gem_exec_schedule@preempt-user@bcs0:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.01, 0.04] s
> 
>   * igt@gem_exec_schedule@preempt-user@rcs0:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.02, 0.06] s
> 
>   * igt@gem_exec_schedule@preempt-user@vcs0:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.01, 0.04] s
> 
>   * igt@gem_exec_schedule@preempt-user@vcs1:
>     - Statuses : 4 pass(s)
>     - Exec time: [0.02, 0.04] s
> 
>   * igt@gem_exec_schedule@preempt-user@vecs0:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.02, 0.04] s
> 
>   * igt@gem_exec_schedule@u-fairslice:
>     - Statuses : 4 pass(s) 1 skip(s)
>     - Exec time: [0.0, 12.10] s
> 
>   * igt@gem_exec_schedule@u-fairslice-all:
>     - Statuses : 3 pass(s) 1 skip(s)
>     - Exec time: [0.0, 2.09] s
> 
>   * igt@gem_exec_schedule@u-fairslice@bcs0:
>     - Statuses : 4 pass(s)
>     - Exec time: [1.96, 2.03] s
> 
>   * igt@gem_exec_schedule@u-fairslice@rcs0:
>     - Statuses : 4 pass(s)
>     - Exec time: [2.01, 2.04] s
> 
>   * igt@gem_exec_schedule@u-fairslice@vcs0:
>     - Statuses : 4 pass(s)
>     - Exec time: [1.97, 2.02] s
> 
>   * igt@gem_exec_schedule@u-fairslice@vcs1:
>     - Statuses : 3 pass(s)
>     - Exec time: [1.99, 2.02] s
> 
>   * igt@gem_exec_schedule@u-fairslice@vecs0:
>     - Statuses : 4 pass(s)
>     - Exec time: [1.99, 2.02] s
> 
>   * igt@gem_exec_schedule@u-independent:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.11, 9.75] s
> 
>   * igt@gem_exec_schedule@u-independent@rcs0:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.07, 1.69] s
> 
>   * igt@gem_exec_schedule@u-independent@vcs0:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.12, 2.08] s
> 
>   * igt@gem_exec_schedule@u-independent@vcs1:
>     - Statuses : 3 pass(s)
>     - Exec time: [0.10, 1.98] s
> 
>   * igt@gem_exec_schedule@u-independent@vecs0:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.11, 2.06] s
> 
>   * igt@gem_exec_schedule@u-lateslice:
>     - Statuses : 3 pass(s)
>     - Exec time: [0.05, 0.10] s
> 
>   * igt@gem_exec_schedule@u-lateslice@bcs0:
>     - Statuses : 3 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@gem_exec_schedule@u-lateslice@rcs0:
>     - Statuses : 3 pass(s)
>     - Exec time: [0.01, 0.02] s
> 
>   * igt@gem_exec_schedule@u-lateslice@vcs0:
>     - Statuses : 3 pass(s)
>     - Exec time: [0.01, 0.02] s
> 
>   * igt@gem_exec_schedule@u-lateslice@vcs1:
>     - Statuses : 2 pass(s)
>     - Exec time: [0.01, 0.02] s
> 
>   * igt@gem_exec_schedule@u-lateslice@vecs0:
>     - Statuses : 3 pass(s)
>     - Exec time: [0.01, 0.02] s
> 
>   * igt@gem_exec_schedule@u-semaphore-codependency:
>     - Statuses : 4 pass(s)
>     - Exec time: [0.01, 0.04] s
> 
>   * igt@gem_exec_schedule@u-semaphore-noskip:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.81] s
> 
>   * igt@gem_exec_schedule@u-semaphore-resolve:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.07] s
> 
>   * igt@gem_exec_schedule@u-semaphore-user:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.01, 0.08] s
> 
>   * igt@gem_exec_schedule@u-submit-early-slice:
>     - Statuses : 4 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.21] s
> 
>   * igt@gem_exec_schedule@u-submit-early-slice@bcs0:
>     - Statuses : 4 pass(s)
>     - Exec time: [0.02, 0.04] s
> 
>   * igt@gem_exec_schedule@u-submit-early-slice@rcs0:
>     - Statuses : 4 pass(s)
>     - Exec time: [0.02, 0.05] s
> 
>   * igt@gem_exec_schedule@u-submit-early-slice@vcs0:
>     - Statuses : 4 pass(s)
>     - Exec time: [0.02, 0.04] s
> 
>   * igt@gem_exec_schedule@u-submit-early-slice@vcs1:
>     - Statuses : 3 pass(s)
>     - Exec time: [0.03, 0.04] s
> 
>   * igt@gem_exec_schedule@u-submit-early-slice@vecs0:
>     - Statuses : 4 pass(s)
>     - Exec time: [0.02, 0.04] s
> 
>   * igt@gem_exec_schedule@u-submit-golden-slice:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.07, 0.20] s
> 
>   * igt@gem_exec_schedule@u-submit-golden-slice@bcs0:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.02, 0.05] s
> 
>   * igt@gem_exec_schedule@u-submit-golden-slice@rcs0:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.02, 0.05] s
> 
>   * igt@gem_exec_schedule@u-submit-golden-slice@vcs0:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.01, 0.04] s
> 
>   * igt@gem_exec_schedule@u-submit-golden-slice@vcs1:
>     - Statuses : 3 pass(s)
>     - Exec time: [0.03] s
> 
>   * igt@gem_exec_schedule@u-submit-golden-slice@vecs0:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.02, 0.05] s
> 
>   * igt@gem_exec_schedule@u-submit-late-slice:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.21] s
> 
>   * igt@gem_exec_schedule@u-submit-late-slice@bcs0:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.04] s
> 
>   * igt@gem_exec_schedule@u-submit-late-slice@rcs0:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.05] s
> 
>   * igt@gem_exec_schedule@u-submit-late-slice@vcs0:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.05] s
> 
>   * igt@gem_exec_schedule@u-submit-late-slice@vecs0:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.05] s
> 
>   * igt@gem_softpin@32b-excludes-last-page:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.01] s
> 
>   * igt@gem_softpin@full:
>     - Statuses : 4 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@gem_softpin@zero:
>     - Statuses : 3 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gen9_exec_parse@shadow-peek:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@perf@non-zero-reason:
>     - Statuses : 1 fail(s) 4 pass(s)
>     - Exec time: [2.75, 11.06] s
> 
>   * igt@perf_pmu@gt-awake:
>     - Statuses : 7 pass(s)
>     - Exec time: [2.01, 9.13] s
> 
>   * igt@perf_pmu@invalid-open:
>     - Statuses : 4 pass(s)
>     - Exec time: [0.0] s
> 
>   * igt@perf_pmu@rc6-suspend:
>     - Statuses : 7 pass(s)
>     - Exec time: [6.91, 23.34] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12418_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@api_intel_bb@object-reloc-purge-cache:
>     - shard-dg2:          NOTRUN -> [SKIP][45] ([i915#8411]) +1 other test skip
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-dg2-2/igt@api_intel_bb@object-reloc-purge-cache.html
> 
>   * igt@device_reset@cold-reset-bound:
>     - shard-tglu-1:       NOTRUN -> [SKIP][46] ([i915#11078])
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-tglu-1/igt@device_reset@cold-reset-bound.html
> 
>   * igt@drm_fdinfo@busy-check-all@ccs0:
>     - shard-mtlp:         NOTRUN -> [SKIP][47] ([i915#8414]) +6 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/shard-mtlp-2/igt@drm_fdinfo@busy-check-all@ccs0.html

...cut...

> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12418/index.html
