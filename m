Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052FB6E193
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2020 05:30:39 +0000 (UTC)
Date: Mon, 26 Oct 2020 06:30:32 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20201026053032.GA4084@zkempczy-mobl2>
References: <20201023124212.26428-1-zbigniew.kempczynski@intel.com>
 <160346698976.1405.12940175541646881403@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160346698976.1405.12940175541646881403@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 03:29:49PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Introduce IGT allocator (rev3)                                 
>    URL:     https://patchwork.freedesktop.org/series/82954/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5092/index.html 
> 
>            CI Bug Log - changes from IGT_5823_full -> IGTPW_5092_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_5092_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_5092_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5092/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_5092_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_ctx_isolation@preservation-s3@vcs0:
> 
>           * shard-glk: PASS -> INCOMPLETE
>      * igt@gem_exec_reloc@basic-write-cpu-noreloc:

I didn't touch this test. I rerun the series to check is this
was incidental, but:

Starting subtest: basic-write-cpu-noreloc
(gem_exec_reloc:1496) CRITICAL: Test assertion failure function basic_reloc, file ../tests/i915/gem_exec_reloc.c:639:
(gem_exec_reloc:1496) CRITICAL: Failed assertion: reloc.presumed_offset == offset
(gem_exec_reloc:1496) CRITICAL: error: 0x7fff0000 != 0
Subtest basic-write-cpu-noreloc failed.

looks it should be likely reproducible on that gen all the time.

--
Zbigniew

