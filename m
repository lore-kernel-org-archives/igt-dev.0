Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285B7C021A0
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 08:49:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9F410E26D;
	Mon, 17 Feb 2025 08:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NSGCWScZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3242C10E26D;
 Mon, 17 Feb 2025 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739782172; x=1771318172;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lAViEgqUvAwt2Q3x1aRjBXmarpi5FqfhC6BuacljvEo=;
 b=NSGCWScZm5jDoclqvkK8TSYv/3noOa/3MwELf36ckcI/MwFvG4YAJD7r
 +Ep3MWh4rLUF84Ze5z0c9fYOSOxGvdjMdFB91FXHxDUTVR1goQXKKR/51
 HSiaAefrb5+EFZl2AcjhC8XHgVC8z7DaF66sxY4smTv1aCUXekxr0tKZC
 w5IsZcOsa/8rqjksXa6vURC2Z93+hvEIG+7MYQ2Gh43n7Z1zGsps3G88e
 nR19O9sAad/c3hDSQr6TwUrzu/P0WbF78fB/kqPB8QoSW1Jt82F+AMUMB
 sq6f+lYyvarynwNHQKW+u5metPsgrYtks/Jx0uXQluO519aAkHuskijG0 Q==;
X-CSE-ConnectionGUID: hR/N9tdhSWO5vm3S3IwANg==
X-CSE-MsgGUID: fCGDY+m9Rze1I4nM5J8cpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="51102027"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="51102027"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:49:32 -0800
X-CSE-ConnectionGUID: YPbSjh2QQ6604QXkOHjWwQ==
X-CSE-MsgGUID: JuWiV2TrTfOqlsNYJHbSWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114540519"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 00:49:30 -0800
Date: Mon, 17 Feb 2025 09:49:10 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 igt_runner: Bump network ping deadline to 40 seconds
Message-ID: <20250217084910.uuh2qow5i42a3jtc@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250214190416.145374-1-kamil.konieczny@linux.intel.com>
 <173959018516.2294059.15604654203544451638@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173959018516.2294059.15604654203544451638@b555e5b46a47>
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
On 2025-02-15 at 03:29:45 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: igt_runner: Bump network ping deadline to 40 seconds
> URL   : https://patchwork.freedesktop.org/series/144902/
> State : failure

Unrelated, no need for rerun.

Regards,
Kamil

> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16138_full -> IGTPW_12603_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12603_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12603_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12603/index.html
> 
> Participating hosts (10 -> 9)
> ------------------------------
> 
>   Missing    (1): shard-glk-0 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12603_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_ctx_isolation@preservation-s3 (NEW):
>     - shard-rkl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16138/shard-rkl-3/igt@gem_ctx_isolation@preservation-s3.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12603/shard-rkl-5/igt@gem_ctx_isolation@preservation-s3.html
> 
>   * igt@gem_exec_suspend@basic-s4-devices:
>     - shard-glk:          NOTRUN -> [ABORT][3] +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12603/shard-glk6/igt@gem_exec_suspend@basic-s4-devices.html
> 
>   * igt@gem_softpin@noreloc-s3:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][4]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12603/shard-glk4/igt@gem_softpin@noreloc-s3.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between CI_DRM_16138_full and IGTPW_12603_full:
> 
> ### New IGT tests (81) ###
> 
>   * igt@drm_fdinfo@all-busy-check-all:
>     - Statuses : 2 pass(s) 4 skip(s)
>     - Exec time: [0.0, 0.53] s
> 
>   * igt@drm_fdinfo@all-busy-idle-check-all:
>     - Statuses : 3 pass(s) 3 skip(s)
>     - Exec time: [0.0, 0.62] s
> 
>   * igt@drm_fdinfo@basics:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@drm_fdinfo@busy:
>     - Statuses : 2 pass(s) 4 skip(s)
>     - Exec time: [0.0, 2.61] s
> 
>   * igt@drm_fdinfo@busy-check-all:
>     - Statuses : 1 pass(s) 3 skip(s)
>     - Exec time: [0.0, 2.10] s
> 
>   * igt@drm_fdinfo@busy-hang:
>     - Statuses : 2 pass(s) 4 skip(s)
>     - Exec time: [0.0, 5.14] s
> 
>   * igt@drm_fdinfo@busy-idle:
>     - Statuses : 3 pass(s) 4 skip(s)
>     - Exec time: [0.0, 3.12] s
> 
>   * igt@drm_fdinfo@busy-idle-check-all:
>     - Statuses : 3 pass(s) 4 skip(s)
>     - Exec time: [0.0, 3.12] s
> 
>   * igt@drm_fdinfo@idle:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.0, 3.63] s
> 
>   * igt@drm_fdinfo@most-busy-check-all:
>     - Statuses : 3 pass(s) 4 skip(s)
>     - Exec time: [0.0, 2.69] s
> 
>   * igt@drm_fdinfo@most-busy-idle-check-all:
>     - Statuses : 3 pass(s) 4 skip(s)
>     - Exec time: [0.0, 3.21] s
> 
>   * igt@gem_ctx_isolation@clean:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.07, 5.97] s
> 
>   * igt@gem_ctx_isolation@dirty-create:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.58, 7.27] s
> 
>   * igt@gem_ctx_isolation@dirty-switch:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.59, 6.68] s
> 
>   * igt@gem_ctx_isolation@nonpriv:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.00, 8.68] s
> 
>   * igt@gem_ctx_isolation@nonpriv-switch:
>     - Statuses : 1 dmesg-warn(s) 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 8.70] s
> 
>   * igt@gem_ctx_isolation@preservation:
>     - Statuses : 6 pass(s)
>     - Exec time: [0.49, 6.09] s
> 
>   * igt@gem_ctx_isolation@preservation-reset:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.50, 4.16] s
> 
>   * igt@gem_ctx_isolation@preservation-s3:
>     - Statuses : 2 incomplete(s) 5 pass(s)
>     - Exec time: [0.0, 49.74] s
> 
>   * igt@gem_ctx_shared@exec-shared-gtt:
>     - Statuses : 4 pass(s) 1 skip(s)
>     - Exec time: [0.0, 0.05] s
> 
>   * igt@gem_ctx_shared@exec-single-timeline:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 7.28] s
> 
>   * igt@gem_ctx_shared@q-in-order:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.0, 1.39] s
> 
>   * igt@gem_ctx_shared@q-independent:
>     - Statuses : 4 pass(s) 1 skip(s)
>     - Exec time: [0.0, 1.15] s
> 
>   * igt@gem_ctx_shared@q-out-order:
>     - Statuses : 1 dmesg-warn(s) 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 1.37] s
> 
>   * igt@gem_ctx_shared@q-promotion:
>     - Statuses : 1 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_ctx_shared@q-smoketest:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.0, 37.98] s
> 
>   * igt@gem_exec_big@single:
>     - Statuses : 1 abort(s) 4 pass(s)
>     - Exec time: [0.0, 7.52] s
> 
>   * igt@gem_exec_schedule@semaphore-power:
>     - Statuses : 1 pass(s) 4 skip(s)
>     - Exec time: [0.0, 0.87] s
> 
>   * igt@gem_lmem_swapping@heavy-verify-random-ccs:
>     - Statuses : 1 pass(s) 6 skip(s)
>     - Exec time: [0.0, 10.16] s
> 
>   * igt@gem_mmap@bad-offset:
>     - Statuses : 4 pass(s) 3 skip(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_mmap@bad-size:
>     - Statuses : 3 pass(s) 3 skip(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_mmap@pf-nonblock:
>     - Statuses : 3 pass(s) 3 skip(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_mmap_gtt@bad-object:
>     - Statuses : 4 pass(s) 3 skip(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_mmap_gtt@pf-nonblock:
>     - Statuses : 4 pass(s) 3 skip(s)
>     - Exec time: [0.0, 0.01] s
> 
>   * igt@gem_mmap_offset@oob-read:
>     - Statuses : 7 pass(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_mmap_wc@bad-object:
>     - Statuses : 4 pass(s) 3 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@gem_mmap_wc@bad-offset:
>     - Statuses : 4 pass(s) 3 skip(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_mmap_wc@bad-size:
>     - Statuses : 2 pass(s) 3 skip(s)
>     - Exec time: [0.0, 0.00] s
> 
>   * igt@gem_mmap_wc@pf-nonblock:
>     - Statuses : 3 pass(s) 3 skip(s)
>     - Exec time: [0.0, 0.01] s
> 
>   * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
>     - Statuses : 3 pass(s) 3 skip(s)
>     - Exec time: [0.0, 1.03] s
> 
>   * igt@gem_render_copy@yf-tiled:
>     - Statuses : 4 pass(s) 3 skip(s)
>     - Exec time: [0.0, 0.85] s
> 
>   * igt@gem_render_copy@yf-tiled-ccs-to-linear:
>     - Statuses : 4 pass(s) 3 skip(s)
>     - Exec time: [0.0, 0.39] s
> 
>   * igt@gem_render_copy@yf-tiled-ccs-to-x-tiled:
>     - Statuses : 3 pass(s) 3 skip(s)
>     - Exec time: [0.0, 1.02] s
> 
>   * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
>     - Statuses : 4 pass(s) 3 skip(s)
>     - Exec time: [0.0, 1.03] s
> 
>   * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
>     - Statuses : 4 pass(s) 2 skip(s)
>     - Exec time: [0.0, 1.04] s
> 
>   * igt@gem_watchdog@default-physical:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.00, 1.76] s
> 
>   * igt@gem_watchdog@default-virtual:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 7.07] s
> 
>   * igt@i915_query@test-query-geometry-subslices:
>     - Statuses : 2 pass(s) 5 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-c-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.60] s
> 
>   * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-c-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.48] s
> 
>   * igt@kms_cursor_edge_walk@64x64-right-edge@pipe-c-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.60] s
> 
>   * igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-hdmi-a-1:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.40] s
> 
>   * igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-c-hdmi-a-2:
>     - Statuses : 1 pass(s)
>     - Exec time: [3.60] s
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-indfb-fliptrack-mmap-gtt:
>     - Statuses : 2 pass(s) 3 skip(s)
>     - Exec time: [0.0, 3.50] s
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:
>     - Statuses : 3 pass(s) 3 skip(s)
>     - Exec time: [0.0, 3.87] s
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
>     - Statuses : 1 pass(s) 6 skip(s)
>     - Exec time: [0.0, 3.60] s
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
>     - Statuses : 1 pass(s) 6 skip(s)
>     - Exec time: [0.0, 3.58] s
> 
>   * igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:
>     - Statuses : 2 pass(s) 3 skip(s)
>     - Exec time: [0.0, 2.02] s
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
>     - Statuses : 6 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-1p-shrfb-fliptrack-mmap-gtt:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@kms_frontbuffer_tracking@psr-farfromfence-mmap-gtt:
>     - Statuses : 7 skip(s)
>     - Exec time: [0.0] s
> 
>   * igt@perf@blocking-parameterized:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 20.04] s
> 
>   * igt@perf@gen12-oa-tlb-invalidate:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 20.11] s
> 
>   * igt@perf@global-sseu-config:
>     - Statuses : 4 pass(s) 3 skip(s)
>     - Exec time: [0.0, 0.12] s
> 
>   * igt@perf@global-sseu-config-invalid:
>     - Statuses : 3 pass(s) 3 skip(s)
>     - Exec time: [0.0, 0.04] s
> 
>   * igt@perf@polling-parameterized:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.0, 20.04] s
> 
>   * igt@sysfs_heartbeat_interval@idempotent:
>     - Statuses : 4 pass(s)
>     - Exec time: [0.01] s
> 
>   * igt@sysfs_heartbeat_interval@invalid:
>     - Statuses : 5 pass(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@sysfs_heartbeat_interval@mixed:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.01, 36.79] s
> 
>   * igt@sysfs_heartbeat_interval@nopreempt:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.00, 42.09] s
> 
>   * igt@sysfs_heartbeat_interval@precise:
>     - Statuses : 3 pass(s) 1 skip(s)
>     - Exec time: [0.00, 26.24] s
> 
>   * igt@sysfs_preempt_timeout@idempotent:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.00, 0.03] s
> 
>   * igt@sysfs_preempt_timeout@invalid:
>     - Statuses : 5 pass(s) 1 skip(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@sysfs_preempt_timeout@timeout:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.00, 32.44] s
> 
>   * igt@sysfs_timeslice_duration@duration:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.01, 92.03] s
> 
>   * igt@sysfs_timeslice_duration@idempotent:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.01, 0.04] s
> 
>   * igt@sysfs_timeslice_duration@invalid:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.00, 0.02] s
> 
>   * igt@sysfs_timeslice_duration@timeout:
>     - Statuses : 6 pass(s) 1 skip(s)
>     - Exec time: [0.00, 33.02] s
> 
>   
> 
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_12603_full that come from known issues:
> 
...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8230 -> IGTPW_12603
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_16138: cbd747025a1ef985e1ebfa040aa0da4a5d77aacd @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_12603: d1cdbcc1841b595ebe56c3ab3c9a87d036a53d46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8230: 8230
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12603/index.html
