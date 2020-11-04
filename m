Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACE96E947
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2020 06:13:19 +0000 (UTC)
Date: Wed, 4 Nov 2020 07:13:14 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20201104061314.GA4154@zkempczy-mobl2>
References: <20201103104712.29233-1-zbigniew.kempczynski@intel.com>
 <160443189693.25740.3372073036395770491@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160443189693.25740.3372073036395770491@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev8=29?=
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

On Tue, Nov 03, 2020 at 07:31:36PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Introduce IGT allocator (rev8)                                 
>    URL:     https://patchwork.freedesktop.org/series/82954/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/index.html 
> 
>          CI Bug Log - changes from CI_DRM_9252_full -> IGTPW_5123_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_5123_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_5123_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_5123_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_exec_suspend@basic-s3:
> 
>           * shard-glk: PASS -> INCOMPLETE

Series is not related to above.


>      * igt@gem_exec_whisper@basic-forked:
> 
>           * shard-iclb: PASS -> INCOMPLETE

Same.

> 
>     Warnings
> 
>      * igt@core_hotunplug@hotrebind-lateclose:
>           * shard-hsw: WARN (i915#2283) -> FAIL

Same.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_9252_full and
>    IGTPW_5123_full:
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
>           * Statuses : 6 pass(s)
>           * Exec time: [5.40, 5.50] s
>      * igt@api_intel_allocator@fork-simple-stress-signal:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [5.41, 5.55] s
>      * igt@api_intel_allocator@print:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.0] s
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
>           * Exec time: [3.23, 3.28] s
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
>           * Statuses : 6 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_allocator@simple-allocator@parallel-one:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.10, 0.21] s
>      * igt@api_intel_allocator@simple-allocator@reserve:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@simple-allocator@reuse:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [0.0] s
>      * igt@api_intel_allocator@two-level-inception:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [5.41, 5.68] s
>      * igt@api_intel_allocator@two-level-inception-interruptible:
> 
>           * Statuses : 6 pass(s)
>           * Exec time: [5.41, 5.66] s
>      * igt@api_intel_bb@add-remove-objects:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.02] s
>      * igt@api_intel_bb@blit-noreloc-keep-cache-random:
> 
>           * Statuses : 5 pass(s) 2 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_bb@blit-noreloc-purge-cache-random:
> 
>           * Statuses : 5 pass(s) 1 skip(s)
>           * Exec time: [0.0, 0.01] s
>      * igt@api_intel_bb@destroy-bb:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.01, 0.03] s
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
>      * igt@api_intel_bb@purge-bb:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.01] s
>      * igt@api_intel_bb@reset-bb:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [0.00, 0.01] s
> 
> Known issues
> 
>    Here are the changes found in IGTPW_5123_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@blit-noreloc-keep-cache:
> 
>           * shard-hsw: PASS -> SKIP (fdo#109271) +1 similar issue
>      * igt@gem_exec_suspend@basic-s3:
> 
>           * shard-iclb: PASS -> INCOMPLETE (i915#1185)
> 
>           * shard-hsw: PASS -> INCOMPLETE (i915#1888)
> 
>           * shard-kbl: PASS -> INCOMPLETE (i915#155)
> 
>           * shard-apl: PASS -> INCOMPLETE (i915#1635)
> 
>      * igt@gem_exec_whisper@basic-queues-priority-all:
> 
>           * shard-glk: PASS -> DMESG-WARN (i915#118 / i915#95)
>      * igt@gem_partial_pwrite_pread@writes-after-reads-uncached:
> 
>           * shard-hsw: PASS -> FAIL (i915#1888)
> 
>           * shard-snb: PASS -> INCOMPLETE (i915#82) +1 similar issue
> 
>      * igt@i915_pm_rc6_residency@rc6-idle:
> 
>           * shard-hsw: PASS -> WARN (i915#1519)
>      * igt@i915_suspend@fence-restore-tiled2untiled:
> 
>           * shard-snb: PASS -> DMESG-WARN (i915#42)
>      * igt@kms_cursor_edge_walk@pipe-b-64x64-bottom-edge:
> 
>           * shard-snb: PASS -> SKIP (fdo#109271) +4 similar issues
>      * igt@kms_cursor_edge_walk@pipe-c-256x256-bottom-edge:
> 
>           * shard-apl: PASS -> DMESG-WARN (i915#1635 / i915#1982) +4 similar
>             issues
>      * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
> 
>           * shard-glk: PASS -> DMESG-WARN (i915#1982) +7 similar issues
>      * igt@kms_cursor_legacy@flip-vs-cursor-crc-legacy:
> 
>           * shard-tglb: PASS -> FAIL (i915#2346)
>      * igt@kms_flip@2x-flip-vs-fences@ab-vga1-hdmi-a1:
> 
>           * shard-hsw: PASS -> DMESG-WARN (i915#1982)
>      * igt@kms_flip@2x-plain-flip-ts-check@bc-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL (i915#2122)
>      * igt@kms_flip@blocking-wf_vblank@a-edp1:
> 
>           * shard-tglb: PASS -> DMESG-WARN (i915#1982)
>      * igt@kms_flip@flip-vs-absolute-wf_vblank@a-dp1:
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#1982) +2 similar issues
>      * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
> 
>           * shard-iclb: PASS -> FAIL (i915#79)
>      * igt@kms_flip@flip-vs-suspend@c-dp1:
> 
>           * shard-kbl: PASS -> DMESG-WARN (i915#180) +1 similar issue
>      * igt@kms_psr@psr2_cursor_mmap_cpu:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +1 similar issue
>      * igt@kms_setmode@basic:
> 
>           * shard-hsw: PASS -> FAIL (i915#31)
> 
>     Possible fixes
> 
>      * igt@gem_exec_create@forked:
> 
>           * shard-glk: DMESG-WARN (i915#118 / i915#95) -> PASS
>      * igt@i915_pm_rpm@pm-tiling:
> 
>           * shard-hsw: SKIP (fdo#109271) -> PASS +2 similar issues
> 
>           * shard-kbl: SKIP (fdo#109271) -> PASS +1 similar issue
> 
>           * shard-apl: SKIP (fdo#109271 / i915#1635) -> PASS +1 similar issue
> 
>           * shard-glk: SKIP (fdo#109271) -> PASS +1 similar issue
> 
>           * shard-iclb: SKIP (i915#579) -> PASS
> 
>      * {igt@kms_async_flips@alternate-sync-async-flip}:
> 
>           * shard-kbl: FAIL (i915#2521) -> PASS
> 
>           * shard-tglb: FAIL (i915#2521) -> PASS
> 
>      * igt@kms_draw_crc@draw-method-xrgb2101010-mmap-gtt-untiled:
> 
>           * shard-apl: DMESG-WARN (i915#1635 / i915#1982) -> PASS +2 similar
>             issues
>      * igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
> 
>           * shard-glk: DMESG-WARN (i915#1982) -> PASS +5 similar issues
>      * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
> 
>           * shard-hsw: INCOMPLETE (i915#2055) -> PASS
>      * igt@kms_flip_tiling@flip-to-yf-tiled:
> 
>           * shard-kbl: DMESG-WARN (i915#1982) -> PASS +2 similar issues
>      * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
> 
>           * shard-iclb: DMESG-WARN (i915#1982) -> PASS
>      * igt@kms_psr@psr2_sprite_mmap_gtt:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS +2 similar issues
>      * igt@kms_psr@suspend:
> 
>           * shard-iclb: INCOMPLETE (i915#1185) -> PASS
>      * igt@kms_vblank@pipe-d-accuracy-idle:
> 
>           * shard-tglb: DMESG-WARN (i915#1982) -> PASS +1 similar issue
>      * igt@perf@non-system-wide-paranoid:
> 
>           * shard-apl: SKIP (fdo#109271 / i915#1354 / i915#1635) -> PASS
> 
>           * shard-glk: SKIP (fdo#109271 / i915#1354) -> PASS
> 
>           * shard-iclb: SKIP (i915#1354) -> PASS
> 
>           * shard-kbl: SKIP (fdo#109271 / i915#1354) -> PASS
> 
>           * shard-tglb: SKIP (i915#1354) -> PASS
> 
>      * igt@perf@polling-parameterized:
> 
>           * shard-iclb: FAIL (i915#1542) -> PASS
> 
>           * shard-hsw: FAIL (i915#1542) -> PASS
> 
>     Warnings
> 
>      * igt@gem_exec_suspend@basic-s3:
> 
>           * shard-tglb: DMESG-WARN (i915#2411) -> DMESG-WARN (i915#1436)
>      * igt@i915_pm_backlight@fade_with_suspend:
> 
>           * shard-tglb: INCOMPLETE (i915#1436 / i915#456) -> DMESG-WARN
>             (i915#2411)
>      * igt@i915_pm_rpm@dpms-mode-unset-non-lpsp:
> 
>           * shard-iclb: SKIP (i915#579) -> SKIP (fdo#110892)
>      * igt@i915_pm_rpm@pm-tiling:
> 
>           * shard-tglb: SKIP (i915#579) -> DMESG-WARN (i915#2411)
>      * igt@kms_flip@flip-vs-suspend@a-edp1:
> 
>           * shard-tglb: DMESG-WARN (i915#2411) -> INCOMPLETE (i915#1436 /
>             i915#456)
>      * igt@runner@aborted:
> 
>           * shard-iclb: FAIL (i915#1814 / i915#483) -> (FAIL, FAIL)
>             (i915#2439 / i915#483)
> 
>           * shard-glk: FAIL (i915#1611 / i915#1814 / k.org#202321) -> FAIL
>             (i915#2439 / k.org#202321)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Participating hosts (11 -> 8)
> 
>    Missing (3): pig-skl-6260u pig-glk-j5005 pig-icl-1065g7
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_5830 -> IGTPW_5123
>      * Piglit: piglit_4509 -> None
> 
>    CI-20190529: 20190529
>    CI_DRM_9252: bb8053708f1889f738f4247e84ef5e051e1e178d @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_5123: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5123/index.html
>    IGT_5830: 12d370cb57e0cfcb781c87ad9e15e68b17a1f41f @
>    git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
>    piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
>    git://anongit.freedesktop.org/piglit
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
