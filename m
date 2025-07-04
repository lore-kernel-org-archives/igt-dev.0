Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884BFC83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 15:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A9C10E2B9;
	Fri,  4 Jul 2025 15:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXMuvX53";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7980F10E2B9
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 15:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751643491; x=1783179491;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=LB2Oi/34M2I5e43T3/jVApQ3oM6NuRP1Pl3q7w2ZdHw=;
 b=OXMuvX53JlJCMJwWNpWdXVV4NP9tqpmQjZqVx8wb/oeW4Z/tnCakNLeH
 oO2aGIz86LH+/e5JHcS5QbOsvy+GntKeGm8l6aF3dLlt3qUY697zRsaHn
 /idB6HMIhYB/j5Ot01oKRni7eGju5+I2UMGRWGyJeH1W4tRbKK8uaPfdp
 N/NwmdJIK1LpJk6CWKA/ZtnY96K9UZg+r1mjzMolalI3K9CNhOWjLS/nv
 e70TwB8cleZCF73LXvi0Zo6CzJh1K4UPoTAMN0mxdsp6YWlgie9LRessf
 mOhex33N3mi5NrMpKYo7U/pN0d/A4CYKH+I41zCw1hF205kjfUmK4uUIw Q==;
X-CSE-ConnectionGUID: pFnzYYEDRsi9GNNMAgzuvw==
X-CSE-MsgGUID: uZszWTuzSN65aCyImfSVJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="54097736"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="54097736"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 08:38:11 -0700
X-CSE-ConnectionGUID: RmRoFJ9CRZeu0GfB3wXZCw==
X-CSE-MsgGUID: GiUJvO+ZRIqxmD/t9FsZiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="155029870"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.42])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 08:38:09 -0700
Date: Fri, 4 Jul 2025 17:38:05 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbA==?= =?utf-8?Q?=3A?= failure for
 lib/intel_compute: reuse bo checking code
Message-ID: <o2v5n675qjju7cawzzcyfju6nvxv2kvx66ei2q4aemvm6bep6z@cxnphbyuxh3v>
References: <20250704081131.895088-2-zbigniew.kempczynski@intel.com>
 <175163867127.135781.6939466134880333550@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175163867127.135781.6939466134880333550@1538d3639d33>
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

