Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59FC6E87D
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2020 08:09:13 +0000 (UTC)
Date: Mon, 26 Oct 2020 09:09:07 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20201026080907.GD4084@zkempczy-mobl2>
References: <20201023124212.26428-1-zbigniew.kempczynski@intel.com>
 <160369469134.3259.3351511935030195635@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160369469134.3259.3351511935030195635@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgSW50cm9k?=
 =?utf-8?q?uce_IGT_allocator_=28rev4=29?=
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

On Mon, Oct 26, 2020 at 06:44:51AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Introduce IGT allocator (rev4)                                 
>    URL:     https://patchwork.freedesktop.org/series/82954/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5096/index.html 
> 
>          CI Bug Log - changes from CI_DRM_9193_full -> IGTPW_5096_full
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_5096_full absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_5096_full, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5096/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in
>    IGTPW_5096_full:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_exec_parallel@fds@vecs0:
> 
>           * shard-iclb: PASS -> INCOMPLETE

I didn't touch the test. 

>      * igt@gem_pipe_control_store_loop@fresh-buffer:
> 
>           * shard-snb: PASS -> FAIL

I didn't touch the test. 

>      * igt@kms_cursor_legacy@all-pipes-forked-bo:

It seems there's some limits constraints exceeded:

Starting subtest: all-pipes-forked-bo
runner: This test was killed due to exceeding disk usage limit. (Used 10492255 bytes, limit 10485760)

> 
>           * shard-tglb: PASS -> INCOMPLETE
>      * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
> 
>           * shard-tglb: PASS -> FAIL

(kms_flip:1498) CRITICAL: Test assertion failure function run_test_step, file ../tests/kms_flip.c:721:
(kms_flip:1498) CRITICAL: Failed assertion: timercmp(&reply.ts, &o->flip_state.last_ts, ==)
(kms_flip:1498) CRITICAL: Last errno: 4, Interrupted system call
Dynamic subtest A-eDP1 failed.

Also series is not involved in above error.

--
Zbigniew