> 
>           * shard-snb: PASS -> FAIL +1 similar issue
>      * igt@gem_userptr_blits@coherency-unsync:
> 
>           * shard-hsw: PASS -> INCOMPLETE
> 
>     Suppressed
> 
>    The following results come from untrusted machines, tests, or statuses.
>    They do not affect the overall result.
> 
>      * {igt@core_hotunplug@hotrebind}:
>           * shard-hsw: NOTRUN -> WARN
> 
> New tests
> 
>    New tests have been introduced between IGT_5823_full and IGTPW_5092_full:
> 
>   New IGT tests (32)
> 
>      * igt@api_intel_allocator@alloc-simple:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@fork-simple-once:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.01, 0.04] s
>      * igt@api_intel_allocator@fork-simple-stress:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [5.40, 5.60] s
>      * igt@api_intel_allocator@fork-simple-stress-signal:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [5.41, 5.50] s
>      * igt@api_intel_allocator@print:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@purge-bb:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.0, 0.00] s
>      * igt@api_intel_allocator@random-allocator:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@random-allocator@basic:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.0, 0.00] s
>      * igt@api_intel_allocator@random-allocator@parallel-one:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_allocator@reopen:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_allocator@reopen-fork:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [3.23, 3.26] s
>      * igt@api_intel_allocator@reserve:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@reserve-simple:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@reuse:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@simple-allocator:
> 
>           * Statuses :
>           * Exec time: [None] s
>      * igt@api_intel_allocator@simple-allocator@basic:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00] s
>      * igt@api_intel_allocator@simple-allocator@parallel-one:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.10, 0.21] s
>      * igt@api_intel_allocator@simple-allocator@reserve:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@simple-allocator@reuse:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@two-level-inception:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [5.40, 5.61] s
>      * igt@api_intel_allocator@two-level-inception-interruptible:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [5.41, 5.60] s
>      * igt@api_intel_bb@add-remove-objects:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_bb@blit-noreloc-keep-cache-random:
> 
>           * Statuses : 5 pass(s) 2 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_bb@blit-noreloc-purge-cache-random:
> 
>           * Statuses : 5 pass(s) 2 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_bb@destroy-bb:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.01, 0.02] s
>      * igt@api_intel_bb@object-noreloc-keep-cache-random:
> 
>           * Statuses : 5 pass(s) 2 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_bb@object-noreloc-keep-cache-simple:
> 
>           * Statuses : 5 pass(s) 2 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_bb@object-noreloc-purge-cache-random:
> 
>           * Statuses : 5 pass(s) 2 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_bb@object-noreloc-purge-cache-simple:
> 
>           * Statuses : 5 pass(s) 2 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_bb@object-reloc-keep-cache:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_bb@object-reloc-purge-cache:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_bb@reset-bb:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.0, 0.00] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_5092_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@blit-noreloc-keep-cache:
> 
>           * shard-hsw: PASS -> SKIP (fdo#109271) +3 similar issues
> 
>           * shard-snb: PASS -> SKIP (fdo#109271) +1 similar issue
> 
>      * igt@core_hotunplug@hotrebind-lateclose:
> 
>           * shard-iclb: PASS -> DMESG-WARN (i915#1982)
>      * igt@kms_cursor_edge_walk@pipe-c-64x64-left-edge:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#1635 / i915#1982) +1 similar
>             issue
>      * igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
> 
>           * shard-hsw: PASS -> FAIL (i915#2370)
>      * igt@kms_frontbuffer_tracking@fbc-farfromfence:
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#1982) +2 similar issues
>      * igt@kms_frontbuffer_tracking@fbcpsr-badstride:
> 
>           * shard-tglb: PASS -> DMESG-WARN (i915#1982) +2 similar issues
>      * igt@kms_psr@psr2_cursor_render:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +1 similar issue
>      * igt@perf@oa-formats:
> 
>           * shard-iclb: PASS -> SKIP (i915#1354) +1 similar issue
> 
>           * shard-glk: PASS -> SKIP (fdo#109271 / i915#1354) +1 similar issue
> 
>           * shard-apl: PASS -> SKIP (fdo#109271 / i915#1354 / i915#1635) +1
>             similar issue
> 
>           * shard-kbl: PASS -> SKIP (fdo#109271 / i915#1354) +1 similar issue
> 
>           * shard-tglb: PASS -> SKIP (i915#1354)
> 
>     Possible fixes
> 
>      * igt@gem_exec_create@madvise:
> 
>           * shard-glk: DMESG-WARN (i915#118 / i915#95) -> PASS +1 similar
>             issue
>      * igt@gem_exec_fence@long-history:
> 
>           * shard-kbl: INCOMPLETE (CI#80) -> PASS
>      * igt@gem_exec_reloc@basic-many-active@rcs0:
> 
>           * shard-apl: FAIL (i915#1635 / i915#2389) -> PASS
>      * igt@i915_pm_dc@dc6-psr:
> 
>           * shard-iclb: FAIL (i915#454) -> PASS
>      * {igt@kms_async_flips@async-flip-with-page-flip-events}:
> 
>           * shard-kbl: FAIL (i915#2521) -> PASS
>      * igt@kms_cursor_edge_walk@pipe-c-64x64-right-edge:
> 
>           * shard-glk: DMESG-WARN (i915#1982) -> PASS +1 similar issue
>      * igt@kms_draw_crc@draw-method-rgb565-render-xtiled:
> 
>           * shard-apl: DMESG-WARN (i915#1635 / i915#1982) -> PASS
>      * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
> 
>           * shard-hsw: INCOMPLETE (i915#2055) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-cpu:
> 
>           * shard-glk: FAIL (i915#49) -> PASS
>      * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
> 
>           * shard-tglb: DMESG-WARN (i915#1982) -> PASS +4 similar issues
>      * igt@kms_psr@psr2_sprite_plane_onoff:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS
> 
>     Warnings
> 
>      * igt@kms_content_protection@atomic-dpms:
> 
>           * shard-apl: TIMEOUT (i915#1319 / i915#1635) -> FAIL (fdo#110321 /
>             fdo#110336 / i915#1635) +1 similar issue
>      * igt@kms_content_protection@lic:
> 
>           * shard-apl: FAIL (fdo#110321 / i915#1635) -> TIMEOUT (i915#1319 /
>             i915#1635)
>      * igt@perf@mi-rpc:
> 
>           * shard-tglb: SKIP (fdo#109289) -> SKIP (i915#1354)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Participating hosts (8 -> 8)
> 
>    No changes in participating hosts
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_5823 -> IGTPW_5092
> 
>    CI-20190529: 20190529
>    CI_DRM_9190: a3d535579dd93942862b867b4452ba11e4f6bbb1 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_5092: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5092/index.html
>    IGT_5823: 7dd2fe99bd9dde00456cc5abf7e5ef0c8d7d6118 @
>    git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
