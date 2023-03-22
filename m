Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============4726818533125848548=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 22 Mar 2023 19:25:04 -0000
Message-ID: <167951310411.13421.6286170997290558394@emeril.freedesktop.org>
References: <20230322140030.1800192-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20230322140030.1800192-1-mauro.chehab@linux.intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgeGUveGVf?=
 =?utf-8?q?module=5Fload=3A_add_a_test_to_load/unload_Xe_driver_=28rev2=29?=
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

--===============4726818533125848548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe/xe_module_load: add a test to load/unload Xe driver (rev2)
URL   : https://patchwork.freedesktop.org/series/115511/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_12897_full -> IGTPW_8662_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/index.html

Participating hosts (7 -> 8)
------------------------------

  Additional (1): shard-rkl0 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_8662_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_module_load@force-load} (NEW):
    - {shard-rkl}:        NOTRUN -> [SKIP][1] +1 similar issue
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-4/igt@xe_module_load@force-load.html
    - {shard-dg1}:        NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-dg1-18/igt@xe_module_load@force-load.html
    - {shard-tglu}:       NOTRUN -> [SKIP][3] +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-3/igt@xe_module_load@force-load.html

  * {igt@xe_module_load@many-reload} (NEW):
    - shard-snb:          NOTRUN -> [FAIL][4] +2 similar issues
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-snb7/igt@xe_module_load@many-reload.html
    - {shard-tglu}:       NOTRUN -> [FAIL][5] +2 similar issues
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-10/igt@xe_module_load@many-reload.html

  * {igt@xe_module_load@reload} (NEW):
    - shard-glk:          NOTRUN -> [FAIL][6] +2 similar issues
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-glk9/igt@xe_module_load@reload.html
    - {shard-rkl}:        NOTRUN -> [FAIL][7] +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@xe_module_load@reload.html

  * {igt@xe_module_load@reload-no-display} (NEW):
    - {shard-dg1}:        NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-dg1-14/igt@xe_module_load@reload-no-display.html
    - shard-apl:          NOTRUN -> [FAIL][9] +2 similar issues
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-apl7/igt@xe_module_load@reload-no-display.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_legacy@single-move@pipe-b:
    - {shard-tglu}:       [PASS][10] -> [INCOMPLETE][11] +1 similar issue
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-tglu-7/igt@kms_cursor_legacy@single-move@pipe-b.html
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-1/igt@kms_cursor_legacy@single-move@pipe-b.html

  * {igt@xe_noexec_ping_pong}:
    - {shard-dg1}:        NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-dg1-16/igt@xe_noexec_ping_pong.html

  