On Fri, Jul 04, 2025 at 02:17:51PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  lib/intel_compute: reuse bo checking code                       
>    URL:     https://patchwork.freedesktop.org/series/151166/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13405/index.html 
> 
>           CI Bug Log - changes from IGT_8439_full -> IGTPW_13405_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_13405_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_13405_full, please notify your bug team
>    (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13405/index.html
> 
> Participating hosts (10 -> 10)
> 
>    No changes in participating hosts
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_13405_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live:
>           * shard-rkl: PASS -> DMESG-FAIL +1 other test dmesg-fail

Unrelated to the change. It touches compute tests only.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_13405_full that come from known
>    issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@blit-reloc-keep-cache:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8411)
>      * igt@api_intel_bb@crc32:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6230)
>      * igt@api_intel_bb@object-reloc-purge-cache:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8411) +1 other test skip
>      * igt@device_reset@cold-reset-bound:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11078)
>      * igt@device_reset@unbind-cold-reset-rebind:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11078)
>      * igt@drm_read@empty-block:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544) +13 other tests skip
>      * igt@fbdev@info:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#1849 / i915#2582)
>      * igt@fbdev@nullptr:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#2582)
>      * igt@gem_busy@semaphore:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3936)
>      * igt@gem_caching@writes:
> 
>           * shard-rkl: PASS -> DMESG-WARN (i915#12917 / i915#12964) +1 other
>             test dmesg-warn
>      * igt@gem_ccs@block-multicopy-compressed:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9323)
>      * igt@gem_ccs@ctrl-surf-copy:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9323) +1 other test
>             skip
>      * igt@gem_close_race@multigpu-basic-process:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_close_race@multigpu-basic-threads:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7697)
>      * igt@gem_ctx_isolation@preservation-s3:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#12353) +1 other test
>             incomplete
>      * igt@gem_ctx_isolation@preservation-s3@rcs0:
> 
>           * shard-snb: PASS -> ABORT (i915#12817) +1 other test abort
>      * igt@gem_ctx_persistence@hang:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_persistence@heartbeat-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8555)
>      * igt@gem_ctx_sseu@engines:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#280)
>      * igt@gem_ctx_sseu@mmap-args:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#280)
>      * igt@gem_eio@in-flight-suspend:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4391 / i915#4423)
>      * igt@gem_eio@kms:
> 
>           * shard-dg2-9: NOTRUN -> FAIL (i915#5784)
>      * igt@gem_exec_balancer@parallel-contexts:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4525)
>      * igt@gem_exec_balancer@parallel-out-fence:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4525) +1 other test skip
>      * igt@gem_exec_big@single:
> 
>           * shard-tglu: NOTRUN -> ABORT (i915#11713 / i915#14533)
>      * igt@gem_exec_capture@capture-invisible:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6334) +1 other test skip
>      * igt@gem_exec_capture@capture@vecs0-lmem0:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#11965) +4 other tests fail
>      * igt@gem_exec_fence@concurrent:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4812)
>      * igt@gem_exec_flush@basic-batch-kernel-default-uc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3539 / i915#4852)
>      * igt@gem_exec_flush@basic-wb-ro-before-default:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3539 / i915#4852) +2 other tests
>             skip
>      * igt@gem_exec_flush@basic-wb-ro-default:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3539 / i915#4852)
>      * igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3281) +1 other test skip
>      * igt@gem_exec_reloc@basic-cpu-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3281) +1 other test
>             skip
>      * igt@gem_exec_reloc@basic-gtt-cpu-active:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281) +4 other tests skip
>      * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3281) +4 other tests skip
>      * igt@gem_exec_reloc@basic-wc-read-active:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3281)
>      * igt@gem_exec_reloc@basic-write-read-active:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3281) +11 other tests skip
>      * igt@gem_exec_schedule@preempt-queue:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4812) +1 other test skip
>      * igt@gem_fence_thrash@bo-write-verify-x:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_fenced_exec_thrash@2-spare-fences:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4860) +1 other test skip
>      * igt@gem_fenced_exec_thrash@no-spare-fences-busy:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4860)
>      * igt@gem_lmem_evict@dontneed-evict-race:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613 / i915#7582)
>      * igt@gem_lmem_swapping@heavy-verify-random-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@parallel-random-verify-ccs:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_lmem_swapping@random:
> 
>           * shard-glk: NOTRUN -> SKIP (i915#4613)
>      * igt@gem_lmem_swapping@verify-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4613) +1 other test skip
>      * igt@gem_madvise@dontneed-before-exec:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3282) +3 other tests skip
>      * igt@gem_media_fill@media-fill:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8289)
>      * igt@gem_media_vme:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#284)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#284)
>      * igt@gem_mmap@big-bo:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4083) +2 other tests skip
>      * igt@gem_mmap_gtt@basic-read-write-distinct:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4077) +2 other tests skip
>      * igt@gem_mmap_gtt@basic-small-bo:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4077) +16 other tests skip
>      * igt@gem_mmap_gtt@fault-concurrent-x:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4077) +10 other tests skip
>      * igt@gem_mmap_wc@bad-size:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_mmap_wc@read-write:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_mmap_wc@write-prefaulted:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4083) +7 other tests skip
>      * igt@gem_partial_pwrite_pread@reads:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3282) +4 other tests skip
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3282) +3 other tests skip
>      * igt@gem_pread@snoop:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3282) +7 other tests skip
>      * igt@gem_pxp@fail-invalid-protected-context:
> 
>           * shard-rkl: PASS -> TIMEOUT (i915#12964)
>      * igt@gem_pxp@protected-encrypted-src-copy-not-readible:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_pxp@regular-baseline-src-copy-readible:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4270) +4 other tests skip
>      * igt@gem_pxp@reject-modify-context-protection-off-2:
> 
>           * shard-rkl: PASS -> TIMEOUT (i915#12917 / i915#12964)
>      * igt@gem_pxp@reject-modify-context-protection-off-3:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4270) +1 other test skip
>      * igt@gem_pxp@reject-modify-context-protection-on:
> 
>           * shard-rkl: NOTRUN -> TIMEOUT (i915#12917 / i915#12964) +2 other
>             tests timeout
>      * igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8428) +2 other tests skip
>      * igt@gem_render_copy@y-tiled-to-vebox-linear:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5190 / i915#8428) +4 other tests
>             skip
>      * igt@gem_render_copy@yf-tiled-ccs-to-y-tiled-ccs:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5190 / i915#8428) +2 other
>             tests skip
>      * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4079) +1 other test skip
>      * igt@gem_tiled_pread_basic:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4079)
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_tiled_pread_pwrite:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4079)
>      * igt@gem_userptr_blits@coherency-sync:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@create-destroy-unsync:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3297) +1 other test skip
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_userptr_blits@forbidden-operations:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3282 / i915#3297)
>      * igt@gem_userptr_blits@relocations:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3281 / i915#3297)
>      * igt@gem_userptr_blits@unsync-overlap:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3297) +2 other tests skip
>      * igt@gem_userptr_blits@unsync-unmap:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3297)
>      * igt@gem_userptr_blits@unsync-unmap-cycles:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3297)
>      * igt@gem_workarounds@suspend-resume:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#13356)
>      * igt@gen9_exec_parse@allowed-single:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2856) +2 other tests skip
>      * igt@gen9_exec_parse@bb-chained:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2527) +3 other tests skip
>      * igt@gen9_exec_parse@bb-oversize:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2856) +2 other tests skip
>      * igt@gen9_exec_parse@bb-start-out:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2527) +1 other test skip
>           * shard-mtlp: NOTRUN -> SKIP (i915#2856)
>      * igt@gen9_exec_parse@bb-start-param:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#2527)
>      * igt@gen9_exec_parse@cmd-crossing-page:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2527 / i915#2856) +3 other tests
>             skip
>      * igt@gen9_exec_parse@shadow-peek:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2527 / i915#2856) +1 other
>             test skip
>      * igt@i915_drm_fdinfo@all-busy-check-all:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#14123)
>      * igt@i915_drm_fdinfo@busy-check-all@vecs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11527) +7 other tests skip
>      * igt@i915_drm_fdinfo@isolation@rcs0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#14073) +7 other tests skip
>      * igt@i915_drm_fdinfo@virtual-busy-idle-all:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#14118) +1 other test skip
>      * igt@i915_module_load@reload-no-display:
> 
>           * shard-dg2: PASS -> DMESG-WARN (i915#13029 / i915#14545)
>           * shard-dg1: PASS -> DMESG-WARN (i915#13029)
>      * igt@i915_pm_freq_api@freq-reset-multiple:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#8399)
>      * igt@i915_pm_freq_api@freq-suspend:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#8399)
>      * igt@i915_pm_rc6_residency@rc6-accuracy:
> 
>           * shard-rkl: PASS -> FAIL (i915#12942) +1 other test fail
>      * igt@i915_pm_rpm@gem-execbuf-stress:
> 
>           * shard-rkl: PASS -> SKIP (i915#13328 / i915#14544)
>      * igt@i915_pm_rps@basic-api:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11681 / i915#6621)
>      * igt@i915_pm_rps@thresholds-park:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11681)
>      * igt@i915_pm_sseu@full-enable:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4387)
>      * igt@i915_query@query-topology-coherent-slice-mask:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6188)
>      * igt@i915_query@test-query-geometry-subslices:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5723)
>      * igt@i915_selftest@live@workarounds:
> 
>           * shard-dg2: NOTRUN -> DMESG-FAIL (i915#12061) +1 other test
>             dmesg-fail
>           * shard-mtlp: PASS -> DMESG-FAIL (i915#12061) +1 other test
>             dmesg-fail
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-glk: NOTRUN -> INCOMPLETE (i915#4817)
>      * igt@intel_hwmon@hwmon-read:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#7707)
>      * igt@intel_hwmon@hwmon-write:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#7707)
>      * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@basic-x-tiled-legacy:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#4212)
>      * igt@kms_addfb_basic@clobberred-modifier:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4212) +1 other test skip
>      * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9531)
>      * igt@kms_atomic_interruptible@legacy-dpms:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544) +36 other tests skip
>      * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
> 
>           * shard-rkl: PASS -> DMESG-WARN (i915#12964) +26 other tests
>             dmesg-warn
>      * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1769 / i915#3555)
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5286) +2 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5286) +4 other tests skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#5286) +3 other tests skip
>           * shard-dg1: NOTRUN -> SKIP (i915#4538 / i915#5286) +1 other test
>             skip
>      * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>           * shard-mtlp: PASS -> FAIL (i915#5138)
>      * igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3638)
>      * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3638)
>      * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>           * shard-mtlp: NOTRUN -> SKIP +5 other tests skip
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4538 / i915#5190) +11 other tests
>             skip
>      * igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5190)
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#4538 / i915#5190) +6 other
>             tests skip
>      * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-4:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#6095) +139 other tests skip
>      * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-1:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#6095) +29 other tests skip
>      * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-2:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#10307 / i915#6095) +29 other
>             tests skip
>      * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12313) +1 other test skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14098 / i915#6095) +45 other
>             tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#12313)
>           * shard-mtlp: NOTRUN -> SKIP (i915#12313)
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6095) +39 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-a-edp-1:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6095) +14 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12805)
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#6095) +48 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-2:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#6095) +9 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
> 
>           * shard-tglu: PASS -> ABORT (i915#12817) +1 other test abort
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6095) +25 other tests skip
>      * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
> 
>           * shard-tglu: PASS -> DMESG-WARN (i915#12817)
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#6095) +152 other
>             tests skip
>      * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12313) +3 other tests skip
>      * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-hdmi-a-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#10307 / i915#10434 / i915#6095)
>             +4 other tests skip
>      * igt@kms_cdclk@mode-transition-all-outputs:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13784)
>      * igt@kms_chamelium_audio@dp-audio-edid:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11151 / i915#7828) +7 other tests
>             skip
>           * shard-dg1: NOTRUN -> SKIP (i915#11151 / i915#7828)
>      * igt@kms_chamelium_color@ctm-0-75:
> 
>           * shard-snb: NOTRUN -> SKIP +42 other tests skip
>      * igt@kms_chamelium_edid@dp-mode-timings:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#11151 / i915#7828) +4 other
>             tests skip
>      * igt@kms_chamelium_frames@hdmi-aspect-ratio:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#14544 / i915#7828)
>      * igt@kms_chamelium_hpd@common-hpd-after-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other
>             tests skip
>      * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11151 / i915#7828) +6 other tests
>             skip
>      * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other
>             tests skip
>      * igt@kms_chamelium_hpd@vga-hpd:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11151 / i915#7828) +5 other
>             tests skip
>      * igt@kms_color@ctm-signed:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12655 / i915#14544)
>      * igt@kms_color@deep-color:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#9979)
>      * igt@kms_color@legacy-gamma:
> 
>           * shard-rkl: PASS -> SKIP (i915#12655 / i915#14544)
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7118 / i915#9424) +1 other test
>             skip
>      * igt@kms_content_protection@dp-mst-lic-type-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3116 / i915#3299)
>      * igt@kms_content_protection@dp-mst-type-1:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3299)
>      * igt@kms_content_protection@lic-type-0:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9424)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6944 / i915#9424)
>           * shard-dg1: NOTRUN -> SKIP (i915#9424)
>      * igt@kms_content_protection@srm:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#6944)
>      * igt@kms_content_protection@srm@pipe-a-dp-3:
> 
>           * shard-dg2: NOTRUN -> FAIL (i915#7173)
>      * igt@kms_content_protection@type1:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#6944 / i915#7116 / i915#7118 /
>             i915#9424)
>      * igt@kms_cursor_crc@cursor-offscreen-32x10:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3555) +2 other tests skip
>      * igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> FAIL (i915#13566)
>      * igt@kms_cursor_crc@cursor-onscreen-32x32:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3555) +1 other test skip
>      * igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-random-32x10:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3555) +1 other test skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13049) +1 other test skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8814)
>      * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: NOTRUN -> DMESG-WARN (i915#12964) +11 other tests
>             dmesg-warn
>      * igt@kms_cursor_crc@cursor-sliding-128x42:
> 
>           * shard-tglu: PASS -> FAIL (i915#13566) +3 other tests fail
>      * igt@kms_cursor_crc@cursor-sliding-128x42@pipe-a-hdmi-a-2:
> 
>           * shard-rkl: PASS -> FAIL (i915#13566) +4 other tests fail
>      * igt@kms_cursor_crc@cursor-sliding-32x10:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555) +7 other tests skip
>      * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#14152)
>      * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP +9 other tests skip
>      * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13046 / i915#5354) +5 other tests
>             skip
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#4103) +1 other test skip
>      * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
> 
>           * shard-rkl: PASS -> SKIP (i915#11190 / i915#14544) +3 other tests
>             skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9809) +1 other test skip
>      * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13046 / i915#5354) +2 other
>             tests skip
>      * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
> 
>           * shard-rkl: PASS -> FAIL (i915#2346)
>      * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4103 / i915#4213)
>      * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9723)
>      * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4423 / i915#9723)
>      * igt@kms_dp_aux_dev:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1257)
>      * igt@kms_dp_link_training@non-uhbr-sst:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13749)
>           * shard-rkl: NOTRUN -> SKIP (i915#13749)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13749)
>      * igt@kms_dsc@dsc-basic:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-fractional-bpp:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3840)
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3840 / i915#9688)
>      * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3840)
>      * igt@kms_dsc@dsc-with-bpc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#3840 / i915#9053)
>      * igt@kms_fbcon_fbt@psr-suspend:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3469)
>      * igt@kms_feature_discovery@chamelium:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#4854)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2065 / i915#4854)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@display-3x:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1839) +1 other test skip
>      * igt@kms_feature_discovery@dp-mst:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9337)
>      * igt@kms_feature_discovery@psr2:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#658)
>      * igt@kms_fence_pin_leak:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4881)
>      * igt@kms_flip@2x-blocking-wf_vblank:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#3637 / i915#9934) +3 other
>             tests skip
>      * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9934) +9 other tests skip
>      * igt@kms_flip@2x-flip-vs-panning:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#9934) +4 other tests skip
>      * igt@kms_flip@2x-flip-vs-panning-vs-hang:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9934) +5 other tests skip
>      * igt@kms_flip@2x-modeset-vs-vblank-race:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9934) +3 other tests skip
>      * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3637 / i915#9934)
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#9934)
>      * igt@kms_flip@2x-plain-flip:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3637 / i915#9934) +6 other tests
>             skip
>      * igt@kms_flip@basic-flip-vs-dpms:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#3637) +4 other tests
>             skip
>      * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
> 
>           * shard-dg1: PASS -> DMESG-WARN (i915#4423) +2 other tests
>             dmesg-warn
>      * igt@kms_flip@flip-vs-suspend-interruptible:
> 
>           * shard-rkl: PASS -> INCOMPLETE (i915#6113)
>      * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a2:
> 
>           * shard-rkl: NOTRUN -> INCOMPLETE (i915#6113)
>      * igt@kms_flip@plain-flip-ts-check:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#3637) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2672 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#2587 / i915#2672)
>      * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555) +2 other tests
>             skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#5190)
>             +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#2672) +1 other test skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672) +2 other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#5190) +1
>             other test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#3555 / i915#8810 / i915#8813)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8810 / i915#8813)
>      * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#3555)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#3555 / i915#8813)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-default-mode:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#2672 / i915#8813)
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other
>             test skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2672 / i915#3555) +1 other test
>             skip
>      * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2587 / i915#2672) +1 other test
>             skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-pwrite:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#1849 / i915#5354) +7
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#1849 / i915#5354) +4
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#1825) +7 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
> 
>           * shard-tglu-1: NOTRUN -> SKIP +48 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
> 
>           * shard-dg2: PASS -> FAIL (i915#6880)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3458) +11 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#8708) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-gtt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1825) +15 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8708) +24 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#8708) +3 other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#10055)
>      * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#9766)
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3458) +18 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3023) +6 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#3458) +2 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
> 
>           * shard-dg1: NOTRUN -> SKIP +13 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#5354) +17 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#5354) +32 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#8708) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-cpu:
> 
>           * shard-glk: NOTRUN -> SKIP +6 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
> 
>           * shard-tglu: NOTRUN -> SKIP +48 other tests skip
>      * igt@kms_hdr@bpc-switch-suspend:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8228)
>      * igt@kms_hdr@static-swap:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555 / i915#8228) +1 other test
>             skip
>      * igt@kms_invalid_mode@bad-vtotal:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#3555 / i915#8826)
>      * igt@kms_invalid_mode@overflow-vrefresh:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#8826)
>      * igt@kms_joiner@basic-max-non-joiner:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13688)
>      * igt@kms_joiner@invalid-modeset-force-big-joiner:
> 
>           * shard-dg2: PASS -> SKIP (i915#12388)
>      * igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12339)
>      * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#4816)
>      * igt@kms_panel_fitting@atomic-fastset:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#6301)
>      * igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
> 
>           * shard-dg2: NOTRUN -> SKIP +10 other tests skip
>      * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#13705)
>      * igt@kms_plane_alpha_blend@alpha-7efc:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#7294)
>      * igt@kms_plane_lowres@tiling-yf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3555 / i915#8821)
>      * igt@kms_plane_multiple@2x-tiling-yf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#13958)
>           * shard-dg2: NOTRUN -> SKIP (i915#13958) +1 other test skip
>      * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#13046 / i915#5354 / i915#9423)
>      * igt@kms_plane_scaling@intel-max-src-size:
> 
>           * shard-dg2: PASS -> SKIP (i915#6953 / i915#9423)
>           * shard-rkl: NOTRUN -> SKIP (i915#14544 / i915#6953 / i915#8152)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12247 / i915#9423)
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12247) +3 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-c:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#12247) +3 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12247) +4 other tests skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12247) +13 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#8152)
>      * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12247 / i915#6953 / i915#9423) +2
>             other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:
> 
>           * shard-rkl: PASS -> SKIP (i915#12247 / i915#14544 / i915#8152) +3
>             other tests skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling@pipe-a:
> 
>           * shard-rkl: PASS -> SKIP (i915#12247 / i915#14544) +2 other tests
>             skip
>      * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#6953 / i915#8152)
>      * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12247) +11 other tests skip
>      * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#12247 / i915#3555)
>      * igt@kms_pm_backlight@brightness-with-dpms:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#12343)
>      * igt@kms_pm_dc@dc5-retention-flops:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3828)
>      * igt@kms_pm_dc@dc9-dpms:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#4281)
>      * igt@kms_pm_lpsp@screens-disabled:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8430)
>      * igt@kms_pm_rpm@cursor:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#4077) +3 other tests skip
>      * igt@kms_pm_rpm@dpms-lpsp:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9519)
>      * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#9519)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
> 
>           * shard-rkl: PASS -> SKIP (i915#9519) +1 other test skip
>      * igt@kms_pm_rpm@pc8-residency:
> 
>           * shard-dg2-9: NOTRUN -> SKIP +5 other tests skip
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#6524 / i915#6805) +1 other test
>             skip
>      * igt@kms_properties@crtc-properties-legacy:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11521 / i915#14544)
>      * igt@kms_properties@plane-properties-legacy:
> 
>           * shard-rkl: PASS -> SKIP (i915#11521 / i915#14544)
>      * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#11520) +1 other test skip
>      * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#11520) +5 other tests skip
>      * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#11520) +4 other tests skip
>      * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#12316)
>      * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
> 
>           * shard-snb: NOTRUN -> SKIP (i915#11520)
>      * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#11520) +2 other tests skip
>      * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11520) +8 other tests skip
>      * igt@kms_psr2_su@page_flip-nv12:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr2_su@page_flip-p010:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr2_su@page_flip-xrgb8888:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9683)
>      * igt@kms_psr@fbc-psr-primary-mmap-gtt:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#1072 / i915#9732) +12 other
>             tests skip
>      * igt@kms_psr@fbc-psr2-dpms:
> 
>           * shard-mtlp: NOTRUN -> SKIP (i915#9688) +4 other tests skip
>      * igt@kms_psr@fbc-psr2-no-drrs:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#9732) +10 other tests skip
>      * igt@kms_psr@fbc-psr2-suspend:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#1072 / i915#9732) +2 other tests
>             skip
>      * igt@kms_psr@pr-cursor-blt:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#14544 / i915#9732)
>      * igt@kms_psr@pr-sprite-render:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#1072 / i915#9732) +6 other tests
>             skip
>      * igt@kms_psr@psr2-primary-mmap-gtt:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#1072 / i915#9732) +20 other tests
>             skip
>      * igt@kms_psr@psr2-sprite-mmap-gtt:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9732) +10 other tests skip
>      * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9685) +1 other test skip
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9685)
>      * igt@kms_rotation_crc@primary-rotation-270:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#12755) +1 other test skip
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#5289)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
> 
>           * shard-tglu-1: NOTRUN -> SKIP (i915#5289)
>           * shard-mtlp: NOTRUN -> SKIP (i915#12755)
>      * igt@kms_rotation_crc@sprite-rotation-270:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#12755)
>      * igt@kms_selftest@drm_framebuffer:
> 
>           * shard-rkl: NOTRUN -> ABORT (i915#13179) +1 other test abort
>           * shard-tglu-1: NOTRUN -> ABORT (i915#13179) +1 other test abort
>      * igt@kms_vrr@flip-basic-fastset:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#9906)
>           * shard-tglu-1: NOTRUN -> SKIP (i915#9906)
>      * igt@kms_vrr@flip-suspend:
> 
>           * shard-tglu: NOTRUN -> SKIP (i915#3555) +1 other test skip
>      * igt@kms_vrr@lobf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#11920)
>      * igt@kms_writeback@writeback-fb-id:
> 
>           * shard-dg1: NOTRUN -> SKIP (i915#2437)
>      * igt@kms_writeback@writeback-fb-id-xrgb2101010:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2437 / i915#9412)
>      * igt@kms_writeback@writeback-invalid-parameters:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#2437)
>      * igt@perf@gen8-unprivileged-single-ctx-counters:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2436)
>      * igt@perf@global-sseu-config:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#7387)
>      * igt@perf@global-sseu-config-invalid:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#7387)
>      * igt@perf@mi-rpc:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#2434)
>      * igt@perf_pmu@rc6@other-idle-gt0:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#8516)
>      * igt@prime_mmap@test_aperture_limit:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#14121) +1 other test skip
>      * igt@prime_vgem@basic-fence-flip:
> 
>           * shard-rkl: PASS -> SKIP (i915#14544 / i915#3708)
>      * igt@prime_vgem@basic-read:
> 
>           * shard-rkl: NOTRUN -> SKIP (i915#3291 / i915#3708)
>      * igt@prime_vgem@basic-write:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3291 / i915#3708)
>      * igt@prime_vgem@coherency-gtt:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3708 / i915#4077) +1 other test
>             skip
>           * shard-rkl: NOTRUN -> SKIP (i915#3708)
>           * shard-dg1: NOTRUN -> SKIP (i915#3708 / i915#4077)
>           * shard-mtlp: NOTRUN -> SKIP (i915#3708 / i915#4077)
>      * igt@prime_vgem@fence-read-hang:
> 
>           * shard-dg2-9: NOTRUN -> SKIP (i915#3708)
>      * igt@prime_vgem@fence-write-hang:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#3708) +1 other test skip
>      * igt@sriov_basic@bind-unbind-vf:
> 
>           * shard-dg2: NOTRUN -> SKIP (i915#9917) +1 other test skip
>      * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
> 
>           * shard-tglu: NOTRUN -> FAIL (i915#12910) +9 other tests fail
> 
>     Possible fixes
> 
>      * igt@gem_ccs@suspend-resume:
> 
>           * shard-dg2: INCOMPLETE (i915#13356) -> PASS +1 other test pass
>      * igt@gem_ctx_freq@sysfs:
> 
>           * shard-dg2: FAIL (i915#9561) -> PASS +1 other test pass
>      * igt@gem_eio@hibernate:
> 
>           * shard-rkl: ABORT (i915#7975 / i915#8213) -> PASS
>      * igt@gem_eio@in-flight-suspend:
> 
>           * shard-rkl: INCOMPLETE (i915#13390) -> PASS
>      * igt@gem_lmem_swapping@smem-oom@lmem0:
> 
>           * shard-dg1: TIMEOUT (i915#5493) -> PASS +1 other test pass
>      * igt@gem_softpin@noreloc-s3:
> 
>           * shard-rkl: INCOMPLETE (i915#13809) -> PASS
>      * igt@i915_module_load@resize-bar:
> 
>           * shard-dg2: DMESG-WARN (i915#14545) -> PASS
>      * igt@i915_power@sanity:
> 
>           * shard-mtlp: SKIP (i915#7984) -> PASS
>      * igt@i915_suspend@basic-s3-without-i915:
> 
>           * shard-rkl: INCOMPLETE (i915#4817) -> PASS +1 other test pass
>      * igt@kms_async_flips@alternate-sync-async-flip-atomic:
> 
>           * shard-tglu: FAIL (i915#10991 / i915#13320) -> PASS +1 other test
>             pass
>      * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
> 
>           * shard-dg1: DMESG-WARN (i915#4423) -> PASS
>      * igt@kms_color@ctm-0-25:
> 
>           * shard-rkl: SKIP (i915#12655 / i915#14544) -> PASS
>      * igt@kms_cursor_edge_walk@128x128-top-edge:
> 
>           * shard-rkl: SKIP (i915#14544) -> PASS +23 other tests pass
>      * igt@kms_flip@basic-flip-vs-wf_vblank:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3637) -> PASS +1 other test
>             pass
>      * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3555) -> PASS +1 other test
>             pass
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1849 / i915#5354) -> PASS +4
>             other tests pass
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-dg2: FAIL (i915#6880) -> PASS +1 other test pass
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
> 
>           * shard-snb: SKIP -> PASS
>      * igt@kms_hdr@static-toggle:
> 
>           * shard-dg2: SKIP (i915#3555 / i915#8228) -> PASS +1 other test
>             pass
>      * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
> 
>           * shard-rkl: SKIP (i915#11190 / i915#14544) -> PASS
>      * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-hdmi-a-1:
> 
>           * shard-rkl: DMESG-WARN (i915#12964) -> PASS +12 other tests pass
>      * igt@kms_plane_alpha_blend@coverage-7efc:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#7294) -> PASS
>      * igt@kms_plane_scaling@invalid-parameters:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8152) -> PASS
>      * igt@kms_pm_rpm@dpms-non-lpsp:
> 
>           * shard-rkl: SKIP (i915#9519) -> PASS
>      * igt@kms_setmode@basic:
> 
>           * shard-tglu: FAIL (i915#5465) -> PASS +2 other tests pass
>      * igt@kms_vblank@ts-continuation-dpms-rpm:
> 
>           * shard-rkl: DMESG-WARN (i915#12917 / i915#12964) -> PASS
>      * igt@kms_vrr@negative-basic:
> 
>           * shard-dg2: SKIP (i915#3555 / i915#9906) -> PASS
>      * igt@perf_pmu@most-busy-check-all:
> 
>           * shard-rkl: FAIL (i915#4349) -> PASS +1 other test pass
>      * igt@perf_pmu@most-busy-idle-check-all@rcs0:
> 
>           * shard-dg1: FAIL (i915#11943) -> PASS +2 other tests pass
>           * shard-mtlp: FAIL (i915#11943) -> PASS +1 other test pass
>      * igt@perf_pmu@semaphore-busy@bcs0:
> 
>           * shard-mtlp: FAIL (i915#4349) -> PASS +5 other tests pass
>      * igt@perf_pmu@semaphore-busy@vcs1:
> 
>           * shard-dg1: FAIL (i915#4349) -> PASS +3 other tests pass
> 
>     Warnings
> 
>      * igt@gem_ccs@block-copy-compressed:
> 
>           * shard-rkl: SKIP (i915#3555 / i915#9323) -> SKIP (i915#14544 /
>             i915#3555 / i915#9323)
>      * igt@gem_create@create-ext-cpu-access-big:
> 
>           * shard-rkl: SKIP (i915#6335) -> SKIP (i915#14544 / i915#6335)
>      * igt@gem_exec_balancer@parallel-balancer:
> 
>           * shard-rkl: SKIP (i915#4525) -> SKIP (i915#14544 / i915#4525) +2
>             other tests skip
>      * igt@gem_exec_capture@capture-recoverable:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6344) -> SKIP (i915#6344)
>      * igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
> 
>           * shard-rkl: SKIP (i915#3281) -> SKIP (i915#14544 / i915#3281) +5
>             other tests skip
>      * igt@gem_exec_reloc@basic-write-read:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3281) -> SKIP (i915#3281) +3
>             other tests skip
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2190) -> SKIP (i915#2190)
>      * igt@gem_lmem_swapping@parallel-multi:
> 
>           * shard-rkl: SKIP (i915#4613) -> SKIP (i915#14544 / i915#4613) +2
>             other tests skip
>      * igt@gem_lmem_swapping@verify:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#4613) -> SKIP (i915#4613) +1
>             other test skip
>      * igt@gem_partial_pwrite_pread@reads-uncached:
> 
>           * shard-rkl: SKIP (i915#3282) -> SKIP (i915#14544 / i915#3282) +1
>             other test skip
>      * igt@gem_pread@bench:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#3282) -> SKIP (i915#3282) +3
>             other tests skip
>      * igt@gem_pxp@create-regular-buffer:
> 
>           * shard-rkl: TIMEOUT (i915#12917 / i915#12964) -> SKIP (i915#14544
>             / i915#4270)
>      * igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
> 
>           * shard-rkl: SKIP (i915#4270) -> TIMEOUT (i915#12964)
>      * igt@gem_pxp@hw-rejects-pxp-buffer:
> 
>           * shard-rkl: TIMEOUT (i915#12917 / i915#12964) -> SKIP (i915#13717)
>             +1 other test skip
>      * igt@gem_set_tiling_vs_blt@tiled-to-untiled:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#8411) -> SKIP (i915#8411) +1
>             other test skip
>      * igt@gem_set_tiling_vs_blt@untiled-to-tiled:
> 
>           * shard-rkl: SKIP (i915#8411) -> SKIP (i915#14544 / i915#8411)
>      * igt@gem_userptr_blits@dmabuf-sync:
> 
>           * shard-rkl: SKIP (i915#3297 / i915#3323) -> SKIP (i915#14544 /
>             i915#3297 / i915#3323)
>      * igt@gem_userptr_blits@unsync-unmap-after-close:
> 
>           * shard-rkl: SKIP (i915#3297) -> SKIP (i915#14544 / i915#3297) +1
>             other test skip
>      * igt@gen7_exec_parse@chained-batch:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP +6 other tests skip
>      * igt@gen9_exec_parse@batch-invalid-length:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#2527) -> SKIP (i915#2527) +1
>             other test skip
>      * igt@gen9_exec_parse@batch-without-end:
> 
>           * shard-rkl: SKIP (i915#2527) -> SKIP (i915#14544 / i915#2527) +2
>             other tests skip
>      * igt@i915_pm_freq_mult@media-freq@gt0:
> 
>           * shard-rkl: SKIP (i915#6590) -> SKIP (i915#14544 / i915#6590) +1
>             other test skip
>      * igt@i915_power@sanity:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#7984) -> SKIP (i915#7984)
>      * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
> 
>           * shard-rkl: SKIP (i915#12454 / i915#12712) -> SKIP (i915#12454 /
>             i915#12712 / i915#14544)
>      * igt@kms_big_fb@4-tiled-8bpp-rotate-0:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#5286) +2 other tests
>             skip
>      * igt@kms_big_fb@4-tiled-addfb:
> 
>           * shard-rkl: SKIP (i915#5286) -> SKIP (i915#14544) +4 other tests
>             skip
>      * igt@kms_big_fb@linear-8bpp-rotate-270:
> 
>           * shard-dg1: SKIP (i915#3638 / i915#4423) -> SKIP (i915#3638)
>      * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
> 
>           * shard-rkl: SKIP (i915#3638) -> SKIP (i915#14544) +4 other tests
>             skip
>      * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#3638) +1 other test
>             skip
>      * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
> 
>           * shard-rkl: SKIP -> SKIP (i915#14544) +15 other tests skip
>      * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#14544) +11
>             other tests skip
>      * igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#14098 / i915#6095) -> SKIP (i915#6095) +2
>             other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-mc-ccs:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#14098 / i915#6095) +3
>             other tests skip
>      * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-2:
> 
>           * shard-rkl: SKIP (i915#6095) -> SKIP (i915#14098 / i915#6095) +2
>             other tests skip
>      * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#12313)
>      * igt@kms_cdclk@mode-transition:
> 
>           * shard-rkl: SKIP (i915#3742) -> SKIP (i915#14544 / i915#3742) +1
>             other test skip
>      * igt@kms_chamelium_edid@hdmi-edid-read:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#14544 / i915#7828) -> SKIP
>             (i915#11151 / i915#7828) +4 other tests skip
>      * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
> 
>           * shard-dg1: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 /
>             i915#4423 / i915#7828) +1 other test skip
>      * igt@kms_chamelium_hpd@dp-hpd:
> 
>           * shard-rkl: SKIP (i915#11151 / i915#7828) -> SKIP (i915#11151 /
>             i915#14544 / i915#7828) +4 other tests skip
>      * igt@kms_content_protection@mei-interface:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#9424)
>      * igt@kms_content_protection@srm:
> 
>           * shard-dg2: SKIP (i915#7118) -> FAIL (i915#7173)
>      * igt@kms_content_protection@uevent:
> 
>           * shard-dg2: FAIL (i915#1339 / i915#7173) -> SKIP (i915#7118 /
>             i915#9424)
>      * igt@kms_cursor_crc@cursor-offscreen-32x10:
> 
>           * shard-dg1: SKIP (i915#3555 / i915#4423) -> SKIP (i915#3555)
>      * igt@kms_cursor_crc@cursor-offscreen-512x170:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#13049)
>      * igt@kms_cursor_crc@cursor-random-512x170:
> 
>           * shard-rkl: SKIP (i915#13049) -> SKIP (i915#14544) +3 other tests
>             skip
>      * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
> 
>           * shard-rkl: SKIP (i915#3555) -> SKIP (i915#14544) +2 other tests
>             skip
>      * igt@kms_cursor_crc@cursor-sliding-256x85:
> 
>           * shard-rkl: DMESG-FAIL (i915#12964) -> FAIL (i915#13566)
>      * igt@kms_cursor_crc@cursor-suspend:
> 
>           * shard-rkl: SKIP (i915#14544) -> INCOMPLETE (i915#12358 /
>             i915#14152)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
> 
>           * shard-rkl: SKIP (i915#11190 / i915#14544) -> SKIP (i915#4103)
>      * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
> 
>           * shard-rkl: FAIL (i915#2346) -> SKIP (i915#14544)
>      * igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
> 
>           * shard-rkl: SKIP (i915#9067) -> SKIP (i915#14544)
>      * igt@kms_dp_linktrain_fallback@dsc-fallback:
> 
>           * shard-rkl: SKIP (i915#13707) -> SKIP (i915#14544)
>      * igt@kms_fbcon_fbt@psr:
> 
>           * shard-rkl: SKIP (i915#3955) -> SKIP (i915#14544 / i915#3955)
>      * igt@kms_feature_discovery@display-2x:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1839) -> SKIP (i915#1839)
>      * igt@kms_feature_discovery@display-4x:
> 
>           * shard-rkl: SKIP (i915#1839) -> SKIP (i915#14544 / i915#1839)
>      * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
> 
>           * shard-rkl: SKIP (i915#9934) -> SKIP (i915#14544 / i915#9934) +6
>             other tests skip
>      * igt@kms_flip@2x-flip-vs-dpms:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9934) -> SKIP (i915#9934) +2
>             other tests skip
>      * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
> 
>           * shard-rkl: SKIP (i915#2672 / i915#3555) -> SKIP (i915#14544 /
>             i915#3555) +5 other tests skip
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
> 
>           * shard-rkl: DMESG-WARN (i915#12964) -> SKIP (i915#14544 /
>             i915#1849 / i915#5354)
>      * igt@kms_frontbuffer_tracking@fbc-2p-indfb-fliptrack-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1849 / i915#5354) -> SKIP
>      * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
> 
>           * shard-dg1: SKIP (i915#4423) -> SKIP
>      * igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack-mmap-gtt:
> 
>           * shard-rkl: SKIP -> SKIP (i915#14544 / i915#1849 / i915#5354)
>      * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-mmap-cpu:
> 
>           * shard-dg2: SKIP (i915#3458) -> SKIP (i915#10433 / i915#3458) +3
>             other tests skip
>      * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
> 
>           * shard-dg1: SKIP (i915#3458 / i915#4423) -> SKIP (i915#3458)
>      * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1849 / i915#5354) -> SKIP
>             (i915#3023) +10 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#3023) -> SKIP (i915#14544 / i915#1849 /
>             i915#5354) +16 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
> 
>           * shard-rkl: SKIP (i915#1825) -> SKIP (i915#14544 / i915#1849 /
>             i915#5354) +31 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
> 
>           * shard-dg1: SKIP (i915#8708) -> SKIP (i915#4423 / i915#8708)
>      * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#1849 / i915#5354) -> SKIP
>             (i915#1825) +14 other tests skip
>      * igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
> 
>           * shard-dg2: SKIP (i915#10433 / i915#3458) -> SKIP (i915#3458)
>      * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
> 
>           * shard-dg1: SKIP (i915#3458) -> SKIP (i915#3458 / i915#4423)
>      * igt@kms_hdr@brightness-with-hdr:
> 
>           * shard-dg2: SKIP (i915#13331) -> SKIP (i915#12713)
>      * igt@kms_hdr@invalid-hdr:
> 
>           * shard-rkl: SKIP (i915#3555 / i915#8228) -> SKIP (i915#14544)
>      * igt@kms_joiner@basic-ultra-joiner:
> 
>           * shard-rkl: SKIP (i915#12339 / i915#14544) -> SKIP (i915#12339)
>      * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
> 
>           * shard-rkl: SKIP (i915#13522) -> SKIP (i915#13522 / i915#14544)
>      * igt@kms_plane_multiple@2x-tiling-y:
> 
>           * shard-rkl: SKIP (i915#13958) -> SKIP (i915#14544) +2 other tests
>             skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-a:
> 
>           * shard-rkl: SKIP (i915#12247) -> SKIP (i915#12247 / i915#14544) +1
>             other test skip
>      * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
> 
>           * shard-rkl: SKIP (i915#12247) -> SKIP (i915#12247 / i915#14544 /
>             i915#8152) +3 other tests skip
>      * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:
> 
>           * shard-rkl: SKIP (i915#12247 / i915#14544) -> SKIP (i915#12247)
>      * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:
> 
>           * shard-rkl: SKIP (i915#12247 / i915#14544 / i915#8152) -> SKIP
>             (i915#12247) +1 other test skip
>      * igt@kms_pm_backlight@bad-brightness:
> 
>           * shard-rkl: SKIP (i915#5354) -> SKIP (i915#14544 / i915#5354)
>      * igt@kms_pm_dc@dc6-psr:
> 
>           * shard-rkl: SKIP (i915#9685) -> SKIP (i915#14544 / i915#9685)
>      * igt@kms_pm_rpm@modeset-lpsp:
> 
>           * shard-dg1: SKIP (i915#9519) -> SKIP (i915#4423 / i915#9519)
>      * igt@kms_pm_rpm@modeset-non-lpsp:
> 
>           * shard-rkl: DMESG-WARN (i915#12964) -> SKIP (i915#14544 /
>             i915#9519)
>      * igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#9519) -> SKIP (i915#9519) +1
>             other test skip
>      * igt@kms_prime@basic-modeset-hybrid:
> 
>           * shard-rkl: SKIP (i915#14544 / i915#6524) -> SKIP (i915#6524)
>      * igt@kms_prime@d3hot:
> 
>           * shard-rkl: SKIP (i915#6524) -> SKIP (i915#14544 / i915#6524)
>      * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
> 
>           * shard-rkl: SKIP (i915#11520) -> SKIP (i915#11520 / i915#14544) +5
>             other tests skip
>      * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
> 
>           * shard-rkl: SKIP (i915#11520 / i915#14544) -> SKIP (i915#11520) +1
>             other test skip
>      * igt@kms_psr@fbc-psr-primary-mmap-gtt:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#14544 / i915#9732) -> SKIP
>             (i915#1072 / i915#9732) +8 other tests skip
>      * igt@kms_psr@fbc-psr2-sprite-render:
> 
>           * shard-rkl: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#14544 / i915#9732) +15 other tests skip
>      * igt@kms_psr@psr2-sprite-blt:
> 
>           * shard-dg1: SKIP (i915#1072 / i915#9732) -> SKIP (i915#1072 /
>             i915#4423 / i915#9732)
>      * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>           * shard-rkl: SKIP (i915#5289) -> SKIP (i915#14544)
>      * igt@kms_setmode@invalid-clone-single-crtc-stealing:
> 
>           * shard-rkl: SKIP (i915#3555) -> SKIP (i915#14544 / i915#3555)
>      * igt@kms_vrr@flip-dpms:
> 
>           * shard-rkl: SKIP (i915#14544) -> SKIP (i915#3555)
>      * igt@kms_vrr@max-min:
> 
>           * shard-rkl: SKIP (i915#9906) -> SKIP (i915#14544)
>      * igt@kms_writeback@writeback-check-output:
> 
>           * shard-rkl: SKIP (i915#2437) -> SKIP (i915#14544 / i915#2437)
>      * igt@kms_writeback@writeback-pixel-formats:
> 
>           * shard-rkl: SKIP (i915#2437 / i915#9412) -> SKIP (i915#14544 /
>             i915#2437 / i915#9412)
>      * igt@runner@aborted:
> 
>           * shard-mtlp: (FAIL, FAIL) (i915#14483 / i915#14489) -> (FAIL,
>             FAIL) (i915#14489)
>      * igt@sriov_basic@enable-vfs-autoprobe-on:
> 
>           * shard-rkl: SKIP (i915#9917) -> SKIP (i915#14544 / i915#9917) +1
>             other test skip
>      * igt@testdisplay:
> 
>           * shard-rkl: DMESG-WARN (i915#12964) -> SKIP (i915#14544) +3 other
>             tests skip
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_8439 -> IGTPW_13405
> 
>    CI-20190529: 20190529
>    CI_DRM_16801: bf8cb3609bc5e03d788964e62c5d1f2c3e141e80 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_13405: 13405
>    IGT_8439: 8439
