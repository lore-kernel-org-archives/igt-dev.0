Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2637C55162
	for <igt-dev@archiver.kernel.org>; Mon,  3 Aug 2026 05:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A9E10E38E;
	Mon,  3 Aug 2026 05:24:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cGiTq/ln";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288CA10E38E
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Aug 2026 05:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785734636; x=1817270636;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=Lhk4BZn09rNVGqQqqLyMIz04KiH7ARrK5hP3KhKdKlY=;
 b=cGiTq/lnN5De4GqTNc6PawSq80uLy9HDDWCsdyM7dAraWc3l9/rDNfz3
 2PmNYP2lbPiUcb5x/CeaF0YpW3VjYcXBPzKRFhQDM49Cg58tnKwIcOx10
 4UwAZ+5KZqniLrLoa5ZfC7n0IQMT8qOuS4t1LN8z373I2dLAAghoUEQMY
 gksSHCP54g37HojCGtgUYL4ckhhnOAZQ2on5He5BYoKP+KsKvNWoEfJmd
 wyqEz+8V79K82i+qvBbIpGyrqAoKr+gdf+Cy7sXkrqQTe+Bwh0F86bLpZ
 LGqo8nHi7vxu7/WfylkmdP4zmULUaaOcDeqmB1anmiUmAv5PD1ShzrMUF Q==;
X-CSE-ConnectionGUID: Bx24UQLwTz2d6lUn8tFbFg==
X-CSE-MsgGUID: nQqiPwh5QxSSYEEKbZl/7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86138751"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="86138751"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:23:56 -0700
X-CSE-ConnectionGUID: Uuf89zqoRr6kCEON4ylHrQ==
X-CSE-MsgGUID: 0jE5eAjeTEy9oqAl1Owdaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; d="scan'208";a="259315319"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.238])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2026 22:23:54 -0700
Date: Mon, 3 Aug 2026 07:23:52 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib=2Fgpg?=
 =?utf-8?Q?pu=5Ffill?= =?utf-8?Q?=3A?= Implement gpgpu_fill for XE3 which
 uses ugm intead of tgm
Message-ID: <7nspirmfkndypkb2y7emh4edmiykcjtxheg6nofmjf35rt7jzn@im7ql5ked4tx>
References: <20260731083127.168212-2-zbigniew.kempczynski@intel.com>
 <178550628724.9498.18213495869682417354@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178550628724.9498.18213495869682417354@61270ab9df2a>
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

On Fri, Jul 31, 2026 at 01:58:07PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/gpgpu_fill: Implement gpgpu_fill for XE3 which uses ugm       
>             intead of tgm                                                     
>    URL:     https://patchwork.freedesktop.org/series/171423/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15615/index.html   
> 
>         CI Bug Log - changes from CI_DRM_18931_full -> IGTPW_15615_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_15615_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_15615_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15615/index.html
> 
> Participating hosts (10 -> 10)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_15615_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_gpgpu_fill@offset-16x16:
> 
>           * shard-dg2: PASS -> FAIL +5 other tests fail

Unfortunately patch introduced this regression. V2 series should
fix this issue.

--
Zbigniew