> 
> New tests
> 
>    New tests have been introduced between CI_DRM_9193_full and
>    IGTPW_5096_full:
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
>           * Exec time: [5.40, 5.50] s
>      * igt@api_intel_allocator@fork-simple-stress-signal:
> 
>           * Statuses : 7 pass(s)
>           * Exec time: [5.41, 5.54] s
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
>           * Exec time: [3.23, 3.27] s
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
>           * Exec time: [0.0, 0.00] s
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
>           * Exec time: [0.10, 0.22] s
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
>           * Exec time: [5.41, 5.62] s
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
>    Here are the changes found in IGTPW_5096_full that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@api_intel_bb@blit-noreloc-keep-cache:
> 
>           * shard-hsw: PASS -> SKIP (fdo#109271) +2 similar issues
> 
>           * shard-snb: PASS -> SKIP (fdo#109271) +1 similar issue
> 
>      * igt@core_hotunplug@unbind-rebind:
> 
>           * shard-iclb: PASS -> DMESG-WARN ([i915#1982])
>      * igt@gem_exec_whisper@basic-fds-all:
> 
>           * shard-glk: PASS -> DMESG-WARN (i915#118 / [i915#95]) +2 similar
>             issues
>      * igt@i915_suspend@forcewake:
> 
>           * shard-kbl: PASS -> INCOMPLETE ([i915#155] / [i915#636])
>      * igt@kms_big_fb@linear-8bpp-rotate-180:
> 
>           * shard-kbl: PASS -> DMESG-WARN ([i915#1982]) +2 similar issues
>      * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
> 
>           * shard-apl: PASS -> DMESG-WARN ([i915#1635] / [i915#1982])
>      * igt@kms_cursor_crc@pipe-a-cursor-alpha-opaque:
> 
>           * shard-kbl: PASS -> FAIL ([i915#54])
> 
>           * shard-apl: PASS -> FAIL ([i915#1635] / [i915#54])
> 
>           * shard-glk: PASS -> FAIL ([i915#54])
> 
>      * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
> 
>           * shard-tglb: PASS -> DMESG-WARN ([i915#1982]) +3 similar issues
>      * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a1-hdmi-a2:
> 
>           * shard-glk: PASS -> FAIL ([i915#79])
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>           * shard-kbl: PASS -> FAIL ([i915#49])
> 
>           * shard-apl: PASS -> FAIL ([i915#1635] / [i915#49])
> 
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-onoff:
> 
>           * shard-snb: PASS -> FAIL ([i915#2546])
>      * igt@kms_prime@basic-crc@first-to-second:
> 
>           * shard-iclb: PASS -> SKIP ([i915#1836])
> 
>           * shard-kbl: PASS -> SKIP (fdo#109271) +1 similar issue
> 
>           * shard-tglb: PASS -> SKIP ([i915#1836])
> 
>      * igt@kms_psr@psr2_cursor_plane_move:
> 
>           * shard-iclb: PASS -> SKIP (fdo#109441) +3 similar issues
>      * igt@perf@invalid-open-flags:
> 
>           * shard-tglb: PASS -> SKIP ([i915#405])
> 
>           * shard-apl: PASS -> SKIP (fdo#109271 / [i915#1635]) +1 similar
>             issue
> 
>           * shard-iclb: PASS -> SKIP ([i915#405])
> 
>           * shard-glk: PASS -> SKIP (fdo#109271) +1 similar issue
> 
>     Possible fixes
> 
>      * igt@gem_ctx_shared@q-smoketest-all:
> 
>           * shard-glk: FAIL ([i915#1888]) -> PASS
>      * {igt@gem_exec_capture@pi@vecs0}:
> 
>           * shard-iclb: INCOMPLETE -> PASS
>      * igt@gem_exec_reloc@basic-many-active@vecs0:
> 
>           * shard-glk: FAIL ([i915#2389]) -> PASS +2 similar issues
>      * igt@gem_exec_whisper@basic-contexts-forked:
> 
>           * shard-snb: INCOMPLETE ([i915#82]) -> PASS
> 
>           * shard-hsw: FAIL ([i915#1888]) -> PASS +1 similar issue
> 
>      * igt@gem_exec_whisper@basic-queues-all:
> 
>           * shard-glk: DMESG-WARN (i915#118 / [i915#95]) -> PASS +1 similar
>             issue
>      * igt@gem_huc_copy@huc-copy:
> 
>           * shard-tglb: SKIP ([i915#2190]) -> PASS
>      * igt@gem_linear_blits@normal:
> 
>           * shard-snb: FAIL -> PASS
>      * igt@i915_module_load@reload-with-fault-injection:
> 
>           * shard-tglb: DMESG-WARN ([i915#1982]) -> PASS +3 similar issues
>      * {igt@kms_async_flips@async-flip-with-page-flip-events}:
> 
>           * shard-apl: FAIL ([i915#1635] / [i915#2521]) -> PASS
>      * {igt@kms_async_flips@test-time-stamp}:
> 
>           * shard-tglb: FAIL ([i915#2597]) -> PASS
>      * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
> 
>           * shard-glk: FAIL (i915#1119) -> PASS
>      * igt@kms_flip@2x-nonexisting-fb-interruptible@ab-vga1-hdmi-a1:
> 
>           * shard-hsw: DMESG-WARN ([i915#1982]) -> PASS +1 similar issue
>      * igt@kms_flip@flip-vs-expired-vblank@a-dp1:
> 
>           * shard-apl: FAIL ([i915#1635] / [i915#79]) -> PASS
>      * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> 
>           * shard-tglb: FAIL ([i915#2598]) -> PASS
>      * igt@kms_flip@flip-vs-suspend@c-hdmi-a1:
> 
>           * shard-hsw: INCOMPLETE ([i915#2055]) -> PASS
>      * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp1:
> 
>           * shard-kbl: DMESG-WARN ([i915#1982]) -> PASS
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
> 
>           * shard-kbl: FAIL ([i915#49]) -> PASS +1 similar issue
> 
>           * shard-glk: FAIL ([i915#49]) -> PASS
> 
>      * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
> 
>           * shard-apl: FAIL ([i915#1635] / [i915#49]) -> PASS +1 similar
>             issue
>      * igt@kms_plane_scaling@pipe-a-scaler-with-clipping-clamping:
> 
>           * shard-iclb: DMESG-WARN ([i915#1982]) -> PASS
>      * igt@kms_prime@basic-crc@second-to-first:
> 
>           * shard-apl: SKIP (fdo#109271 / [i915#1635]) -> PASS
> 
>           * shard-kbl: SKIP (fdo#109271) -> PASS
> 
>           * shard-iclb: SKIP ([i915#1836]) -> PASS
> 
>           * shard-tglb: SKIP ([i915#1836]) -> PASS
> 
>           * shard-glk: SKIP (fdo#109271) -> PASS
> 
>      * igt@kms_psr2_su@frontbuffer:
> 
>           * shard-iclb: SKIP (fdo#109642 / fdo#111068) -> PASS
>      * igt@kms_psr@psr2_sprite_render:
> 
>           * shard-iclb: SKIP (fdo#109441) -> PASS
>      * igt@kms_vblank@pipe-c-wait-idle:
> 
>           * shard-apl: DMESG-WARN ([i915#1635] / [i915#1982]) -> PASS
>      * igt@perf@gen12-oa-tlb-invalidate:
> 
>           * shard-tglb: SKIP (i915#1354) -> PASS +1 similar issue
>      * igt@perf@non-system-wide-paranoid:
> 
>           * shard-apl: SKIP (fdo#109271 / i915#1354 / [i915#1635]) -> PASS
> 
>           * shard-glk: SKIP (fdo#109271 / i915#1354) -> PASS
> 
>           * shard-hsw: SKIP (fdo#109271) -> PASS
> 
>           * shard-iclb: SKIP (i915#1354) -> PASS
> 
>           * shard-kbl: SKIP (fdo#109271 / i915#1354) -> PASS
> 
>     Warnings
> 
>      * igt@kms_content_protection@lic:
> 
>           * shard-apl: FAIL (fdo#110321 / [i915#1635]) -> TIMEOUT (i915#1319
>             / [i915#1635])
>      * igt@kms_dp_dsc@basic-dsc-enable-edp:
> 
>           * shard-iclb: DMESG-WARN (i915#1226) -> SKIP (fdo#109349)
>      * igt@kms_plane_alpha_blend@pipe-a-alpha-7efc:
> 
>           * shard-apl: FAIL (fdo#108145 / [i915#1635] / [i915#265]) ->
>             DMESG-FAIL (fdo#108145 / [i915#1635] / [i915#1982])
>      * igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
> 
>           * shard-apl: DMESG-FAIL (fdo#108145 / [i915#1635] / [i915#1982]) ->
>             FAIL (fdo#108145 / [i915#1635] / [i915#265])
>      * igt@perf@gen12-oa-tlb-invalidate:
> 
>           * shard-kbl: SKIP (fdo#109271 / i915#1354) -> SKIP (fdo#109271)
> 
>           * shard-glk: SKIP (fdo#109271 / i915#1354) -> SKIP (fdo#109271)
> 
>           * shard-apl: SKIP (fdo#109271 / i915#1354 / [i915#1635]) -> SKIP
>             (fdo#109271 / [i915#1635])
> 
>           * shard-iclb: SKIP (i915#1354) -> SKIP (fdo#109289)
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