New tests
---------

  New tests have been introduced between CI_DRM_12897_full and IGTPW_8662_full:

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
    - Statuses : 5 fail(s)
    - Exec time: [0.0] s

  * igt@xe_module_load@reload-no-display:
    - Statuses : 6 fail(s)
    - Exec time: [0.0] s

  * igt@xe_module_load@unload:
    - Statuses : 6 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in IGTPW_8662_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_ctx_persistence@process:
    - shard-snb:          NOTRUN -> [SKIP][13] ([fdo#109271] / [i915#1099])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-snb2/igt@gem_ctx_persistence@process.html

  * igt@gem_lmem_swapping@verify-random-ccs:
    - shard-glk:          NOTRUN -> [SKIP][14] ([fdo#109271] / [i915#4613])
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-glk3/igt@gem_lmem_swapping@verify-random-ccs.html

  * igt@gen9_exec_parse@basic-rejected-ctx-param:
    - shard-snb:          NOTRUN -> [SKIP][15] ([fdo#109271]) +31 similar issues
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-snb2/igt@gen9_exec_parse@basic-rejected-ctx-param.html

  * igt@i915_pm_rpm@gem-execbuf-stress-pc8:
    - shard-glk:          NOTRUN -> [SKIP][16] ([fdo#109271]) +30 similar issues
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-glk9/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html

  * igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:
    - shard-glk:          NOTRUN -> [SKIP][17] ([fdo#109271] / [i915#3886]) +3 similar issues
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-glk6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-apl:          [PASS][18] -> [FAIL][19] ([i915#4767])
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html

  * {igt@xe_module_load@force-load} (NEW):
    - shard-apl:          NOTRUN -> [SKIP][20] ([fdo#109271]) +1 similar issue
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-apl2/igt@xe_module_load@force-load.html

  
#### Possible fixes ####

  * igt@api_intel_bb@object-reloc-purge-cache:
    - {shard-rkl}:        [SKIP][21] ([i915#3281]) -> [PASS][22] +4 similar issues
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-4/igt@api_intel_bb@object-reloc-purge-cache.html
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-5/igt@api_intel_bb@object-reloc-purge-cache.html

  * igt@drm_read@short-buffer-nonblock:
    - {shard-rkl}:        [SKIP][23] ([i915#4098]) -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-3/igt@drm_read@short-buffer-nonblock.html
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@drm_read@short-buffer-nonblock.html

  * igt@fbdev@eof:
    - {shard-tglu}:       [SKIP][25] ([i915#2582]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-tglu-10/igt@fbdev@eof.html
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-6/igt@fbdev@eof.html

  * igt@fbdev@unaligned-write:
    - {shard-rkl}:        [SKIP][27] ([i915#2582]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-1/igt@fbdev@unaligned-write.html
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@fbdev@unaligned-write.html

  * igt@gem_eio@in-flight-suspend:
    - {shard-rkl}:        [FAIL][29] ([fdo#103375]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-4/igt@gem_eio@in-flight-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-1/igt@gem_eio@in-flight-suspend.html

  * igt@gem_exec_fair@basic-none-solo@rcs0:
    - shard-apl:          [FAIL][31] ([i915#2842]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html

  * igt@gem_exec_fair@basic-none@vcs0:
    - {shard-rkl}:        [FAIL][33] ([i915#2842]) -> [PASS][34] +1 similar issue
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-3/igt@gem_exec_fair@basic-none@vcs0.html
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-5/igt@gem_exec_fair@basic-none@vcs0.html

  * igt@gem_exec_fair@basic-pace-share@rcs0:
    - shard-glk:          [FAIL][35] ([i915#2842]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html

  * igt@gem_mmap_gtt@coherency:
    - {shard-rkl}:        [SKIP][37] ([fdo#111656]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-2/igt@gem_mmap_gtt@coherency.html
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-5/igt@gem_mmap_gtt@coherency.html

  * igt@gem_partial_pwrite_pread@write-snoop:
    - {shard-rkl}:        [SKIP][39] ([i915#3282]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-3/igt@gem_partial_pwrite_pread@write-snoop.html
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-5/igt@gem_partial_pwrite_pread@write-snoop.html

  * igt@gen9_exec_parse@allowed-single:
    - shard-glk:          [ABORT][41] ([i915#5566]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-glk8/igt@gen9_exec_parse@allowed-single.html
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-glk8/igt@gen9_exec_parse@allowed-single.html

  * igt@gen9_exec_parse@batch-invalid-length:
    - {shard-rkl}:        [SKIP][43] ([i915#2527]) -> [PASS][44] +1 similar issue
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-6/igt@gen9_exec_parse@batch-invalid-length.html
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html

  * igt@i915_pm_dc@dc6-psr:
    - {shard-rkl}:        [SKIP][45] ([i915#658]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-1/igt@i915_pm_dc@dc6-psr.html
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@i915_pm_dc@dc6-psr.html

  * igt@i915_pm_dc@dc9-dpms:
    - {shard-tglu}:       [SKIP][47] ([i915#4281]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-tglu-3/igt@i915_pm_dc@dc9-dpms.html
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-9/igt@i915_pm_dc@dc9-dpms.html

  * igt@i915_pm_rpm@dpms-mode-unset-lpsp:
    - {shard-tglu}:       [SKIP][49] ([i915#1397]) -> [PASS][50] +1 similar issue
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-tglu-10/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@i915_pm_rpm@fences:
    - {shard-rkl}:        [SKIP][51] ([i915#1849]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-4/igt@i915_pm_rpm@fences.html
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@i915_pm_rpm@fences.html

  * igt@i915_pm_rpm@i2c:
    - {shard-tglu}:       [SKIP][53] ([i915#3547]) -> [PASS][54] +1 similar issue
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-tglu-10/igt@i915_pm_rpm@i2c.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-8/igt@i915_pm_rpm@i2c.html

  * igt@i915_pm_rpm@modeset-lpsp:
    - {shard-rkl}:        [SKIP][55] ([i915#1397]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-3/igt@i915_pm_rpm@modeset-lpsp.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp.html

  * igt@i915_selftest@live@gt_heartbeat:
    - shard-apl:          [DMESG-FAIL][57] ([i915#5334]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-apl7/igt@i915_selftest@live@gt_heartbeat.html

  * igt@i915_selftest@perf@engine_cs:
    - shard-snb:          [ABORT][59] ([i915#4528]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-snb2/igt@i915_selftest@perf@engine_cs.html
   [60]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-snb4/igt@i915_selftest@perf@engine_cs.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - {shard-rkl}:        [SKIP][61] ([i915#1845] / [i915#4098]) -> [PASS][62] +35 similar issues
   [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [62]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs:
    - {shard-tglu}:       [SKIP][63] ([i915#1845]) -> [PASS][64] +47 similar issues
   [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-tglu-10/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html
   [64]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-7/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html

  * igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs:
    - {shard-tglu}:       [SKIP][65] ([i915#1845] / [i915#7651]) -> [PASS][66] +20 similar issues
   [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-tglu-9/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs.html
   [66]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-3/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-apl:          [FAIL][67] ([i915#2346]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [68]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@single-move@pipe-b:
    - {shard-rkl}:        [INCOMPLETE][69] -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-6/igt@kms_cursor_legacy@single-move@pipe-b.html
   [70]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-5/igt@kms_cursor_legacy@single-move@pipe-b.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
    - {shard-tglu}:       [SKIP][71] ([i915#1849]) -> [PASS][72] +19 similar issues
   [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html
   [72]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:
    - {shard-rkl}:        [SKIP][73] ([i915#1849] / [i915#4098]) -> [PASS][74] +20 similar issues
   [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html
   [74]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html

  * igt@kms_psr@cursor_mmap_cpu:
    - {shard-rkl}:        [SKIP][75] ([i915#1072]) -> [PASS][76] +3 similar issues
   [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-5/igt@kms_psr@cursor_mmap_cpu.html
   [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@kms_psr@cursor_mmap_cpu.html

  * igt@perf@polling-small-buf:
    - {shard-rkl}:        [FAIL][77] ([i915#1722]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-4/igt@perf@polling-small-buf.html
   [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-5/igt@perf@polling-small-buf.html

  * igt@perf@stress-open-close:
    - shard-glk:          [ABORT][79] ([i915#5213]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-glk4/igt@perf@stress-open-close.html
   [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-glk6/igt@perf@stress-open-close.html

  * igt@perf_pmu@idle@rcs0:
    - {shard-dg1}:        [FAIL][81] ([i915#4349]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-dg1-14/igt@perf_pmu@idle@rcs0.html
   [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-dg1-18/igt@perf_pmu@idle@rcs0.html

  * igt@prime_vgem@basic-read:
    - {shard-rkl}:        [SKIP][83] ([fdo#109295] / [i915#3291] / [i915#3708]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-2/igt@prime_vgem@basic-read.html
   [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-5/igt@prime_vgem@basic-read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [IGT#2]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2
  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [fdo#109274]: https://bugs.freedesktop.org/show_bug.cgi?id=109274
  [fdo#109279]: https://bugs.freedesktop.org/show_bug.cgi?id=109279
  [fdo#109280]: https://bugs.freedesktop.org/show_bug.cgi?id=109280
  [fdo#109289]: https://bugs.freedesktop.org/show_bug.cgi?id=109289
  [fdo#109295]: https://bugs.freedesktop.org/show_bug.cgi?id=109295
  [fdo#109307]: https://bugs.freedesktop.org/show_bug.cgi?id=109307
  [fdo#109308]: https://bugs.freedesktop.org/show_bug.cgi?id=109308
  [fdo#109309]: https://bugs.freedesktop.org/show_bug.cgi?id=109309
  [fdo#109315]: https://bugs.freedesktop.org/show_bug.cgi?id=109315
  [fdo#109506]: https://bugs.freedesktop.org/show_bug.cgi?id=109506
  [fdo#110189]: https://bugs.freedesktop.org/show_bug.cgi?id=110189
  [fdo#110542]: https://bugs.freedesktop.org/show_bug.cgi?id=110542
  [fdo#110723]: https://bugs.freedesktop.org/show_bug.cgi?id=110723
  [fdo#111068]: https://bugs.freedesktop.org/show_bug.cgi?id=111068
  [fdo#111614]: https://bugs.freedesktop.org/show_bug.cgi?id=111614
  [fdo#111615]: https://bugs.freedesktop.org/show_bug.cgi?id=111615
  [fdo#111656]: https://bugs.freedesktop.org/show_bug.cgi?id=111656
  [fdo#111825]: https://bugs.freedesktop.org/show_bug.cgi?id=111825
  [fdo#111827]: https://bugs.freedesktop.org/show_bug.cgi?id=111827
  [fdo#112054]: https://bugs.freedesktop.org/show_bug.cgi?id=112054
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#1099]: https://gitlab.freedesktop.org/drm/intel/issues/1099
  [i915#132]: https://gitlab.freedesktop.org/drm/intel/issues/132
  [i915#1397]: https://gitlab.freedesktop.org/drm/intel/issues/1397
  [i915#1722]: https://gitlab.freedesktop.org/drm/intel/issues/1722
  [i915#1825]: https://gitlab.freedesktop.org/drm/intel/issues/1825
  [i915#1839]: https://gitlab.freedesktop.org/drm/intel/issues/1839
  [i915#1845]: https://gitlab.freedesktop.org/drm/intel/issues/1845
  [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
  [i915#2232]: https://gitlab.freedesktop.org/drm/intel/issues/2232
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#2437]: https://gitlab.freedesktop.org/drm/intel/issues/2437
  [i915#2527]: https://gitlab.freedesktop.org/drm/intel/issues/2527
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
  [i915#2587]: https://gitlab.freedesktop.org/drm/intel/issues/2587
  [i915#2658]: https://gitlab.freedesktop.org/drm/intel/issues/2658
  [i915#2672]: https://gitlab.freedesktop.org/drm/intel/issues/2672
  [i915#2705]: https://gitlab.freedesktop.org/drm/intel/issues/2705
  [i915#284]: https://gitlab.freedesktop.org/drm/intel/issues/284
  [i915#2842]: https://gitlab.freedesktop.org/drm/intel/issues/2842
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
  [i915#3528]: https://gitlab.freedesktop.org/drm/intel/issues/3528
  [i915#3539]: https://gitlab.freedesktop.org/drm/intel/issues/3539
  [i915#3546]: https://gitlab.freedesktop.org/drm/intel/issues/3546
  [i915#3547]: https://gitlab.freedesktop.org/drm/intel/issues/3547
  [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
  [i915#3637]: https://gitlab.freedesktop.org/drm/intel/issues/3637
  [i915#3638]: https://gitlab.freedesktop.org/drm/intel/issues/3638
  [i915#3689]: https://gitlab.freedesktop.org/drm/intel/issues/3689
  [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
  [i915#3734]: https://gitlab.freedesktop.org/drm/intel/issues/3734
  [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
  [i915#3886]: https://gitlab.freedesktop.org/drm/intel/issues/3886
  [i915#3936]: https://gitlab.freedesktop.org/drm/intel/issues/3936
  [i915#3955]: https://gitlab.freedesktop.org/drm/intel/issues/3955
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
  [i915#4270]: https://gitlab.freedesktop.org/drm/intel/issues/4270
  [i915#4281]: https://gitlab.freedesktop.org/drm/intel/issues/4281
  [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
  [i915#4349]: https://gitlab.freedesktop.org/drm/intel/issues/4349
  [i915#4387]: https://gitlab.freedesktop.org/drm/intel/issues/4387
  [i915#4391]: https://gitlab.freedesktop.org/drm/intel/issues/4391
  [i915#4528]: https://gitlab.freedesktop.org/drm/intel/issues/4528
  [i915#4538]: https://gitlab.freedesktop.org/drm/intel/issues/4538
  [i915#4579]: https://gitlab.freedesktop.org/drm/intel/issues/4579
  [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
  [i915#4767]: https://gitlab.freedesktop.org/drm/intel/issues/4767
  [i915#4771]: https://gitlab.freedesktop.org/drm/intel/issues/4771
  [i915#4812]: https://gitlab.freedesktop.org/drm/intel/issues/4812
  [i915#4818]: https://gitlab.freedesktop.org/drm/intel/issues/4818
  [i915#4833]: https://gitlab.freedesktop.org/drm/intel/issues/4833
  [i915#4852]: https://gitlab.freedesktop.org/drm/intel/issues/4852
  [i915#4859]: https://gitlab.freedesktop.org/drm/intel/issues/4859
  [i915#4860]: https://gitlab.freedesktop.org/drm/intel/issues/4860
  [i915#4880]: https://gitlab.freedesktop.org/drm/intel/issues/4880
  [i915#4884]: https://gitlab.freedesktop.org/drm/intel/issues/4884
  [i915#4885]: https://gitlab.freedesktop.org/drm/intel/issues/4885
  [i915#4983]: https://gitlab.freedesktop.org/drm/intel/issues/4983
  [i915#5176]: https://gitlab.freedesktop.org/drm/intel/issues/5176
  [i915#5213]: https://gitlab.freedesktop.org/drm/intel/issues/5213
  [i915#5235]: https://gitlab.freedesktop.org/drm/intel/issues/5235
  [i915#5286]: https://gitlab.freedesktop.org/drm/intel/issues/5286
  [i915#5288]: https://gitlab.freedesktop.org/drm/intel/issues/5288
  [i915#5289]: https://gitlab.freedesktop.org/drm/intel/issues/5289
  [i915#5325]: https://gitlab.freedesktop.org/drm/intel/issues/5325
  [i915#533]: https://gitlab.freedesktop.org/drm/intel/issues/533
  [i915#5334]: https://gitlab.freedesktop.org/drm/intel/issues/5334
  [i915#5354]: https://gitlab.freedesktop.org/drm/intel/issues/5354
  [i915#5461]: https://gitlab.freedesktop.org/drm/intel/issues/5461
  [i915#5563]: https://gitlab.freedesktop.org/drm/intel/issues/5563
  [i915#5566]: https://gitlab.freedesktop.org/drm/intel/issues/5566
  [i915#5723]: https://gitlab.freedesktop.org/drm/intel/issues/5723
  [i915#6095]: https://gitlab.freedesktop.org/drm/intel/issues/6095
  [i915#6247]: https://gitlab.freedesktop.org/drm/intel/issues/6247
  [i915#6248]: https://gitlab.freedesktop.org/drm/intel/issues/6248
  [i915#6252]: https://gitlab.freedesktop.org/drm/intel/issues/6252
  [i915#6268]: https://gitlab.freedesktop.org/drm/intel/issues/6268
  [i915#6301]: https://gitlab.freedesktop.org/drm/intel/issues/6301
  [i915#6334]: https://gitlab.freedesktop.org/drm/intel/issues/6334
  [i915#6493]: https://gitlab.freedesktop.org/drm/intel/issues/6493
  [i915#6497]: https://gitlab.freedesktop.org/drm/intel/issues/6497
  [i915#6524]: https://gitlab.freedesktop.org/drm/intel/issues/6524
  [i915#658]: https://gitlab.freedesktop.org/drm/intel/issues/658
  [i915#6768]: https://gitlab.freedesktop.org/drm/intel/issues/6768
  [i915#6944]: https://gitlab.freedesktop.org/drm/intel/issues/6944
  [i915#6953]: https://gitlab.freedesktop.org/drm/intel/issues/6953
  [i915#7037]: https://gitlab.freedesktop.org/drm/intel/issues/7037
  [i915#7116]: https://gitlab.freedesktop.org/drm/intel/issues/7116
  [i915#7118]: https://gitlab.freedesktop.org/drm/intel/issues/7118
  [i915#7128]: https://gitlab.freedesktop.org/drm/intel/issues/7128
  [i915#7178]: https://gitlab.freedesktop.org/drm/intel/issues/7178
  [i915#7294]: https://gitlab.freedesktop.org/drm/intel/issues/7294
  [i915#7561]: https://gitlab.freedesktop.org/drm/intel/issues/7561
  [i915#7651]: https://gitlab.freedesktop.org/drm/intel/issues/7651
  [i915#7707]: https://gitlab.freedesktop.org/drm/intel/issues/7707
  [i915#7711]: https://gitlab.freedesktop.org/drm/intel/issues/7711
  [i915#7742]: https://gitlab.freedesktop.org/drm/intel/issues/7742
  [i915#7828]: https://gitlab.freedesktop.org/drm/intel/issues/7828
  [i915#7949]: https://gitlab.freedesktop.org/drm/intel/issues/7949
  [i915#7957]: https://gitlab.freedesktop.org/drm/intel/issues/7957
  [i915#7981]: https://gitlab.freedesktop.org/drm/intel/issues/7981
  [i915#8150]: https://gitlab.freedesktop.org/drm/intel/issues/8150
  [i915#8152]: https://gitlab.freedesktop.org/drm/intel/issues/8152
  [i915#8155]: https://gitlab.freedesktop.org/drm/intel/issues/8155
  [i915#8228]: https://gitlab.freedesktop.org/drm/intel/issues/8228
  [i915#8282]: https://gitlab.freedesktop.org/drm/intel/issues/8282


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7211 -> IGTPW_8662
  * Piglit: piglit_4509 -> None

  CI-20190529: 20190529
  CI_DRM_12897: 48de8fde637e7fb42e44046fbb3f33199d36ea6b @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_8662: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/index.html
  IGT_7211: c0cc1de7b2f4041ca68960362aa55f881d416bac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/index.html

--===============4726818533125848548==
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
<tr><td><b>Series:</b></td><td>xe/xe_module_load: add a test to load/unload Xe driver (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/115511/">https://patchwork.freedesktop.org/series/115511/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_12897_full -&gt; IGTPW_8662_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/index.html</p>
<h2>Participating hosts (7 -&gt; 8)</h2>
<p>Additional (1): shard-rkl0 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8662_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@xe_module_load@force-load} (NEW):</p>
<ul>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-4/igt@xe_module_load@force-load.html">SKIP</a> +1 similar issue</p>
</li>
<li>
<p>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-dg1-18/igt@xe_module_load@force-load.html">SKIP</a></p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-3/igt@xe_module_load@force-load.html">SKIP</a> +1 similar issue</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_module_load@many-reload} (NEW):</p>
<ul>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-snb7/igt@xe_module_load@many-reload.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>{shard-tglu}:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-10/igt@xe_module_load@many-reload.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_module_load@reload} (NEW):</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-glk9/igt@xe_module_load@reload.html">FAIL</a> +2 similar issues</p>
</li>
<li>
<p>{shard-rkl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@xe_module_load@reload.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_module_load@reload-no-display} (NEW):</p>
<ul>
<li>
<p>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-dg1-14/igt@xe_module_load@reload-no-display.html">FAIL</a></p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-apl7/igt@xe_module_load@reload-no-display.html">FAIL</a> +2 similar issues</p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-b:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-tglu-7/igt@kms_cursor_legacy@single-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-1/igt@kms_cursor_legacy@single-move@pipe-b.html">INCOMPLETE</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>{igt@xe_noexec_ping_pong}:</p>
<ul>
<li>{shard-dg1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-dg1-16/igt@xe_noexec_ping_pong.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_12897_full and IGTPW_8662_full:</p>
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
<li>Statuses : 5 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>Statuses : 6 fail(s)</li>
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
<p>Here are the changes found in IGTPW_8662_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@process:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-snb2/igt@gem_ctx_persistence@process.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/1099">i915#1099</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@verify-random-ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-glk3/igt@gem_lmem_swapping@verify-random-ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4613">i915#4613</a>)</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected-ctx-param:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-snb2/igt@gen9_exec_parse@basic-rejected-ctx-param.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-glk9/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +30 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-glk6/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_gen12_mc_ccs.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3886">i915#3886</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-apl2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-apl6/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>{igt@xe_module_load@force-load} (NEW):</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-apl2/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +1 similar issue</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@api_intel_bb@object-reloc-purge-cache:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-4/igt@api_intel_bb@object-reloc-purge-cache.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3281">i915#3281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-5/igt@api_intel_bb@object-reloc-purge-cache.html">PASS</a> +4 similar issues</li>
</ul>
</li>
<li>
<p>igt@drm_read@short-buffer-nonblock:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-3/igt@drm_read@short-buffer-nonblock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@drm_read@short-buffer-nonblock.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-tglu-10/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-6/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-1/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2582">i915#2582</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_eio@in-flight-suspend:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-4/igt@gem_eio@in-flight-suspend.html">FAIL</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=103375">fdo#103375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-1/igt@gem_eio@in-flight-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-apl3/igt@gem_exec_fair@basic-none-solo@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-apl7/igt@gem_exec_fair@basic-none-solo@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vcs0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-3/igt@gem_exec_fair@basic-none@vcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-5/igt@gem_exec_fair@basic-none@vcs0.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-glk1/igt@gem_exec_fair@basic-pace-share@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2842">i915#2842</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-glk4/igt@gem_exec_fair@basic-pace-share@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-2/igt@gem_mmap_gtt@coherency.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=111656">fdo#111656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-5/igt@gem_mmap_gtt@coherency.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_partial_pwrite_pread@write-snoop:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-3/igt@gem_partial_pwrite_pread@write-snoop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3282">i915#3282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-5/igt@gem_partial_pwrite_pread@write-snoop.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-single:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-glk8/igt@gen9_exec_parse@allowed-single.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5566">i915#5566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-glk8/igt@gen9_exec_parse@allowed-single.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@batch-invalid-length:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-6/igt@gen9_exec_parse@batch-invalid-length.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2527">i915#2527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-1/igt@i915_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/658">i915#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc9-dpms:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-tglu-3/igt@i915_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4281">i915#4281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-9/igt@i915_pm_dc@dc9-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-tglu-10/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-6/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@fences:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-4/igt@i915_pm_rpm@fences.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@i915_pm_rpm@fences.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@i2c:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-tglu-10/igt@i915_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/3547">i915#3547</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-8/igt@i915_pm_rpm@i2c.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-lpsp:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-3/igt@i915_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#1397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@i915_pm_rpm@modeset-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_heartbeat:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-apl1/igt@i915_selftest@live@gt_heartbeat.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5334">i915#5334</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-apl7/igt@i915_selftest@live@gt_heartbeat.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@perf@engine_cs:</p>
<ul>
<li>shard-snb:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-snb2/igt@i915_selftest@perf@engine_cs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4528">i915#4528</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-snb4/igt@i915_selftest@perf@engine_cs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">PASS</a> +35 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-tglu-10/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-7/igt@kms_ccs@pipe-c-bad-pixel-format-y_tiled_gen12_rc_ccs.html">PASS</a> +47 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-tglu-9/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1845">i915#1845</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/7651">i915#7651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-3/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_gen12_rc_ccs.html">PASS</a> +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-apl:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-apl1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-apl3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-b:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-6/igt@kms_cursor_legacy@single-move@pipe-b.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-5/igt@kms_cursor_legacy@single-move@pipe-b.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>{shard-tglu}:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-tglu-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt.html">PASS</a> +19 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1849">i915#1849</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/4098">i915#4098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-gtt.html">PASS</a> +20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_mmap_cpu:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-5/igt@kms_psr@cursor_mmap_cpu.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-6/igt@kms_psr@cursor_mmap_cpu.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@perf@polling-small-buf:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-4/igt@perf@polling-small-buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1722">i915#1722</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-5/igt@perf@polling-small-buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@stress-open-close:</p>
<ul>
<li>shard-glk:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-glk4/igt@perf@stress-open-close.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5213">i915#5213</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-glk6/igt@perf@stress-open-close.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf_pmu@idle@rcs0:</p>
<ul>
<li>{shard-dg1}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-dg1-14/igt@perf_pmu@idle@rcs0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/4349">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-dg1-18/igt@perf_pmu@idle@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-read:</p>
<ul>
<li>{shard-rkl}:        <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12897/shard-rkl-2/igt@prime_vgem@basic-read.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109295">fdo#109295</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3291">i915#3291</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/3708">i915#3708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/shard-rkl-5/igt@prime_vgem@basic-read.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7211 -&gt; IGTPW_8662</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_12897: 48de8fde637e7fb42e44046fbb3f33199d36ea6b @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_8662: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8662/index.html<br />
  IGT_7211: c0cc1de7b2f4041ca68960362aa55f881d416bac @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit</p>

</body>
</html>

--===============4726818533125848548==--

