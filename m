Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============3777476573454934237=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 21 Mar 2023 20:16:03 -0000
Message-ID: <167942976328.18680.14555245121780801364@emeril.freedesktop.org>
References: <20230321144614.1676419-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230321144614.1676419-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgQWRkIHN1?=
 =?utf-8?q?pport_for_Xe_driver_unload/reload?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============3777476573454934237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for Xe driver unload/reload
URL   : https://patchwork.freedesktop.org/series/115451/
State : success

== Summary ==

CI Bug Log - changes from IGT_7210_full -> IGTPW_8653_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/index.html

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): shard-rkl0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8653_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_module_load@force-load} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-2/igt@xe_module_load@force-load.html
    - {shard-dg1}:        NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-dg1-18/igt@xe_module_load@force-load.html
    - {shard-tglu}:       NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-3/igt@xe_module_load@force-load.html

  * {igt@xe_module_load@many-reload} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-snb5/igt@xe_module_load@many-reload.html
    - {shard-dg1}:        NOTRUN -> [FAIL][5] +1 similar issue
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-dg1-13/igt@xe_module_load@many-reload.html
    - {shard-tglu}:       NOTRUN -> [FAIL][6] +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-6/igt@xe_module_load@many-reload.html

  * {igt@xe_module_load@reload} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][7] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-glk9/igt@xe_module_load@reload.html
    - {shard-rkl}:        NOTRUN -> [FAIL][8] +1 similar issue
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-3/igt@xe_module_load@reload.html

  * {igt@xe_module_load@reload-no-display} (NEW):
    - shard-apl:          NOTRUN -> [FAIL][9] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-apl1/igt@xe_module_load@reload-no-display.html

  
New tests
---------

  New tests have been introduced between IGT_7210_full and IGTPW_8653_full:

### New IGT tests (6) ###

  * igt@xe_module_load@force-load:
    - Statuses : 6 skip(s)
    - Exec time: [0.0] s

  * igt@xe_module_load@load:
    - Statuses : 5 skip(s)
    - Exec time: [0.0] s

  * igt@xe_module_load@many-reload:
    - Statuses : 5 fail(s)
    - Exec time: [0.0] s

  * igt@xe_module_load@reload:
    - Statuses : 6 fail(s)
    - Exec time: [0.0] s

  * igt@xe_module_load@reload-no-display:
    - Statuses : 5 fail(s)
    - Exec time: [0.0] s

  * igt@xe_module_load@unload:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8653_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [PASS][10] -> [FAIL][11] ([i915#2842])
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@kms_cursor_crc@cursor-alpha-opaque:
    - shard-snb:          NOTRUN -> [SKIP][12] ([fdo#109271]) +2 similar issues
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-snb7/igt@kms_cursor_crc@cursor-alpha-opaque.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-glk:          [PASS][13] -> [FAIL][14] ([i915#2346])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
    - shard-apl:          [PASS][15] -> [FAIL][16] ([i915#2346])
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-snb:          [PASS][17] -> [SKIP][18] ([fdo#109271])
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-snb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-snb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * {igt@xe_module_load@force-load} (NEW):
    - shard-apl:          NOTRUN -> [SKIP][19] ([fdo#109271]) +1 similar issue
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-apl2/igt@xe_module_load@force-load.html
    - shard-glk:          NOTRUN -> [SKIP][20] ([fdo#109271]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-glk1/igt@xe_module_load@force-load.html

  
#### Possible fixes ####

  * igt@drm_fdinfo@most-busy-check-all@rcs0:
    - {shard-rkl}:        [FAIL][21] ([i915#7742]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html

  * igt@fbdev@write:
    - {shard-tglu}:       [SKIP][23] ([i915#2582]) -> [PASS][24] +2 similar issues
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-tglu-10/igt@fbdev@write.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-3/igt@fbdev@write.html

  * {igt@gem_barrier_race@remote-request@rcs0}:
    - {shard-tglu}:       [ABORT][25] ([i915#8211]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-tglu-10/igt@gem_barrier_race@remote-request@rcs0.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-10/igt@gem_barrier_race@remote-request@rcs0.html

  * igt@gem_ctx_exec@basic-nohangcheck:
    - {shard-rkl}:        [FAIL][27] ([i915#6268]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-6/igt@gem_ctx_exec@basic-nohangcheck.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-3/igt@gem_ctx_exec@basic-nohangcheck.html

  * igt@gem_ctx_persistence@hang:
    - {shard-rkl}:        [SKIP][29] ([i915#6252]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-5/igt@gem_ctx_persistence@hang.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-4/igt@gem_ctx_persistence@hang.html

  * igt@gem_eio@reset-stress:
    - {shard-dg1}:        [FAIL][31] ([i915#5784]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-dg1-17/igt@gem_eio@reset-stress.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-dg1-18/igt@gem_eio@reset-stress.html

  * igt@gem_exec_fair@basic-deadline:
    - shard-glk:          [FAIL][33] ([i915#2846]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-glk9/igt@gem_exec_fair@basic-deadline.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-glk1/igt@gem_exec_fair@basic-deadline.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - {shard-rkl}:        [FAIL][35] ([i915#2842]) -> [PASS][36] +1 similar issue
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-6/igt@gem_exec_fair@basic-none@vcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-5/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace@rcs0:
    - shard-glk:          [FAIL][37] ([i915#2842]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-glk8/igt@gem_exec_fair@basic-pace@rcs0.html

  * igt@gem_exec_reloc@basic-gtt-wc-noreloc:
    - {shard-rkl}:        [SKIP][39] ([i915#3281]) -> [PASS][40] +9 similar issues
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html

  * igt@gem_exec_schedule@semaphore-power:
    - {shard-rkl}:        [SKIP][41] ([i915#7276]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html

  * igt@gem_lmem_swapping@smem-oom@lmem0:
    - {shard-dg1}:        [DMESG-WARN][43] ([i915#4936]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html

  * igt@gem_partial_pwrite_pread@reads-uncached:
    - {shard-rkl}:        [SKIP][45] ([i915#3282]) -> [PASS][46] +6 similar issues
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-4/igt@gem_partial_pwrite_pread@reads-uncached.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-5/igt@gem_partial_pwrite_pread@reads-uncached.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - {shard-rkl}:        [SKIP][47] ([i915#2527]) -> [PASS][48] +2 similar issues
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-4/igt@gen9_exec_parse@batch-invalid-length.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@i915_pm_dc@dc6-dpms:
    - {shard-tglu}:       [FAIL][49] ([i915#3989] / [i915#454]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-tglu-7/igt@i915_pm_dc@dc6-dpms.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html

  * igt@i915_pm_dc@dc9-dpms:
    - shard-apl:          [SKIP][51] ([fdo#109271]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-apl2/igt@i915_pm_dc@dc9-dpms.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-apl7/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:
    - {shard-dg1}:        [SKIP][53] ([i915#1937]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-dg1-15/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-dg1-14/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html

  * igt@i915_pm_rc6_residency@rc6-idle@vcs0:
    - {shard-rkl}:        [WARN][55] ([i915#2681]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html

  * igt@i915_pm_rpm@dpms-lpsp:
    - {shard-tglu}:       [SKIP][57] ([i915#1397]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-tglu-9/igt@i915_pm_rpm@dpms-lpsp.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-3/igt@i915_pm_rpm@dpms-lpsp.html

  * igt@i915_pm_rpm@drm-resources-equal:
    - {shard-tglu}:       [SKIP][59] ([i915#3547]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-tglu-9/igt@i915_pm_rpm@drm-resources-equal.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-8/igt@i915_pm_rpm@drm-resources-equal.html

  * igt@i915_pm_sseu@full-enable:
    - {shard-rkl}:        [SKIP][61] ([i915#4387]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-3/igt@i915_pm_sseu@full-enable.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-5/igt@i915_pm_sseu@full-enable.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - {shard-tglu}:       [SKIP][63] ([i915#1845]) -> [PASS][64] +18 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-tglu-10/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-3/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:
    - {shard-tglu}:       [SKIP][65] ([i915#1849]) -> [PASS][66] +9 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - {shard-rkl}:        [SKIP][67] ([i915#1849] / [i915#4098]) -> [PASS][68] +11 similar issues
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_pipe_crc_basic@bad-source:
    - {shard-rkl}:        [SKIP][69] ([i915#1845] / [i915#4098]) -> [PASS][70] +8 similar issues
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-4/igt@kms_pipe_crc_basic@bad-source.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-6/igt@kms_pipe_crc_basic@bad-source.html

  * igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a:
    - {shard-rkl}:        [SKIP][71] ([i915#4098]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-2/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-6/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a.html

  * igt@kms_vblank@pipe-a-query-forked:
    - {shard-tglu}:       [SKIP][73] ([i915#1845] / [i915#7651]) -> [PASS][74] +25 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-tglu-9/igt@kms_vblank@pipe-a-query-forked.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-7/igt@kms_vblank@pipe-a-query-forked.html

  * igt@perf_pmu@idle@rcs0:
    - {shard-rkl}:        [FAIL][75] ([i915#4349]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-3/igt@perf_pmu@idle@rcs0.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-3/igt@perf_pmu@idle@rcs0.html

  * igt@prime_vgem@basic-write:
    - {shard-rkl}:        [SKIP][77] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-4/igt@prime_vgem@basic-write.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-5/igt@prime_vgem@basic-write.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109291]: https://bugs.freedesktop.org/show_bug.cgi?id=109291
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109302]: https://bugs.freedesktop.org/show_bug.cgi?id=109302
  [fdo#109303]: https://bugs.freedesktop.org/show_bug.cgi?id=109303
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1755]: https://gitlab.freedesktop.org/drm/intel/issues/1755
  [i915#1769]: https://gitlab.freedesktop.org/drm/intel/issues/1769
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#1850]: https://gitlab.freedesktop.org/drm/intel/issues/1850
  [i915#1902]: https://gitlab.freedesktop.org/drm/intel/issues/1902
  [i915#1937]: https://gitlab.freedesktop.org/drm/intel/issues/1937
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2681]: https://gitlab.freedesktop.org/drm/intel/issues/2681
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#280]: https://gitlab.freedesktop.org/drm/intel/issues/280
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
  [i915#2846]: https://gitlab.freedesktop.org/drm/intel/issues/2846
  [i915#2856]: https://gitlab.freedesktop.org/drm/intel/issues/2856
  [i915#2920]: https://gitlab.freedesktop.org/drm/intel/issues/2920
  [i915#3116]: https://gitlab.freedesktop.org/drm/intel/issues/3116
  [i915#315]: https://gitlab.freedesktop.org/drm/intel/issues/315
  [i915#3281]: https://gitlab.freedesktop.org/drm/intel/issues/3281
  [i915#3282]: https://gitlab.freedesktop.org/drm/intel/issues/3282
  [i915#3291]: https://gitlab.freedesktop.org/drm/intel/issues/3291
  [i915#3297]: https://gitlab.freedesktop.org/drm/intel/issues/3297
  [i915#3299]: https://gitlab.freedesktop.org/drm/intel/issues/3299
  [i915#3318]: https://gitlab.freedesktop.org/drm/intel/issues/3318
  [i915#3359]: https://gitlab.freedesktop.org/drm/intel/issues/3359
  [i915#3458]: https://gitlab.freedesktop.org/drm/intel/issues/3458
  [i915#3469]: https://gitlab.freedesktop.org/drm/intel/issues/3469
  [i915#3536]: https://gitlab.freedesktop.org/drm/intel/issues/3536
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3547]: https://gitlab.freedesktop.org/drm/intel/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3804]: https://gitlab.freedesktop.org/drm/intel/issues/3804
  [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3952]: https://gitlab.freedesktop.org/drm/intel/issues/3952
  [i915#3989]: https://gitlab.freedesktop.org/drm/intel/issues/3989
  [i915#4036]: https://gitlab.freedesktop.org/drm/intel/issues/4036
  [i915#404]: https://gitlab.freedesktop.org/drm/intel/issues/404
  [i915#4070]: https://gitlab.freedesktop.org/drm/intel/issues/4070
  [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
  [i915#4078]: https://gitlab.freedesktop.org/drm/intel/issues/4078
  [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
  [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
  [i915#4098]: https://gitlab.freedesktop.org/drm/intel/issues/4098
  [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
  [i915#4212]: https://gitlab.freedesktop.org/drm/intel/issues/4212
  [i915#4215]: https://gitlab.freedesktop.org/drm/intel/issues/4215
  [i915#426]: https://gitlab.freedesktop.org/drm/intel/issues/426
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#454]: https://gitlab.freedesktop.org/drm/intel/issues/454
  [i915#4565]: https://gitlab.freedesktop.org/drm/intel/issues/4565
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4936]: https://gitlab.freedesktop.org/drm/intel/issues/4936
  [i915#5122]: https://gitlab.freedesktop.org/drm/intel/issues/5122
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5251]: https://gitlab.freedesktop.org/drm/intel/issues/5251
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5431]: https://gitlab.freedesktop.org/drm/intel/issues/5431
  [i915#5439]: https://gitlab.freedesktop.org/drm/intel/issues/5439
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5784]: https://gitlab.freedesktop.org/drm/intel/issues/5784
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6230]: https://gitlab.freedesktop.org/drm/intel/issues/6230
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6258]: https://gitlab.freedesktop.org/drm/intel/issues/6258
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6335]: https://gitlab.freedesktop.org/drm/intel/issues/6335
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6621]: https://gitlab.freedesktop.org/drm/intel/issues/6621
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6946]: https://gitlab.freedesktop.org/drm/intel/issues/6946
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7128]: https://gitlab.freedesktop.org/drm/intel/issues/7128
  [i915#7178]: https://gitlab.freedesktop.org/drm/intel/issues/7178
  [i915#7276]: https://gitlab.freedesktop.org/drm/intel/issues/7276
  [i915#7294]: https://gitlab.freedesktop.org/drm/intel/issues/7294
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7697]: https://gitlab.freedesktop.org/drm/intel/issues/7697
  [i915#7701]: https://gitlab.freedesktop.org/drm/intel/issues/7701
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7949]: https://gitlab.freedesktop.org/drm/intel/issues/7949
  [i915#7957]: https://gitlab.freedesktop.org/drm/intel/issues/7957
  [i915#7975]: https://gitlab.freedesktop.org/drm/intel/issues/7975
  [i915#8018]: https://gitlab.freedesktop.org/drm/intel/issues/8018
  [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152
  [i915#8154]: https://gitlab.freedesktop.org/drm/intel/issues/8154
  [i915#8155]: https://gitlab.freedesktop.org/drm/intel/issues/8155
  [i915#8211]: https://gitlab.freedesktop.org/drm/intel/issues/8211
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8282]: https://gitlab.freedesktop.org/drm/intel/issues/8282


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7210 -> IGTPW_8653

  CI-20190529: 20190529
  CI_DRM_12884: 1d4054731cfcb1cb9810d309b70535ae0b90ecf0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8653: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/index.html
  IGT_7210: 5f7116708590b55864456acd993ecdb02374a06f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/index.html

--===============3777476573454934237==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>Add support for Xe driver unload/reload</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/115451/">https://patchwork.freedesktop.org/series/115451/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_7210_full -&gt; IGTPW_8653_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/index.html</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): shard-rkl0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8653_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_module_load@force-load} (NEW):</p>
<ul>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-2/igt@xe_module_load@force-load.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-dg1-18/igt@xe_module_load@force-load.html">SKIP</a></p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-3/igt@xe_module_load@force-load.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_module_load@many-reload} (NEW):</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-snb5/igt@xe_module_load@many-reload.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-dg1-13/igt@xe_module_load@many-reload.html">FAIL</a> +1 similar issue</p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-6/igt@xe_module_load@many-reload.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_module_load@reload} (NEW):</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-glk9/igt@xe_module_load@reload.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-3/igt@xe_module_load@reload.html">FAIL</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_module_load@reload-no-display} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-apl1/igt@xe_module_load@reload-no-display.html">FAIL</a> +2 similar issues</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_7210_full and IGTPW_8653_full:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>Statuses : 6 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>Statuses : 5 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>Statuses : 6 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8653_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-glk6/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-snb7/igt@kms_cursor_crc@cursor-alpha-opaque.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>
<p>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-glk1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</p>
</li>
<li>
<p>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-apl6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-snb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-snb7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>)</li>
</ul>
</li>
<li>
<p>{igt@xe_module_load@force-load} (NEW):</p>
<ul>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-apl2/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-glk1/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@drm_fdinfo@most-busy-check-all@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7742">i915#7742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-4/igt@drm_fdinfo@most-busy-check-all@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-tglu-10/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-3/igt@fbdev@write.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>{igt@gem_barrier_race@remote-request@rcs0}:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-tglu-10/igt@gem_barrier_race@remote-request@rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8211">i915#8211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-10/igt@gem_barrier_race@remote-request@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_exec@basic-nohangcheck:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-6/igt@gem_ctx_exec@basic-nohangcheck.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6268">i915#6268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-3/igt@gem_ctx_exec@basic-nohangcheck.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@hang:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-5/igt@gem_ctx_persistence@hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6252">i915#6252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-4/igt@gem_ctx_persistence@hang.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@reset-stress:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-dg1-17/igt@gem_eio@reset-stress.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5784">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-dg1-18/igt@gem_eio@reset-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-glk9/igt@gem_exec_fair@basic-deadline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2846">i915#2846</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-glk1/igt@gem_exec_fair@basic-deadline.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-6/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-5/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-glk7/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-glk8/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-gtt-wc-noreloc:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-5/igt@gem_exec_reloc@basic-gtt-wc-noreloc.html">PASS</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_schedule@semaphore-power:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/7276">i915#7276</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-dg1-15/igt@gem_lmem_swapping@smem-oom@lmem0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4936">i915#4936</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-dg1-13/igt@gem_lmem_swapping@smem-oom@lmem0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-4/igt@gem_partial_pwrite_pread@reads-uncached.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-5/igt@gem_partial_pwrite_pread@reads-uncached.html">PASS</a> +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-4/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-dpms:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-tglu-7/igt@i915_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3989">i915#3989</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/454">i915#454</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-2/igt@i915_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-apl2/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-apl7/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-dg1-15/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1937">i915#1937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-dg1-14/igt@i915_pm_lpsp@kms-lpsp@kms-lpsp-hdmi-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle@vcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-5/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-2/igt@i915_pm_rc6_residency@rc6-idle@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-lpsp:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-tglu-9/igt@i915_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-3/igt@i915_pm_rpm@dpms-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@drm-resources-equal:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-tglu-9/igt@i915_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3547">i915#3547</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-8/igt@i915_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_sseu@full-enable:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-3/igt@i915_pm_sseu@full-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4387">i915#4387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-5/igt@i915_pm_sseu@full-enable.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-tglu-10/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-3/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a> +18 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-render.html">PASS</a> +9 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html">PASS</a> +11 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@bad-source:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-4/igt@kms_pipe_crc_basic@bad-source.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-6/igt@kms_pipe_crc_basic@bad-source.html">PASS</a> +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-2/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-6/igt@kms_universal_plane@universal-plane-pageflip-windowed-pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-a-query-forked:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-tglu-9/igt@kms_vblank@pipe-a-query-forked.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-tglu-7/igt@kms_vblank@pipe-a-query-forked.html">PASS</a> +25 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@idle@rcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-3/igt@perf_pmu@idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-3/igt@perf_pmu@idle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-write:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7210/shard-rkl-4/igt@prime_vgem@basic-write.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/shard-rkl-5/igt@prime_vgem@basic-write.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7210 -&gt; IGTPW_8653</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12884: 1d4054731cfcb1cb9810d309b70535ae0b90ecf0 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8653: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8653/index.html<br />
  IGT_7210: 5f7116708590b55864456acd993ecdb02374a06f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>

</body>
</html>

--===============3777476573454934237==--