>      * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
> 
>           * shard-mtlp: PASS -> FAIL +5 other tests fail
>      * igt@kms_pm_rpm@system-suspend-idle:
> 
>           * shard-dg2: PASS -> SKIP
> 
> Known issues
> 
>    Here are the changes found in IGTPW_15615_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@fbdev@unaligned-read:
> 
>           * shard-dg2: PASS -> SKIP (i915#2582) +1 other test skip
>      * igt@gem_basic@multigpu-create-close:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7697) +1 other test skip
>      * igt@gem_caching@read-writes:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4873)
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555 / i915#9323)
>      * igt@gem_ccs@block-multicopy-compressed:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy-new-ctx:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9323)
>           * shard-dg1: NOTRUN -> SKIP (i915#9323)
>           * shard-tglu: NOTRUN -> SKIP (i915#9323)
>           * shard-mtlp: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#13356 / i915#16348)
>      * igt@gem_close_race@multigpu-basic-threads:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7697)
>           * shard-rkl: NOTRUN -> SKIP (i915#7697)
>           * shard-dg1: NOTRUN -> SKIP (i915#7697)
>           * shard-mtlp: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_create@create-ext-cpu-access-sanity-check:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6335)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6335)
>           * shard-rkl: NOTRUN -> SKIP (i915#6335)
>      * igt@gem_ctx_isolation@preservation-s3:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#13356) +3 other tests
>             incomplete
>      * igt@gem_ctx_isolation@preservation-s3@rcs0:
> 
>           * shard-glk: PASS -> INCOMPLETE (i915#13356 / i915#16466)
>      * igt@gem_ctx_persistence@heartbeat-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555) +1 other test skip
>      * igt@gem_ctx_persistence@heartbeat-many:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8555)
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_sseu@invalid-sseu:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#280)
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280)
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#280)
>      * igt@gem_exec_balancer@bonded-false-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4812) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#4812) +1 other test skip
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525)
>           * shard-tglu: NOTRUN -> SKIP (i915#4525) +1 other test skip
>      * igt@gem_exec_capture@capture-invisible@lmem0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6334) +2 other tests skip
>      * igt@gem_exec_capture@capture-invisible@smem0:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6334) +1 other test skip
>      * igt@gem_exec_flush@basic-wb-ro-before-default:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852)
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852)
>      * igt@gem_exec_params@secure-non-master:
> 
>           * shard-dg2: NOTRUN -> SKIP +8 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-cpu:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +9 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +6 other tests skip
>      * igt@gem_exec_reloc@basic-softpin:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3281)
>      * igt@gem_exec_reloc@basic-write-read-active:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +8 other tests skip
>      * igt@gem_exec_reloc@basic-write-wc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281) +10 other tests skip
>      * igt@gem_exec_schedule@preempt-queue-chain:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4537 / i915#4812)
>      * igt@gem_exec_schedule@semaphore-power:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4812) +3 other tests skip
>      * igt@gem_exec_suspend@basic-s0@smem:
> 
>           * shard-dg2: PASS -> INCOMPLETE (i915#13356)
>      * igt@gem_fence_thrash@bo-write-verify-x:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860) +1 other test skip
>      * igt@gem_fenced_exec_thrash@2-spare-fences:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4860)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2190)
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613 / i915#7582)
>      * igt@gem_lmem_swapping@heavy-verify-multi:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@heavy-verify-multi-ccs:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613) +7 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@heavy-verify-random:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4613) +2 other tests skip
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#4613) +1 other test
>             skip
>      * igt@gem_madvise@dontneed-before-pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3282) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +3 other tests skip
>      * igt@gem_media_fill@media-fill:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8289)
>      * igt@gem_mmap@bad-object:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_mmap@basic-small-bo:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +3 other tests skip
>      * igt@gem_mmap_gtt@basic:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +6 other tests skip
>      * igt@gem_mmap_gtt@close-race:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +7 other tests skip
>      * igt@gem_mmap_gtt@cpuset-big-copy-odd:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +9 other tests skip
>      * igt@gem_mmap_wc@set-cache-level:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083) +3 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +8 other tests skip
>      * igt@gem_pwrite@basic-exhaustion:
> 
>           * shard-glk: NOTRUN -> WARN (i915#14702 / i915#2658)
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3282)
>      * igt@gem_pxp@create-regular-buffer:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270)
>      * igt@gem_pxp@hw-rejects-pxp-buffer:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13717)
>      * igt@gem_pxp@protected-raw-src-copy-not-readible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_render_copy@mixed-tiled-to-yf-tiled-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +4 other tests
>             skip
>      * igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +4 other tests skip
>      * igt@gem_tiled_pread_pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079)
>           * shard-dg1: NOTRUN -> SKIP (i915#4079)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_userptr_blits@access-control:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#3297)
>           * shard-rkl: NOTRUN -> SKIP (i915#3297)
>           * shard-dg1: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@coherency-unsync:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#3323)
>           * shard-rkl: NOTRUN -> SKIP (i915#3297 / i915#3323)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3297 / i915#3323)
>      * igt@gem_userptr_blits@map-fixed-invalidate-busy:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3297 / i915#4880) +1 other test
>             skip
>      * igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297 / i915#4880)
>      * igt@gem_userptr_blits@relocations:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281 / i915#3297)
>           * shard-rkl: NOTRUN -> SKIP (i915#3281 / i915#3297)
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-glk: PASS -> INCOMPLETE (i915#13356 / i915#14586)
>      * igt@gen9_exec_parse@basic-rejected:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +3 other tests
>             skip
>      * igt@gen9_exec_parse@bb-start-far:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +1 other test skip
>      * igt@gen9_exec_parse@bb-start-param:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +1 other test skip
>      * igt@gen9_exec_parse@secure-batches:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527)
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856)
>      * igt@gen9_exec_parse@unaligned-jump:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2527 / i915#2856)
>      * igt@i915_drm_fdinfo@all-busy-idle-check-all:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14123)
>           * shard-dg1: NOTRUN -> SKIP (i915#14123)
>           * shard-mtlp: NOTRUN -> SKIP (i915#14123)
>      * igt@i915_drm_fdinfo@isolation@rcs0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#14073) +5 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#14073) +6 other tests skip
>      * igt@i915_drm_fdinfo@most-busy-idle-check-all@vecs1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14073) +15 other tests skip
>      * igt@i915_drm_fdinfo@virtual-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14118)
>      * igt@i915_pm_freq_api@freq-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8399)
>           * shard-tglu: NOTRUN -> SKIP (i915#8399)
>      * igt@i915_pm_freq_api@freq-suspend@gt0:
> 
>           * shard-dg2: NOTRUN -> INCOMPLETE (i915#13356 / i915#13820) +1
>             other test incomplete
>      * igt@i915_pm_rps@min-max-config-idle:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11681 / i915#6621)
>      * igt@i915_pm_rps@waitboost:
> 
>           * shard-mtlp: PASS -> FAIL (i915#15365 / i915#16503) +1 other test
>             fail
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4387)
>           * shard-rkl: NOTRUN -> SKIP (i915#4387)
>      * igt@i915_power@sanity:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#7984)
>      * igt@i915_query@test-query-geometry-subslices:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5723)
>      * igt@i915_suspend@debugfs-reader:
> 
>           * shard-rkl: PASS -> ABORT (i915#15131 / i915#15140)
>      * igt@i915_suspend@fence-restore-untiled:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#16182 / i915#4817)
>      * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4212)
>           * shard-dg2: NOTRUN -> SKIP (i915#4212)
>           * shard-dg1: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_atomic@plane-cursor-legacy:
> 
>           * shard-dg2: PASS -> SKIP (i915#16707) +51 other tests skip
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +5 other tests skip
>      * igt@kms_big_fb@4-tiled-addfb:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5286)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286)
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +4 other tests skip
>      * igt@kms_big_fb@linear-16bpp-rotate-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP +12 other tests skip
>      * igt@kms_big_fb@linear-16bpp-rotate-90:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638) +1 other test skip
>      * igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638) +2 other tests skip
>      * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3828)
>      * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#16707 / i915#5190) +2 other tests
>             skip
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +3 other tests
>             skip
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4538)
>      * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190)
>           * shard-mtlp: NOTRUN -> SKIP (i915#6187)
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#14544 / i915#6095)
>             +5 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +29 other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6095) +7 other tests
>             skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +69 other tests skip
>      * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +94 other tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +1 other test skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#14694 / i915#15582)
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#14694 / i915#15582)
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#15582) +1 other test
>             incomplete
>      * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +174 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-2:
> 
>           * shard-glk11: NOTRUN -> SKIP +57 other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-glk10: NOTRUN -> SKIP +123 other tests skip
>      * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +71 other
>             tests skip
>      * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6095) +19 other tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +47 other
>             tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12313) +1 other test skip
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3742)
>      * igt@kms_chamelium_audio@dp-audio-after-suspend:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151)
>      * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#16464 / i915#16471)
>           * shard-dg1: NOTRUN -> SKIP (i915#16471)
>      * igt@kms_chamelium_color_pipeline@plane-lut1d:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#16471) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#16471) +1 other test skip
>      * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#16471) +1 other test skip
>      * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#16471)
>      * igt@kms_chamelium_frames@hdmi-aspect-ratio:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +8 other
>             tests skip
>      * igt@kms_chamelium_frames@hdmi-crc-fast:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +7 other tests
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other tests
>             skip
>      * igt@kms_chamelium_frames@hdmi-frame-dump:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +10 other
>             tests skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +3 other
>             tests skip
>      * igt@kms_chamelium_hpd@vga-hpd:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828) +6 other
>             tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#14544 / i915#7828)
>      * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:
> 
>           * shard-dg2: PASS -> SKIP (i915#15529) +1 other test skip
>      * igt@kms_color_pipeline@plane-lut1d-lut1d:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15529)
>      * igt@kms_content_protection@dp-mst-lic-type-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15330 / i915#3299)
>      * igt@kms_content_protection@dp-mst-type-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15330 / i915#3116 / i915#3299)
>      * igt@kms_content_protection@dp-mst-type-0-hdcp14:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15330) +1 other test skip
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15330 / i915#3116 / i915#3299)
>      * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15330)
>           * shard-mtlp: NOTRUN -> SKIP (i915#15330)
>           * shard-dg2: NOTRUN -> SKIP (i915#15330)
>           * shard-rkl: NOTRUN -> SKIP (i915#15330)
>      * igt@kms_content_protection@lic-type-0-hdcp14:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15865)
>      * igt@kms_content_protection@type1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15865) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#15865) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15865) +1 other test skip
>           * shard-tglu: NOTRUN -> SKIP (i915#15865) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#15865) +1 other test skip
>      * igt@kms_cursor_crc@cursor-offscreen-32x10:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +1 other test skip
>      * igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-random-256x85@pipe-a-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-random-64x21:
> 
>           * shard-tglu: PASS -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#13566) +4 other tests fail
>      * igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>           * shard-rkl: PASS -> FAIL (i915#13566) +1 other test fail
>      * igt@kms_cursor_crc@cursor-sliding-32x10:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8814) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-sliding-512x512:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13049) +1 other test skip
>      * igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#13566) +3 other tests fail
>      * igt@kms_cursor_crc@cursor-suspend:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#12358 / i915#14152 /
>             i915#7882)
>      * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
> 
>           * shard-glk10: NOTRUN -> INCOMPLETE (i915#12358 / i915#14152)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4103) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4103) +2 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#4103) +2 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#16119 / i915#4213) +2 other
>             tests skip
>      * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11190 / i915#16707) +1 other test
>             skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809) +4 other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354)
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#15804)
>      * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9067)
>           * shard-rkl: NOTRUN -> SKIP (i915#9067)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#4103)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#1769 / i915#3555 / i915#3804)
>      * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3804)
>      * igt@kms_dp_aux_dev@basic:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#1257)
>      * igt@kms_dp_link_training@non-uhbr-sst:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13749)
>      * igt@kms_dp_link_training@uhbr-sst:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13748 / i915#14544)
>      * igt@kms_dp_linktrain_fallback@dsc-fallback:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13707)
>           * shard-rkl: NOTRUN -> SKIP (i915#13707) +1 other test skip
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#16361) +4 other tests skip
>      * igt@kms_dsc@dsc-with-bpc-bigjoiner:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#16361) +2 other tests skip
>      * igt@kms_dsc@dsc-with-formats:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#16361) +4 other tests skip
>      * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#16361) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#16361) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#16361) +3 other tests skip
>      * igt@kms_fbcon_fbt@fbc-suspend:
> 
>           * shard-glk11: NOTRUN -> INCOMPLETE (i915#9878)
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#16680)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#16680)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#16084)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#16081) +1 other test skip
>      * igt@kms_feature_discovery@psr1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#658)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#658)
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#658)
>      * igt@kms_flip@2x-blocking-wf_vblank:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934) +2 other
>             tests skip
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9934) +7 other tests skip
>      * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637 / i915#9934) +2 other tests
>             skip
>      * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +4 other tests
>             skip
>      * igt@kms_flip@2x-wf_vblank-ts-check:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9934) +3 other tests skip
>      * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
> 
>           * shard-dg2: PASS -> SKIP (i915#5354) +6 other tests skip
>      * igt@kms_flip@flip-vs-dpms-on-nop:
> 
>           * shard-dg2: PASS -> SKIP (i915#16724)
>      * igt@kms_flip@nonexisting-fb-interruptible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354)
>      * igt@kms_flip@wf_vblank-ts-check-interruptible@b-hdmi-a1:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#10826) +1 other test fail
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15643) +4 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15643) +3 other tests skip
>           * shard-tglu: NOTRUN -> SKIP (i915#15643) +4 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#15643) +3 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15643)
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15643)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8813)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8813)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8810 / i915#8813)
>      * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
> 
>           * shard-dg2: PASS -> SKIP (i915#3555 / i915#8813) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15643) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15643 / i915#5190) +1 other test
>             skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
> 
>           * shard-dg2: PASS -> SKIP (i915#16708)
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15991 / i915#5354) +12 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15990 / i915#8708) +11 other
>             tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#1825)
>      * igt@kms_frontbuffer_tracking@fbc-farfromfence-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#16708 / i915#5354) +5 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-pwrite:
> 
>           * shard-dg2: PASS -> SKIP (i915#16708 / i915#5354) +8 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-shrfb-plflip-blt:
> 
>           * shard-rkl: PASS -> SKIP (i915#15989) +4 other tests skip
>      * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-glk: PASS -> SKIP +6 other tests skip
>      * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15989) +11 other tests skip
>      * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-shrfb-pgflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP +85 other tests skip
>      * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt:
> 
>           * shard-tglu: NOTRUN -> SKIP +122 other tests skip
>      * igt@kms_frontbuffer_tracking@fbchdr-suspend:
> 
>           * shard-glk11: NOTRUN -> INCOMPLETE (i915#16056 / i915#16593)
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#16056)
>      * igt@kms_frontbuffer_tracking@fbchdr-tiling-4:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5439) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbchdr-tiling-linear:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15989) +21 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-mmap-wc:
> 
>           * shard-snb: NOTRUN -> SKIP +196 other tests skip
>           * shard-dg2: NOTRUN -> SKIP (i915#15104 / i915#15990)
>           * shard-dg1: NOTRUN -> SKIP (i915#15104 / i915#15990)
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +41 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15102 / i915#3023) +21 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10433 / i915#15102) +1 other test
>             skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#5439)
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15989) +25 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15102) +20 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-pgflip-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15102) +21 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-pwrite:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15991) +19 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544) +9 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15990) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15102) +19 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15102) +14 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5439) +1 other test skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-linear:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#16708) +17 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-indfb-draw-blt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15989) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15989) +25 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-pwrite:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15991) +28 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-shrfb-scaledprimary:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15989) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15104 / i915#15990)
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#15990 / i915#8708) +7 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15990 / i915#8708) +4 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15991 / i915#1825) +17 other
>             tests skip
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15102 / i915#3023)
>             +2 other tests skip
>      * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-pgflip-blt:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15102) +49 other tests skip
>      * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15102)
>      * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP +33 other tests skip
>      * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15990) +12 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#15990) +3 other tests skip
>      * igt@kms_hdr@bpc-switch-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#16518 / i915#3555 / i915#8228) +2
>             other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_hdr@invalid-metadata-sizes:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#16644 / i915#3555 / i915#8228) +2
>             other tests skip
>      * igt@kms_invalid_mode@int-max-clock:
> 
>           * shard-dg2: PASS -> SKIP (i915#3555) +1 other test skip
>      * igt@kms_joiner@basic-big-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15460)
>      * igt@kms_joiner@basic-max-non-joiner:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13688)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15458)
>      * igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15458)
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15638 / i915#15722)
>      * igt@kms_lease@atomic-implicit-crtc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#16707) +15 other tests skip
>      * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#14712)
>      * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#13705)
>      * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15709) +3 other tests skip
>      * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier@pipe-b-plane-5:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#16386) +1 other test skip
>      * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#15709) +1 other test skip
>      * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15709) +7 other tests skip
>      * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier@pipe-a-plane-5:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#16386) +1 other test skip
>      * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier@pipe-a-plane-7:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#16386) +1 other test skip
>      * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15709) +3 other tests skip
>      * igt@kms_plane@pixel-format-yf-tiled-modifier:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#15709) +2 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15709) +2 other tests skip
>      * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#16112)
>           * shard-rkl: NOTRUN -> SKIP (i915#16112)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#16112)
>      * igt@kms_plane@plane-panning-bottom-right-suspend:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#13026) +1 other test
>             incomplete
>      * igt@kms_plane@plane-panning-top-left:
> 
>           * shard-dg2: PASS -> SKIP (i915#8825) +3 other tests skip
>      * igt@kms_plane_alpha_blend@alpha-opaque-fb:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647 / i915#12169) +1 other test
>             fail
>      * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
> 
>           * shard-glk: NOTRUN -> FAIL (i915#10647) +3 other tests fail
>      * igt@kms_plane_multiple@2x-tiling-4:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#13958 / i915#14544)
>      * igt@kms_plane_multiple@2x-tiling-yf:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#13958)
>           * shard-tglu: NOTRUN -> SKIP (i915#13958) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#13958)
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6953)
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format:
> 
>           * shard-dg2: PASS -> SKIP (i915#15329 / i915#9423) +1 other test
>             skip
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-c:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15329) +9 other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#15329 / i915#6953)
>           * shard-dg2: NOTRUN -> SKIP (i915#15329 / i915#6953 / i915#9423)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-a:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15329) +3 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#15329) +5 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25:
> 
>           * shard-dg2: PASS -> SKIP (i915#15329 / i915#3555 / i915#6953 /
>             i915#9423)
>      * igt@kms_plane_scaling@planes-upscale-factor-0-25@pipe-d:
> 
>           * shard-dg2: PASS -> SKIP (i915#15329) +11 other tests skip
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12343)
>           * shard-rkl: NOTRUN -> SKIP (i915#12343)
>      * igt@kms_pm_backlight@fade-with-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12343 / i915#5354) +1 other test
>             skip
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12343 / i915#9812) +1 other
>             test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#12343 / i915#5354)
>           * shard-dg2: NOTRUN -> SKIP (i915#12343 / i915#5354)
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15739)
>      * igt@kms_pm_lpsp@kms-lpsp:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9340)
>      * igt@kms_pm_lpsp@screens-disabled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8430)
>           * shard-rkl: NOTRUN -> SKIP (i915#8430)
>           * shard-dg1: NOTRUN -> SKIP (i915#8430)
>           * shard-tglu: NOTRUN -> SKIP (i915#8430)
>           * shard-mtlp: NOTRUN -> SKIP (i915#8430)
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15073)
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#15073) +1 other test
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-dg2: PASS -> SKIP (i915#15073) +1 other test skip
>      * igt@kms_pm_rpm@modeset-lpsp-stress:
> 
>           * shard-dg1: PASS -> SKIP (i915#15073) +2 other tests skip
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15073)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-rkl: PASS -> SKIP (i915#15073) +1 other test skip
>      * igt@kms_pm_rpm@system-suspend-idle:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#15132)
>      * igt@kms_properties@colorop-properties-atomic:
> 
>           * shard-dg2: PASS -> SKIP (i915#15347)
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#11520) +11 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520) +3 other tests skip
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +6 other tests skip
>      * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11520) +1 other test skip
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#11520) +1 other test skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11520) +1 other test skip
>      * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9808)
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12316) +3 other tests skip
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520 / i915#14544) +2 other
>             tests skip
>           * shard-glk11: NOTRUN -> SKIP (i915#11520)
>      * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +6 other tests skip
>      * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
> 
>           * shard-glk10: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-psr-basic:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#14544 / i915#9732) +5
>             other tests skip
>      * igt@kms_psr@fbc-psr-no-drrs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +23 other tests skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +11 other tests skip
>      * igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
> 
>           * shard-glk: NOTRUN -> SKIP +645 other tests skip
>      * igt@kms_psr@pr-cursor-plane-onoff:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +23 other tests
>             skip
>      * igt@kms_psr@pr-primary-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +16 other tests
>             skip
>      * igt@kms_psr@psr-sprite-mmap-gtt@edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077 / i915#9688) +1 other test
>             skip
>      * igt@kms_psr@psr2-primary-mmap-gtt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9732) +10 other tests skip
>      * igt@kms_psr@psr2-sprite-mmap-cpu:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +11 other tests
>             skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#15949)
>      * igt@kms_rotation_crc@exhaust-fences:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4235)
>           * shard-dg1: NOTRUN -> SKIP (i915#4884)
>           * shard-mtlp: NOTRUN -> SKIP (i915#4235)
>      * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-rotation-90:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12755 / i915#15867)
>           * shard-dg2: NOTRUN -> SKIP (i915#12755 / i915#15867)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755 / i915#15867 / i915#5190)
>           * shard-rkl: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_scaling_modes@scaling-mode-full-aspect:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +4 other tests skip
>      * igt@kms_scaling_modes@scaling-mode-none:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3555)
>      * igt@kms_tiled_display@basic-test-pattern:
> 
>           * shard-glk10: NOTRUN -> FAIL (i915#10959)
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#15243 / i915#3555)
>      * igt@kms_vrr@max-min:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#9906)
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3555 / i915#9906)
>           * shard-dg1: NOTRUN -> SKIP (i915#3555 / i915#9906)
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9906)
>      * igt@kms_vrr@seamless-rr-switch-virtual:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9906)
>      * igt@perf@non-zero-reason@0-rcs0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#9100) +1 other test fail
>      * igt@prime_udl@share-import:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#16420)
>           * shard-rkl: NOTRUN -> SKIP (i915#16420)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#16420)
>           * shard-dg1: NOTRUN -> SKIP (i915#16420)
>           * shard-mtlp: NOTRUN -> SKIP (i915#16420)
>      * igt@prime_vgem@basic-fence-flip:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3708) +1 other test skip
>      * igt@prime_vgem@fence-read-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708) +1 other test skip
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3708)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3708)
>      * igt@sriov_basic@bind-unbind-vf@vf-5:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#16066) +18 other tests skip
>      * igt@sriov_basic@enable-vfs-bind-unbind-each:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9917)
>           * shard-rkl: NOTRUN -> SKIP (i915#9917)
>           * shard-dg1: NOTRUN -> SKIP (i915#9917)
>      * igt@sriov_basic@enable-vfs-bind-unbind-each@numvfs-random:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#16066) +8 other tests skip
>      * igt@tools_test@sysfs_l3_parity:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4818)
> 
>     Possible fixes
> 
>      * igt@gem_workarounds@suspend-resume-fd:
> 
>           * shard-glk: INCOMPLETE (i915#13356 / i915#14586) -> PASS
>      * igt@i915_module_load@reload-no-display:
> 
>           * shard-dg1: DMESG-WARN (i915#13029 / i915#14545) -> PASS
>      * igt@i915_pm_rc6_residency@rc6-accuracy:
> 
>           * shard-dg2: FAIL (i915#12964) -> PASS +1 other test pass
>      * igt@i915_selftest@live@gt_lrc:
> 
>           * shard-mtlp: INCOMPLETE (i915#16229) -> PASS +1 other test pass
>      * igt@i915_suspend@fence-restore-tiled2untiled:
> 
>           * shard-rkl: INCOMPLETE (i915#4817) -> PASS
>      * igt@kms_atomic_interruptible@atomic-setmode:
> 
>           * shard-dg2: SKIP (i915#16707) -> PASS +23 other tests pass
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-mtlp: FAIL (i915#15733 / i915#5138) -> PASS
>      * igt@kms_color@legacy-gamma:
> 
>           * shard-dg2: SKIP (i915#12655) -> PASS
>      * igt@kms_cursor_crc@cursor-onscreen-256x85:
> 
>           * shard-tglu: FAIL (i915#13566) -> PASS +3 other tests pass
>      * igt@kms_cursor_crc@cursor-random-128x42:
> 
>           * shard-rkl: FAIL (i915#13566) -> PASS +1 other test pass
>      * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
> 
>           * shard-tglu: FAIL (i915#15768) -> PASS
>      * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
> 
>           * shard-dg2: SKIP (i915#5354) -> PASS +1 other test pass
>      * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
> 
>           * shard-dg2: SKIP (i915#3555 / i915#8813) -> PASS +1 other test
>             pass
>      * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
> 
>           * shard-dg2: SKIP (i915#16708) -> PASS +1 other test pass
>      * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-render:
> 
>           * shard-dg2: SKIP (i915#16708 / i915#5354) -> PASS +3 other tests
>             pass
>      * igt@kms_frontbuffer_tracking@fbchdr-rgb565-draw-mmap-cpu:
> 
>           * shard-rkl: SKIP (i915#15989) -> PASS +11 other tests pass
>      * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-glk: SKIP -> PASS +7 other tests pass
>      * igt@kms_hdr@bpc-switch:
> 
>           * shard-rkl: SKIP (i915#16644 / i915#3555 / i915#8228) -> PASS
>      * igt@kms_invalid_mode@zero-hdisplay:
> 
>           * shard-dg2: SKIP (i915#3555) -> PASS
>      * igt@kms_pipe_crc_basic@suspend-read-crc:
> 
>           * shard-rkl: INCOMPLETE (i915#12756 / i915#13476) -> PASS
>      * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: INCOMPLETE (i915#13476) -> PASS
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-d:
> 
>           * shard-dg2: SKIP (i915#15329) -> PASS +11 other tests pass
>      * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
> 
>           * shard-dg2: SKIP (i915#15329 / i915#9423) -> PASS +2 other tests
>             pass
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-dg1: SKIP (i915#15073) -> PASS +1 other test pass
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-rkl: SKIP (i915#15073) -> PASS
>      * igt@kms_pm_rpm@system-suspend-modeset:
> 
>           * shard-glk: INCOMPLETE (i915#10553) -> PASS
>           * shard-dg2: SKIP (i915#3547) -> PASS
> 
>     Warnings
> 
>      * igt@api_intel_bb@blit-reloc-purge-cache:
> 
>           * shard-rkl: SKIP (i915#8411) -> SKIP (i915#14544 / i915#8411) +1
>             other test skip
>      * igt@api_intel_bb@crc32:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6230) -> SKIP (i915#6230)
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-rkl: SKIP (i915#280) -> SKIP (i915#14544 / i915#280)
>      * igt@gem_exec_balancer@parallel-keep-submit-fence:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4525) -> SKIP (i915#4525)
>      * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3281) -> SKIP (i915#3281)
>      * igt@gem_exec_reloc@basic-wc:
> 
>           * shard-rkl: SKIP (i915#3281) -> SKIP (i915#14544 / i915#3281) +2
>             other tests skip
>      * igt@gem_lmem_swapping@heavy-random:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4613) -> SKIP (i915#4613) +1
>             other test skip
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-rkl: SKIP (i915#4613) -> SKIP (i915#14544 / i915#4613) +1
>             other test skip
>      * igt@gem_pwrite@basic-random:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3282) -> SKIP (i915#3282)
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3297) -> SKIP (i915#3297)
>      * igt@gen9_exec_parse@bb-chained:
> 
>           * shard-rkl: SKIP (i915#2527) -> SKIP (i915#14544 / i915#2527)
>      * igt@gen9_exec_parse@bb-secure:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2527) -> SKIP (i915#2527)
>      * igt@i915_pm_freq_api@freq-reset-multiple:
> 
>           * shard-rkl: SKIP (i915#8399) -> SKIP (i915#14544 / i915#8399)
>      * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
> 
>           * shard-dg1: SKIP (i915#4212 / i915#4423) -> SKIP (i915#4212)
>      * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
> 
>           * shard-rkl: SKIP (i915#5286) -> SKIP (i915#14544 / i915#5286) +1
>             other test skip
>      * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> 
>           * shard-dg2: SKIP -> SKIP (i915#16707) +2 other tests skip
>      * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
> 
>           * shard-dg2: SKIP (i915#16707) -> SKIP +1 other test skip
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
> 
>           * shard-dg2: SKIP (i915#4538 / i915#5190) -> SKIP (i915#16707 /
>             i915#5190) +9 other tests skip
>      * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>           * shard-dg2: SKIP (i915#16707 / i915#5190) -> SKIP (i915#4538 /
>             i915#5190) +4 other tests skip
>      * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
> 
>           * shard-rkl: SKIP -> SKIP (i915#14544) +32 other tests skip
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#14098 /
>             i915#14544 / i915#6095) +3 other tests skip
>      * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
> 
>           * shard-dg2: SKIP (i915#10307 / i915#6095) -> SKIP (i915#16707) +9
>             other tests skip
>      * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>           * shard-rkl: SKIP (i915#12313) -> SKIP (i915#12313 / i915#14544)
>      * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
> 
>           * shard-dg2: SKIP (i915#16707) -> SKIP (i915#10307 / i915#6095) +4
>             other tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
> 
>           * shard-dg2: SKIP (i915#12313) -> SKIP (i915#16707) +1 other test
>             skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6095) -> SKIP (i915#6095) +1
>             other test skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#14544 / i915#6095) -> SKIP
>             (i915#14098 / i915#6095) +2 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>           * shard-rkl: SKIP (i915#12805) -> SKIP (i915#12805 / i915#14544)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-dg2: SKIP (i915#6095) -> SKIP (i915#16707) +1 other test
>             skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#6095) -> SKIP (i915#14544 / i915#6095) +1
>             other test skip
>      * igt@kms_cdclk@plane-scaling:
> 
>           * shard-dg2: SKIP (i915#13783) -> SKIP (i915#16707)
>      * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
> 
>           * shard-rkl: SKIP (i915#11151) -> SKIP (i915#11151 / i915#14544)
>      * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#16471) -> SKIP (i915#16471)
>      * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
> 
>           * shard-rkl: SKIP (i915#16471) -> SKIP (i915#14544 / i915#16471)
>      * igt@kms_chamelium_edid@dp-mode-timings:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 /
>             i915#14544 / i915#7828) +3 other tests skip
>      * igt@kms_content_protection@atomic:
> 
>           * shard-rkl: SKIP (i915#15865) -> SKIP (i915#14544 / i915#15865) +1
>             other test skip
>      * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
> 
>           * shard-dg2: SKIP (i915#16707) -> SKIP (i915#15330)
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-dg2: SKIP (i915#15330 / i915#3299) -> SKIP (i915#16707)
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-dg1: SKIP (i915#9433) -> SKIP (i915#15865)
>      * igt@kms_content_protection@suspend-resume:
> 
>           * shard-dg2: SKIP (i915#16707) -> SKIP (i915#15865)
>      * igt@kms_content_protection@uevent-hdcp14:
> 
>           * shard-dg2: SKIP (i915#15865) -> SKIP (i915#16707) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-random-512x170:
> 
>           * shard-dg2: SKIP (i915#13049) -> SKIP (i915#16707) +1 other test
>             skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>           * shard-rkl: SKIP (i915#3555) -> SKIP (i915#14544 / i915#3555) +2
>             other tests skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
> 
>           * shard-dg2: SKIP (i915#16707) -> SKIP (i915#3555)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-rkl: SKIP (i915#4103) -> SKIP (i915#14544 / i915#4103)
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
> 
>           * shard-dg2: SKIP (i915#16707) -> SKIP (i915#13046 / i915#5354) +3
>             other tests skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
> 
>           * shard-dg2: SKIP (i915#13046 / i915#5354) -> SKIP (i915#16707) +1
>             other test skip
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-dg2: SKIP (i915#9833) -> SKIP (i915#16707)
>      * igt@kms_dither@fb-8bpc-vs-panel-8bpc:
> 
>           * shard-dg2: SKIP (i915#3555) -> SKIP (i915#16707) +3 other tests
>             skip
>      * igt@kms_draw_crc@draw-method-mmap-wc:
> 
>           * shard-dg2: SKIP (i915#8812) -> SKIP (i915#16707)
>      * igt@kms_dsc@dsc-with-bpc-formats:
> 
>           * shard-dg2: SKIP (i915#16707) -> SKIP (i915#16361) +1 other test
>             skip
>      * igt@kms_dsc@dsc-with-formats-ultrajoiner:
> 
>           * shard-dg2: SKIP (i915#16361) -> SKIP (i915#16707) +3 other tests
>             skip
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-dg1: SKIP (i915#16081 / i915#4423) -> SKIP (i915#16081)
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-rkl: SKIP (i915#16599) -> SKIP (i915#14544 / i915#16599)
>      * igt@kms_feature_discovery@dsc:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#16600) -> SKIP (i915#16600)
>      * igt@kms_fence_pin_leak:
> 
>           * shard-dg2: SKIP (i915#16707) -> SKIP (i915#4881)
>      * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
> 
>           * shard-rkl: SKIP (i915#9934) -> SKIP (i915#14544 / i915#9934) +4
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
> 
>           * shard-rkl: SKIP (i915#15643) -> SKIP (i915#14544 / i915#15643) +2
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
> 
>           * shard-dg2: SKIP (i915#15990 / i915#8708) -> SKIP (i915#16708 /
>             i915#5354) +17 other tests skip
>      * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg2: SKIP (i915#16708) -> SKIP (i915#15990) +13 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:
> 
>           * shard-dg2: SKIP (i915#15989) -> SKIP (i915#16708) +16 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
> 
>           * shard-dg2: SKIP (i915#10055) -> SKIP (i915#16708)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-indfb-fliptrack-mmap-gtt:
> 
>           * shard-dg2: SKIP (i915#16708 / i915#5354) -> SKIP (i915#15990 /
>             i915#8708) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
> 
>           * shard-dg2: SKIP (i915#15102) -> SKIP (i915#16708 / i915#5354) +14
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: SKIP (i915#15102) -> SKIP (i915#10433 / i915#15102)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
> 
>           * shard-dg2: SKIP (i915#16708 / i915#5354) -> SKIP (i915#15102) +4
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-pwrite:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#15102) -> SKIP (i915#15102) +3
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
> 
>           * shard-rkl: SKIP (i915#15102 / i915#3023) -> SKIP (i915#14544 /
>             i915#15102 / i915#3023) +8 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-dg2: SKIP (i915#15991 / i915#5354) -> SKIP (i915#16708 /
>             i915#5354) +30 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
> 
>           * shard-dg2: SKIP (i915#16708 / i915#5354) -> SKIP (i915#15991 /
>             i915#5354) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-plflip-blt:
> 
>           * shard-dg2: SKIP (i915#15102) -> SKIP (i915#16708) +10 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP +7 other tests skip
>      * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-onoff:
> 
>           * shard-dg2: SKIP (i915#16708) -> SKIP (i915#15989) +2 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: SKIP (i915#16708) -> SKIP (i915#15991) +18 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-pri-shrfb-draw-blt:
> 
>           * shard-dg2: SKIP (i915#15991) -> SKIP (i915#16708) +38 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-dg2: SKIP (i915#9766) -> SKIP (i915#16708 / i915#4342 /
>             i915#5354)
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#15102) -> SKIP (i915#14544 / i915#15102) +9
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
> 
>           * shard-dg2: SKIP (i915#15104 / i915#15990) -> SKIP (i915#16708) +2
>             other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-render:
> 
>           * shard-dg1: SKIP (i915#15102 / i915#4423) -> SKIP (i915#15102)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-pwrite:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#15102) -> SKIP (i915#16708 /
>             i915#5354)
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#1825) -> SKIP (i915#14544 / i915#1825) +1
>             other test skip
>      * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102 / i915#3023) -> SKIP
>             (i915#15102 / i915#3023) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-shrfb-draw-pwrite:
> 
>           * shard-dg2: SKIP (i915#16708) -> SKIP (i915#15102) +6 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-mmap-wc:
> 
>           * shard-dg2: SKIP (i915#15990) -> SKIP (i915#16708) +14 other tests
>             skip
>      * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-indfb-draw-pwrite:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15102) -> SKIP (i915#15102) +3
>             other tests skip
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-dg2: SKIP (i915#16707) -> SKIP (i915#12713 / i915#16518)
>           * shard-rkl: SKIP (i915#12713 / i915#16644) -> SKIP (i915#14544 /
>             i915#16644)
>           * shard-tglu: SKIP (i915#1187 / i915#12713) -> SKIP (i915#12713)
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-dg2: SKIP (i915#16518 / i915#3555 / i915#8228) -> SKIP
>             (i915#16707) +2 other tests skip
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-rkl: SKIP (i915#15459) -> SKIP (i915#14544 / i915#15459)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-rkl: SKIP (i915#15815) -> SKIP (i915#14544 / i915#15815)
>      * igt@kms_panel_fitting@legacy:
> 
>           * shard-dg2: SKIP (i915#16707) -> SKIP (i915#6301)
>      * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#15709) -> SKIP (i915#15709)
>      * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
> 
>           * shard-rkl: SKIP (i915#15709) -> SKIP (i915#14544 / i915#15709)
>      * igt@kms_plane_lowres@tiling-yf:
> 
>           * shard-dg2: SKIP (i915#3555 / i915#8821) -> SKIP (i915#16707)
>      * igt@kms_plane_multiple@2x-tiling-none:
> 
>           * shard-dg2: SKIP (i915#16707) -> SKIP (i915#13958)
>      * igt@kms_plane_multiple@2x-tiling-x:
> 
>           * shard-rkl: SKIP (i915#13958) -> SKIP (i915#13958 / i915#14544)
>      * igt@kms_plane_multiple@tiling-y:
> 
>           * shard-dg2: SKIP (i915#14259) -> SKIP (i915#16707)
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-rkl: SKIP (i915#15948) -> SKIP (i915#14544 / i915#15948)
>      * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-rkl: SKIP (i915#15073) -> SKIP (i915#14544 / i915#15073)
>      * igt@kms_pm_rpm@package-g7:
> 
>           * shard-dg1: SKIP (i915#15403 / i915#4423) -> SKIP (i915#15403)
>      * igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>           * shard-rkl: SKIP (i915#9683) -> SKIP (i915#14544 / i915#9683)
>      * igt@kms_psr@pr-primary-render:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#14544 / i915#9732) +6 other tests skip
>      * igt@kms_psr@psr-cursor-mmap-cpu:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#14544 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#5289) -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-dg2: SKIP (i915#16707 / i915#5190) -> SKIP (i915#5190)
>      * igt@kms_rotation_crc@sprite-rotation-90:
> 
>           * shard-dg2: SKIP (i915#16707) -> SKIP (i915#12755 / i915#15867) +1
>             other test skip
>      * igt@kms_selftest@drm_framebuffer:
> 
>           * shard-dg1: ABORT (i915#13179) -> ABORT (i915#13179 / i915#16508)
>             +1 other test abort
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555) -> SKIP (i915#3555) +1
>             other test skip
>      * igt@kms_vrr@flip-basic:
> 
>           * shard-dg2: SKIP (i915#15243 / i915#3555) -> SKIP (i915#16707)
>      * igt@perf_pmu@rc6-all-gts:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8516) -> SKIP (i915#8516)
>      * igt@prime_vgem@basic-fence-read:
> 
>           * shard-rkl: SKIP (i915#3291 / i915#3708) -> SKIP (i915#14544 /
>             i915#3291 / i915#3708)
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_9034 -> IGTPW_15615
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_18931: f584d11df22f39e3a4e97cbd2bdb76bb2a11b19c @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_15615: 15615
>    IGT_9034: be1d1af352dbd4ca4557202a8ed0d6d60f95e0bf @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
